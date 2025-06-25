<div id="loan_application">

<?php
    session_start();    
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(!isset($_SESSION['user_id'])) {
        header("Location: ../index.php");
        exit();
    }else{
        if(isset($_GET['customer'])){
            $customer = $_GET['customer'];
            $get_details = new selects();
            //get customer details
            $customer_details = $get_details->fetch_details_cond('customers', 'customer_id', $customer);
            if(is_array($customer_details)){
                foreach($customer_details as $detail){
                    $customer_name = $detail->customer;
                }
            }
        //check if kyc has been submitted
        $details = $get_details->fetch_details_cond('kyc', 'customer', $customer);
        if(is_array($details)){
            foreach($details as $detail){
                $kyc_status = $detail->verification;
            }
            //check if kyc has been verified
            if($kyc_status == "0"){
?>
            <div class="not_available">
                <p><strong>KYC Pending Approval <i class="fas fa-spinner" style="color:var(--tertiaryColor)"></i></strong><br>Customer have submitted KYC details, but verification is still pending.<br>Please wait for approval before proceeding with your loan application.</p>

            </div>
<?php
            }else{

?>

    <div class="displays allResults" style="width:100%;">
        <div class="add_user_form" style="width:50%; margin:20px 0">
            <h3 style="background:var(--primaryColor)">Loan Application for <?php echo $customer_name?></h3>
            <!-- <form method="POST" id="addUserForm"> -->
            <section>
                <div class="inputs">
                    <div class="data" style="width:100%;">
                        <label for="business"> Loan Product</label>
                        <select name="product" id="product" onchange="getLoanProduct(this.value, '<?php echo $customer?>')">
                            <option value="" selected disabled>Select Loan Product</option>
                            <?php
                                $loans = $get_details->fetch_details_condOrder('loan_products', 'product_status', 0, 'product');
                                if(is_array($loans)){
                                    foreach($loans as $loan){
                            ?>
                            <option value="<?php echo $loan->product_id?>"><?php echo $loan->product?></option>
                            <?php } }?>
                        </select>
                    </div>
                </div>
                
            </section>    
        </div>
        <div id="product_info">
            
        </div>
    </div>
    <?php 
            }
        }else{
    ?>
        <div class="not_available">
            <p><strong>KYC Not Submitted <i class="fas fa-exclamation-triangle" style="color:#cfb20e"></i></strong><br>Selected Customer needs to complete KYC verification before applying for a loan.<br><br>:</p>
        </div>
    <?php
        }
        }else{
        echo "<div class='not_available'><p><strong>Error: Customer ID not provided.</strong></p></div>";
    }
    }
    
    
    ?>
</div>