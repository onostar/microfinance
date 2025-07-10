<?php
    date_default_timezone_set("Africa/Lagos");
    session_start();
    $user = $_SESSION['user_id'];
    $customer = htmlspecialchars(stripslashes($_POST['customer_id']));
    $id_type = strtoupper(htmlspecialchars(stripslashes($_POST['id_type'])));
    $id_number = htmlspecialchars(stripslashes($_POST['id_number']));
    $bvn = htmlspecialchars(stripslashes($_POST['bvn']));
    $photo = $_FILES['id_card']['name'];
    // $photo_folder = "../id_cards/".$photo;
    $photo_size = $_FILES['id_card']['size'];
    $allowed_ext = array('png', 'jpg', 'jpeg', 'webp');
    //get current file extention
    $file_ext = explode('.', $photo);
    $file_ext = strtolower(end($file_ext));
    $ran_num ="";
    for($i = 0; $i < 5; $i++){
        $random_num = random_int(0, 9);
        $ran_num .= $random_num;
    }
    
    $id_card = $ran_num."_".$customer.".".$file_ext;
    $photo_folder = "../id_cards/".$id_card;
    $data = array(
        'customer' => $customer,
        'id_type' => $id_type,
        'id_number' => $id_number,
        'id_card' => $id_card,
        'bvn' => $bvn,
        'posted_by' => $user,
        'kyc_date' => date("Y-m-d H:i:s")
    );
    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";
    include "../classes/inserts.php";

    //check if customer already added kyc
    $check = new selects();
    $results = $check->fetch_details_cond('kyc', 'customer', $customer);
    if(is_array($results) && count($results) > 0){
        //get current kyc status
        foreach($results as $result){
            $kyc_status = $result->verification;
        }
        //check if kyc is verified
        if($kyc_status == 1){
            echo "<p class='exist'>KYC verification is complete. You're all set!</p>";
            exit();
        }else if($kyc_status == 0){
            echo "<p class='exist'>Your KYC is currently under verification. Please wait for the process to complete.</p>";
            exit();
        }else{
            //add new kyc
            if(in_array($file_ext, $allowed_ext)){
                if($photo_size <= 500000){
                    //compress image
                    function compressImage($source, $destination, $quality){
                        //get image info
                        $imgInfo = getimagesize($source);
                        $mime = $imgInfo['mime'];
                        //create new image from file
                        switch($mime){
                            case 'image/png':
                                $image = imagecreatefrompng($source);
                                imagejpeg($image, $destination, $quality);
                                break;
                            case 'image/jpeg':
                                $image = imagecreatefromjpeg($source);
                                imagejpeg($image, $destination, $quality);
                                break;
                            
                            case 'image/webp':
                                $image = imagecreatefromwebp($source);
                                imagejpeg($image, $destination, $quality);
                                break;
                            default:
                                $image = imagecreatefromjpeg($source);
                                imagejpeg($image, $destination, $quality);
                        }
                        //return compressed image
                        return $destination;
                    }
                    $compress = compressImage($_FILES['id_card']['tmp_name'], $photo_folder, 70);
                    if($compress){
                        //update kyc data
                        $add_kyc = new add_data('kyc', $data);
                        if($add_kyc){
                            echo "<p><span>KYC added Successfully<br>Kindly await approval</p>";
                        }else{
                            echo "<p class='exist'>Failed to update KYC</p>";
                        }
                    }else{
                        echo "<p class='exist'>Failed to compress image</p>";
                    }
                }else{
                    echo "<p class='exist'>File too large</p>";
                }
            }else{
                echo "<p class='exist'Your Image format is not supported</p>";

            }  
        }
    }else{
        if(in_array($file_ext, $allowed_ext)){
            if($photo_size <= 500000){
                //compress image
                function compressImage($source, $destination, $quality){
                    //get image info
                    $imgInfo = getimagesize($source);
                    $mime = $imgInfo['mime'];
                    //create new image from file
                    switch($mime){
                        case 'image/png':
                            $image = imagecreatefrompng($source);
                            imagejpeg($image, $destination, $quality);
                            break;
                        case 'image/jpeg':
                            $image = imagecreatefromjpeg($source);
                            imagejpeg($image, $destination, $quality);
                            break;
                        
                        case 'image/webp':
                            $image = imagecreatefromwebp($source);
                            imagejpeg($image, $destination, $quality);
                            break;
                        default:
                            $image = imagecreatefromjpeg($source);
                            imagejpeg($image, $destination, $quality);
                    }
                    //return compressed image
                    return $destination;
                }
                $compress = compressImage($_FILES['id_card']['tmp_name'], $photo_folder, 70);
                if($compress){
                    $add_item = new add_data('kyc', $data);
                    $add_item->create_data();
                    if($add_item){
                        echo "<p><span>KYC added Successfully<br>Kindly await approval</p>";
                    }else{
                        echo "<p class='exist'>Failed to add KYC</p>";
                    }
                }else{
                    echo "<p class='exist'>Failed to compress image</p>";
                }
            }else{
                echo "<p class='exist'>File too large</p>";
            }
        }else{
            echo "<p class='exist'>Your Image format is not supported</p>";

        }                    
    }
