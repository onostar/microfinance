<?php
    session_start();
    $store = $_SESSION['store_id'];
    $from = htmlspecialchars(stripslashes($_POST['from_date']));
    $to = htmlspecialchars(stripslashes($_POST['to_date']));

    // instantiate classes
    include "../classes/dbh.php";
    include "../classes/select.php";

    $get_revenue = new selects();
    $details = $get_revenue->fetch_details_date2Con('disbursal', 'date(disbursed_date)', $from, $to, 'store', $store);
    $n = 1;
?>
<h2>Loan Disbursements between '<?php echo date("jS M, Y", strtotime($from)) . "' and '" . date("jS M, Y", strtotime($to))?>'</h2>
    <hr>
    <div class="search">
        <input type="search" id="searchRevenue" placeholder="Enter keyword" onkeyup="searchData(this.value)">
        <a class="download_excel" href="javascript:void(0)" onclick="convertToExcel('data_table', 'Loan Disbursement report')"title="Download to excel"><i class="fas fa-file-excel"></i></a>
    </div>
    <table id="data_table" class="searchTable">
        <thead>
        <tr style="background:var(--primaryColor)">
                <td>S/N</td>
                <td>Customer</td>
                <td>Trx. No.</td>
                <td>Amount</td>
                <td>Payment Mode</td>
                <td>Bank</td>
                <td>Trans. Date</td>
                <td>Date Posted</td>
                <td>Posted by</td>
                
            </tr>
        </thead>
        <tbody>
<?php
    if(gettype($details) === 'array'){
    foreach($details as $detail){

?>
            <tr>
                <td style="text-align:center; color:red;"><?php echo $n?></td>
                <td>
                    <?php
                        //get customer
                        $client = $get_revenue->fetch_details_group('customers', 'customer', 'customer_id', $detail->customer);
                        echo $client->customer;
                    ?>
                </td>
                <td style="color:green"><?php echo $detail->trx_number?></td>
                <td>
                    <?php echo "₦".number_format($detail->amount, 2);?>
                </td>
                <td>
                    <?php echo $detail->mode?>
                </td>
                <td>
                    <?php
                        if($detail->bank == 0){
                            echo "Cash Account";
                        }else{
                            //get bank name
                            $bnks = $get_revenue->fetch_details_group('banks', 'bank', 'bank_id', $detail->bank);
                            echo $bnks->bank;
                        }
                    ?>
                </td>
                <td style="color:var(--otherColor)"><?php echo date("d-m-Y", strtotime($detail->trx_date));?></td>
                <td style="color:var(--primaryColor)"><?php echo date("d-m-y, h:ia", strtotime($detail->disbursed_date));?></td>
                <td>
                    <?php
                        //get posted by
                        $checkedin_by = $get_revenue->fetch_details_group('users', 'full_name', 'user_id', $detail->disbursed_by);
                        echo $checkedin_by->full_name;
                    ?>
                </td>
                
            </tr>
            <?php $n++; }}?>
        </tbody>
    </table>
    <?php
    if(gettype($details) == "string"){
        echo "<p class='no_result'>'$details'</p>";
    }
    ?>
    <div class="all_modes">

<?php
    //get cash
    $cashs = $get_revenue->fetch_sum_2date2Cond('disbursal', 'amount', 'date(disbursed_date)', 'mode', 'store', $from, $to, 'Cash', $store);
    if(gettype($cashs) === "array"){
        foreach($cashs as $cash){
            echo "<p class='sum_amount' style='background:var(--otherColor)'><strong>Cash</strong>: ₦".number_format($cash->total, 2)."</p>";
        }
    }
    
    //get transfer
    $trfs = $get_revenue->fetch_sum_2date2Cond('disbursal', 'amount', 'date(disbursed_date)', 'mode', 'store', $from, $to, 'Transfer', $store);
    if(gettype($trfs) === "array"){
        foreach($trfs as $trf){
            echo "<p class='sum_amount' style='background:brown'><strong>Transfer</strong>: ₦".number_format($trf->total, 2)."</p>";
        }
    }
    // get sum
    $amounts = $get_revenue->fetch_sum_2dateCond('disbursal', 'amount', 'store', 'date(disbursed_date)', $from, $to, $store);
    foreach($amounts as $amount){
        echo "<p class='sum_amount' style='background:green; margin-left:250px; font-size:.8rem;'><strong>Total Disbursement</strong>: ₦".number_format($amount->total, 2)."</p>";
    }
?>
    </div>