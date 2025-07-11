<div id="loan_applications">
    <style>
        table td {
            font-size:.7rem;
        }
        .main_consult{
            margin: 10px 0;
        }
    </style>
<?php
    date_default_timezone_set("Africa/Lagos");
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
                    $income = $cu->income;
                }

?>
<a style="border-radius:15px; background:brown;color:#fff;padding:10px; box-shadow:1px 1px 1px #222; position:fixed;" href="javascript:void(0)" onclick="showPage('active_loans.php')"><i class="fas fa-angle-double-left"></i> Return</a>
    <div id="patient_details">
        <h3 style="background:var(--labColor); color:#fff;">Loan Details</h3>
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
                <div class="data" style="width:30%">
                    <label for="phone_number">Phone number:</label>
                    <input type="text" required value="<?php echo $phone?>" readonly>
                </div>
                
                <div class="data" style="width:25%">
                    <label for="gender">Gender:</label>
                    <input type="text" value="<?php echo $gender?>">
                </div>
                <div class="data" style="width:60%">
                    <label for="Address">Address:</label>
                    <textarea style="width:100%!important; padding:2px;border:none;" readonly><?php echo $address?></textarea>
                </div>
                <div class="data" style="width:auto!important">
                    <a style="border-radius:15px; background:var(--menuColor);color:#fff;padding:10px; box-shadow:1px 1px 1px #222; border:1px solid #fff;" href="javascript:void(0)" onclick="showPage('view_loan_customer_details.php?customer=<?php echo $row->customer?>&loan=<?php echo $loan?>')"><i class="fas fa-user-tag"></i> View More Details</a>

                </div>
            </div>
            
        </section>    
        
        <!-- loan details -->
        <section id="prescriptions">
            <div class="add_user_form" style="margin:0!important;width:100%!important">
                <h3 style="background:var(--tertiaryColor);color:#fff;text-align:center;font-size:.9rem;padding:5px">Loan Details</h3>
                <section style="text-align:left">
                    <div class="inputs" style="align-items:flex-end; justify-content:left; gap:.5rem">
                       <div class="data" style="width:24%;">
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
                        <div class="data" style="width:24%;">
                            <label for="amount" style="text-align:left!important;">Amount Requested (₦)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->amount, 2)?>" readonly style="color:green">
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="purpose" style="text-align:left!important;">Application Date:</label>
                            <input type="text" value="<?php echo date("d-M-Y, h:ia", strtotime($row->application_date))?>" readonly>
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="purpose" style="text-align:left!important;">Disbursed Date:</label>
                            <input type="text" value="<?php echo date("d-M-Y, h:ia", strtotime($row->disbursed_date))?>" readonly>
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="purpose" style="text-align:left!important;">Loan Purpose</label>
                            <input type="text" value="<?php echo $row->purpose?>" readonly>
                        </div>
                        
                        <div class="data" style="width:24%;">
                            <label for="duration" style="text-align:left!important;">Loan Term</label>
                            <input type="text" value="<?php echo $row->loan_term?> Months" readonly>
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="repayment" style="text-align:left!important;">Repayment Frequency</label>
                            <input type="text" value="<?php echo $row->frequency?>" readonly>
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="interest" style="text-align:left!important;">Interest: (<?php echo $row->interest_rate?>%)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->interest, 2)?>" readonly style="color:var(--secondaryColor)">
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="processing"> Processing Fee: (<?php echo $row->processing_rate?>%)</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->processing_fee, 2)?>" readonly style="color:var(--primaryColor)">
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="">Total Repayable Amount:</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->total_payable, 2)?>" readonly style="color:var(--tertiaryColor)">
                        </div>
                        <div class="data" style="width:24%;">
                            <label for=""><?php echo $row->frequency?> Installment:</label>
                            <input type="text" value="<?php echo '₦'.number_format($row->installment, 2)?>" readonly style="color:var(--otherColor)">
                        </div>
                        <div class="data" style="width:24%;">
                            <label for="purpose" style="text-align:left!important;">Due Date:</label>
                            <input type="text" value="<?php echo date("d-M-Y", strtotime($row->due_date))?>" readonly>
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
        <section style="width:100%">
             <h3 style="background:var(--labColor); text-align:center; color:#fff; font-size:.9rem;padding:5px;">Repayment Schedule</h3>
            <div class="displays allResults" style="width:100%!important; margin:0!important">
                <table id="item_list_table" class="searchTable">
                    <thead>
                        <tr style="background:var(--tertiaryColor)">
                            <td>S/N</td>
                            <td>Date</td>
                            <td>Amount Due</td>
                            <td>Amount Paid</td>
                            <td>Status</td>
                        </tr>
                    </thead>
                    <tbody id="result">
                        <?php
                            $n = 1;
                            $repays = $get_details->fetch_details_cond('repayment_schedule', 'loan', $row->loan_id);
                            $allow_next = true; // True until first unpaid schedule is found
                            foreach($repays as $index => $repay){
                        ?>
                        <tr>
                            <td style="text-align:center; color:red;"><?php echo $n?></td>
                            <td><?php echo date("d-M-Y", strtotime($repay->due_date))?></td>
                            <td style="color:var(--secondaryColor)"><?php echo "₦".number_format($repay->amount_due, 2)?></td>
                            <td><?php echo "₦".number_format($repay->amount_paid, 2)?></td>
                            <td>
                                <?php
                                    $date_due = new DateTime($repay->due_date);
                                    $today = new DateTime();

                                    $button = "<a style='border-radius:15px; background:var(--tertiaryColor);color:#fff; padding:3px 6px; box-shadow:1px 1px 1px #222; border:1px solid #fff' href='javascript:void(0)' onclick=\"showPage('loan_payment.php?schedule={$repay->repayment_id}&customer={$row->customer}')\" title='Post payment'>Add Payment <i class='fas fa-hand-holding-dollar'></i></a>";

                                    if($repay->payment_status == "1"){
                                        echo "<span style='color:var(--tertiaryColor);'>Paid <i class='fas fa-check-circle'></i></span>";
                                    } else {
                                        // First unpaid schedule (or any overdue) is allowed to pay only if previous schedules are paid
                                        if($allow_next || $date_due < $today){
                                            if($date_due > $today){
                                                echo "<span style='color:var(--primaryColor);'><i class='fas fa-spinner'></i> Pending </span> {$button}";
                                            } else {
                                                echo "<span style='color:red;'><i class='fas fa-clock'></i> Overdue </span> {$button}";
                                            }
                                            $allow_next = false; // After showing Add Payment for one, others must wait
                                        } else {
                                            echo "<span style='color:#999;'>Waiting for previous payment <i class='fas fa-lock'></i></span>";
                                        }
                                    }
                                ?>
                            </td>
                        </tr>
                        <?php $n++; }; ?>
                    </tbody>
                </table>
                <?php
                    //get total due
                    $tls = $get_details->fetch_sum_single('repayment_schedule', 'amount_due', 'loan', $row->loan_id);
                    foreach($tls as $tl){
                        $total_due = $tl->total;
                    }
                    //get total paid
                    $paids = $get_details->fetch_sum_single('repayment_schedule', 'amount_paid', 'loan', $row->loan_id);
                    foreach($paids as $paid){
                        $total_paid = $paid->total;
                    }
                    $balance = $total_due - $total_paid;
                    ?>
                    <div class="totals" style="display:flex; gap:1rem; justify-content:right">
                        <?php
                        echo "<p class='total_amount' style='background:green; color:#fff; text-decoration:none; width:auto; float:right; padding:10px;font-size:1rem;'>Total Paid: ₦".number_format($total_paid, 2)."</p>";
                        echo "<p class='total_amount' style='background:red; color:#fff; text-decoration:none; width:auto; float:right; padding:10px;font-size:1rem;'>Total Due: ₦".number_format($balance, 2)."</p>";
                    ?>
                    </div>
            </div>
        </section>
        <?php
            //check for request
            $requests = $get_details->fetch_details_2cond('info_request', 'customer', 'loan', $row->customer, $loan);
            if(is_array($requests)){
            
            //check guaantors
            $n = 1;
            $guas = $get_details->fetch_details_2cond('guarantors', 'client', 'loan', $row->customer, $loan);
            if(is_array($guas)){
        ?>
        <section class="main_consult" id="clientResponse">
             <h3 style="background:var(--labColor); text-align:left; color:#fff; font-size:.8rem">Guarantors</h3>
            <div class="displays allResults" style="width:100%!important; margin:0!important">
                <!-- <div class="search">
                    <input type="search" id="searchRoom" placeholder="Enter keyword" onkeyup="searchItems(this.value, 'search_patients.php')">
                </div> -->
               <table id="priceTable" class="searchTable">
            <thead>
                <tr style="background:var(--labColor)">
                    <td>S/N</td>
                    <td>Loan Applied</td>
                    <td>Guarantor</td>
                    <td>Gender</td>
                    <td>Address</td>
                    <td>Phone No.</td>
                    <td>Email</td>
                    <td>Occupation</td>
                    <td>Business Name</td>
                    <td>Business Address</td>
                    <td>Relationship</td>
                </tr>
            </thead>

            
            <tbody>
            <?php
                foreach($guas as $gua):
                   
            ?>
                <tr>
                    <td style="text-align:center;"><?php echo $n?></td>
                    
                    <td>
                        <?php 
                            //get current loan
                            $cur_loan = $get_details->fetch_details_group('loan_applications', 'product', 'loan_id', $gua->loan);
                            $product = $cur_loan->product;
                            $loans = $get_details->fetch_details_cond('loan_products', 'product_id', $product);
                            foreach($loans as $ln){
                                echo $ln->product;
                            }
                        ?>
                    </td>
                    <td><?php echo $gua->full_name?></td>
                    <td><?php echo $gua->gender?></td>
                    <td>
                        <?php
                            echo $gua->address;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->phone_number
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->email_address;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->occupation;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->business;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->business_address;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $gua->relationship;
                        ?>
                    </td>
                </tr>
            <?php $n++; endforeach;?>

            </tbody>

        </table>
            </div>
        </section>
        <?php }}?>
        
    </div>

<?php
            }
        }
    }else{
        header("Location: ../index.php");
    }
?>
</div>
