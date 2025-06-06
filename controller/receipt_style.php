<style>
    .sales_receipt{
    padding:10px;
}
.sales_receipt h2{
    font-size:.9rem;
}
.sales_receipt h2, .sales_receipt p{
    text-align:center;
    font-size:.8rem;
    padding:0;
    margin:0;
}
.receipt_head{
    margin:5px;
}
.sales_receipt .receipt_head{
    display:flex;
    justify-content: center;
    gap:.5rem;
    margin:2px 0;
}
.sales_receipt .total_amount{
    text-align: right;
    font-size:.8rem;
    margin:5px 0;
    color:#222;
    font-weight: bold;
}

.sales_receipt .sold_by{
    text-align: left;
    font-size:.8rem;

}
.sales_receipt table{
    width:100%!important;
    margin:10px auto!important;
    box-shadow:none;
    border:1px solid #222;
    border-collapse: collapse;
}
.sales_receipt table thead tr td{
    font-size:.8rem;
    padding:2px;

}
.sales_receipt table td{
    border:1px solid #222;
    padding:4px;
}
.item_categories{
    padding:20px;
}
.patient_details{
    width:40%;

}
.patient_details h3{
    color:#fff;
    background:rgba(11, 99, 134, 0.7);
    padding:5px;
}
.patient_details p{
    text-transform: uppercase;
    font-size:.9rem;
    margin:5px 0;
    text-align: left;
}
/* .patient_details span{
    text-decoration: underline;
} */
.comp_details{
    display:flex;
    justify-content: space-between;
    background:#e6e4e4;
    padding:10px;
}
.comp{
    display:flex;
    align-items:flex-start;
    gap:.5rem;
    flex-wrap: wrap;
}
.receipt_logo{
    width:100px;
    height:100px;
}
.receipt_logo img{
    width:100%;
    height:100%;
}
.com_name{
    text-align: left!important;
}
.com_name h2{
    font-size: 1.1rem;
    text-align: left!important;

}
.com_name p{
    text-align: left!important;
    width:50%;
}
.inv_val h2{
    font-size:1.5rem;
    color:rgba(11, 99, 134, 0.7);
}
.inv_val p{
    margin:5px;
    font-weight: bold;
}
.inv_val span{
    text-align: right;
    text-decoration: underline;
    margin-right:5px;
}
</style>