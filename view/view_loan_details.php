<div id="edit_customer">
<?php
    session_start();
    $store = $_SESSION['store_id'];
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(isset($_SESSION['user_id'])){
        $user_id = $_SESSION['user_id'];
        // echo $user_id;
        if(isset($_GET['loan'])){
            $loan = $_GET['loan'];
            //get details
            $get_details = new selects();
            $rows = $get_details->fetch_details_cond('loan_applications', 'loan_id', $loan);
            foreach($rows as $row){
                //get customer details
                $cus = $get_details->fetch_details_cond('customers', 'customer_id', $row->customer);
                foreach($cus as $cu){
                    $customer_name = $cu->customer;
                    $acn = $cu->acn;
                    $phone = $cu->phone_numbers;
                    $gender = $cu->gender;
                    $address = $cu->customer_address.", ".$cu->lga.", ".$cu->state_region;
                    $photo = $cu->photo;
                }

?>
<a style="border-radius:15px; background:brown;color:#fff;padding:10px; box-shadow:1px 1px 1px #222"href="javascript:void(0)" onclick="showPage('pending_applications.php')"><i class="fas fa-angle-double-left"></i> Return</a>
    <div id="patient_details">
        <h3 style="background:var(--tertiaryColor)">Loan Application Details</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section class="nomenclature">
            <div class="profile_foto">
                <img src="<?php echo '../photos/'.$photo?>" alt="Photo">
            </div>
            <div class="inputs">
                <div class="data">
                    <label for="customer">Full Name:</label>
                    <input type="text"value="<?php echo $customer_name?>" readonly>
                </div>
                
                <div class="data">
                    <label for="prn">Ledger No.:</label>
                    <input type="text" value="<?php echo $acn?>" readonly>
                   
                </div>
                <div class="data">
                    <label for="phone_number">Phone number:</label>
                    <input type="text" required value="<?php echo $phone?>" readonly>
                </div>
                
                <div class="data">
                    <label for="gender">Gender:</label>
                    <input type="text" value="<?php echo $gender?>">
                </div>
                <div class="data" style="width:60%">
                    <label for="Address">Address:</label>
                    <textarea style="width:100%!important; padding:2px;border:none;" readonly><?php echo $address?></textarea>
                </div>
                <div class="data" style="width:auto!important">
                    <a style="border-radius:15px; background:var(--menuColor);color:#fff;padding:10px; box-shadow:1px 1px 1px #222; border:1px solid #fff;" href="javascript:void(0)" onclick="showPage('view_customer_details.php?customer=<?php echo $row->customer?>')"><i class="fas fa-user-tag"></i> View More Details</a>

                </div>
            </div>
            
        </section>    
        <!-- <section id="prescriptions">
            <h3 style="background:var(--menuColor); color:#fff; text-align:left">Employment details</h3>
            <div class="nomenclature" style="box-shadow:none">
                <div class="inputs" style="width:100%; align-items:flex-end">
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="customer">Occupation:</label>
                        <input type="text" name="last_name" id="last_name" value="<?php echo $row->occupation?>" readonly>
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="other_names">Estimated Monthly Income (NGN):</label>
                        <input type="text"  value="<?php echo $row->income?>" readonly>
                    
                    </div>
                    <div class="data"style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="other_names">Business/Company Name:</label>
                        <input type="text"  value="<?php echo $row->business?>" readonly>
                    
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left;width:auto" for="other_names">Business/Company Address:</label>
                        <input type="text"  value="<?php echo $row->business_address?>" readonly>
                    
                    </div>
                </div>
                
            </div>
        </section>
        <section id="main_consult">
            <h3 style="background:var(--otherColor); text-align:left">Next of Kin Information</h3>
            <div class="nomenclature" style="box-shadow:none">
                <div class="inputs" style="width:100%; align-items:flex-end">
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="customer">Full Name:</label>
                        <input type="text" name="last_name" id="last_name" value="<?php echo $row->nok?>" readonly>
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="other_names">Relationship:</label>
                        <input type="text"  value="<?php echo $row->nok_relation?>" readonly>
                    
                    </div>
                    <div class="data"style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left; width:auto" for="other_names">Phone Number:</label>
                        <input type="text"  value="<?php echo $row->nok_phone?>" readonly>
                    
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="background:transparent; color:green; text-align:left;width:auto" for="other_names">Residential Address:</label>
                        <input type="text"  value="<?php echo $row->nok_address?>" readonly>
                    
                    </div>
                    
                </div>
                
            </div>
        </section> -->
        <!-- loan details -->
        <section id="prescriptions">
            <div class="add_user_form" style="margin:0!important" style="width:100%!important">
                <h3 style="background:var(--menuColor);color:#fff;text-align:left">Loan Details</h3>
                <section style="text-align:left">
                    <div class="inputs" style="align-items:flex-end; justify-content:left; gap:.5rem">
                       <div class="data" style="width:32%;">
                            <label for="loan_name">Product:</label>
                            <?php
                                $prods = $get_details->fetch_details_cond('loan_products', 'product_id', $row->product);
                                if(is_array($prods)){
                                    foreach($prods as $prod){
                                        $product_name = $prod->product;
                                    }
                                }
                            ?>
                            <input type="text" value="<?php echo $product_name?>" readonly>
                       </div>
                        <div class="data" style="width:32%;">
                            <label for="amount" style="text-align:left!important;">Amount Requested (₦)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->amount, 2)?>" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for="purpose" style="text-align:left!important;">Loan Purpose</label>
                            <input type="text" value="<?php echo $row->purpose?>" readonly>
                        </div>
                        
                        <div class="data" style="width:32%;">
                            <label for="duration" style="text-align:left!important;">Loan Term</label>
                            <input type="text" value="<?php echo $row->loan_term?> Months" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for="repayment" style="text-align:left!important;">Repayment Frequency</label>
                            <input type="text" value="<?php echo $row->frequency?>" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for="interest" style="text-align:left!important;">Interest: (<?php echo $row->interest_rate?>%)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->interest)?>" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for="processing"> Processing Fee: (<?php echo $row->processing_rate?>%)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->processing_fee)?>" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for="">Total Repayable Amount:</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->total_payable)?>" readonly>
                        </div>
                        <div class="data" style="width:32%;">
                            <label for=""><?php echo $row->frequency?> Installment:</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->installment)?>" readonly>
                        </div>
                        
                        <?php if($row->collateral == "Yes"){?>
                        <div class="data" style="width:64%;">
                            <label for="collateral"> Collateral Details</label>
                            <textarea readonly><?php echo $row->collateral?></textarea>
                        </div>
                        <?php }?>
                    </div>
                </section>   
            </div>
        </section>
        <section id="last_consult">
            <h3 style="background:var(--menuColor); text-align:left; color:#fff;">KYC Info</h3>
            <div class="nomenclature" style="box-shadow:none">
                
                <div class="inputs" style="width:100%; align-items:flex-end">
                    <!-- get kyc -->
                     <?php
                        $kycs = $get_details->fetch_details_cond('kyc', 'customer', $row->customer);
                        if(is_array($kycs)){
                            foreach($kycs as $kyc){
                                if($kyc->verification == 0){
                                    echo "<p style='text-align:center;font-size:.9rem;padding:5px;'>KYC is currently under verification.</p>";
                                }elseif($kyc->verification == -1){
                                    echo "<p style='text-align:center;font-size:.9rem;padding:5px;'>KYC was declined.</p>";
                                }else{
                     ?>
                    <div class="data" style="width:auto!important">
                        <label style="width:auto" for="other_names">ID Type:</label>
                        <input type="text"  value="<?php echo $kyc->id_type?>" readonly>
                    
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="width:auto" for="other_names">ID Number:</label>
                        <input type="text"  value="<?php echo $kyc->id_number?>" readonly>
                    
                    </div>
                    <div class="data" style="width:auto!important">
                        <label style="width:auto" for="other_names">BVN:</label>
                        <input type="text"  value="<?php echo $kyc->bvn?>" readonly>
                    
                    </div>
                    <div class="data">
                        <a style="border-radius:5px; background:silver;color:#222;padding:10px; box-shadow:1px 1px 1px #222; border:1px solid #fff;" href="../id_cards/<?php echo $kyc->id_card?>" target="_blank"><i class="fas fa-id-card"></i> View Identity Card</a>
                    </div>
                    <?php
                                }
                            }
                        }else{
                            echo "<p style='text-align:center;font-size:.9rem;padding:5px;'>No KYC available.</p>";
                        }
                    ?>
                   
                </div>
                 
            </div>
        </section>
    </div>

<?php
            }
        }
    }else{
        header("Location: ../index.php");
    }
?>
</div>
