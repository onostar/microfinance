<?php
    session_start();
    $store = $_SESSION['store_id'];
    $from = htmlspecialchars(stripslashes($_POST['from_date']));
    $to = htmlspecialchars(stripslashes($_POST['to_date']));

    // instantiate classes
    include "../classes/dbh.php";
    include "../classes/select.php";

    $get_revenue = new selects();
    $details = $get_revenue->fetch_details_2date1Con1Neg('purchase_payments', 'date(post_date)', $from, $to, 'store', $store, 'payment_mode', 'Credit');
    $n = 1;
?>
<h2>Vendor payments between '<?php echo date("jS M, Y", strtotime($from)) . "' and '" . date("jS M, Y", strtotime($to))?>'</h2>
    <hr>
    <div class="search">
        <input type="search" id="searchRevenue" placeholder="Enter keyword" onkeyup="searchData(this.value)">
        <a class="download_excel" href="javascript:void(0)" onclick="convertToExcel('data_table', 'Debt payment report')"title="Download to excel"><i class="fas fa-file-excel"></i></a>
    </div>
    <table id="data_table" class="searchTable">
        <thead>
        <tr style="background:var(--primaryColor)">
                <td>S/N</td>
                <td>Customer</td>
                <!-- <td>Invoice</td> -->
                <td>Amount</td>
                <!-- <td>Payment Mode</td> -->
                <td>Trans. Date</td>
                <td>Date</td>
                <td>Post Time</td>
                <td>Posted by</td>
                
            </tr>
        </thead>
        <tbody>
<?php
    if(gettype($details) === 'array'){
    foreach($details as $detail){

?>
            <tr>
                <td style="text-align:center; color:red;"><?php echo $n?></td>
                <td>
                    <?php
                        //get customer
                        $get_customer = new selects();
                        $client = $get_customer->fetch_details_group('vendors', 'vendor', 'vendor_id', $detail->vendor);
                        echo $client->vendor;
                    ?>
                </td>
                <td>
                    <?php echo "₦".number_format($detail->amount_paid, 2);?>
                </td>
                <td style="color:var(--otherColor)"><?php echo date("d-M-y", strtotime($detail->trans_date));?></td>
                <td style="color:var(--otherColor)"><?php echo date("d-m-y", strtotime($detail->post_date));?></td>
                <td style="color:var(--moreColor)"><?php echo date("H:i:sa", strtotime($detail->post_date));?></td>
                <td>
                    <?php
                        //get posted by
                        $get_posted_by = new selects();
                        $checkedin_by = $get_posted_by->fetch_details_group('users', 'full_name', 'user_id', $detail->posted_by);
                        echo $checkedin_by->full_name;
                    ?>
                </td>
                
            </tr>
            <?php $n++; }}?>
        </tbody>
    </table>
    <div class="all_modes">

<?php
    if(gettype($details) == "string"){
        echo "<p class='no_result'>'$details'</p>";
    }
    
    // get sum
    $get_total = new selects();
    $amounts = $get_total->fetch_sum_2date2Cond1neg('purchase_payments', 'amount_paid', 'date(post_date)', 'store', 'payment_mode', $from, $to, $store, 'Credit');
    foreach($amounts as $amount){
        echo "<p class='total_amount' style='color:green'>Total: ₦".number_format($amount->total, 2)."</p>";
    }
?>
    </div>