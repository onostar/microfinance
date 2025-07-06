<div id="disburse" class="displays">

<?php
    session_start();
    $store = $_SESSION['store_id'];
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(isset($_SESSION['user_id'])){
        $user = $_SESSION['user_id'];
     //get customer details
    $get_customer = new selects();
    $rows = $get_customer->fetch_details_cond('customers', 'user_id', $user);
    foreach($rows as $row){
        $customer_id = $row->customer_id;
    }
    //check for current loan
    $lns = $get_customer->fetch_details_2cond('loan_applications', 'customer', 'loan_status', $customer_id, 2);
    if(is_array($lns)){
        foreach($lns as $ln){
            $loan = $ln->loan_id;
        }
?>
    <div class="info" style="width:50%; margin:5px 0;"></div>
   
    <div class="add_user_form" style="width:30%; margin:5px 0;">
        <h3 style="background:var(--tertiaryColor); text-align:left">Post Payment</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section class="addUserForm" style="padding:10px 0">
            <div class="inputs" style="gap:.7rem; align-items:flex-start;padding:10px;">
                <input type="hidden" name="customer" id="customer" value="<?php echo $customer_id?>">
                <input type="hidden" name="loan" id="loan" value="<?php echo $loan?>">
                <div class="data" style="width:100%;">
                    <label for="exp_date">Transaction Date</label>
                    <input type="date" name="trx_date" id="trx_date" required value="<?php echo date("Y-m-d")?>">
                </div>
                <div class="data" style="width:100%;">
                    <label for="amount">Amount (NGN)</label>
                    <input type="text" name="amount" id="amount">
                    
                </div>
                <div class="data" style="width:100%; margin:5px 0">
                    <button type="button" id="post_exp" name="post_exp" onclick="postPayment()">Post Payment  <i class="fas fa-dollar-sign"></i></button>
                </div>
            </div>
        </section>    
    </div>
<?php 
    }else{
         echo "<div class='not_available'><p><strong><i class='fas fa-exclamation-triangle' style='color: #cfb20e;'></i> No Active Loan Application</strong><br>The selected customer have no loan application pending. Please help the customer apply for a loan to enable them add guarantors.</p></div>";
    }
}else{
    header("Location: ../index.php");
}

?>
</div>
