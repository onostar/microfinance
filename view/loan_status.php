<style>
    .not_available{
        width: 50%;
    }
    @media screen and (max-width: 800px){
        .not_available{
            width: 80%;
        }
    }
</style>
<div id="loan_application">
<?php
    session_start();    
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(!isset($_SESSION['user_id'])) {
        header("Location: ../index.php");
        exit();
    }else{
        $customer = $_SESSION['client_id'];
        //check loan status
        $get_details = new selects();
        $existing = $get_details->fetch_details_cond('loan_applications', 'customer', $customer);
        if(is_array($existing)){
            foreach($existing as $exist){
                //get loan product details
                $product_details = $get_details->fetch_details_cond('loan_products', 'product_id', $exist->product);
                if(is_array($product_details)){
                    foreach($product_details as $detail){
                        $product_name = $detail->product;
                    }
                }
                if($exist->loan_status == 0){
                    //get loan product details
                    $product_details = $get_details->fetch_details_cond('loan_products', 'product_id', $exist->product);
                    echo "<div class='not_available'>
                    <p><strong>Existing Loan Application <i class='fas fa-exclamation-triangle' style='color:#cfb20e'></i></strong><br>You have an existing $product_name loan application pending approval. Please wait for it to be processed.</p>
                    </div>";
                    exit();
                }elseif($exist->loan_status == 1){
                    echo "<div class='not_available'>
                    <p><strong><i class='fas fa-exclamation-triangle' style='color: #cfb20e;'></i> Existing Loan Detected</strong><br>You currently have an active $product_name loan. Please note that you are not eligible to apply for a new loan until your current loan is fully repaid.</p></div>";
                }else{
                    echo "<div class='not_available'>
                    <p><strong><i class='fas fa-exclamation-triangle' style='color: #cfb20e;'></i> No Active Loan</strong><br>You currently have an active No Active Loan.</p></div>";
                    
                }
            }
        }else{
            echo "<div class='not_available'>
                <p><strong><i class='fas fa-exclamation-triangle' style='color: #cfb20e;'></i> No Active Loan</strong><br>You currently have no Active Loan.</p></div>";
            }
        }
    ?>
</div>