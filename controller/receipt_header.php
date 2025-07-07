
<div class="comp_details">
    <div class="comp">
        <div class='receipt_logo'><img src="../images/icon.png" title="logo"></div>
        <div class="com_name">
            <h2><?php echo $_SESSION['company'];?></h2>
            <p><?php echo $address?></p>
            <p>Tel: <?php echo $phone?></p>
        </div>
        
    </div>
    
</div>
<div class="inv_val">
    <h2>DEPOSIT RECEIPT</h2>
    <div class="rec">
        <p><?php echo date("d-M-Y", strtotime($paid_date))?></p>
        <p><?php echo $invoice?></p>
    </div>
    

</div>