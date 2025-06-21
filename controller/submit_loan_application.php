<?php
    session_start();
    date_default_timezone_set("Africa/Lagos");;
    $user = $_SESSION['user_id'];
    $date = date("Y-m-d H:i:s");
    $customer = htmlspecialchars(stripslashes($_POST['customer']));
    $product = htmlspecialchars(stripslashes($_POST['product']));
    $amount = htmlspecialchars(stripslashes($_POST['amount']));
    $purpose = ucwords(htmlspecialchars(stripslashes($_POST['purpose'])));
    $repayment = htmlspecialchars(stripslashes($_POST['repayment']));
    $interest = htmlspecialchars(stripslashes($_POST['interest']));
    $collateral = htmlspecialchars(stripslashes($_POST['collateral']));
    $processing = htmlspecialchars(stripslashes($_POST['processing']));
    $total = htmlspecialchars(stripslashes($_POST['total_payable']));
    $loan_term = htmlspecialchars(stripslashes($_POST['loan_term']));

    $data = array(
        'customer' => $customer,
        'product' => $product,
        'amount' => $amount,
        'purpose' => $purpose,
        'repayment' => $repayment,
        'interest' => $interest,
        'collateral' => $collateral,
        'processing_fee' => $processing,
        'total_payable' => $total,
        'loan_term' => $loan_term,
        'posted_by' => $user,
        'application_date' => $date
    );