<?php
    date_default_timezone_set("Africa/Lagos");
    session_start();
    $date = date("Y-m-d H:i:s");
    $user = $_SESSION['user_id'];
    $kyc = $_GET['kyc'];
    $company = $_SESSION['company'];
    

    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";
    include "../classes/update.php";
    include "../classes/inserts.php";

    //get customer
    $get_details = new selects();
    $rows = $get_details->fetch_details_cond('kyc', 'kyc_id', $kyc);
    foreach($rows as $row){
        $customer = $row->customer;
    }
    //get details 
    $results = $get_details->fetch_details_cond('customers', 'customer_id', $customer);
    foreach($results as $result){
        $client = $result->customer;
        $email = $result->customer_email;
    }
    //approve kyc
    $update = new Update_table();
    $update->update_tripple('kyc', 'verification', 1, 'verified_by', $user, 'verified_date', $date, 'kyc_id', $kyc);
    //update reg status in customer table
    $update->update('customers', 'reg_status', 'customer_id', 1, $customer);
    $message = "Dear $customer, We’re happy to inform you that your KYC verification has been successfully completed. 🎉<br> Your account is now fully verified, and you can enjoy uninterrupted access to all features and services.<br>Thank you for completing the verification process. If you have any questions or need assistance, feel free to reach out to our support team.<br><br>
Best regards,<br>$company;

";
    if($update){
        //insert into notifications
        $notif_data = array(
            'client' => $customer,
            'subject' => 'KYC Verification status',
            'message' => $message,
            'post_date' => $date,
        );
        $add_data = new add_data('notifications', $notif_data);
        $add_data->create_data();
        echo "<div class='success'><p><i class='fas fa-thumbs-up'></i> KYC Approved for $client successfully!</p></div>";
    }