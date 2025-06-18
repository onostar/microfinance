<?php
    session_start();
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

    <div class="displays allResults" style="width:100%;">
        <a style="border-radius:15px; background:brown;color:#fff;padding:8px; margin:10px 0!important; box-shadow:1px 1px 1px #222"href="javascript:void(0)" onclick="showPage('apply_loan.php')"><i class="fas fa-angle-double-left"></i> Return</a>
        <div class="add_user_form" style="margin:0!important">
            <h3 style="background:var(--tertiaryColor);text-align:left">Complete Application for <?php echo $row->product?></h3>
            <section style="text-align:left">
                <div class="inputs" style="align-items:flex-end; justify-content:left; gap:.5rem">
                    <input type="hidden" name="minimum" id="minimum" value="<?php echo $row->minimum?>">
                    <input type="hidden" name="maximum" id="maximum" value="<?php echo $row->maximum?>">
                    <input type="hidden" name="product" id="product" value="<?php echo $id?>">
                    <div class="data" style="width:32%;">
                        <label for="minimum" style="text-align:left!important;">Amount (₦)</label>
                        <input type="text" name="amount" id="amount">
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
    </div>
    
<?php
    endforeach;
     }
    }    
?>