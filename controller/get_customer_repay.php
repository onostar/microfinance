<?php
    session_start();
    $store = $_SESSION['store_id'];
    $input= htmlspecialchars(stripslashes($_GET['input']));
    // instantiate class
    include "../classes/dbh.php";
    include "../classes/select.php";
    //get store details
   
    $get_customer = new selects();
    $rows = $get_customer->fetch_details_like3('customers', 'customer', 'customer_email','phone_numbers', $input);
     if(gettype($rows) == 'array'){
        foreach($rows as $row):
        
    ?>
    <div class="results">
        <a href="javascript:void(0)" onclick="showPage('customer_repayment.php?customer=<?php echo $row->customer_id?>')"><?php echo $row->customer?></a>
    </div>
    <!-- <option onclick="showPage('prescription_order.php?customer=<?php echo $row->customer_id?>')">
        <?php echo $row->customer?>
    </option> -->
<?php
    // }
    endforeach;
     }else{
        echo "No resullt found";
     }
?>