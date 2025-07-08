<?php
    session_start();
    $store = $_SESSION['store_id'];
    include "../classes/dbh.php";
    include "../classes/select.php";

    //get store
    $get_store = new selects();
    $str = $get_store->fetch_details_group('stores', 'store', 'store_id', $store);
    $store_name = $str->store;
    $month = date("m");
    $year = date("Y");
    $fin_date = $year."-".$month."-01";
    $prev_year = intval($year) - 1;
    $prev_date = $prev_year."-".$month."-01";
?>
<div id="revenueReport" class="displays management" style="width:70%!important;margin:20px!important">
<div class="add_user_form" style="width:70%; margin:0 40px;">
        <h3 style="background:var(--moreColor); text-align:left!important;">Comprehensive Yearly Income Statement</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section class="addUserForm">
            <div class="inputs" style="align-items:flex-end">
                
                <div class="data" style="width:40%;">
                    <label for="fin_year">Select Financial Year</label>
                    <select name="fin_year" id="fin_year">
                        <option value="<?php echo date('Y')?>"><?php echo date('Y')?></option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                        <option value="2025">2025</option>
                        <option value="2026">2026</option>
                        <option value="2027">2027</option>
                        <option value="2028">2028</option>
                        <option value="2029">2029</option>
                        <option value="2030">2030</option>
                    </select>
                </div>
                <div class="data" style="width:50%;">
                    <button title="fetch financial position for the month" onclick="getYearlyIncome()">Get Income Statement</button>
                </div>
            </div>
        </section>
    </div>
<div class="displays allResults new_data" id="revenue_report" style="width:60%">
    <!-- <hr> -->
    <div class="search">
        <a class="download_excel" href="javascript:void(0)" onclick="convertToExcel('data_table', 'Income Statement for <?php echo date('Y')?>')"title="Download to excel"><i class="fas fa-file-excel"></i></a>
    </div>
    <h2 style="background:var(--tertiaryColor); color:#fff; padding:10px;">Comprehensive Income statement for "<?php echo date("Y")?>"</h2>
    
    <table id="data_table" class="searchTable">
        <thead>
            <tr style="background:var(--tertiaryColor)">
                <td>Details</td>
                <td><?php echo $year?> (₦)</td>
                <td><?php echo $prev_year?> (₦)</td>
                <!-- <td>Account No.</td>
                <td>Debit</td>
                <td>Credit</td> -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="color:#222;text-align:left">Revenue</td>
                <td>
                    <?php
                        // get accounts
                        $get_account = new selects();
                        $rows = $get_account->fetch_sum_Year2Cond('invoices', 'total_amount', 'post_date', $year, 'store', $store, 'invoice_status', 1);
                        foreach($rows as $row){
                            $revenue = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($revenue, 2)
                    ?>
                </td>
                <td>
                    <?php
                        // get accounts
                        $get_account = new selects();
                        $rows = $get_account->fetch_sum_Year2Cond('invoices', 'total_amount', 'post_date', $prev_year, 'store', $store, 'invoice_status', 1);
                        foreach($rows as $row){
                            $pre_revenue = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($pre_revenue, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left">Other Revenue (Gain from disposal of Asset, Interest, Loan fees)</td>
                <td>
                    <?php
                        // get accounts
                        $get_account = new selects();
                        $rows = $get_account->fetch_sum_YearCond('other_income', 'amount', 'post_date', $year, 'activity', 'gain');
                        foreach($rows as $row){
                            $other_revenue = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($other_revenue, 2)
                    ?>
                </td>
                <td>
                    <?php
                        // get accounts
                        $get_account = new selects();
                        $rows = $get_account->fetch_sum_YearCond('other_income', 'amount', 'post_date', $prev_year, 'activity', 'gain');
                        foreach($rows as $row){
                            $pre_other_revenue = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($pre_other_revenue, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left">Cost of Goods Sold (COGS)</td>
                <td>
                    <?php    
                        

                        //get cost of sales
                        $get_purchase = new selects();
                        $costss = $get_purchase->fetch_sum_YearCond('cost_of_sales', 'amount', 'post_date', $year, 'store', $store);
                        foreach($costss as $costs){
                            $cost = $costs->total;
                        }
                        /* //get waybill
                        $get_waybill = new selects();
                        $bills = $get_waybill->fetch_sum_curdate('waybills', 'waybill', 'date(post_date)');
                        foreach($bills as $bill){
                            $logistic = $bill->total;
                        } */
                        // $total_cost = $cost + $logistic;
                        echo number_format($cost, 2);
                    ?>
                </td>
                <td>
                    <?php    
                        

                        //get cost of sales
                        $get_purchase = new selects();
                        $costss = $get_purchase->fetch_sum_YearCond('cost_of_sales', 'amount', 'post_date', $prev_year, 'store', $store);
                        foreach($costss as $costs){
                            $pre_cost = $costs->total;
                        }
                        /* //get waybill
                        $get_waybill = new selects();
                        $bills = $get_waybill->fetch_sum_curdate('waybills', 'waybill', 'date(post_date)');
                        foreach($bills as $bill){
                            $logistic = $bill->total;
                        } */
                        // $total_cost = $cost + $logistic;
                        echo number_format($pre_cost, 2);
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; font-weight:bold; text-transform:uppercase">Gross Profit</td>
                <td style="font-weight:bold;">
                    <?php
                        $gross_profit = ($revenue + $other_revenue) - $cost;
                        echo number_format($gross_profit, 2);
                    ?>
                </td>
                <td style="font-weight:bold;">
                    <?php
                        $pre_gross_profit = ($pre_revenue + $pre_other_revenue) - $pre_cost;
                        echo number_format($pre_gross_profit, 2);
                    ?>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="color:#222;text-align:left; font-weight:bold; text-transform:uppercase">Expenses</td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left">Operating Expense</td>
                <td>
                    <?php    
                        //get waybill
                        $get_waybill = new selects();
                        $bills = $get_waybill->fetch_sum_Year('waybills', 'waybill', 'post_date', $year);
                        foreach($bills as $bill){
                            $logistic = $bill->total;
                        }
                        echo number_format($logistic, 2);
                        
                    ?>
                </td>
                <td>
                    <?php    
                        //get waybill
                        $get_waybill = new selects();
                        $bills = $get_waybill->fetch_sum_Year('waybills', 'waybill', 'post_date', $prev_year);
                        foreach($bills as $bill){
                            $prev_logistic = $bill->total;
                        }
                        echo number_format($prev_logistic, 2);
                        
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; cursor:pointer" onclick="toggleExpense()">Admin Expense</td>
                <td>
                    <?php    
                        //get expense
                        $get_exp = new selects();
                        $exps = $get_exp->fetch_sum_YearCond('expenses', 'amount', 'post_date', $year, 'store', $store);
                        foreach($exps as $exp){
                            $expense = $exp->total;
                        }
                        // echo number_format($expense, 2);

                        //get bank charges
                        $get_cha = new selects();
                        $char = $get_exp->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $year, 'store', $store, 'trans_type', 'Bank Charges');
                        foreach($char as $cha){
                            $charges = $cha->total;
                        }
                        $total_expense = $charges + $expense;
                        echo number_format($total_expense, 2);

                    ?>
                </td>
                <td>
                    <?php    
                        //get expense
                        $get_exp = new selects();
                        $exps = $get_exp->fetch_sum_YearCond('expenses', 'amount', 'post_date', $prev_year, 'store', $store);
                        foreach($exps as $exp){
                            $prev_expense = $exp->total;
                        }
                        // echo number_format($expense, 2);

                        //get bank charges
                        $get_cha = new selects();
                        $char = $get_exp->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $prev_year, 'store', $store, 'trans_type', 'Bank Charges');
                        foreach($char as $cha){
                            $prev_charges = $cha->total;
                        }
                        $prev_total_expense = $prev_charges + $prev_expense;
                        echo number_format($prev_total_expense, 2);

                    ?>
                </td>
            </tr>
            <tr class="expenses">
                <td style="color:#222;text-align:left; text-transform:uppercase">Bank Charges</td>
                <td>
                    <?php    
                       //get bank charges
                       $get_cha = new selects();
                       $char = $get_exp->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $year, 'store', $store, 'trans_type', 'Bank Charges');
                       foreach($char as $cha){
                           $charges = $cha->total;
                       }
                      
                       echo number_format($charges, 2);
                    ?>
                </td>
                <td>
                    <?php    
                       //get bank charges
                       $get_cha = new selects();
                       $char = $get_exp->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $prev_year, 'store', $store, 'trans_type', 'Bank Charges');
                       foreach($char as $cha){
                           $prev_charges = $cha->total;
                       }
                       
                       echo number_format($prev_charges, 2);
                    ?>
                </td>
            </tr>
            <!-- get all expense head -->
             <?php
                $get_heads = new selects();
                $heads = $get_heads->fetch_details_groupBy('expenses', 'expense_head');
                if(gettype($heads) == 'array'){
                    foreach($heads as $head){

                
             ?>
             <tr class="expenses">
                <td style="color:#222; text-align:left">
                    <?php
                        $get_exp_head = new selects();
                        $head_ledger = $get_exp_head->fetch_details_group('ledgers', 'ledger', 'ledger_id', $head->expense_head);
                        echo $head_ledger->ledger;
                    ?>
                </td>
                <td>
                    <?php
                        //get total from each expense head
                        $get_exp = new selects();
                        $char = $get_exp->fetch_sum_Year2Cond('expenses', 'amount', 'post_date', $year, 'store', $store, 'expense_head', $head->expense_head);
                        foreach($char as $cha){
                            $exp_amount = $cha->total;
                        }
                       
                        echo number_format($exp_amount, 2);
                    ?>
                </td>
                <td>
                    <?php
                        //get total from each expense head
                        $get_exp = new selects();
                        $char = $get_exp->fetch_sum_Year2Cond('expenses', 'amount', 'post_date', $prev_year, 'store', $store, 'expense_head', $head->expense_head);
                        foreach($char as $cha){
                            $prev_exp_amount = $cha->total;
                        }
                       
                        echo number_format($prev_exp_amount, 2);
                    ?>
                </td>
             </tr>
             <?php }}?>
            <tr>
                <td style="color:#222;text-align:left">Loss from Asset Disposal</td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $other_loss = $get_oth->fetch_sum_YearCond('other_income', 'amount', 'post_date', $year, 'activity', 'loss');
                        foreach($other_loss as $row){
                            $loss = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($loss, 2)
                    ?>
                </td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $other_loss = $get_oth->fetch_sum_YearCond('other_income', 'amount', 'post_date', $prev_year, 'activity', 'loss');
                        foreach($other_loss as $row){
                            $prev_loss = $row->total;
                            // $cost = $row->total_cost;
                        }
                        echo number_format($prev_loss, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left">Other Finance Cost (Loan Fees)</td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $year, 'store', $store, 'trans_type', 'Loan Fee');
                        foreach($others as $oth){
                            $finance_cost = $oth->total;
                        }
                        echo number_format($finance_cost, 2)
                    ?>
                </td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $prev_year, 'store', $store, 'trans_type', 'Loan Fee');
                        foreach($others as $oth){
                            $prev_finance_cost = $oth->total;
                        }
                        echo number_format($prev_finance_cost, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; cursor:pointer" onclick="showPage('depreciation_report.php')">Depreciation</td>
                <td>
                    <?php    
                        //get depreciation
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year('depreciation', 'amount', 'post_date', $year);
                        foreach($others as $oth){
                            $depreciation = $oth->total;
                        }
                        echo number_format($depreciation, 2)
                    ?>
                </td>
                <td>
                    <?php    
                        //get depreciation
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year('depreciation', 'amount', 'post_date', $prev_year);
                        foreach($others as $oth){
                            $prev_depreciation = $oth->total;
                        }
                        echo number_format($prev_depreciation, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; font-weight:bold; text-transform:uppercase">Total Expenses</td>
                <td style="font-weight:bold">
                    <?php
                        $exp_total = $logistic + $total_expense + $finance_cost + $loss + $depreciation;
                        echo number_format($exp_total, 2);
                    ?>
                </td>
                <td style="font-weight:bold">
                    <?php
                        $prev_exp_total = $prev_logistic + $prev_total_expense + $prev_finance_cost + $prev_loss + $prev_depreciation;
                        echo number_format($prev_exp_total, 2);
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; font-weight:bold; text-transform:uppercase">Earnings Before tax</td>
                <td style="font-weight:bold;">
                    <?php
                        $earnings = $gross_profit - $exp_total;
                        echo number_format($earnings, 2);
                    ?>
                </td>
                <td style="font-weight:bold;">
                    <?php
                        $prev_earnings = $pre_gross_profit - $prev_exp_total;
                        echo number_format($prev_earnings, 2);
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left">Taxes</td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $year, 'store', $store, 'trans_type', 'Tax');
                        foreach($others as $oth){
                            $tax = $oth->total;
                        }
                        echo number_format($tax, 2)
                    ?>
                </td>
                <td>
                    <?php    
                        //get expense
                        $get_oth = new selects();
                        $others = $get_oth->fetch_sum_Year2Cond('finance_cost', 'amount', 'post_date', $prev_year, 'store', $store, 'trans_type', 'Tax');
                        foreach($others as $oth){
                            $prev_tax = $oth->total;
                        }
                        echo number_format($prev_tax, 2)
                    ?>
                </td>
            </tr>
            <tr>
                <td style="color:#222;text-align:left; font-weight:bold; text-transform:uppercase">Net Earnings</td>
                <td style="font-weight:bold;">
                    <?php
                        $net_earnings = $earnings - $tax;
                        echo number_format($net_earnings, 2);
                    ?>
                </td>
                <td style="font-weight:bold;">
                    <?php
                        $prev_net_earnings = $prev_earnings - $prev_tax;
                        echo number_format($prev_net_earnings, 2);
                    ?>
                </td>
            </tr>
        </tbody>
    </table>
        
        
    
    <?php

        // get sum
        
            // $total_profit = ($revenue + $other_revenue) - ($total_cost + $expense + $charges + $finance_cost + $loss);
            /* $total_profit = ($revenue + $other_revenue) - ($cost + $logistic + $total_expense  + $finance_cost + $loss + $depreciation); */
            $total_profit = $net_earnings;
            // $total_profit = $revenue - $expense;
            echo "<p class='total_amount' style='background:red; color:#fff; text-decoration:none; padding:10px; width:auto; float:right'>Current Net Profit: ₦".number_format($total_profit, 2)."</p>";
        
    ?>

</div>

<script src="../jquery.js"></script>
<script src="../script.js"></script>