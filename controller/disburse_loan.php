<?php
    date_default_timezone_set("Africa/Lagos");
    session_start();
    $date = date("Y-m-d H:i:s");
    $user = $_SESSION['user_id'];
    $store = $_SESSION['store_id'];
    $loan = htmlspecialchars(stripslashes($_POST['loan']));
    $customer = htmlspecialchars(stripslashes($_POST['customer']));
    $amount = htmlspecialchars(stripslashes($_POST['amount']));
    $contra = htmlspecialchars(stripslashes($_POST['contra']));
    $trx_date = htmlspecialchars(stripslashes($_POST['trx_date']));
    $company = $_SESSION['company'];
    require "../PHPMailer/PHPMailerAutoload.php";
    require "../PHPMailer/class.phpmailer.php";
    require "../PHPMailer/class.smtp.php";

    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";
    include "../classes/update.php";
    include "../classes/inserts.php";

    //get details
    $get_details = new selects();
    $rows = $get_details->fetch_details_cond('loan_applications', 'loan_id', $loan);
    foreach($rows as $row){
        $interest = $row->interest;
        $processing = $row->processing_fee;
        $installment = $row->installment;
        $total = $row->total_payable;
        $loan_term = $row->loan_term;
        $frequency = $row->frequency;
    }
    //get customer details 
    $results = $get_details->fetch_details_cond('customers', 'customer_id', $customer);
    foreach($results as $result){
        $client = $result->customer;
        $customer_email = $result->customer_email;
    }
    //approve loan
    $update = new Update_table();
    $update->update_tripple('loan_applications', 'loan_status', 1, 'approved_by', $user, 'approve_date', $date, 'loan_id', $loan);
    //update reg status in customer table
    $message = "<p>Dear $client, <br> We’re pleased to inform you that your loan application has been approved ✅.<br><br>Your loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.<br><br>Thank you for choosing us. We’re excited to support your financial journey!.<br><br>Best regards,<br>$company</p>";
    if($update){
        //insert into notifications
        $notif_data = array(
            'client' => $customer,
            'subject' => 'Your Loan Has Been Approved',
            'message' => 'Dear '.$client.', 

            We’re pleased to inform you that your loan application has been approved ✅.

Your loan is now awaiting disbursement, and you will receive a notification once the funds have been released to your account.

Thank you for choosing us. We’re excited to support your financial journey!
            
            Best regards,
            '.$company,
            'post_date' => $date,
        );
        $add_data = new add_data('notifications', $notif_data);
        $add_data->create_data();
        /* send mails to customer */
        function smtpmailer($to, $from, $from_name, $subject, $body){
            $mail = new PHPMailer();
            $mail->IsSMTP();
            $mail->SMTPAuth = true; 
    
            $mail->SMTPSecure = 'ssl'; 
            $mail->Host = 'www.dorthprosuite.com';
            $mail->Port = 465; 
            $mail->Username = 'admin@dorthprosuite.com';
            $mail->Password = 'yMcmb@her0123!';   
    
    
            $mail->IsHTML(true);
            $mail->From="admin@dorthprosuite.com";
            $mail->FromName=$from_name;
            $mail->Sender=$from;
            $mail->AddReplyTo($from, $from_name);
            $mail->Subject = $subject;
            $mail->Body = $body;
            $mail->AddAddress($to);
            $mail->AddAddress('onostarmedia@gmail.com');
            
            if(!$mail->Send())
            {
                $error = "Failed to send mail";
                
                return $error; 
            }
            else 
            {
                
                /* success message */
                
                $error = "Message Sent Successfully";
                
                // header("Location: index.html");
                return $error;
            }
        }
        
        $to = $customer_email;
        $from = 'admin@dorthprosuite.com';
        $from_name = "$company";
        $name = "$company";
        $subj = 'Your Loan Has Been Approved';
        $msg = "<div>$message</div>";
        
        $error=smtpmailer($to, $from, $name ,$subj, $msg);
        ?>
        <div class='not_available'>
        <p><i class='fas fa-check-circle' style='color: #28a745;'></i> Loan Application Approved Successfully</p><br>
        <a href="javascript:void(0)" style="padding:5px;background:var(--tertiaryColor);color:#fff;box-shadow:1px 1px 1px #222; text-align:center;" onclick="showPage('../view/pending_applications.php')"> Continue <i class="fas fa-paper-plane"></i></a></div>
    <?php
    }