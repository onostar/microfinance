<?php
    session_start();
    $store = $_SESSION['store_id'];
    include "../classes/dbh.php";
    include "../classes/select.php";


?>
<div id="debt_paymentReport" class="displays management" style="width:100%!important">
    <div class="select_date">
        <!-- <form method="POST"> -->
        <section>    
            <div class="from_to_date">
                <label>Select From Date</label><br>
                <input type="date" name="from_date" id="from_date"><br>
            </div>
            <div class="from_to_date">
                <label>Select to Date</label><br>
                <input type="date" name="to_date" id="to_date"><br>
            </div>
            <button type="submit" name="search_date" id="search_date" onclick="search('search_loan_summary.php')">Search <i class="fas fa-search"></i></button>
        </section>
    </div>
<div class="displays allResults new_data" id="revenue_report">
    <h2>Today's Loan Summary</h2>
    <hr>
    <div class="search">
        <input type="search" id="searchCheckout" placeholder="Enter keyword" onkeyup="searchData(this.value)">
        <a class="download_excel" href="javascript:void(0)" onclick="convertToExcel('data_table', 'Loan Summary report')"title="Download to excel"><i class="fas fa-file-excel"></i></a>
    </div>
    <table id="data_table" class="searchTable">
        <thead>
            <tr style="background:var(--primaryColor)">
                <td>S/N</td>
                <td>Customer</td>
                <td>Product</td>
                <td>Requested Amount</td>
                <td>Total Payable</td>
                <td>Time</td>
                <td>Status</td>
                <td></td>
                
            </tr>
        </thead>
        <tbody>
            <?php
                $n = 1;
                $get_users = new selects();
                $details = $get_users->fetch_details_curdate('loan_applications', 'date(application_date)');
                if(gettype($details) === 'array'){
                foreach($details as $detail):
            ?>
            <tr>
                <td style="text-align:center; color:red;"><?php echo $n?></td>
                <td>
                    <?php
                        //get customer
                        $client = $get_users->fetch_details_group('customers', 'customer', 'customer_id', $detail->customer);
                        echo $client->customer;
                    ?>
                </td>
                <td>
                    <?php
                        //get product
                        $prod = $get_users->fetch_details_group('loan_products', 'product', 'product_id', $detail->product);
                        echo $prod->product;
                    ?>
                </td>
                <td style="color:green">
                    <?php echo "₦".number_format($detail->amount, 2);?>
                </td>
                <td>
                    <?php echo "₦".number_format($detail->total_payable, 2);?>
                </td>
                <td style="color:var(--moreColor)"><?php echo date("H:ia", strtotime($detail->trx_date));?></td>
                <td style="color:var(--otherColor)"><?php echo date("H:i:sa", strtotime($detail->application_date));?></td>
                <td>
                    <?php
                        if($detail->loan_status == "0"){
                            echo "<span style='color:var(--primaryColor)'><i class='fas fa-spinner'></i> Under Review</span>";
                        }elseif($detail->loan_status == "-1"){
                            echo "<span style='color:red'><i class='fas fa-cancel'></i> Declined</span>";
                        }elseif($detail->loan_status == "1"){
                            echo "<span style='color:var(--otherColor)'><i class='fas fa-hand-holding-dollar'></i> Approved</span>";
                        }elseif($detail->loan_status == "2"){
                            echo "<span style='color:var(--tertiaryColor)'><i class='fas fa-chart-line'></i> Active</span>";
                        }else{
                            echo "<span style='color:var(--tertiaryColor)'><i class='fas fa-check-circle'></i> Completed</span>";

                        }
                    ?>
                </td>
                
            </tr>
            <?php $n++; endforeach;}?>
        </tbody>
    </table>
    <?php
        if(gettype($details) == "string"){
            echo "<p class='no_result'>'$details'</p>";
        }
    ?>
       <div class="all_modes">
    <?php
        //get total disbursed
        $cashs = $get_users->fetch_sum_curdateCon('loan_applications', 'amount', 'disbursed_date', 'loan_status', '2');
        if(gettype($cashs) === "array"){
            foreach($cashs as $cash){
                ?>
                <a href="javascript:void(0)" class="sum_amount" style="background:var(--otherColor)"><strong>Total Disbursed</strong>: ₦<?php echo number_format($cash->total, 2)?></a>

                <?php
            }
        }
       
        //get transfer
        $trfs = $get_users->fetch_sum_curdate2Con('disbursal', 'amount', 'disbursed_date', 'mode', 'Transfer', 'store', $store);
        if(gettype($trfs) === "array"){
            foreach($trfs as $trf){
                ?>
                <a href="javascript:void(0)" class="sum_amount" style="background:brown"><strong>Transfer</strong>: ₦<?php echo number_format($trf->total, 2)?></a>
                <?php
            }
        }
        // get sum
        $amounts = $get_users->fetch_sum_curdateCon('disbursal', 'amount', 'disbursed_date', 'store', $store);
        foreach($amounts as $amount){
            $paid_amount = $amount->total;
            
        }
        echo "<p class='sum_amount' style='background:green; margin-left:100px;'><strong>Total Disbursement</strong>: ₦".number_format($paid_amount, 2)."</p>";
        
    ?>
    </div>
</div>

<script src="../jquery.js"></script>
<script src="../script.js"></script>