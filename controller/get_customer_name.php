<?php
    session_start();
    $input= htmlspecialchars(stripslashes($_POST['customer']));
    $invoice= htmlspecialchars(stripslashes($_POST['invoice']));
    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";
    //first check invoice in sales
    $get_invoice = new selects();
    $invs = $get_invoice->fetch_details_cond('sales', 'invoice', $invoice);
    if(gettype($invs) == 'array'){
        echo "<script>
            alert('Invoice already in use.Cannot proceed!');
        </script>";
    }
    if(gettype($invs) == 'string'){
        $get_customer = new selects();
        $rows = $get_customer->fetch_details_likeCond('customers', 'customer', $input);
        if(gettype($rows) == 'array'){
            foreach($rows as $row):
            
        ?>
        <div class="results">
            <a href="javascript:void(0)" onclick="showPage('wholesale_order.php?customer=<?php echo $row->customer_id?>&invoice=<?php echo $invoice?>')"><?php echo $row->customer?></a>
        </div>
        <!-- <option onclick="showPage('wholesale_order.php?customer=<?php echo $row->customer_id?>&invoice=<?php echo $invoice?>')">
            <?php echo $row->customer?>
        </option> -->
        <?php
        endforeach;

        }else{
            echo "No resullt found";
        }
    }
?>