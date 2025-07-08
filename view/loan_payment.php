<div id="fund_account">
<?php
    session_start();
    include "../classes/dbh.php";
    include "../classes/select.php";
    include "../classes/update.php";
    if(isset($_SESSION['user_id'])){
        $user_id = $_SESSION['user_id'];
        $store = $_SESSION['store_id'];
        // echo $user_id;
    
    if(isset($_GET['customer']) && isset($_GET['schedule'])){
        $customer_id = $_GET['customer'];
        $schedule = $_GET['schedule'];
        //get customer details;
        $get_details = new selects();
        $rows = $get_details->fetch_details_cond('customers', 'customer_id', $customer_id);
        foreach($rows as $row){
            $customer = $row->customer;
            $acn = $row->acn;
        }
        //generate deposit receipt
        //get current date
        $todays_date = date("dmyhi");
        $ran_num ="";
        for($i = 0; $i < 5; $i++){
            $random_num = random_int(0, 3);
            $ran_num .= $random_num;
        }
        $receipt_id = "LP".$todays_date.$ran_num.$user_id.$schedule;
        //get balance from transactions
        $bals = $get_details->fetch_account_balance($acn);
        if(gettype($bals) == 'array'){
            foreach($bals as $bal){
                $balance = $bal->balance;
            }
        }
        //get loan details
        $lns = $get_details->fetch_details_cond('repayment_schedule', 'repayment_id', $schedule);
        foreach($lns as $lns){
            $loan = $lns->loan;
            $amount_due = $lns->amount_due;
            $payment_status = $lns->payment_status;
        }
       //get total paid
       $ttls = $get_details->fetch_sum_single('repayment_schedule', 'amount_paid', 'loan', $loan);
       if(gettype($ttls) == 'array'){
            foreach($ttls as $ttl){
                $total_paid = $ttl->total;
            }
        }else{
            $total_paid = 0;
        }
       //get total due
       $ttlx = $get_details->fetch_sum_single('repayment_schedule', 'amount_due', 'loan', $loan);
       if(gettype($ttlx) == 'array'){
            foreach($ttlx as $ttx){
                $total_due = $ttx->total;
            }
        }else{
            $total_due = 0;
        }
        //
        $debt = $total_due - $total_paid;

?>
<div class="back_invoice">
    <button class="page_navs" id="back" onclick="showPage('customer_repayment.php?customer=<?php echo $customer_id?>')"><i class="fas fa-angle-double-left"></i> Back</button>

    <!-- <a href="javascript:void(0)" onclick="showPage('debt_payment.php?customer=<?php echo $customer_id?>') "title="view customer invoices" style="background:green; color:#fff; padding:10px; border-radius:10px; box-shadow:1px 1px 1px #222">View Invoices <i class="fas fa-receipt"></i></a> -->
</div>
<div id="deposit" class="displays">
    <div class="info" style="width:70%; margin:5px 0;"></div>
    <div class="fund_account" style="width:80%; margin:5px 0;">
        <h3 style="background:var(--labColor); text-align:left">Post customer payments</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <div class="details_forms">
            <section class="addUserForm">
                <div class="inputs" style="flex-wrap:wrap">
                    <input type="hidden" name="invoice" id="invoice" value="<?php echo $receipt_id?>">
                    <input type="hidden" name="posted" id="posted" value="<?php echo $user_id?>">
                    <input type="hidden" name="customer" id="customer" value="<?php echo $customer_id?>">
                    <input type="hidden" name="balance" id="balance" value="<?php echo $debt?>">
                    <input type="hidden" name="store" id="store" value="<?php echo $store?>">
                    <input type="hidden" name="schedule" id="schedule" value="<?php echo $schedule?>">
                    
                    <div class="data" style="width:100%; margin:5px 0">
                        <label for="amount"> Transaction Date</label>
                        <input type="date" name="trans_date" id="trans_date" value="<?php echo date('Y-m-d')?>">
                    </div>
                    <div class="data" style="width:50%; margin:5px 0">
                        <label for="amount"> Amount paid</label>
                        <input type="text" name="amount" id="amount" required placeholder="0.00">
                    </div>
                    <div class="data" style="width:45%">
                        <label for="Payment_mode"><span class="ledger">Dr. Ledger</span> (Cash/Bank)</label>
                        <select name="payment_mode" id="payment_mode" onchange="checkMode(this.value)">
                            <option value=""selected>Select payment option</option>
                            <option value="Cash">Cash</option>
                            <option value="POS">POS</option>
                            <option value="Transfer">Transfer</option>
                        </select>
                    </div>
                    <div class="data" id="selectBank"  style="width:100%!important">
                        <select name="bank" id="bank">
                            <option value=""selected>Select Bank</option>
                            <?php
                                $get_bank = new selects();
                                $rows = $get_bank->fetch_details('banks', 10, 10);
                                foreach($rows as $row):
                            ?>
                            <option value="<?php echo $row->bank_id?>"><?php echo $row->bank?></option>
                            <?php endforeach?>
                        </select>
                    </div>
                    <div class="data" style="width:100%; margin:5px 0">
                        <label for="details"> Description</label>
                        <textarea name="details" id="details" cols="30" rows="5" placeholder="Enter a detailed description of the transaction"></textarea>
                    </div>
                    <div class="data" style="width:50%; margin:5px 0">
                        <button type="submit" id="post_exp" name="post_exp" onclick="payLoan()">Post payment <i class="fas fa-cash-register"></i></button>
                    </div>
                </div>
            </section>
            <section class="customer_details" style="height:100%;">
                <div class="inputs">
                    <div class="data">
                        <label for="customer_id">Customer ID:</label>
                        <input type="text" value="<?php echo $acn?>">
                    </div>
                    <div class="data">
                        <label for="customer_name"><span class="ledger" style="color:#fff">Cr. Ledger</span> (Client):</label>
                        <input type="text" value="<?php echo $customer?>">
                    </div>
                    <?php if($balance >= 0){?>
                    <div class="data">
                        <label for="balance">Account balance:</label>
                        <input type="text" value="<?php echo "₦".number_format(0, 2)?>" style="color:red;">
                    </div>
                    <?php }else{?>
                    <div class="data">
                        <label for="balance">Account balance:</label>
                        <input type="text" value="<?php echo "₦".number_format(-($balance), 2)?>" style="color:green;">
                    </div>
                    <?php }?>
                    <div class="data">
                        <label for="balance">Loan Due:</label>
                        <input type="text" value="<?php echo "₦".number_format($debt, 2)?>" style="color:red;">
                    </div>
                </div>
            </section> 
        </div>
    </div>
</div>
<?php
            }
        
    }else{
        header("Location: ../index.php");
    }
?>
</div>