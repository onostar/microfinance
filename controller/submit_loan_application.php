<?php
    session_start();
    date_default_timezone_set("Africa/Lagos");;
    $user = $_SESSION['user_id'];
    $date = date("Y-m-d H:i:s");
    $customer = htmlspecialchars(stripslashes($_POST['customer']));
    $product = htmlspecialchars(stripslashes($_POST['product']));
    $amount = htmlspecialchars(stripslashes($_POST['amount']));
    $purpose = ucwords(htmlspecialchars(stripslashes($_POST['purpose'])));
    $frequency = htmlspecialchars(stripslashes($_POST['frequency']));
    $installment = htmlspecialchars(stripslashes($_POST['installment']));
    $interest = htmlspecialchars(stripslashes($_POST['interest']));
    $interest_rate = htmlspecialchars(stripslashes($_POST['interest_rate']));
    $collateral = htmlspecialchars(stripslashes($_POST['collateral']));
    $processing = htmlspecialchars(stripslashes($_POST['processing_fee']));
    $processing_rate = htmlspecialchars(stripslashes($_POST['processing']));
    $total = htmlspecialchars(stripslashes($_POST['total_payable']));
    $loan_term = htmlspecialchars(stripslashes($_POST['loan_term']));

    $data = array(
        'customer' => $customer,
        'product' => $product,
        'amount' => $amount,
        'purpose' => $purpose,
        'frequency' => $frequency,
        'installment' => $installment,
        'interest_rate' => $interest_rate,
        'interest' => $interest,
        'collateral' => $collateral,
        'processing_fee' => $processing,
        'processing_rate' => $processing_rate,
        'total_payable' => $total,
        'loan_term' => $loan_term,
        'posted_by' => $user,
        'application_date' => $date
    );
    include "../classes/dbh.php";
    include "../classes/inserts.php";
    include "../classes/select.php";
    //check if customer has an existing loan application
    $get_details = new selects();
    $existing = $get_details->fetch_details_cond('loan_applications', 'customer', $customer);
    if(is_array($existing)){
        foreach($existing as $exist){
            if($exist->loan_status == 0){
                echo "<div class='not_available'>
                <p><strong>Existing Loan Application <i class='fas fa-exclamation-triangle' style='color:#cfb20e'></i></strong><br>You have an existing loan application pending approval. Please wait for it to be processed.</p>
                </div>";
                exit();
            }elseif($exist->loan_status == 1){
                echo "<div class='not_available'>
                    <p><strong><i class='fas fa-exclamation-triangle' style='color: #cfb20e;'></i> Existing Loan Detected</strong><br>You currently have an active loan. Please note that you are not eligible to apply for a new loan until your current loan is fully repaid.</p></div>";
            }else{
                //submitloan application
                $add_loan = new add_data('loan_applications', $data);
                $add_loan->create_data();
                if($add_loan){
                   echo "<div class='not_available'>
                    <p><strong><i class='fas fa-check-circle' style='color: #28a745;'></i> Loan Application Submitted</strong><br>Your loan application has been submitted successfully. Kindly await approval and disbursement.</p></div>";
                }
            }
        }
    }else{
        //submitloan application
        $add_loan = new add_data('loan_applications', $data);
        $add_loan->create_data();
        if($add_loan){
            echo "<div class='success'><p>Loan application submitted successfully. Kindly await approval for disbursement <i class='fas fa-thumbs-up'></i></p></div>";
        }
    }