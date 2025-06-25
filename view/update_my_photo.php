<div id="edit_customer">
    <style>
    @media screen and (max-width: 800px){
        .profile_foto{
            width: 50%!important;
            height: 150px!important;
        }
    }
</style>
<?php
    session_start();
    $store = $_SESSION['store_id'];
    include "../classes/dbh.php";
    include "../classes/select.php";
    if(isset($_SESSION['user_id'])){
        $user_id = $_SESSION['user_id'];
        // echo $user_id;
        if(isset($_SESSION['user_id'])){
            $user = $_SESSION['user_id'];
            //get customer name
            $get_customer = new selects();
            $rows = $get_customer->fetch_details_cond('customers', 'user_id', $user);
            foreach($rows as $row){

?>
    <div id="patient_details">
        <h3 style="background:var(--tertiaryColor); color:#fff;">Update My photo</h3>
        <!-- <form method="POST" id="addUserForm"> -->
        <section class="nomenclature" style="align-items:flex-end">
            <div class="profile_foto">
                <img src="<?php echo '../photos/'.$row->photo?>" alt="Photo">
            </div>
            <div class="inputs">
                <div class="data" style="border-bottom:none;">
                    <button style="background:silver; color:#222"onclick="window.open('update_my_pic.php?customer=<?php echo $row->customer_id?>', '_blank')">Update Photo</button>
                </div>
                
            </div>
        </section>    
        
    </div>

<?php
            }
        }
    }else{
        header("Location: ../index.php");
    }
?>
</div>
