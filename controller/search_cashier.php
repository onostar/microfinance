<?php
    session_start();
    $store = $_SESSION['store_id'];
    $from = htmlspecialchars(stripslashes($_POST['from_date']));
    $to = htmlspecialchars(stripslashes($_POST['to_date']));

    // instantiate classes
    include "../classes/dbh.php";
    include "../classes/select.php";

    $get_cashier = new selects();
    $details = $get_cashier->fetch_details_dateGro1con('deposits', 'date(post_date)', $from, $to, 'store', $store, 'posted_by');
    $n = 1; 

?>
<h2>Officer Collections between '<?php echo date("jS M, Y", strtotime($from)) . "' and '" . date("jS M, Y", strtotime($to))?>'</h2>
    <hr>
    <div class="search">
        <input type="search" id="searchRevenue" placeholder="Enter keyword" onkeyup="searchData(this.value)">
        <a class="download_excel" href="javascript:void(0)" onclick="convertToExcel('data_table', 'Loan Officer report')"title="Download to excel"><i class="fas fa-file-excel"></i></a>
    </div>
    <table id="data_table" class="searchTable">
        <thead>
            <tr style="background:var(--primaryColor)">
                <td>S/N</td>
                <td>Loan Officer</td>
                <td>Cash</td>
                <td>POS</td>
                <td>Transfer</td>
                <!-- <td>Wallet</td>
                <td>Credit</td> -->
                <td>Total</td>
                
            </tr>
        </thead>
        <tbody>
<?php
    if(gettype($details) === 'array'){
        foreach($details as $detail){
            //get posted by
            $psts = $get_cashier->fetch_details_cond('users', 'user_id', $detail->posted_by);
            if(is_array($psts)){
                foreach($psts as $ps){
                    $cashier_name = $ps->full_name;
                    $role = $ps->user_role;
                }
            }
            if($role == "Client"){
                //check customer table for name
                $cus = $get_users->fetch_details_cond('customers', 'user_id', $detail->posted_by);
                foreach($cus as $c){
                    $cashier = $c->customer;
                }
                
            }else{
                $cashier = $cashier_name;
            }
?>
            <tr>
                <td style="text-align:center; color:red;"><?php echo $n?></td>
                <td>
                    <?php if($role == "Client"){?>
                    <a href="javascript:void(0)" style="color:var(--otherColor)"><?php echo $cashier?></a>
                    <?php }else{?>
                    <a href="javascript:void(0)" style="color:var(--otherColor)" onclick="showPage('officer_collection_date.php?cashier=<?php echo $detail->posted_by?>&from=<?php echo $from?>&to=<?php echo $to?>')"><?php echo $cashier?></a>
                    <?php }?>
                </td>
                <td>
                    <?php
                        $get_cash = new selects();
                        $cashs = $get_cash->fetch_sum_2dateCondGr('deposits', 'amount', 'payment_mode', 'date(post_date)', 'posted_by', $from, $to, 'Cash', $detail->posted_by);
                        foreach($cashs as $cash){
                            echo "₦".number_format($cash->total, 2);
                        }
                    ?>
                </td>
                <td>
                    <?php
                        $get_cash = new selects();
                        $cashs = $get_cash->fetch_sum_2dateCondGr('deposits', 'amount', 'payment_mode', 'date(post_date)', 'posted_by', $from, $to, 'POS', $detail->posted_by);
                        foreach($cashs as $cash){
                            echo "₦".number_format($cash->total, 2);
                        }
                    ?>
                </td>
                <td>
                    <?php
                        $get_cash = new selects();
                        $cashs = $get_cash->fetch_sum_2dateCondGr('deposits', 'amount', 'payment_mode', 'date(post_date)', 'posted_by', $from, $to, 'Transfer', $detail->posted_by);
                        foreach($cashs as $cash){
                            echo "₦".number_format($cash->total, 2);
                        }
                    ?>
                </td>
                <!-- <td>
                    <?php
                        $get_cash = new selects();
                        $cashs = $get_cash->fetch_sum_2dateCondGr('payments', 'amount_paid', 'payment_mode', 'date(post_date)', 'posted_by', $from, $to, 'Wallet', $detail->posted_by);
                        foreach($cashs as $cash){
                            echo "₦".number_format($cash->total, 2);
                        }
                    ?>
                </td>
                <td>
                    <?php
                        $get_cash = new selects();
                        $cashs = $get_cash->fetch_sum_2dateCondGr('payments', 'amount_due', 'payment_mode', 'date(post_date)', 'posted_by', $from, $to, 'Credit', $detail->posted_by);
                        foreach($cashs as $cash){
                            echo "₦".number_format($cash->total, 2);
                        }
                    ?>
                </td> -->
                <td style="color:red">
                    <?php
                        // get sum
                        $get_total = new selects();
                        $amounts = $get_total->fetch_sum_2dateCond('deposits', 'amount', 'posted_by', 'date(post_date)', $from, $to, $detail->posted_by);
                        foreach($amounts as $amount){
                            $paid_amount = $amount->total;
                        }
                        // if credit was sold
                        /* $get_credit = new selects();
                        $credits = $get_credit->fetch_sum_2date2Cond('payments', 'amount_due', 'date(post_date)', 'payment_mode', 'posted_by', $from, $to, 'Credit', $detail->posted_by);
                        if(gettype($credits) === "array"){
                            foreach($credits as $credit){
                                $owed_amount = $credit->total;
                            }
                            $total_revenue = $owed_amount + $paid_amount;
                            echo "₦".number_format($total_revenue, 2);

                        }
                        //if no credit sales
                        if(gettype($credits) == "string"){ */
                            echo "₦".number_format($paid_amount, 2);
                            
                        // }
                    ?>
                </td>
                
                
            </tr>
            <?php $n++; }?>
            <tr>
                <td></td>
                <td style="color:green; font-size:1rem;">Total</td>
                <td style="color:green; font-size:1rem">
                    <?php
                        $get_total = new selects();
                        $totals = $get_total->fetch_sum_2date2Cond('deposits', 'amount', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'Cash', $store);
                        foreach($totals as $total){
                            echo "₦".number_format($total->total, 2);
                        }
                    ?>
                </td>
                <td style="color:green; font-size:1rem">
                    <?php
                        $get_total = new selects();
                        $totals = $get_total->fetch_sum_2date2Cond('deposits', 'amount', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'POS', $store);
                        foreach($totals as $total){
                            echo "₦".number_format($total->total, 2);
                        }
                    ?>
                </td>
                <td style="color:green; font-size:1rem">
                    <?php
                        $get_total = new selects();
                        $totals = $get_total->fetch_sum_2date2Cond('deposits', 'amount', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'Transfer', $store);
                        foreach($totals as $total){
                            echo "₦".number_format($total->total, 2);
                        }
                    ?>
                </td>
                <!-- <td style="color:green; font-size:1rem">
                    <?php
                        $get_total = new selects();
                        $totals = $get_total->fetch_sum_2date2Cond('payments', 'amount_paid', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'Wallet', $store);
                        foreach($totals as $total){
                            echo "₦".number_format($total->total, 2);
                        }
                    ?>
                </td>
                <td style="color:green; font-size:1rem">
                    <?php
                        $get_total = new selects();
                        $totals = $get_total->fetch_sum_2date2Cond('payments', 'amount_due', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'Credit', $store);
                        foreach($totals as $total){
                            echo "₦".number_format($total->total, 2);
                        }
                    ?>
                </td> -->
                <td style="color:red; font-size:1rem">
                    <?php
                        // get sum
                        $get_total = new selects();
                        $amounts = $get_total->fetch_sum_2dateCond('deposits', 'amount', 'store', 'date(post_date)', $from, $to, $store);
                        foreach($amounts as $amount){
                            $paid_amount = $amount->total;
                        }
                        // if credit was sold
                        /* $get_credit = new selects();
                        $credits = $get_credit->fetch_sum_2date2Cond('payments', 'amount_due', 'date(post_date)', 'payment_mode', 'store', $from, $to, 'Credit', $store);
                        if(gettype($credits) === "array"){
                            foreach($credits as $credit){
                                $owed_amount = $credit->total;
                            }
                            $total_revenue = $owed_amount + $paid_amount;
                            echo "₦".number_format($total_revenue, 2);

                        }
                        //if no credit sales
                        if(gettype($credits) == "string"){ */
                            echo "₦".number_format($paid_amount, 2);
                            
                        // }
                    ?>
                </td>
            </tr>
        </tbody>
    </table>
<?php
    }else{
        echo "<p class='no_result'>'$details'</p>";
    }
    
?>
