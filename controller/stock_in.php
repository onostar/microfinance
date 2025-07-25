<div id="stockin">
<?php
date_default_timezone_set("Africa/Lagos");

    session_start();
    $trans_type ="purchase";
    // $type = htmlspecialchars(stripslashes($_POST['item_type'])); 
    $posted = htmlspecialchars(stripslashes($_POST['posted_by']));
    $store = $_SESSION['store_id'];
    // $item = htmlspecialchars(stripslashes($_POST['item_id']));
    $details = ucwords(htmlspecialchars(stripslashes($_POST['details'])));
    $supplier = htmlspecialchars(stripslashes($_POST['supplier']));
    $invoice = htmlspecialchars(stripslashes($_POST['invoice_number']));
    $quantity = htmlspecialchars(stripslashes($_POST['quantity']));
    $cost_price = htmlspecialchars(stripslashes($_POST['cost_price']));
    $purchase_date = htmlspecialchars(stripslashes($_POST['purchase_date']));
    /* $sales_price = htmlspecialchars(stripslashes($_POST['sales_price']));
    $pack_price = htmlspecialchars(stripslashes($_POST['pack_price']));
    $wholesale = htmlspecialchars(stripslashes($_POST['wholesale_price']));
    $wholesale_pack = htmlspecialchars(stripslashes($_POST['wholesale_pack']));
    $pack_size = htmlspecialchars(stripslashes($_POST['pack_size'])); */
    // $expiration = htmlspecialchars(stripslashes($_POST['expiration_date']));
    // $guest_id = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
    $date = date("Y-m-d H:i:s");
    //instantiate classes
    include "../classes/dbh.php";
    include "../classes/inserts.php";
    include "../classes/update.php";
    include "../classes/select.php";
    //get reordr level
    /* $get_reorder = new selects();
    $row = $get_reorder->fetch_details_group('items', 'reorder_level', 'item_id', $item);
    $reorder_level = $row->reorder_level;
    // get item previous quantity in inventory;
    $get_prev_qty = new selects();
    $prev_qtys = $get_prev_qty->fetch_details_2cond('inventory', 'item', 'store', $item, $store);
    if(gettype($prev_qtys) === 'array'){
        foreach($prev_qtys as $prev_qty){
            $inv_qty = $prev_qty->quantity;
        }
    }
    if(gettype($prev_qtys) === 'string'){
        $inv_qty = 0;
    } */

    //data to insert into audit trail
    /* $audit_data = array(
        'item' => $item,
        'transaction' => $trans_type,
        'previous_qty' => $inv_qty,
        'quantity' => $quantity,
        'posted_by' => $posted,
        'store' => $store,
        'post_date' => $date
    );
    //insert into audit trail
    $inser_trail = new add_data('audit_trail', $audit_data);
    $inser_trail->create_data(); */
    //check if item is in store inventory
    /* $check_item = new selects();
    if(gettype($prev_qtys) === 'array'){
        //update current quantity in inventory
        $new_qty = $inv_qty + $quantity;
        $update_inventory = new Update_table();
        $update_inventory->update_double2Cond('inventory', 'quantity', $new_qty, 'cost_price', $cost_price, 'item', $item, 'store', $store);
    } */
    //add to inventory if not found
    // if(gettype($prev_qtys) === 'string'){
        //data to insert into inventory
        $inventory_data = array(
            // 'item' => $item,
            'details' => $details,
            'cost_price' => $cost_price,
            // 'expiration_date' => $expiration,
            'quantity' => $quantity,
            // 'reorder_level' => $reorder_level,
            'store' => $store,
            // 'item_type' => $type
        );
        $insert_item = new add_data('inventory', $inventory_data);
        $insert_item->create_data();
    // }
    //stockin item
    //data to stockin into purchases
    $purchase_data = array(
        // 'item' => $item,
        'details' => $details,
        'invoice' => $invoice,
        'cost_price' => $cost_price,
        'vendor' => $supplier,
        // 'sales_price' => $sales_price,
        // 'expiration_date' => $expiration,
        'quantity' => $quantity,
        'posted_by' => $posted,
        'store' => $store,
        'post_date' => $date,
        'purchase_date' => $purchase_date,
    );
    $stock_in = new add_data('purchases', $purchase_data);
    $stock_in->create_data();
    
    if($stock_in){
        
        //update all prices and pack size
       /*  $update_item = new Update_table();
        $update_item->update('items', 'cost_price', 'item_id',  $cost_price, $item); */
        // if($update_item){
        //update expiration
        /* $update_exp = new Update_table();
        $update_exp->update('items', 'expiration_date', 'item_id', $expiration, $item); */

        
?>
    <!-- display stockins for this invoice number -->
<div class="displays allResults" id="stocked_items" style="width:100%!important">
    <h2>Items received with invoice <?php echo $invoice?></h2>
    <table id="stock_items_table" class="searchTable">
        <thead>
            <tr style="background:var(--moreColor)">
                <td>S/N</td>
                <td>Item name</td>
                <td>Quantity</td>
                <td>Unit cost</td>
                <!-- <td>Unit sales</td>
                <td>Expiration</td> -->
                <td></td>
            </tr>
        </thead>
        <tbody>
            <?php
                $n = 1;
                $get_items = new selects();
                $details = $get_items->fetch_details_2cond('purchases', 'vendor', 'invoice', $supplier, $invoice);
                if(gettype($details) === 'array'){
                foreach($details as $detail):
            ?>
            <tr>
                <td style="text-align:center; color:red;"><?php echo $n?></td>
                <td style="color:var(--moreClor);">
                    <?php
                        /* //get category name
                        $get_item_name = new selects();
                        $item_name = $get_item_name->fetch_details_group('items', 'item_name', 'item_id', $detail->item);
                        echo $item_name->item_name; */
                        echo $detail->details;
                    ?>
                </td>
                <td style="text-align:center"><?php echo $detail->quantity?></td>
                <td>
                    <?php 
                        echo "₦".number_format($detail->cost_price, 2);
                    ?>
                </td>
                <!-- <td>
                    <?php 
                        echo "₦".number_format($detail->sales_price, 2);
                    ?>
                </td>
                <td><?php echo $detail->expiration_date?></td> -->
                <td>
                    <a style="color:red; font-size:1rem" href="javascript:void(0) "title="delete purchase" onclick="deletePurchase('<?php echo $detail->purchase_id?>', 0)"><i class="fas fa-trash"></i></a>
                </td>
                
            </tr>
            
            <?php $n++; endforeach;}?>
        </tbody>
    </table>

    
    <?php
        if(gettype($details) == "string"){
            echo "<p class='no_result'>'$details'</p>";
        }

        // get sum
        $get_total = new selects();
        $amounts = $get_total->fetch_sum_2con('purchases', 'cost_price', 'quantity', 'vendor', 'invoice', $supplier, $invoice);
        foreach($amounts as $amount){
            $total_amount = $amount->total;
        }
        // $total_worth = $total_amount * $total_qty;
        echo "<p class='total_amount' style='color:red; float:right'>Total Cost: ₦".number_format($total_amount, 2)."</p>";
    ?>
    <div class="close_stockin add_user_form" style="width:50%; margin:0;">
        <section class="addUserForm">
            <div class="inputs" style="display:flex;flex-wrap:wrap">
                <input type="hidden" name="supplier" id="supplier" value="<?php echo $supplier?>">
                <input type="hidden" name="sales_invoice" id="sales_invoice" value="<?php echo $invoice?>">
                <div class="data">
                    <label for="" style="color:var(--tertiaryColor)">Waybill/Frieght</label>
                    <input type="number" name="waybill" id="waybill">
                </div>
                <div class="data">
                    <button onclick="postStockin()" style="background:green; padding:8px; border-radius:5px;font-size:.9rem;">Post Stockin <i class="fas fa-power-off"></i></button>
                </div>
            </div>
        </section>
    </div>
<?php
        // }
    }

?>
</div>

</div>