<?php
    session_start();
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(isset($_SESSION['user_id'])){
        $user_id = $_SESSION['user_id'];
?>

<div id="stockin" class="displays">
    <div class="add_user_form" style="width:75%; margin:10px 0!important;">
        <h3 style="background:var(--moreColor); text-align:left!important;" >Stockin Purchases by invoice</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section class="addUserForm">
            <div class="inputs">
                <div class="data" style="width:30%">
                    <label for="price">Purchase Date</label><input type="date" name="purcashe_date" id="purchase_date">
                </div>
                <div class="data" class="data" style="width:30%">
                    <label for="Invoice">Invoice Number</label>
                    <input type="text" name="invoice_number" id="invoice_number" required>
                </div>
                <div class="data" style="width:30%">
                    <label for="vendor">Supplier</label>
                    
                    <input type="text" name="vendor" id="vendor" required placeholder="Input vendor name" onkeyup="getSupplier(this.value)">
                    <input type="hidden" name="supplier" id="supplier">
                        <div id="transfer_item">
                            
                        </div>
                </div>
                <!-- <div class="data" class="data" style="width:30%">
                    <label for="vendor">Supplier</label>
                    <select name="supplier" id="supplier" onchange="muteInvoice()">
                        <option value=""selected required>Select supplier</option>
                        <?php
                            $get_dep = new selects();
                            $rows = $get_dep->fetch_details('vendors');
                            foreach($rows as $row){
                        ?>
                        <option value="<?php echo $row->vendor_id?>"><?php echo $row->vendor?></option>
                        <?php } ?>
                    </select>
                </div> -->
                <!-- <div class="data" style="width:100%; margin:10px 0">
                    <input type="text" name="item" id="item" required placeholder="Input item name or barcode" onkeyup="getItemStockin(this.value)">
                        <div id="sales_item">
                            
                        </div>
                    
                </div> -->
                <div class="data" id="bar_items" style="width:100%; margin:2px 0">
                        <label for="item"> Item</label>
                        
                        <input type="hidden" name="posted_by" id="posted_by" value="<?php echo $user_id?>">
                        <textarea name="details" id="details" placeholder="Input item description"></textarea>
                    </div>
                    <div class="data">
                        <label for="quantity">Quantity</label><input type="number" name="quantity" id="quantity">
                    </div>
                    <div class="data">
                        <label for="price">Unit Cost (NGN)</label><input type="text" name="cost_price" id="cost_price">
                    </div>
                    <div class="data">
                        <button stype="submit" onclick="stockin()">Add <i class="fas fa-check"></i></button>
                    </div>
            </div>
        </section>
    </div>
    <div class="info" style="width:100%; margin:0"></div>
    <div class="stocked_in" style="width:100%!important"></div>
</div>
<?php
    }else{
        header("Location: ../index.php");
    }
?>