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
    include "../classes/insert.php";
    include "../classes/select.php";
    //checkif customer has an existing loan application
    $get_details = new selects();