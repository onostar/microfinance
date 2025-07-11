<div id="general_dashboard">
<div class="dashboard_all">
    <h3><i class="fas fa-home"></i> Dashboard for <span style="color:var(--secondaryColor);font-size:1rem"><?php echo $store?></span></h3>
    <?php
        $get_dashboard = new selects();
    ?>
    <?php 
        if($role === "Admin" || $role === "Accountant"){
    ?>
    
    <div id="dashboard">
        <div class="cards" id="card4">
            <a href="javascript:void(0)" onclick="showPage('deposit_report.php')">
                <div class="infos">
                    <p><i class="fas fa-calendar-day"></i> Today's Receipts</p>
                    <p>
                    <?php
                        $rows = $get_dashboard->fetch_sum_curdate('deposits', 'amount', 'post_date');
                        if(is_array($rows)){
                            foreach($rows as $row){
                                $amount = $row->total;
                            }
                        }else{
                            $amount = 0;
                        }
                        echo "₦".number_format($amount, 2);
                       
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <div class="cards" id="card1">
            <a href="javascript:void(0)">
                <div class="infos">
                    <p><i class="fas fa-piggy-bank"></i> Monthly Receipts</p>
                    <p>
                    <?php
                        $rows = $get_dashboard->fetch_sum_curMonth('deposits', 'amount', 'post_date');
                        if(is_array($rows)){
                            foreach($rows as $row){
                                $amount = $row->total;
                            }
                        }else{
                            $amount = 0;
                        }
                        echo "₦".number_format($amount, 2);
                       
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <div class="cards" id="card5" style="background:var(--moreColor)">
            <a href="javascript:void(0)"onclick="showPage('disbursement_report.php')"class="page_navs">
                <div class="infos">
                    <p><i class="fas fa-people-arrows-left-right"></i> Monthly Disbursements</p>
                    <p>
                    <?php
                        $rows = $get_dashboard->fetch_sum_curMonth('disbursal', 'amount', 'disbursed_date');
                        if(is_array($rows)){
                            foreach($rows as $row){
                                $amount = $row->total;
                            }
                        }else{
                            $amount = 0;
                        }
                        echo "₦".number_format($amount, 2);
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <!-- <div class="cards" id="card5">
            <a href="javascript:void(0)" class="page_navs" onclick="showPage('expense_report.php')">
                <div class="infos">
                    <p><i class="fas fa-hand-holding-dollar"></i> Monthly Expense</p>
                    <p>
                    <?php
                       /*  $get_exp = new selects();
                        $exps = $get_exp->fetch_sum_curMonth('expenses', 'amount', 'expense_date');
                        foreach($exps as $exp){
                            echo "₦".number_format($exp->total, 2);
                        } */
                    ?>
                    </p>
                </div>
            </a>
        </div>  -->
        <div class="cards" id="card0">
            <a href="javascript:void(0)" onclick="showPage('active_loans.php')"class="page_navs">
                <div class="infos">
                    <p><i class="fas fa-hand-holding-dollar"></i> Receiveables</p>
                    <p>
                    <?php
                        //get total due amount
                        $dues = $get_dashboard->fetch_sum_single('repayment_schedule', 'amount_due', 'payment_status', 0);
                        if(is_array($dues)){
                            foreach($dues as $due){
                                $amount_due = $due->total;
                            }
                        }else{
                            $amount_due = 0;
                        }
                        //get total paid amount
                        $paid = $get_dashboard->fetch_sum_single('repayment_schedule', 'amount_paid', 'payment_status', 0);
                        if(is_array($paid)){
                            foreach($paid as $pay){
                                $amount_paid = $pay->total;
                            }
                        }else{
                            $amount_paid = 0;
                        }
                        $debt = $amount_due - $amount_paid;
                        echo "₦".number_format($debt, 2);
                        
                    ?>
                    </p>
                </div>
            </a>
            
        </div> 
        
        
    </div>
    <?php
        }elseif($role == "Loan Officer"){
    ?>
    <div id="dashboard">
        <div class="cards" id="card4">
            <a href="javascript:void(0)" class="page_navs">
                <div class="infos">
                    <p><i class="fas fa-users"></i> Daily Visits</p>
                    <p>
                    <?php
                        //get total customers
                       $customers =  $get_dashboard->fetch_count_condDateGro('repayments',  'posted_by', $user_id, 'post_date', 'customer');
                       echo $customers;

                    ?>
                    </p>
                </div>
            </a>
        </div> 
    <div class="cards" id="card1">
            <a href="javascript:void(0)" class="page_navs">
                <div class="infos">
                    <p><i class="fas fa-hand-holding-dollar"></i> Daily Collections</p>
                    <p>
                    <?php
                       
                       $collections = $get_dashboard->fetch_sum_curdateCon('repayments', 'amount', 'post_date', 'posted_by', $user_id);
                        if(is_array($collections)){
                            foreach($collections as $collect){
                                $collected = $collect->total;
                            }
                        }else{
                            $collected = 0;
                        }
                        echo "₦".number_format($collected, 2);

                    ?>
                    </p>
                </div>
            </a>
        </div> 
        
        <div class="cards" id="card2" style="background: var(--moreColor)">
        <a href="javascript:void(0)" class="page_navs">
                <div class="infos">
                <p><i class="fas fa-coins"></i> Monthly Collections</p>
                    <p>
                        <?php
                            $month_cols = $get_dashboard->fetch_sum_curMonthCon('repayments', 'amount', 'post_date', 'posted_by', $user_id);
                            if(is_array($month_cols)){
                                foreach($month_cols as $month_col){
                                    $monthly_col = $month_col->total;
                                }
                            }else{
                                $monthly_col = 0;
                            }
                            echo "₦".number_format($monthly_col, 2);
                        ?>
                    </p>
                </div>
            </a>
        </div> 
            <div class="cards" id="card5" style="background: brown">
            <a href="javascript:void(0)" onclick="showPage('invoices_due.php')">
                <div class="infos">
                    <p><i class="fas fa-clock"></i> Payments Due</p>
                    <p>
                    <?php
                        $dues = $get_dashboard->fetch_count_curdategreater2con('repayment_schedule', 'due_date', 'store', $store_id, 'payment_status', 0);
                        echo $dues;
                    ?>
                    </p>
                </div>
            </a>
        </div> 
    </div>
    <?php
        }else{
    ?>
    <div id="dashboard">
    <div class="cards" id="card0">
            <a href="javascript:void(0)" class="page_navs">
                <div class="infos">
                    <p><i class="fas fa-users"></i> Customers</p>
                    <p>
                    <?php
                        //get total customers
                       $get_cus = new selects();
                       $customers =  $get_cus->fetch_count_2condDateGro('invoices', 'invoice_status', 1, 'posted_by', $user_id, 'post_date', 'invoice');
                       echo $customers;
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <div class="cards" id="card4">
            <a href="javascript:void(0)" onclick="showPage('invoices_due.php')">
                <div class="infos">
                    <p><i class="fas fa-coins"></i> Invoices Due</p>
                    <p>
                    <?php
                        $get_sales = new selects();
                        $dues = $get_sales->fetch_count_curdategreaterGro2con('invoices', 'due_date', 'store', $store, 'invoice_status', 1, 'invoice');
                        echo $dues;
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <div class="cards" id="card3">
            <a href="javascript:void(0)" onclick="showPage('post_vendor_payments.php')"class="page_navs">
                <div class="infos">
                <p><i class="fas fa-clipboard-list"></i> Vendor Payables</p>
                    <p>
                    <?php
                        //get total sales
                        /* $get_sales = new selects();
                        $rows = $get_sales->fetch_sum_singleGreat('vendors', 'balance', 'balance', 0);
                        if(gettype($rows) == "array"){
                            foreach($rows as $row){
                                $debt = $row->total;
                            }
                        }
                        if(gettype($rows) == "string"){
                            $debt = 0;
                        }
                        
                        echo "₦".number_format($debt, 2); */
                        $get_debit = new selects();
                        $debs = $get_debit->fetch_sum_single('transactions', 'debit', 'class', 7);
                        if(gettype($debs) == 'array'){
                            foreach($debs as $deb){
                                $debit = $deb->total;
                            }
                        }
                        if(gettype($debs) == 'string'){
                            $debit = 0;
                        }
                        //get total credits from customers
                        $get_credit = new selects();
                        $creds = $get_credit->fetch_sum_single('transactions', 'credit', 'class', 7);
                        if(gettype($creds) == 'array'){
                            foreach($creds as $cred){
                                $credit = $cred->total;
                            }
                        }
                        if(gettype($creds) == 'string'){
                            $credit = 0;
                        }
                        $balance = $credit - $debit;
                        if($balance > 0){
                            echo "₦".number_format($balance, 2);
                        }else{
                            echo "₦0.00";
                        }
                    ?>
                    </p>
                </div>
            </a>
        </div> 
        <div class="cards" id="card2" style="background: var(--moreColor)">
        <a href="javascript:void(0)" onclick="showPage('debtors_list.php')"class="page_navs">
                <div class="infos">
                <p><i class="fas fa-money-check"></i> Receiveables</p>
                    <p>
                    <?php
                        //get total sales
                        /* $get_sales = new selects();
                        $rows = $get_sales->fetch_sum_singleless('customers', 'wallet_balance', 'wallet_balance', 0);
                        if(gettype($rows) == "array"){
                            foreach($rows as $row){
                                $debt = $row->total;
                            }
                        }
                        if(gettype($rows) == "string"){
                            $debt = 0;
                        }
                        
                        echo "₦".number_format($debt * -1, 2);
                        */
                        $get_debit = new selects();
                        $debs = $get_debit->fetch_sum_single('transactions', 'debit', 'class', 4);
                        if(gettype($debs) == 'array'){
                            foreach($debs as $deb){
                                $debit = $deb->total;
                            }
                        }
                        if(gettype($debs) == 'string'){
                            $debit = 0;
                        }
                        //get total credits from customers
                        $get_credit = new selects();
                        $creds = $get_credit->fetch_sum_single('transactions', 'credit', 'class', 4);
                        if(gettype($creds) == 'array'){
                            foreach($creds as $cred){
                                $credit = $cred->total;
                            }
                        }
                        if(gettype($creds) == 'string'){
                            $credit = 0;
                        }
                        $balance = $debit - $credit;
                        if($balance > 0){
                            echo "₦".number_format($balance, 2);
                        }else{
                            echo "₦0.00";
                        }
                    ?>
                    </p>
                </div>
            </a>
        </div> 
            
    </div>
    <?php }?>
</div>
<?php 
    if($role === "Admin" || $role == "Accountant"){
?>
<!-- management summary -->
<div id="paid_receipt" class="management">
    <hr>
    <div class="daily_monthly">
        <!-- daily revenue summary -->
        <div class="daily_report allResults">
            <h3 style="background:var(--otherColor)">Daily Encounters</h3>
            <table style="box-shadow:none">
                <thead>
                    <tr>
                        <td>S/N</td>
                        <td>Date</td>
                        <td>Clients</td>
                        <td>Payments</td>
                    </tr>
                </thead>
                <?php
                    $n = 1;
                    $get_daily = new selects();
                    $dailys = $get_daily->fetch_daily_invoice($store_id);
                    if(gettype($dailys) == "array"){
                    foreach($dailys as $daily):

                ?>
                <tbody>
                    <tr>
                        <td><?php echo $n?></td>
                        <td><?php echo date("jS M, Y",strtotime($daily->post_date))?></td>  
                        <td style="text-align:center; color:var(--otherColor)"><?php echo $daily->customers?></td>
                        <td style="color:green;"><?php echo "₦".number_format($daily->revenue, 2)?></td>
                    </tr>
                </tbody>
                <?php $n++; endforeach; }?>

                
            </table>
            <?php
                if(gettype($dailys) == "string"){
                    echo "<p class='no_result'>'$dailys'</p>";
                }
            ?>
        </div>
        <!-- monthly revenue summary -->
        <div class="monthly_report allResults">
            <div class="chart">
                <!-- chart for technical group -->
                <?php
                $get_monthly = new selects();
                $monthlys = $get_monthly->fetch_monthly_invoice($store_id);
                if(gettype($monthlys) == "array"){
                    foreach($monthlys as $monthly){
                        $disbursed[] = $monthly->disbursed;
                        $months[] = date("M, Y", strtotime($monthly->disbursed_date));
                    }
                }
                ?>
                <h3 style="background:var(--moreColor)">Monthly statistics (Loan Disbursed)</h3>
                <canvas id="chartjs_bar2"></canvas>
            </div>
            <div class="monthly_encounter">
                <h3 style="background:rgb(117, 32, 12)">Monthly Payments</h3>
                <table>
                    <thead>
                        <tr>
                            <td>S/N</td>
                            <td>Month</td>
                            <td>Customers</td>
                            <td>Amount</td>
                            <td>Daily Average</td>
                        </tr>
                    </thead>
                    <?php
                        $n =1;
                        $get_monthly = new selects();
                        $monthlys = $get_monthly->fetch_monthly_revenue($store_id);
                        if(gettype($monthlys) == "array"){
                        foreach($monthlys as $monthly):

                    ?>
                    <tbody>
                        <tr>
                            <td><?php echo $n?></td>
                            <td><?php echo date("M, Y", strtotime($monthly->post_date))?></td>
                            <td style="text-align:center; color:var(--otherColor"><?php echo $monthly->customers?></td>
                            <td style="text-align:center; color:green"><?php echo "₦".number_format($monthly->revenue)?></td>
                            <td style="text-align:center; color:red"><?php
                                $average = $monthly->revenue/$monthly->daily_average;
                                echo "₦".number_format($average, 2);
                            ?></td>
                        </tr>
                    </tbody>
                    <?php $n++; endforeach; }?>

                    
                </table>
                <?php 
                    if(gettype($monthlys) == "string"){
                        echo "<p class='no_result'>'$monthlys'</p>";
                    }
                ?>
            </div>
        </div>
        
    </div>
</div>

<?php 
    }elseif($role == "Loan Officer"){
?>
<div class="check_out_due">
    <hr>
    <div class="displays allResults" id="check_out_guest" style="width:100%!important; margin:0 auto!important">
       
        <h3 style="background:var(--otherColor)">My Daily transactions</h3>
        <table id="check_out_table" class="searchTable" style="width:100%;">
            <thead>
                <tr style="background:var(--moreColor)">
                    <td>S/N</td>
                    <td>Invoice No.</td>
                    <td>Customer</td>
                    <td>Amount</td>
                    <td>Payment Mode</td>
                    <!-- <td>Trans. Date</td> -->
                    <td>Post Time</td>
                    
                </tr>
            </thead>
            <tbody>
                <?php
                    $n = 1;
                    $details = $get_dashboard->fetch_details_curdateCon('deposits', 'post_date',  'posted_by', $user_id);
                    if(gettype($details) === 'array'){
                    foreach($details as $detail):
                ?>
                <tr>
                    <td style="text-align:center; color:red;"><?php echo $n?></td>
                    <td style="color:green"><?php echo $detail->invoice?></td>
                    <td>
                        <?php
                            $name = $get_dashboard->fetch_details_group('customers', 'customer', 'customer_id', $detail->customer);
                            echo $name->customer;
                        ?>
                    </td>
                    
                    <td><?php echo "₦".number_format($detail->amount)?></td>
                    <td>
                        <?php
                            //get payment mode
                            echo $detail->payment_mode;
                            ?>
                    </td>
                    <td><?php echo date("h:i:sa", strtotime($detail->post_date))?></td>
                </tr>
                <?php $n++; endforeach;}?>
            </tbody>
        </table>
        
        <?php
            if(gettype($details) == "string"){
                echo "<p class='no_result'>'$details'</p>";
            }
        ?>
    </div>
</div>
<?php 
    }else{
?>
<div class="check_out_due">
    <hr>
    <div class="displays allResults" id="check_out_guest">
       
        <h3 style="background:var(--otherColor)">My Daily transactions</h3>
        <table id="check_out_table" class="searchTable" style="width:100%;">
            <thead>
                <tr style="background:var(--moreColor)">
                    <td>S/N</td>
                    <td>Ref No.</td>
                    <td>Invoice No.</td>
                    <td>Customer</td>
                    <td>Amount</td>
                    <td>Trans. Date</td>
                    <td>Due Date</td>
                    <td>Post Time</td>
                    
                </tr>
            </thead>
            <tbody>
                <?php
                    $n = 1;
                    $get_users = new selects();
                    $details = $get_users->fetch_details_date2Cond('invoices', 'date(post_date)', 'invoice_status', 1, 'posted_by', $user_id);
                    if(gettype($details) === 'array'){
                    foreach($details as $detail):
                ?>
                <tr>
                    <td style="text-align:center; color:red;"><?php echo $n?></td>
                    <td style="color:green"><?php echo $detail->invoice?></td>
                    <td style="color:green"><?php echo $detail->manual_invoice?></td>
                    <td>
                        <?php
                            $get_name = new selects();
                            $name = $get_name->fetch_details_group('customers', 'customer', 'customer_id', $detail->customer);
                            echo $name->customer;
                        ?>
                    </td>
                    <!-- <td style="text-align:center; color:var(--otherColor)"><?php echo $detail->quantity?></td> -->
                    <td>
                        <?php 
                            $get_amount = new selects();
                            $mounts = $get_amount->fetch_sum_single('invoices', 'total_amount', 'invoice', $detail->invoice);
                            foreach($mounts as $mount){
                                echo "₦".number_format($mount->total);
                            }
                            
                        ?>
                    </td>
                    <!-- <td><?php echo "₦".number_format($detail->total_amount)?></td> -->
                    <!-- <td>
                        <?php
                            //get payment mode
                            $get_mode = new selects();
                            $mode = $get_mode->fetch_details_group('payments', 'payment_mode', 'invoice', $detail->invoice);
                            //check if invoice is more than 1
                            $get_mode_count = new selects();
                            $rows = $get_mode_count->fetch_count_cond('payments', 'invoice', $detail->invoice);
                                if($rows >= 2){
                                    echo "Multiple payment";
                                }else{
                                    echo $mode->payment_mode;

                                }
                            ?>
                    </td> -->
                    <td><?php echo date("d-M-Y", strtotime($detail->trx_date))?></td>
                    <td><?php echo date("d-M-Y", strtotime($detail->due_date))?></td>
                    <td><?php echo date("h:i:sa", strtotime($detail->post_date))?></td>
                </tr>
                <?php $n++; endforeach;}?>
            </tbody>
        </table>
        
        <?php
            if(gettype($details) == "string"){
                echo "<p class='no_result'>'$details'</p>";
            }
        ?>
    </div>
</div>
<?php
    }
?>
</div>