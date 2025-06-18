<?php

    if (isset($_GET['product'])){
        $id = $_GET['product'];

    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";

    $get_item = new selects();
    $rows = $get_item->fetch_details_cond('loan_products', 'product_id', $id);
     if(gettype($rows) == 'array'){
        foreach($rows as $row):
            //get packagename
           
            if($row->duration == 90){
                $duration = "3 Months";
            }else if($row->duration == 180){
                $duration = "6 Months";
            }else if($row->duration == 365){
                $duration = "1 Year";
            }else{
                $duration = "";
            }
    ?>
    <style>
        @media screen and (max-width: 800px){
            .add_user_form .inputs .data label{
                margin:0!important;
                padding:0!important;
            }
            .add_user_form .inputs .data input{
                margin:0!important;
            }
            .add_user_form .inputs .data{
                width: 48%!important;
            }
        }
    </style>
    <div class="add_user_form" style="margin:0!important">
        <h3 style="background:var(--menuColor);text-align:left"><?php echo $row->product?> Details</h3>
        <section style="text-align:left">
            <div class="inputs" style="align-items:flex-end; justify-content:left; gap:.5rem">
                <div class="data" style="width:100%!important;">
                    <label for="description"> Description</label>
                    <textarea readonly><?php echo $row->description?></textarea>
                </div>
                <div class="data" style="width:32%;">
                    <label for="minimum" style="text-align:left!important;">Amount Range</label>
                    <input type="text" style="color:green" value="<?php echo "₦".number_format($row->minimum)." - ₦".number_format($row->maximum)?>" readonly>
                </div>
                <div class="data" style="width:32%;">
                    <label for="repayment"> Repayment Frequency</label>
                    <input type="text" value="<?php echo $row->repayment?>" readonly>
                </div>
                <div class="data" style="width:32%;">
                    <label for="interest" style="text-align:left!important;">Interest Rate</label>
                    <input type="text" value="<?php echo $row->interest?>%" readonly>
                </div>
                <div class="data" style="width:32%;">
                    <label for="duration" style="text-align:left!important;">Maximum Term (Duration)</label>
                     <input type="text" value="<?php echo $duration?>" readonly>
                </div>
                <div class="data" style="width:32%;">
                    <label for="processing"> Processing Fee</label>
                    <input type="text" value="<?php echo $row->processing?>%">
                </div>
                <div class="data" style="width:32%;">
                    <label for="penalty"> Late Payment Penalty</label>
                    <input type="text" style="color:red" value="<?php echo $row->penalty?>%">
                </div>
                <div class="data" style="width:32%;">
                    <label for="collateral"> Collateral Required?</label>
                     <input type="text" value="<?php echo $row->collateral?>" readonly>
                </div>
                
                <div class="data">
                    <button type="button" onclick="showPage('continue_application.php?product=<?php echo $id?>')">Apply <i class="fas fa-arrow-right-arrow-left"></i></button>
                    
                </div>
            </div>
        </section>   
    </div>
    
<?php
    endforeach;
     }
    }    
?>