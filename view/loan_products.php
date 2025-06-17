<div id="package">
<?php

    include "../classes/dbh.php";
    include "../classes/select.php";
    
    if(isset($_SESSION['success'])){
        echo $_SESSION['success'];
    }

?>

    <div class="info" style="margin:0"></div>
    <div class="displays allResults" style="width:100%;">
    <div class="add_user_form" style="width:80%; margin:20px 0">
        <h3 style="background:var(--moreColor)">Add New Loan Product</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section>
            <div class="inputs" style="gap:.5rem;justify-content:left">
                <div class="data" style="width:32%;">
                    <label for="business"> Product Name</label>
                    <input type="text" name="product" id="product" placeholder="Enter Product Name" required>
                </div>
                
                <div class="data" style="width:32%;">
                    <label for="interest"> Interest Rate (%)</label>
                    <input type="text" name="interest" id="interest" required>
                </div>
                <div class="data" style="width:32%;">
                    <label for="repayment"> Repayment Frequency</label>
                    <select name="repayment" id="repayment">
                        <option value="" selected disabled>Select Repayment Frequency</option>
                        <option value="Weekly">Weekly</option>
                        <option value="Monthly">Monthly</option>
                        <option value="Yearly">Yearly</option>
                    </select>
                </div>
                <div class="data" style="width:32%;">
                    <label for="minimum"> Minimum Amount (NGN)</label>
                    <input type="number" name="minimum" id="minimum" required>
                </div>
                <div class="data" style="width:32%;">
                    <label for="maximum"> Maximum Amount (NGN)</label>
                    <input type="number" name="maximum" id="maximum" required>
                </div>
                <div class="data" style="width:32%;">
                    <label for="duration"> Maximum Term (Duration)</label>
                    <select name="duration" id="duration">
                        <option value="">Select Duration</option>
                        <option value="90">3 Months</option>
                        <option value="180">6 Months</option>
                        <option value="365">12 Months</option>
                    </select>
                </div>
                <div class="data" style="width:32%;">
                    <label for="processing"> Processing Fee (%)</label>
                    <input type="number" name="processing" id="processing" required>
                </div>
                <div class="data" style="width:32%;">
                    <label for="penalty"> Late Payment Penalty (%)</label>
                    <input type="number" name="penalty" id="penalty" required>
                </div>
                <div class="data" style="width:32%;">
                    <label for="collateral"> Collateral Required?</label>
                    <select name="collateral" id="collateral">
                        <option value="" disabled>Collateral</option>
                        <option value="Yes">Yes</option>
                        <option value="No">No</option>
                    </select>
                </div>
                <div class="data" style="width:50%;">
                    <label for="description"> Description</label>
                    <textarea name="description" id="description"></textarea>
                </div>
                <div class="data" style="width:auto">
                    <button type="button" id="add_store" name="add_store" onclick="addPackage()">Add Product <i class="fas fa-piggy-bank"></i></button>
                </div>
            </div>
        </section>    
    </div>
        <h2>List Of Loan Poducts</h2>
        <hr>
        <div class="search">
            <input type="search" id="searchGuestPayment" placeholder="Enter keyword" onkeyup="searchData(this.value)">
        </div>
        <table id="priceTable" class="searchTable">
            <thead>
                <tr style="background:var(--otherColor)">
                    <td>S/N</td>
                    <td>Product</td>
                    <td>Amount Range (NGN)</td>
                    <td>Duration</td>
                    <td>Interest (%)</td>
                    <td>Repayment Frequency</td>
                    <td>Processing Fee (NGN)</td>
                    <td>Penalty Fee (NGN)</td>
                    <td>Collateral</td>
                    <td></td>
                </tr>
            </thead>

            
            <tbody>
            <?php
                $n = 1;
                $select_cat = new selects();
                $rows = $select_cat->fetch_details('loan_products');
                if(gettype($rows) == "array"){
                foreach($rows as $row):
                   
            ?>
                <tr>
                    <td style="text-align:center;"><?php echo $n?></td>
                    
                    <td>
                        <?php 
                            
                            echo $row->product;
                        ?>
                    </td>
                    <td style="color:green">
                        <?php echo number_format($row->minimum, 2)." - ". number_format($row->maximum, 2)?>
                    </td>
                    <td>
                        <?php
                            if($row->duration == 90){
                                echo "3 Months";
                            }else if($row->duration == 180){
                                echo "6 Months";
                            }else if($row->duration == 365){
                                echo "1 Year";

                            }else{
                                echo "";
                            }
                        ?>
                    </td>
                    <td style="color:red">
                        <?php
                            echo $row->interest."%";
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $row->repayment;
                        ?>
                    </td>
                    <td>
                        <?php
                            echo number_format($row->processing, 2);
                        ?>
                    </td>
                    <td>
                        <?php
                            echo number_format($row->penalty, 2);
                        ?>
                    </td>
                    <td>
                        <?php
                            echo $row->collateral;
                        ?>
                    </td>
                    <td>
                        <a style="background:var(--tertiaryColor)!important; color:#fff!important; padding:5px; border-radius:10px; border:1px solid #fff; box-shadow:1px 1px 1px #222" href="javascript:void(0)" onclick="getForm('<?php echo $row->package_id?>', 'get_package.php');"><i class="fas fa-pen"></i></a>
                    </td>
                </tr>
            <?php $n++; endforeach; }?>

            </tbody>

        </table>
        
        <?php
            if(gettype($rows) == "string"){
                echo "<p class='no_result'>'$rows'</p>";
            }
        ?>
    </div>
</div>