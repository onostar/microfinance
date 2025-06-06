
//show mobile menu
function displayMenu(){
     let main_menu = document.getElementById("mobile_log");
     if(window.innerWidth <= "800"){
          $("#menu_icon").click(function(){
               if(main_menu.style.display == "block"){
                    $(".main_menu").hide();
                    $("#menu_icon").html("<a href='javascript:void(0)'><i class='fas fa-bars'></i></a>");
               }else{
                    $(".main_menu").show();
                    $("#menu_icon").html("<a href='javascript:void(0)'><i class='fas fa-close'></i></a>");
               }
          })
               
          
     }
     // else{
          /* $("#menu_icon").click(function(){
               if(main_menu.style.display == "block"){
               alert (window.innerWidth);

                    main_menu.style.display == "none"
                    $("#menu_icon").html("<a href='javascript:void(0)'><i class='fas fa-close'></i></a>");
                    document.getElementById("contents").style.width = "100vw";
                    document.getElementById("contents").style.marginLeft = "0";
               }
          })
     } */
}
displayMenu();
//checck the screen width 
function checkMobile(){
     let screen_width = window.innerWidth;
     if(screen_width <= "800"){
          // alert(screen_width);
          $("#contents").click(function(){
               $(".main_menu").hide();
               $("#menu_icon").html("<a href='javascript:void(0)'><i class='fas fa-bars'></i></a>");
          
          })
     }
}
checkMobile();

// toggle password
function togglePassword(){
    let pw = document.querySelectorAll(".password");
    pw.forEach(ps => {
       if(ps.type === "password"){
            ps.type = "text";
            document.querySelector(".icon").innerHTML = "<i class='fas fa-eye-slash'></i>";
            document.querySelector(".icon_txt").innerHTML = "Hide password";
       }else{
            ps.type = "password";
            document.querySelector(".icon").innerHTML = "<i class='fas fa-eye'></i>";
            document.querySelector(".icon_txt").innerHTML = "Show password";
       } 
    });
}

//toggle logout
$(document).ready(function(){
     $("#loginDiv").click(function(){
          $(".login_option").toggle();
     })
})

//toggle menu with more options
$(document).ready(function(){
     $(".addMenu").click(function(){
          $(".nav1Menu").toggle();
          //change icon from plus to miinus and vice versa
          let option_icon = document.querySelector(".options");
          if(document.querySelector(".nav1Menu").style.display == "block"){
               option_icon.innerHTML = "<i style='background:none; color:#fff!important; box-shadow:none!important;' class='fas fa-minus'></i>";
          }else{
               option_icon.innerHTML = "<i style='background:none; color:#fff!important; box-shadow:none!important;' class='fas fa-plus'></i>";
          }

     })
})
//toggle all submenu
/* show frequenty asked questions */
function toggleMenu(subMenu){
     let menus = document.querySelectorAll(".subMenu");
     menu_id = document.getElementById(subMenu);
     if(menu_id.style.display == "block"){
          menu_id.style.display = "none";
     }else{
          menus.forEach(function(menu){
               menu.style.display = "none";
          })
          menu_id.style.display = "block";
     }
}

//show payment mode forms
function showCash(){
     document.querySelectorAll(".payment_form").forEach(function(forms){
          forms.style.display = "none";
     })
     $("#cash").show();
}
function showPos(){
     document.querySelectorAll(".payment_form").forEach(function(forms){
          forms.style.display = "none";
     })
     $("#pos").show();
}
function showTransfer(){
     document.querySelectorAll(".payment_form").forEach(function(forms){
          forms.style.display = "none";
     })
     $("#transfer").show();
}
//show pages dynamically with xhttp request
function showPage(page){
     let xhr = false;
     if(window.XMLHttpRequest){
          xhr = new XMLHttpRequest();
     }else{
          xhr = new ActiveXObject("Microsoft.XMLHTTP");
     }
     if(xhr){
          xhr.onreadystatechange = function(){
               if(xhr.readyState == 4 && xhr.status == 200){
                    document.querySelector(".contents").innerHTML = xhr.responseText;
               }
          }
          xhr.open("GET", page, true );
          xhr.send(null);
     }
}

//add users
function addUser(){
     let username = document.getElementById("username").value;
     let full_name = document.getElementById("full_name").value;
     let user_role = document.getElementById("user_role").value;
     let store_id = document.getElementById("store_id").value;
     // alert(store);
     if(full_name.length == 0 || full_name.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter user full name!");
          $("#full_name").focus();
          return;
     }else if(username.length == 0 || username.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter a username!");
          $("#username").focus();
          return;
     }else if(user_role.length == 0 || user_role.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select user role!");
          $("#user_role").focus();
          return;
     }else if(store_id.length == 0 || store_id.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select store!");
          $("#store").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_users.php",
               data : {username:username, full_name:full_name, user_role:user_role, store_id:store_id},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#usernane").val('');
     $("#full_name").val('');
     $("#user_role").val('');
     $("#store").val('');
     $("#full_name").focus();
     return false;
}

//add departments
function addDepartment(){
     let department = document.getElementById("department").value;
     if(department.length == 0 || department.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input department!");
          $("#department").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_department.php",
               data : {department:department},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#department").val('');
     $("#department").focus();
     return false;
}
//add account group
function addAccountGroup(){
     let account_group = document.getElementById("account_group").value;
     if(account_group.length == 0 || account_group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input account group!");
          $("#account_group").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_account_group.php",
               data : {account_group:account_group},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#account_group").val('');
     $("#account_group").focus();
     return false;
}
//add expense head
function addExpHead(){
     let exp_head = document.getElementById("exp_head").value;
     if(exp_head.length == 0 || exp_head.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input expense head!");
          $("#exp_head").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_exp_head.php",
               data : {exp_head:exp_head},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_head").val('');
     $("#exp_head").focus();
     return false;
}
//add categories
function addCategory(){
     let category = document.getElementById("category").value;
     let department = document.getElementById("department").value;
     if(category.length == 0 || category.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter category!");
          $("#category").focus();
          return;
     }else if(department.length == 0 || department.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a department!");
          $("#department").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_category.php",
               data : {category:category, department:department},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#category").val('');
     $("#category").focus();
     return false;
}
//add account sub group
function addSubGroup(){
     let group = document.getElementById("group").value;
     let sub_group = document.getElementById("sub_group").value;
     if(group.length == 0 || group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account group!");
          $("#group").focus();
          return;
     }else if(sub_group.length == 0 || sub_group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter account sub-group!");
          $("#sub_group").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_account_sub_group.php",
               data : {group:group, sub_group:sub_group},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#sub_group").val('');
     $("#sub_group").focus();
     return false;
}
//add account class
function addClass(){
     let group = document.getElementById("group").value;
     let sub_group = document.getElementById("sub_group").value;
     let account_class = document.getElementById("account_class").value;
     if(group.length == 0 || group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account group!");
          $("#group").focus();
          return;
     }else if(sub_group.length == 0 || sub_group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account sub-group!");
          $("#sub_group").focus();
          return;
     }else if(account_class.length == 0 || account_class.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input account class!");
          $("#account_class").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_account_class.php",
               data : {group:group, sub_group:sub_group, account_class:account_class},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#account_class").val('');
     $("#account_class").focus();
     return false;
}
//add account ledgers
function addLedger(){
     let group = document.getElementById("group").value;
     let sub_group = document.getElementById("sub_group").value;
     let account_class = document.getElementById("account_class").value;
     let ledger = document.getElementById("ledger").value;
     if(group.length == 0 || group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account group!");
          $("#group").focus();
          return;
     }else if(sub_group.length == 0 || sub_group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account sub-group!");
          $("#sub_group").focus();
          return;
     }else if(account_class.length == 0 || account_class.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account class!");
          $("#account_class").focus();
          return;
     }else if(account_class.length == 0 || account_class.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input account ledger!");
          $("#ledger").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_account_ledger.php",
               data : {group:group, sub_group:sub_group, account_class:account_class, ledger:ledger},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#ledger").val('');
     $("#ledger").focus();
     return false;
}
//add bank
function addBank(){
     let bank = document.getElementById("bank").value;
     let account_num = document.getElementById("account_num").value;
     if(bank.length == 0 || bank.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input bank name!");
          $("#bank").focus();
          return;
     }else if(account_num.length == 0 || account_num.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input account number!");
          $("#account_num").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_bank.php",
               data : {bank:bank, account_num:account_num},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#bank").val('');
     $("#account_num").val('');
     $("#bank").focus();
     return false;
}
//search for data within table
function searchData(data){
     let $row = $(".searchTable tbody tr");
     let val = $.trim(data).replace(/ +/g, ' ').toLowerCase();
     $row.show().filter(function(){
          var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
          return !~text.indexOf(val);
     }).hide();
}

// disale user
function disableUser(user_id){
     let disable = confirm("Do you want to disable this user?", "");
     if(disable){
          // alert(user_id);
          $.ajax({
               type: "GET",
               url : "../controller/disable_user.php?id="+user_id,
               success : function(response){
                    $("#disable_user").html(response);
               }
          })
          setTimeout(function(){
               $('#disable_user').load("disable_user.php #disable_user");
          }, 3000);
          return false;
     }
}

// activate disabled user
function activateUser(user_id){
     let activate = confirm("Do you want to activate this user account?", "");
     if(activate){
          $.ajax({
               type : "GET",
               url : "../controller/activate_user.php?user_id="+user_id,
               success : function(response){
                    $("#activate_user").html(response);
               }
          })
          setTimeout(function(){
               $("#activate_user").load("activate_user.php #activate_user");
          }, 3000);
          return false;
     }
}
// Reset user password
function resetPassword(user_id){
     let reset = confirm("Do you want to reset this user password?", "");
     if(reset){
          $.ajax({
               type : "GET",
               url : "../controller/reset_user_password.php?user_id="+user_id,
               success : function(response){
                    $("#reset_password").html(response);
               }
          })
          setTimeout(function(){
               $("#reset_password").load("reset_password.php #reset_password");
          }, 3000);
          return false;
     }
}

// add items 
function addItem(){
     let department = document.getElementById("department").value;
     let item_category = document.getElementById("item_category").value;
     let item = document.getElementById("item").value;
     // let barcode = document.getElementById("barcode").value;
     let item_type = document.getElementById("item_type").value;
     if(item_category.length == 0 || item_category.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select item category!");
          $("#item_category").focus();
          return;
     }else if(item.length == 0 || item.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter item name");
          $("#item").focus();
          return;
     /* }else if(barcode.length == 0 || barcode.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter item barcode");
          $("#barcode").focus();
          return; */
     }else if(item_type.length == 0 || item_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select item type");
          $("#item_type").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_item.php",
               data : {department:department, item_category:item_category, item:item, item_type:item_type/* barcode:barcode */},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     // $("#room_category").val('');
     $("#item").val('');
     $("#barcode").val('');
     $("#item_type").val('');
     $("#item").focus();
     return false;    
}
// add stores
function addStore(){
     let store_name = document.getElementById("store_name").value;
     let store_address = document.getElementById("store_address").value;
     let phone = document.getElementById("phone").value;
     if(store_name.length == 0 || store_name.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter store name!");
          $("#store_name").focus();
          return;
     }else if(store_address.length == 0 || store_address.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter store address");
          $("#store_address").focus();
          return;
     }else if(phone.length == 0 || phone.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter store phone numbers");
          $("#phone").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_store.php",
               data : {store_name:store_name, store_address:store_address, phone:phone},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     // $("#room_category").val('');
     $("#store_name").val('');
     $("#store_address").val('');
     $("#phone").val('');
     $("#store").focus();
     return false;    
}
// add staffs 
function addStaff(){
     let staff_name = document.getElementById("staff_name").value;
     let phone_number = document.getElementById("phone_number").value;
     let home_address = document.getElementById("home_address").value;
     if(staff_name.length == 0 || staff_name.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input staff name!");
          $("#staff_name").focus();
          return;
     }else if(home_address.length == 0 || home_address.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input staff residential address");
          $("#home_address").focus();
          return;
     }else if(phone_number.length == 0 || phone_number.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input staff phone number");
          $("#phone_number").focus();
          return;
     }else if(phone_number.length < 11){
          alert("Phone number is too short");
          $("#phone_number").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_staff.php",
               data : {staff_name:staff_name, phone_number:phone_number, home_address:home_address},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     // $("#room_category").val('');
     $("#staff_name").val('');
     $("#phone_number").val('');
     $("#home_address").val('');
     $("#staff_name").focus();
     return false;    
}
// add suppliers 
function addSupplier(){
     let supplier = document.getElementById("supplier").value;
     let contact_person = document.getElementById("contact_person").value;
     let phone = document.getElementById("phone").value;
     let email = document.getElementById("email").value;
     if(supplier.length == 0 || supplier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input supplier name!");
          $("#supplier").focus();
          return;
     }else if(contact_person.length == 0 || contact_person.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input contact person name");
          $("#contact_person").focus();
          return;
     }else if(phone.length == 0 || phone.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input phone number");
          $("#phone").focus();
          return;
     }else if(email.length == 0 || email.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input email address");
          $("#email").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_vendor.php",
               data : {supplier:supplier, contact_person:contact_person, phone:phone, email:email},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#supplier").val('');
     $("#contact_person").val('');
     $("#phone").val('');
     $("#email").val('');
     $("#supplier").focus();
     return false;    
}

// get item categories
function getCategory(post_department){
     let department = post_department;
     if(department){
          $.ajax({
               type : "POST",
               url :"../controller/get_categories.php",
               data : {department:department},
               success : function(response){
                    $("#item_category").html(response);
               }
          })
          return false;
     }else{
          $("#item_category").html("<option value'' selected>Select department first</option>")
     }
     
}


//calculate days from check in and check out
function calculateDays(){
     let check_in_date = document.getElementById("check_in_date").value;
     let check_out_date = document.getElementById("check_out_date").value; 
     let amount = document.getElementById("amount");
     let room_fee = document.getElementById("room_fee").value;
     let num_days = document.getElementById("days");
     firstDay = new Date(check_in_date);
     secondDay = new Date(check_out_date);
     days = secondDay.getTime() - firstDay.getTime();
     totalDays = days / (1000 * 60 * 60 * 24);
     newAmount = totalDays * parseInt(room_fee);
     amount.innerHTML = "<input type='number' name='amount_due' id='amount_due' value='"+newAmount+"'>";
     num_days.innerHTML = "<p>(Checking in for "+totalDays+" days)</p>";
     // alert(totalDays);
}

//post guest cash payment
function postCash(){
     let posted_by = document.getElementById("posted_by").value;
     let guest = document.getElementById("guest").value;
     let payment_mode = document.getElementById("payment_mode").value;
     let bank_paid = document.getElementById("bank_paid").value;
     let sender = document.getElementById("sender").value;
     let guest_amount = document.getElementById("guest_amount").value;
     let amount_paid = document.getElementById("amount_paid").value;
     
     if(amount_paid.length == 0 || amount_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input amount paid!");
          $("#amount_paid").focus();
          return;
     // }else if(parseInt(amount_paid) < parseInt(guest_amount)){
     //      alert("Insufficient funds!");
     //      $("#guest_amount").focus();
     //      return;
     }else{
     $.ajax({
          type : "POST",
          url : "../controller/post_payments.php",
          data : {posted_by:posted_by, guest:guest, payment_mode:payment_mode, bank_paid:bank_paid, sender:sender, guest_amount:guest_amount, amount_paid:amount_paid},
          success : function(response){
               $("#all_payments").html(response);
          }
     })
          setTimeout(function(){
               $('#all_payments').load("post_payment.php?guest_id=+"+guest + "#all_payments");
          }, 3000);
     }
     return false;    

}
//post guest POS payment
function postPos(){
     let posted_by = document.getElementById("posted_by").value;
     let guest = document.getElementById("guest").value;
     let payment_mode = document.getElementById("pos_mode").value;
     let bank_paid = document.getElementById("pos_bank_paid").value;
     let sender = document.getElementById("sender").value;
     let guest_amount = document.getElementById("guest_amount").value;
     let amount_paid = document.getElementById("pos_amount_paid").value;
     
     if(amount_paid.length == 0 || amount_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input amount paid!");
          $("#pos_amount_paid").focus();
          return;
     }else if(bank_paid.length == 0 || bank_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select POS Bank!");
          $("#pos_bank_paid").focus();
          return;
     }else{
     $.ajax({
          type : "POST",
          url : "../controller/post_payments.php",
          data : {posted_by:posted_by, guest:guest, payment_mode:payment_mode, bank_paid:bank_paid, sender:sender, guest_amount:guest_amount, amount_paid:amount_paid},
          success : function(response){
               $("#all_payments").html(response);
          }
     })
          setTimeout(function(){
               $('#all_payments').load("post_payment.php?guest_id=+"+guest + "#all_payments");
          }, 3000);
     }
     return false;    

}
//post other cash payments for guest
function postOtherCash(){
     let posted_by = document.getElementById("posted_by").value;
     let guest = document.getElementById("guest").value;
     let payment_mode = document.getElementById("payment_mode").value;
     let bank_paid = document.getElementById("bank_paid").value;
     let sender = document.getElementById("sender").value;
     let guest_amount = document.getElementById("guest_amount").value;
     let amount_paid = document.getElementById("amount_paid").value;
     
     if(amount_paid.length == 0 || amount_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input amount paid!");
          $("#amount_paid").focus();
          return;
     // }else if(parseInt(amount_paid) < parseInt(guest_amount)){
     //      alert("Insufficient funds!");
     //      $("#guest_amount").focus();
     //      return;
     }else{
     $.ajax({
          type : "POST",
          url : "../controller/post_other_payments.php",
          data : {posted_by:posted_by, guest:guest, payment_mode:payment_mode, bank_paid:bank_paid, sender:sender, guest_amount:guest_amount, amount_paid:amount_paid},
          success : function(response){
               $("#guest_details").html(response);
          }
     })
          setTimeout(function(){
               $('#guest_details').load("guest_details.php?guest_id=+"+guest + "#guest_details");
          }, 3000);
     }
     return false;    

}
//post other Pos payments for guest
function postOtherPos(){
     let posted_by = document.getElementById("posted_by").value;
     let guest = document.getElementById("guest").value;
     let payment_mode = document.getElementById("pos_mode").value;
     let bank_paid = document.getElementById("pos_bank_paid").value;
     let sender = document.getElementById("sender").value;
     let guest_amount = document.getElementById("guest_amount").value;
     let amount_paid = document.getElementById("pos_amount_paid").value;
     
     if(amount_paid.length == 0 || amount_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input amount paid!");
          $("#pos_amount_paid").focus();
          return;
     }else if(bank_paid.length == 0 || bank_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select POS Bank!");
          $("#pos_bank_paid").focus();
          return;
     }else{
     $.ajax({
          type : "POST",
          url : "../controller/post_other_payments.php",
          data : {posted_by:posted_by, guest:guest, payment_mode:payment_mode, bank_paid:bank_paid, sender:sender, guest_amount:guest_amount, amount_paid:amount_paid},
          success : function(response){
               $("#guest_details").html(response);
          }
     })
          setTimeout(function(){
               $('#guest_details').load("guest_details.php?guest_id=+"+guest + "#guest_details");
          }, 3000);
     }
     return false;    

}
//post other Transfer payments for guest
function postOtherTransfer(){
     let posted_by = document.getElementById("posted_by").value;
     let guest = document.getElementById("guest").value;
     let payment_mode = document.getElementById("transfer_mode").value;
     let bank_paid = document.getElementById("transfer_bank_paid").value;
     let sender = document.getElementById("transfer_sender").value;
     let guest_amount = document.getElementById("guest_amount").value;
     let amount_paid = document.getElementById("transfer_amount").value;
     
     if(amount_paid.length == 0 || amount_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input amount paid!");
          $("#transfer_amount").focus();
          return;
     }else if(bank_paid.length == 0 || bank_paid.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Bank Transferred to!");
          $("#transfer_bank_paid").focus();
          return;
     }else if(sender.length == 0 || sender.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please Input Name of sender!");
          $("#transfer_sender").focus();
          return;
     }else{
     $.ajax({
          type : "POST",
          url : "../controller/post_other_payments.php",
          data : {posted_by:posted_by, guest:guest, payment_mode:payment_mode, bank_paid:bank_paid, sender:sender, guest_amount:guest_amount, amount_paid:amount_paid},
          success : function(response){
               $("#guest_details").html(response);
          }
     })
          setTimeout(function(){
               $('#guest_details').load("guest_details.php?guest_id=+"+guest + "#guest_details");
          }, 3000);
     }
     return false;    

}

//check out guest
function checkOut(){
     let checkout = confirm("Do you want to check out this guest?", "");
     if(checkout){
          // alert(user_id);
          let user_id = document.getElementById("user_id").value;
          let guest_id = document.getElementById("guest_id").value;
          $.ajax({
               type : "POST",
               url : "../controller/check_out.php",
               data : {user_id:user_id, guest_id:guest_id},
               success : function(response){
                    $("#guest_details").html(response);
               }
          })
          setTimeout(function(){
               $("#guest_details").load("guest_details.php?guest_id="+guest_id+ "#guest_details");
          }, 3000);
     }
     return false;
}

//display any item form
function getForm(item, link){
     // alert(item);
     $.ajax({
          type : "GET",
          url : "../controller/"+link+"?item_id="+item,
          success : function(response){
               $(".info").html(response);
               window.scrollTo(0, 0);
          }
     })
     return false;
 
 }


//display stockin form
function displayStockinForm(item_id){
     let item = item_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/get_stockin_details.php?item="+item,
               success : function(response){
                    $(".info").html(response);
               }
          })
          $("#sales_item").html("");
          $("#item").val('');

          return false;
     // }
     
 }
//display transfer item form
function addTransfer(item_id){
     let item = item_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/get_transfer_details.php?item="+item,
               success : function(response){
                    $(".info").html(response);
               }
          })
          $("#sales_item").html("");
          $("#item").val('');
          return false;
     // }
     
 }
//display transfer item form
function addIssue(item_id){
     let item = item_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/get_issue_details.php?item="+item,
               success : function(response){
                    $(".info").html(response);
               }
          })
          $("#sales_item").html("");
          $("#item").val('');
          return false;
     // }
     
 }

 //display item purchase history
function checkStockinHistory(item_id){
     // alert(item_id);
/*      let invoice = document.getElementById("invoice").value;
     let vendor = document.getElementById("vendor").value; */
     let item = item_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/stockin_history.php?item="+item,
               success : function(response){
                    $(".new_data").html(response);
               }
          })
          $("#sales_item").html("");
          return false;
     // }
     
 }
 //display item issue history
function checkIssuedHistory(item_id){
     // alert(item_id);
/*      let invoice = document.getElementById("invoice").value;
     let vendor = document.getElementById("vendor").value; */
     let item = item_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/item_issued_history.php?item="+item,
               success : function(response){
                    $(".new_data").html(response);
               }
          })
          $("#sales_item").html("");
          $("#item").val("");
          return false;
     // }
     
 }
 //display customer statement/transaction history
function getCustomerStatement(customer_id){
     let customer = customer_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/customer_statement.php?customer="+customer,
               success : function(response){
                    $("#customer_statement").html(response);
               }
          })
          $("#sales_item").html("");
          $("#customer").val("")
          return false;
     // }
     
 }
 //display vendor statement/transaction history
function getVendorStatement(customer_id){
     let customer = customer_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/vendor_statement.php?vendor="+customer,
               success : function(response){
                    $("#customer_statement").html(response);
               }
          })
          $("#sales_item").html("");
          $("#customer").val("")
          return false;
     // }
     
 }
 //display items in each customer inivoice under statement/transaction history
function viewCustomerInvoice(invoice_id){
     let invoice = invoice_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/customer_invoices.php?invoice="+invoice,
               success : function(response){
                    $("#customer_invoices").html(response);
                    // window.scrollTo(0, 0);
                    document.getElementById("customer_invoices").scrollIntoView();
               }
          })
          $("#sales_item").html("");
          return false;
     // }
     
 }
 //update items in each customer inivoice under statement/transaction history
function updateCustomerInvoice(invoice_id){
     let invoice = invoice_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/update_invoices.php?invoice="+invoice,
               success : function(response){
                    $("#customer_invoices").html(response);
                    // window.scrollTo(0, 0);
                    document.getElementById("customer_invoices").scrollIntoView();
               }
          })
          $("#sales_item").html("");
          return false;
     // }
     
 }
 //display items in each vendor inivoice under statement/transaction history
function viewVendorInvoice(invoice_id, vendor){
     let invoice = invoice_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/vendor_invoices.php?invoice="+invoice+"&vendor="+vendor,
               success : function(response){
                    $("#customer_invoices").html(response);
                    // window.scrollTo(0, 0);
                    document.getElementById("customer_invoices").scrollIntoView();
               }
          })
          $("#sales_item").html("");
          return false;
     // }
     
 }
 //display payment form for credit payments
function addPayment(invoice_id){
     let invoice = invoice_id;          
          $.ajax({
               type : "GET",
               url : "../controller/get_payment.php?invoice="+invoice,
               success : function(response){
                    $("#customer_invoices").html(response);
                    // window.scrollTo(0, 0);
                    document.getElementById("customer_invoices").scrollIntoView();
               }
          })
          // $("#sales_item").html("");
          return false;
     // }
     
 }
 //stockin in items
function stockin(){
     let posted_by = document.getElementById("posted_by").value;
     let store = document.getElementById("store").value;
     let invoice_number = document.getElementById("invoice_number").value;
     let supplier = document.getElementById("supplier").value;
     let details = document.getElementById("details").value;
     // let item_id = document.getElementById("item_id").value;
     let quantity = document.getElementById("quantity").value;
     let cost_price = document.getElementById("cost_price").value;
     let purchase_date = document.getElementById("purchase_date").value;
     let todayDate = new Date();
     // let item_type = document.getElementById("item_type").value;
     /* let sales_price = document.getElementById("sales_price").value;
     let pack_price = document.getElementById("pack_price").value;
     let pack_size = document.getElementById("pack_size").value;
     let wholesale_price = document.getElementById("wholesale_price").value;
     let wholesale_pack = document.getElementById("wholesale_pack").value; */
    /*  let expiration_date = document.getElementById("expiration_date").value;
     
     let today = todayDate.toLocaleDateString(); */
     // alert(today);
     if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity purchased!");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0){
          alert("Please input quantity purchased!");
          $("#quantity").focus();
          return;
     }else if(cost_price <= 0){
          alert("Please input cost price!");
          $("#cost_price").focus();
          return;
     }else if(cost_price.length == 0 || cost_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input cost price");
          $("#cost_price").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input item details");
          $("#details").focus();
          return;
     }else if(supplier.length == 0 || supplier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select supplier");
          $("#supplier").focus();
          return;
     }else if(purchase_date.length == 0 || purchase_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select purchase date");
          $("#purchase_date").focus();
          return;
     /* }else if(sales_price.length == 0 || sales_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input selling price");
          $("#sales_price").focus();
          return; */
     /* }else if(expiration_date.length == 0 || expiration_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input item expiration date");
          $("#expiration_date").focus();
          return;
     }else if(new Date(today).getTime() > new Date(expiration_date).getTime()){
          alert("You can not stock in expired items!");
          $("#expiration_date").focus();
          return; */
     /* }else if(parseInt(cost_price) >= parseInt(sales_price)){
          alert("Cost price cannot be greater than selling price!");
          $("#sales_price").focus();
          return;*/
     }else if(parseInt(cost_price) < 0){
          alert("Cost price cannot be lesser than 0!");
          $("#cost_price").focus();
          return;
     }else if(new Date(purchase_date) > todayDate){
          alert("You cannot enter a futuristic date!");
          $("#purchase_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/stock_in.php",
               data : {posted_by:posted_by, store:store, supplier:supplier, invoice_number:invoice_number, /* item_id:item_id, */ quantity:quantity, cost_price:cost_price,/*  item_type:item_type, */ details:details, purchase_date:purchase_date/* sales_price:sales_price, pack_price:pack_price, pack_size:pack_size, wholesale_price:wholesale_price, wholesale_pack:wholesale_pack,  expiration_date:expiration_date*/},
               success : function(response){
               $(".stocked_in").html(response);
               }
          })
          $("#quantity").val('');
          $("#cost_price").val('');
          $("#details").val('');
          $("#details").focus();
          $(".info").html('');
          return false; 
     }
}
 //transfer in items
function transfer(){
     let posted_by = document.getElementById("posted_by").value;
     let store_from = document.getElementById("store_from").value;
     let store_to = document.getElementById("store_to").value;
     let invoice = document.getElementById("invoice").value;
     let item_id = document.getElementById("item_id").value;
     let quantity = document.getElementById("quantity").value;
     if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity purchased!");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0){
          alert("Please input quantity transfered!");
          $("#quantity").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/transfer.php",
               data : {posted_by:posted_by, store_to:store_to, store_from:store_from, invoice:invoice, item_id:item_id, quantity:quantity},
               success : function(response){
               $(".stocked_in").html(response);
               }
          })
          /* $("#quantity").val('');
          $("#expiration_date").val('');
          $("#quantity").focus(); */
          $(".info").html('');
          return false; 
     }
}
 //issue out items
function issueItem(){
     let posted_by = document.getElementById("posted_by").value;
     let store_from = document.getElementById("store_from").value;
     // let store_to = document.getElementById("store_to").value;
     let invoice = document.getElementById("invoice").value;
     let item_id = document.getElementById("item_id").value;
     let quantity = document.getElementById("quantity").value;
     if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity transferred!");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0){
          alert("Please input quantity transferred!");
          $("#quantity").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/issue_item.php",
               data : {posted_by:posted_by,store_from:store_from, invoice:invoice, item_id:item_id, quantity:quantity},
               success : function(response){
               $(".stocked_in").html(response);
               }
          })
          /* $("#quantity").val('');
          $("#expiration_date").val('');
          $("#quantity").focus(); */
          $(".info").html('');
          return false; 
     }
}

//delete individual purchases
function deletePurchase(purchase, item){
     let confirmDel = confirm("Are you sure you want to delete this purchase?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_purchase.php?purchase_id="+purchase+"&item_id="+item,
               success : function(response){
                    $(".stocked_in").html(response);
               }
               
          })
          $("#quantity").val('');
          $("#details").val('');
          $("#cost_price").val('');
          $("#details").focus();
          return false;
     }else{
          return;
     }
}
//close stock in form
function closeStockin(){
     $("#stockin").load("stockin_purchase.php #stockin");
}


 //adjust item quantity
 function adjustQty(){
     let item_id = document.getElementById("item_id").value;
     let quantity = document.getElementById("quantity").value;
     if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#item_name").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/stock_adjustment.php",
               data: {item_id:item_id, quantity:quantity},
               success : function(response){
                    $("#adjust_quantity").html(response);
               }
          })
          setTimeout(function(){
               $("#adjust_quantity").load("stock_adjustment.php #adjust_quantity");
          }, 2000);
          return false
     }
 }
 
 //remove item quantity from store
 function removeQty(){
     let item_id = document.getElementById("item_id").value;
     let quantity = document.getElementById("quantity").value;
     let remove_reason = document.getElementById("remove_reason").value;
     if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#item_name").focus();
          return;
     }else if(remove_reason.length == 0 || remove_reason.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select reason for removal!");
          $("#remove_reason").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/remove_item.php",
               data: {item_id:item_id, quantity:quantity, remove_reason:remove_reason},
               success : function(response){
                    $("#remove_item").html(response);
               }
          })
          setTimeout(function(){
               $("#remove_item").load("remove_item.php #remove_item");
          }, 2000);
          return false
     }
 }
 //adjust item expiration
 function adjustExpiry(){
     let item_id = document.getElementById("item_id").value;
     let exp_date = document.getElementById("exp_date").value;
     let todayDate = new Date();
     let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input date!");
          $("#item_name").focus();
          return;
     }else if(new Date(today).getTime() > new Date(exp_date).getTime()){
          alert("Expiration date is invalid!");
          $("#expiration_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/adjust_expiration.php",
               data: {item_id:item_id, exp_date:exp_date},
               success : function(response){
                    $("#adjust_expiration").html(response);
               }
          })
          setTimeout(function(){
               $("#adjust_expiration").load("adjust_expiration.php #adjust_expiration");
          }, 2000);
          return false
     }
 }
//  display change rom price
function roomPriceForm(item_id){
     // alert(item_id);
     $.ajax({
          type : "GET",
          url : "../controller/get_room_details.php?item_id="+item_id,
          success : function(response){
               $(".info").html(response);
          }
     })
     return false;
 
 }
 
 //close price form
 function closeForm(){
     
         $(".priceForm").hide();
     
 }

 //change room price
 function changeRoomPrice(){
     let item_id = document.getElementById("item_id").value;
     let price = document.getElementById("price").value;

     $.ajax({
          type : "POST",
          url : "../controller/edit_room_price.php",
          data: {item_id:item_id, price:price},
          success : function(response){
               $("#edit_price").html(response);
          }
     })
     setTimeout(function(){
          $("#edit_price").load("room_price.php #edit_price");
     }, 1500);
     return false;
 }
 //change product price
 function changeItemPrice(){
     let item_id = document.getElementById("item_id").value;
     let cost_price = document.getElementById("cost_price").value;
     let sales_price = document.getElementById("sales_price").value;
     /* let pack_price = document.getElementById("pack_price").value;
     let pack_size = document.getElementById("pack_size").value; */
     // let wholesale_price = document.getElementById("wholesale_price").value;
     /* let wholesale_pack = document.getElementById("wholesale_pack").value;*/
     if(parseInt(cost_price) >= parseInt(sales_price)){
          alert("Selling price can not be lesser than cost price!");
          $("#sales_price").focus();
          return;
     /*}else if(parseInt(cost_price) >= parseInt(wholesale_price)){
          alert("Guest price can not be lesser than cost price!");
          $("#wholesale_price").focus();
          return;*/
     }else if(cost_price.length == 0 || cost_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter cost price!");
          $("#cost_price").focus();
          return; 
     }else if(sales_price.length == 0 || sales_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter selling price!");
          $("#sales_price").focus();
          return;
     /*}else if(wholesale_price.length == 0 || wholesale_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter wholesale price!");
          $("#wholesale_price").focus();
          return;
     /* }else if(pack_price.length == 0 || pack_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter pack price!");
          $("#pack_price").focus();
          return; */
     /* }else if(pack_price <= cost_price){
          alert("Error! Pack price cannot be lesser than cost price!");
          $("#pack_price").focus();
          return; */
     /* }else if(pack_size.length == 0 || pack_size.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter pack size!");
          $("#pack_size").focus();
          return; */
     }else if(sales_price <= 0 || cost_price < 0){
          alert("Prices can not be less than or  equal to 0");
          return;
     
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/edit_price.php",
               data: {item_id:item_id, cost_price:cost_price, sales_price:sales_price, /* pack_price:pack_price, wholesale_price:wholesale_price,wholesale_pack:wholesale_pack, pack_size:pack_size */},
               success : function(response){
                    $("#edit_item_price").html(response);
               }
          })
          setTimeout(function(){
               $("#edit_item_price").load("item_price.php #edit_item_price");
          }, 1500);
          return false
     }
 }
 //change raw matrial cost price
 function changeCostPrice(){
     let item_id = document.getElementById("item_id").value;
     let cost_price = document.getElementById("cost_price").value;
     
     if(parseInt(cost_price) <= 0){
          alert("Cost price can not be lesser than or equal to 0!");
          $("#cost_price").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/edit_cost_price.php",
               data: {item_id:item_id, cost_price:cost_price},
               success : function(response){
                    $("#edit_item_price").html(response);
               }
          })
          setTimeout(function(){
               $("#edit_item_price").load("raw_material_price.php #edit_item_price");
          }, 1500);
          return false
     }
 }
 //modify item name
 function modifyItem(){
     let item_id = document.getElementById("item_id").value;
     let item_name = document.getElementById("item_name").value;
     if(item_name.length == 0 || item_name.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input item name!");
          $("#item_name").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/modify_item.php",
               data: {item_id:item_id, item_name:item_name},
               success : function(response){
                    $("#edit_item_name").html(response);
               }
          })
          setTimeout(function(){
               $("#edit_item_name").load("modify_item.php #edit_item_name");
          }, 1500);
          return false
     }
 }
 //update item barcode
 function updateBarcode(){
     let item_id = document.getElementById("item_id").value;
     let barcode = document.getElementById("barcode").value;
     if(barcode.length == 0 || barcode.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input item barcode!");
          $("#barcode").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/update_barcode.php",
               data: {item_id:item_id, barcode:barcode},
               success : function(response){
                    $("#update_barcode").html(response);
               }
          })
          setTimeout(function(){
               $("#update_barcode").load("update_barcode.php #update_barcode");
          }, 1500);
          return false
     }
 }
 //change item category
 function changeCategory(){
     let item_id = document.getElementById("item_id").value;
     let department = document.getElementById("department").value;
     let item_category = document.getElementById("item_category").value;
     if(department.length == 0 || department.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select item category!");
          $("#department").focus();
          return;
     }else if(item_category.length == 0 || item_category.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select item subcategory!");
          $("#item_category").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/change_category.php",
               data: {item_id:item_id, department:department, item_category:item_category},
               success : function(response){
                    $("#change_category").html(response);
               }
          })
          setTimeout(function(){
               $("#change_category").load("change_category.php #change_category");
          }, 1500);
          return false
     }
 }





// update password
function updatePassword(){
     let username = document.getElementById('username').value;
     let current_password = document.getElementById('current_password').value;
     let new_password = document.getElementById('new_password').value;
     let retype_password = document.getElementById('retype_password').value;
     /* authentication */
     if(current_password == 0 || current_password.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter current password");
          $("#current_password").focus();
          return;
     }else if(new_password == 0 || new_password.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter new password");
          $("#new_password").focus();
          return;
     }else if(new_password.length < 6){
          alert("New password must be greater or equal to 6 characters");
          $("#new_password").focus();
          return;
     }else if(retype_password == 0 || retype_password.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please retype new password");
          $("#retype_password").focus();
          return;
     }else if(new_password !== retype_password){
          alert("Passwords does not match!");
          $("#retype_password").focus();
          return;
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_password.php",
               data: {username:username, current_password:current_password, new_password:new_password, retype_password:retype_password},
               success: function(response){
               $(".info").html(response);
               }
          });
     }
     return false;
}
//  Get room reports 
function getRoomReports(room){
     let room_id = room;
     /* authentication */
     if(room_id){
          $.ajax({
               type: "POST",
               url: "../controller/room_reports.php",
               data: {room_id:room_id},
               success: function(response){
                    $(".new_data").html(response);
               }
          });
     }else{
          alert("select a room!");
          return;
     }
     return false;
}

//get vendors
function getVendors(vendor){
     let ven_input = vendor;
     if(ven_input){
          $.ajax({
               type : "POST",
               url :"../controller/get_vendors.php",
               data : {ven_input:ven_input},
               success : function(response){
                    $("#vendors").html(response);
               }
          })
          return false;
     }else{
          $("#vendors").html("<option value='' selected>No result</option>")
     }
     
}

//show bill types forms
/* function showRetail(){
     $("#retail_customers").show();
     $("#wholesale_customers").hide();
}
function showWholesale(){
     $("#retail_customers").hide();
     $("#wholesale_customers").show();
} */
//show sales form categories (bar and restuarant)
function showBar(){
     $("#bar_items").show();
     $("#restaurant_items").hide();
}
function showRestaurant(){
     $("#bar_items").hide();
     $("#restaurant_items").show();
}

//get item for direct sales
function getItems(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_items.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//get item for sales order
function getItemsOrder(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_sales_order_items.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//get item for wholesale direct sales
function getWholesaleItems(item_name){
     let item = item_name;
     let customer = document.getElementById("customer").value;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_wholesale_items.php",
                    data : {item:item, customer:customer},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//get item for wholesale direct sales
function getUpdateItems(item_name){
     let item = item_name;
     let customer = document.getElementById("customer").value;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_update_items.php",
                    data : {item:item, customer:customer},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//get item for stockin
function getItemStockin(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     let invoice = document.getElementById("invoice").value;
     let vendor = document.getElementById("vendor").value;
     if(invoice.length == 0 || invoice.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input invoice number!");
          $("#invoice").focus();
          return;
     }else if(vendor.length == 0 || vendor.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select supplier!");
          $("#vendor").focus();
          return;
     }else{
          if(item.length >= 3){
               if(item){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_item_stockin.php",
                         data : {item:item, invoice:invoice, vendor:vendor},
                         success : function(response){
                              $("#sales_item").html(response);
                         }
                    })
                    $("#invoice").attr("readonly", true);
                    $("#vendor").attr("readonly", true);
                    return false;
               }else{
                    $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
               }
          }
     }
     
}
//get item for transfer
function getItemTransfer(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     let invoice = document.getElementById("invoice").value;
     let store_to = document.getElementById("store_to").value;
     if(store_to.length == 0 || store_to.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a store!");
          $("#store_to").focus();
          return;
     }else{
          if(item.length >= 3){
               if(item){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_item_transfer.php",
                         data : {item:item,  store_to:store_to, invoice:invoice},
                         success : function(response){
                              $("#sales_item").html(response);
                         }
                    })
                    $("#store_to").attr("readonly", true);
                    return false;
               }else{
                    $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
               }
          }
     }
     
}
//get item for issue
function getItemIssue(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     let invoice = document.getElementById("invoice").value;
     // let store_to = document.getElementById("store_to").value;
     /* if(store_to.length == 0 || store_to.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a store!");
          $("#store_to").focus();
          return;
     }else{ */
          if(item.length >= 3){
               if(item){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_item_issue.php",
                         data : {item:item,/*   store_to:store_to, */ invoice:invoice},
                         success : function(response){
                              $("#sales_item").html(response);
                         }
                    })
                    // $("#store_to").attr("readonly", true);
                    return false;
               }else{
                    $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
               }
          }
     // }
     
}
//get item issued hostory
function getIssuedItem(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#toDate").focus();
          return;
     }else{
          if(item.length >= 3){
               if(item){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_issued_item.php",
                         data : {item:item, fromDate:fromDate, toDate:toDate},
                         success : function(response){
                              $("#sales_item").html(response);
                         }
                    })
                    /* $("#fromDate").attr("readonly", true);
                    $("#toDate").attr("readonly", true); */
                    return false;
               }else{
                    $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
               }
          }
     }
}
//get customer statement
function getCustomer(customer_id){
     let customer = customer_id;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#toDate").focus();
          return;
     }else{
     if(customer.length >= 3){
          if(customer){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_customer.php",
                    data : {customer:customer, fromDate:fromDate, toDate:toDate},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               /* $("#fromDate").attr("readonly", true);
               $("#toDate").attr("readonly", true); */
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
}
     
}
//get vendor statement
function getVendor(customer_id){
     let customer = customer_id;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#toDate").focus();
          return;
     }else{
     if(customer.length >= 3){
          if(customer){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_vendor.php",
                    data : {customer:customer, fromDate:fromDate, toDate:toDate},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               /* $("#fromDate").attr("readonly", true);
               $("#toDate").attr("readonly", true); */
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
}
     
}
//get item for stockin history
function getStockinItem(item_name){
     let item = item_name;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#toDate").focus();
          return;
     }else{
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_item_purchase.php",
                    data : {item:item, fromDate:fromDate, toDate:toDate},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               /* $("#fromDate").attr("readonly", true);
               $("#toDate").attr("readonly", true); */
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
}
     
}
//search vendor history
function vendorHistory(){
     let vendor = document.getElementById("vendor").value;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#toDate").focus();
          return;
     }else if(vendor.length == 0 || vendor.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a vendor!");
          $("#toDate").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url :"../controller/vendor_history.php",
               data : {vendor:vendor, fromDate:fromDate, toDate:toDate},
               success : function(response){
                    $(".new_data").html(response);
               }
          })
         
     }
}
     


//add direct sales 
function addSales(item_id){
     let item = item_id;
     let invoice = document.getElementById("invoice").value;
     $.ajax({
          type : "GET",
          url : "../controller/add_sales.php?sales_item="+item+"&invoice="+invoice,
          success : function(response){
               $(".sales_order").html(response);
          }
     })
     $("#sales_item").html("");
     $("#item").val('');

     return false;
}

//add sales order
function addSalesOrder(item_id){
     let item = item_id;
     $.ajax({
          type : "GET",
          url : "../controller/add_sales_order.php?sales_item="+item,
          success : function(response){
               $(".sales_order").html(response);
          }
     })
     $("#sales_item").html("");
     $("#item").val('');

     return false;
}
//add direct wholesales 
function addWholeSales(item_id){
     let item = item_id;
     let customer = document.getElementById("customer").value;
     let invoice = document.getElementById("invoice").value;
     $.ajax({
          type : "GET",
          url : "../controller/add_wholesale.php?sales_item="+item+"&customer="+customer+"&invoice="+invoice,
          success : function(response){
               $(".sales_order").html(response);
          }
     })
     $("#sales_item").html("");
     $("#item").val('');

     return false;
}
//add direct sales for invoice update 
function addUpdateSales(item_id){
     let item = item_id;
     let customer = document.getElementById("customer").value;
     let invoice = document.getElementById("invoice").value;
     $.ajax({
          type : "GET",
          url : "../controller/add_update.php?sales_item="+item+"&customer="+customer+"&invoice="+invoice,
          success : function(response){
               $(".sales_order").html(response);
          }
     })
     $("#sales_item").html("");
     $("#item").val('');

     return false;
}
//delete individual items from direct sales
function deleteSales(sales, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_sales.php?sales_id="+sales+"&item_id="+item,
               success : function(response){
                    $(".sales_order").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//delete item
function deleteItem(item){
     let confirmDel = confirm("Are you sure you want to delete this item?", "");
     if(confirmDel){
          $.ajax({
               type : "GET",
               url : "../controller/delete_item.php?item="+item,
               success : function(response){
                    $("#delete_item").html(response);
               }
          })
          setTimeout(function(){
               $("#delete_item").load("delete_item.php #delete_item");
          }, 1500);
          return false;
          
     }else{
          return;
     }
}
//delete individual items from sales order
function deleteSalesOrder(sales, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_sales_order.php?sales_id="+sales+"&item_id="+item,
               success : function(response){
                    $(".sales_order").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//delete individual items from direct wholesale
function deleteWholesale(sales, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_wholesale.php?sales_id="+sales+"&item_id="+item,
               success : function(response){
                    $(".sales_order").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//delete individual items from direct wholesale updates
function deleteUpdate(sales, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_update.php?sales_id="+sales+"&item_id="+item,
               success : function(response){
                    $(".sales_order").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//increase quantity for direct sales item
function increaseQty(sales, item){
     // alert(sales);
     $.ajax({
          type : "GET",
          url : "../controller/increase_qty.php?sales_id="+sales+"&item_id="+item,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//increase quantity for sales order item
function increaseQtyOrder(sales, item){
     // alert(sales);
     $.ajax({
          type : "GET",
          url : "../controller/increase_qty_order.php?sales_id="+sales+"&item_id="+item,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//increase quantity for direct wholesalesales item
function increaseQtyWholesale(sales, item){
     // alert(sales);
     $.ajax({
          type : "GET",
          url : "../controller/increase_qty_wholesale.php?sales_id="+sales+"&item_id="+item,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//increase quantity during update of invoice
function increaseQtyUpdate(sales, item){
     // alert(sales);
     $.ajax({
          type : "GET",
          url : "../controller/increase_qty_update.php?sales_id="+sales+"&item_id="+item,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//decrease quantity for direct sales item
function reduceQty(sales){
     $.ajax({
          type : "GET",
          url : "../controller/decrease_qty.php?item="+sales,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//decrease quantity for sales order item
function reduceQtyOrder(sales){
     $.ajax({
          type : "GET",
          url : "../controller/decrease_qty_order.php?item="+sales,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//decrease quantity for direct wholesalesales item
function reduceQtyWholesale(sales){
     $.ajax({
          type : "GET",
          url : "../controller/decrease_qty_wholesale.php?item="+sales,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//decrease quantity for update wholesalesales item
function reduceQtyUpdate(sales){
     $.ajax({
          type : "GET",
          url : "../controller/decrease_qty_update.php?item="+sales,
          success : function(response){
               $(".sales_order").html(response);
          }
          
     })
     return false;
}
//show more options for sales item to edit price and quantity
function showMore(sales){
     $.ajax({
          type : "GET",
          url : "../controller/edit_price_qty.php?item="+sales,
          success : function(response){
               $(".show_more").html(response);
               window.scrollTo(0, 0);
          }
          
     })
     return false;
}
//show more options for sales order item to edit price and quantity
function showMoreOrder(sales){
     $.ajax({
          type : "GET",
          url : "../controller/edit_price_qty_order.php?item="+sales,
          success : function(response){
               $(".show_more").html(response);
               window.scrollTo(0, 0);

          }
          
     })
     return false;
}
//show more options for sales item to edit price and quantity
function showMoreWholesale(sales){
     $.ajax({
          type : "GET",
          url : "../controller/edit_price_qty_wholesale.php?item="+sales,
          success : function(response){
               $(".show_more").html(response);
               window.scrollTo(0, 0);

          }
          
     })
     return false;
}
//show more options for sales item to edit price and quantity during invoice update
function showMoreUpdate(sales){
     $.ajax({
          type : "GET",
          url : "../controller/edit_price_qty_update.php?item="+sales,
          success : function(response){
               $(".show_more").html(response);
               $(".show_more").scrollIntoView();

          }
          
     })
     return false;
}
//update sales quantity and price for direct sales
function updatePriceQty(){
     let sales_id = document.getElementById("sales_id").value;
     let qty = document.getElementById("qty").value;
     let price = document.getElementById("price").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(qty.length == 0 || qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#qty").focus();
          return;
     }else if(price.length == 0 || price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#price").focus();
          return;
     }else if(qty < 1){
          alert("Qauntity cannot be zero or negative!");
          $("#qty").focus();
          return;
     }else if(price < 1){
          alert("Price cannot be zero or negative!");
          $("#price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_price_qty.php",
               data: {sales_id:sales_id, qty:qty, price:price},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//update sales quantity and price for sales order
function updatePriceQtyOrder(){
     let sales_id = document.getElementById("sales_id").value;
     let qty = document.getElementById("qty").value;
     let price = document.getElementById("price").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(qty.length == 0 || qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#qty").focus();
          return;
     }else if(price.length == 0 || price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#price").focus();
          return;
     }else if(qty < 1){
          alert("Qauntity cannot be zero or negative!");
          $("#qty").focus();
          return;
     }else if(price < 1){
          alert("Price cannot be zero or negative!");
          $("#price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_price_qty_order.php",
               data: {sales_id:sales_id, qty:qty, price:price},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//update sales quantity and price for wholesale
function updatePriceQtyWh(){
     let sales_id = document.getElementById("sales_id").value;
     let qty = document.getElementById("qty").value;
     let price = document.getElementById("price").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(qty.length == 0 || qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#qty").focus();
          return;
     }else if(price.length == 0 || price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#price").focus();
          return;
     }else if(qty < 1){
          alert("Qauntity cannot be zero or negative!");
          $("#qty").focus();
          return;
     }else if(price < 1){
          alert("Price cannot be zero or negative!");
          $("#price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_price_qty_who.php",
               data: {sales_id:sales_id, qty:qty, price:price},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//update sales quantity and price for wholesale update
function updatePriceQtyUp(){
     let sales_id = document.getElementById("sales_id").value;
     let qty = document.getElementById("qty").value;
     let prev_qty = document.getElementById("prev_qty").value;
     let price = document.getElementById("price").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(qty.length == 0 || qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#qty").focus();
          return;
     }else if(price.length == 0 || price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#price").focus();
          return;
     }else if(qty < 1){
          alert("Qauntity cannot be zero or negative!");
          $("#qty").focus();
          return;
     }else if(price < 1){
          alert("Price cannot be zero or negative!");
          $("#price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_price_qty_up.php",
               data: {sales_id:sales_id, qty:qty, prev_qty:prev_qty, price:price},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//get item pack price and size for direct sales
function getPack(sales){
     $.ajax({
          type : "GET",
          url : "../controller/get_pack.php?sales_id="+sales,
          success : function(response){
               $(".show_more").html(response);
          }
          
     })
     return false;
}
//get item pack price and size for sales order
function getPackSo(sales){
     $.ajax({
          type : "GET",
          url : "../controller/get_pack_so.php?sales_id="+sales,
          success : function(response){
               $(".show_more").html(response);
          }
          
     })
     return false;
}
//get item pack price and size for wholesale
function getWholesalePack(sales){
     $.ajax({
          type : "GET",
          url : "../controller/get_pack_wholesale.php?sales_id="+sales,
          success : function(response){
               $(".show_more").html(response);
          }
          
     })
     return false;
}
//sell item in pack for direct sales
function sellPack(){
     let sales_id = document.getElementById("sales_id").value;
     let pack_qty = document.getElementById("pack_qty").value;
     let pack_price = document.getElementById("pack_price").value;
     let pack_size = document.getElementById("pack_size").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(pack_qty.length == 0 || pack_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price.length == 0 || pack_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#pack_price").focus();
          return;
     }else if(pack_qty <= 0 ){
          alert("Qauntity cannot be zero or negative!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price <= 0){
          alert("Price cannot be zero or negative!");
          $("#pack_price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/sell_pack.php",
               data: {sales_id:sales_id, pack_qty:pack_qty, pack_price:pack_price, pack_size:pack_size},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//sell item in pack for sales order
function sellPackSo(){
     let sales_id = document.getElementById("sales_id").value;
     let pack_qty = document.getElementById("pack_qty").value;
     let pack_price = document.getElementById("pack_price").value;
     let pack_size = document.getElementById("pack_size").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(pack_qty.length == 0 || pack_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price.length == 0 || pack_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#pack_price").focus();
          return;
     }else if(pack_qty <= 0){
          alert("Qauntity cannot be zero or negative!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price <= 0){
          alert("Price cannot be zero or negative!");
          $("#pack_price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/sell_pack_so.php",
               data: {sales_id:sales_id, pack_qty:pack_qty, pack_price:pack_price, pack_size:pack_size},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//sell item in pack for wholesale
function sellPackWholesale(){
     let sales_id = document.getElementById("sales_id").value;
     let pack_qty = document.getElementById("pack_qty").value;
     let pack_price = document.getElementById("pack_price").value;
     let pack_size = document.getElementById("pack_size").value;
     // let inv_qty = document.getElementById("inv_qty").value;
     /* authentication */
     if(pack_qty.length == 0 || pack_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price.length == 0 || pack_price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input unit price!");
          $("#pack_price").focus();
          return;
     }else if(pack_qty <= 0 ){
          alert("Qauntity cannot be zero or negative!");
          $("#pack_qty").focus();
          return;
     }else if(pack_price <= 0){
          alert("Price cannot be zero or negative!");
          $("#pack_price").focus();
          return;
     /* }else if(qty > inv_qty){
          alert("Available quantity is less than required!");
          $("#qty").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/sell_pack_wholesale.php",
               data: {sales_id:sales_id, pack_qty:pack_qty, pack_price:pack_price, pack_size:pack_size},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}
//check payment mode
function checkMode(mode){
     let pay_mode = mode;
     let bank_input = document.getElementById("selectBank");
     // let multiples = document.getElementById("multiples");
     // let wallet = document.getElementById("account_balance");
     if(pay_mode == "POS" || pay_mode == "Transfer"){
          bank_input.style.display = "block";
          // multiples.style.display = "none";
          // wallet.style.display = "none";
          // deposit_amount.style.display = "none";
     /* }else if(pay_mode == "Multiple"){
          multiples.style.display = "block";
          bank_input.style.display = "block";
          wallet.style.display = "none";
     }else if(pay_mode == "Wallet"){
          wallet.style.display = "block";
          multiples.style.display = "none";
          bank_input.style.display = "none"; */
     }else{
          bank_input.style.display = "none";
          // multiples.style.display = "none";
          // wallet.style.display = "none";

     }
}
//check payment mode for purchases
function checkOtherMode(mode){
     let pay_mode = mode;
     let deposit = document.getElementById("deposited_amount");
     let cr_ledger = document.getElementById("cr_ledger");
     if(pay_mode == "Deposit"){
          deposit.style.display = "block";
          
     }else{
          deposit.style.display = "none";
     }
     if(pay_mode != "Credit"){
          cr_ledger.style.display = "block";
     }else{
          cr_ledger.style.display = "none";
     }
}
//post direct sales payment
function postSales(){
     let confirmPost = confirm("Are you sure you want to post this sales?", "");
     if(confirmPost){
          let total_amount = document.getElementById("total_amount").value;
          let sales_invoice = document.getElementById("sales_invoice").value;
          let discount = document.getElementById("discount").value;
          let store = document.getElementById("store").value;
          let payment_type = document.getElementById("payment_type").value;
          let bank = document.getElementById("bank").value;
          let multi_cash = document.getElementById("multi_cash").value;
          let multi_pos = document.getElementById("multi_pos").value;
          let multi_transfer = document.getElementById("multi_transfer").value;
          let sum_amount = parseInt(multi_cash) + parseInt(multi_pos) + parseInt(multi_transfer);
          if(document.getElementById("multiples").style.display == "block"){
               if(sum_amount != (parseInt(total_amount) - parseInt(discount))){
                    alert("Amount entered is not equal to total amount");
                    $("#multi_cash").focus();
                    return;
               }
          }
          if(payment_type == "Multiple" || payment_type == "POS" || payment_type == "Transfer"){
               if(bank.length == 0 || bank.replace(/^\s+|\s+$/g, "").length == 0){
                    alert("Please select bank!");
                    $("#bank").focus();
                    return;
               }
          }
          if(payment_type.length == 0 || payment_type.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select a payment option!");
               $("#payment_type").focus();
               return;
          }else if(discount.length == 0 || discount.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter discount value or 0!");
               $("#discount").focus();
               return;
          }else{
               $.ajax({
                    type : "POST",
                    url : "../controller/post_sales.php",
                    data : {sales_invoice:sales_invoice, payment_type:payment_type, bank:bank, multi_cash:multi_cash, multi_pos:multi_pos, multi_transfer:multi_transfer, discount:discount, store:store},
                    success : function(response){
                         $("#direct_sales").html(response);
                    }
               })
               $(".sales_order").html('');
               /* setTimeout(function(){
                    $("#direct_sales").load("direct_sales.php #direct_sales");
               }, 200);
               return false; */
          }
     // }
     }else{
          return;
     }
}
//post sales order payment
function postSalesOrder(){
     let confirmPost = confirm("Are you sure you want to post this sales?", "");
     if(confirmPost){
          let total_amount = document.getElementById("total_amount").value;
          let discount = document.getElementById("discount").value;
          // alert(total_amount);
          let sales_invoice = document.getElementById("sales_invoice").value;
          let payment_type = document.getElementById("payment_type").value;
          let bank = document.getElementById("bank").value;
          let store = document.getElementById("store").value;
          let multi_cash = document.getElementById("multi_cash").value;
          let multi_pos = document.getElementById("multi_pos").value;
          let multi_transfer = document.getElementById("multi_transfer").value;
          let sum_amount = parseInt(multi_cash) + parseInt(multi_pos) + parseInt(multi_transfer);
          if(document.getElementById("multiples").style.display == "block"){
               //check if total amount is greater than sum
               if(sum_amount != (total_amount - discount)){
                    alert("Amount entered is not equal to total amount");
                    $("#multi_cash").focus();
                    return;
               }
          }
          if(payment_type.length == 0 || payment_type.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select a payment option!");
               $("#payment_type").focus();
               return;
          }else if(discount.length == 0 || discount.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter discount value or 0!");
               $("#discount").focus();
               return;
          }else{
               $.ajax({
                    type : "POST",
                    url : "../controller/post_sales_order.php",
                    data : {sales_invoice:sales_invoice, payment_type:payment_type, bank:bank, multi_cash:multi_cash, multi_pos:multi_pos, multi_transfer:multi_transfer, discount:discount, store:store},
                    success : function(response){
                         $("#sales_details").html(response);
                    }
               })
               // $(".sales_order").html('');
               /* setTimeout(function(){
                    $("#direct_sales").load("direct_sales.php #direct_sales");
               }, 200);
               return false; */
          }
     }else{
          return;
     }
}
//post sales order ticket
function printSalesOrder(){
     let confirmPost = confirm("Are you sure you want to post this sales?", "");
     if(confirmPost){
          let sales_invoice = document.getElementById("sales_invoice").value;
          
          
          $.ajax({
               type : "POST",
               url : "../controller/post_ticket.php",
               data : {sales_invoice:sales_invoice},
               success : function(response){
                    $("#sales_order").html(response);
               }
          })
          $(".sales_order").html('');
          /* setTimeout(function(){
               $("#direct_sales").load("direct_sales.php #direct_sales");
          }, 200);
          return false; */
     }
}
// prinit transfer receipt
function printTransferReceipt(invoice){
     window.open("../controller/transfer_receipt.php?receipt="+invoice);
     // alert(item_id);
     /* $.ajax({
          type : "GET",
          url : "../controller/sales_receipt.php?receipt="+invoice,
          success : function(response){
               $("#direct_sales").html(response);
          }
     }) */
     setTimeout(function(){
          $("#direct_sales").load("direct_sales.php #direct_sales");
     }, 100);
     return false;
 
 }
//post direct wholesale payment
function postWholesale(){
     let sales_invoice = document.getElementById("sales_invoice").value;
     let store = document.getElementById("store").value;
     let customer_id = document.getElementById("customer_id").value;
     let payment_type = document.getElementById("payment_type").value;
     // let post_date = document.getElementById("post_date").value;
     let todayDate = new Date();
     let today = todayDate;
     /* if(post_date.length == 0 || post_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction date");
          $("#post_date").focus();
          return;
     }else if(new Date(post_date) > new Date(today)){
          alert("You can not post a future transaction!");
          $("#post_date").focus();
          return;
     }else{ */
          let confirmPost = confirm("Are you sure you want to post this sales?", "");
          if(confirmPost){
               $.ajax({
                    type : "POST",
                    url : "../controller/post_wholesale.php",
                    data : {sales_invoice:sales_invoice, payment_type:payment_type, /* bank:bank, multi_cash:multi_cash, multi_pos:multi_pos, multi_transfer:multi_transfer, discount:discount, wallet:wallet, */ store:store, customer_id:customer_id/* , post_date:post_date */},
                    success : function(response){
                         $("#direct_sales").html(response);
                    }
               })
               $(".sales_order").html('');
               /* setTimeout(function(){
                    $("#direct_sales").load("direct_sales.php #direct_sales");
               }, 200);
               return false; */
          }
     
     // }
}
 //adjust item quantity
 function adjustReorderLevel(){
     let item_id = document.getElementById("item_id").value;
     let rol = document.getElementById("rol").value;
     if(rol.length == 0 || rol.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input reorder level!");
          $("#rol").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/reorder_level.php",
               data: {item_id:item_id, rol:rol},
               success : function(response){
                    $("#reorder_levels").html(response);
               }
          })
          setTimeout(function(){
               $("#reorder_levels").load("reorder_level.php #reorder_levels");
          }, 2000);
          return false
     }
 }

 //display sales return form
function displaySales(sales_id){
     // alert(item_id);
     $.ajax({
          type : "GET",
          url : "../controller/get_sales.php?sales_id="+sales_id,
          success : function(response){
               $(".select_date").html(response);
          }
     })
     return false;
 
 }
 //sales return
 function returnSales(){
     let return_sales = confirm("Are you sure you want to return this sales?", "");
     if(return_sales){
          let item = document.getElementById("item").value;
          let sold_qty = document.getElementById("sold_qty").value;
          let sales_id = document.getElementById("sales_id").value;
          let user_id = document.getElementById("user_id").value;
          let store = document.getElementById("store").value;
          let quantity = document.getElementById("quantity").value;
          let reason = document.getElementById("reason").value;
          if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please input quantity!");
               $("#quantity").focus();
               return;
          }else if(quantity > sold_qty){
               alert("You cannot return more than what was sold!");
               $("#quantity").focus();
               return;
          }else if(reason.length == 0 || reason.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please input reason for return!");
               $("#reason").focus();
               return;
          }else{
               $.ajax({
                    type : "POST",
                    url : "../controller/return_sales.php",
                    data: {item:item, sales_id:sales_id, user_id:user_id, quantity:quantity, reason:reason, store:store},
                    success : function(response){
                         $("#sales_return").html(response);
                    }
               })
               setTimeout(function(){
                    $("#sales_return").load("sales_return.php #sales_return");
               }, 3000);
               return false
          }
     }else{
          return;
     }
}


// reprint receipt
function printReceipt(invoice){
     // alert(item_id);
     window.open("../controller/print_receipt.php?receipt="+invoice);
     /* $.ajax({
          type : "GET",
          url : "../controller/print_receipt.php?receipt="+invoice,
          success : function(response){
               $("#printReceipt").html(response);
          }
     })
     setTimeout(function(){
          $("#printReceipt").load("print_receipt.php #printReceipt");
     }, 100);
     return false; */
 
 }
// prinit sales receipt for direct sales
function printSalesReceipt(invoice){
     window.open("../controller/sales_receipt.php?receipt="+invoice);
     // alert(item_id);
     /* $.ajax({
          type : "GET",
          url : "../controller/sales_receipt.php?receipt="+invoice,
          success : function(response){
               $("#direct_sales").html(response);
          }
     }) */
     setTimeout(function(){
          $("#direct_sales").load("wholesale.php #direct_sales");
     }, 100);
     return false;
 
 }
// prinit sales receipt for sales order
function printSalesOrderReceipt(invoice){
     window.open("../controller/sales_order_receipt.php?receipt="+invoice);
     showPage('post_sales_order.php');
     // alert(item_id);
     /* $.ajax({
          type : "GET",
          url : "../controller/sales_order_receipt.php?receipt="+invoice,
          success : function(response){
               $("#sales_details").html(response);
          }
     }) */
     /* setTimeout(function(){
          $("#direct_sales").load("direct_sales.php #direct_sales");
     }, 100);
     return false; */
 
 }
// prinit sales order ticket
function printSalesTicket(invoice){
     window.open("../controller/sales_order_ticket.php?receipt="+invoice);
     // alert(item_id);
     /* $.ajax({
          type : "GET",
          url : "../controller/sales_order_ticket.php?receipt="+invoice,
          success : function(response){
               $("#sales_order").html(response);
          }
     }) */
     setTimeout(function(){
          $("#sales_order").load("sales_order.php #sales_order");
     }, 100);
     return false;
 
 }
 //perform any type of search with just two date
 function search(url){
     let from_date = document.getElementById('from_date').value;
     let to_date = document.getElementById('to_date').value;
     /* authentication */
     if(from_date.length == 0 || from_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date!");
          $("#from_date").focus();
          return;
     }else if(to_date.length == 0 || to_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#to_date").focus();
          return;
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/"+url,
               data: {from_date:from_date, to_date:to_date},
               success: function(response){
               $(".new_data").html(response);
               }
          });
     }
     return false;
}
 //search dashboard reports
 function searchDashboard(board){
     let store = board;
     /* authentication */
     if(store.length == 0 || store.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a store!");
          $("#store").focus();
          return;
    /*  }else if(from_date.length == 0 || from_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date!");
          $("#from_date").focus();
          return;
     }else if(to_date.length == 0 || to_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#to_date").focus();
          return; */
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/search_dashboard.php",
               data: {store:store},
               success: function(response){
               $("#general_dashboard").html(response);
               }
          });
     }
     return false;
}
//change store
function changeStore(store, user){
     window.open("../controller/change_store.php?store="+store+"&user="+user, "_self");
}
// Post daily expense 
function postExpense(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let exp_head = document.getElementById("exp_head").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(exp_head.length == 0 || exp_head.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select an expense ledger");
          $("#exp_head").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_expense.php",
               data : {posted:posted, exp_date:exp_date, exp_head:exp_head, contra:contra, amount:amount, details:details, store:store},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#exp_head").val('');
     $("#contra").val('');
     $("#amount").val('');
     $("#details").val('');
     $("#exp_date").focus();
     return false;    
}

// edit posted expense 
function updateExpense(){
     let exp_id = document.getElementById("exp_id").value;
     let exp_date = document.getElementById("exp_date").value;
     let exp_head = document.getElementById("exp_head").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(exp_head.length == 0 || exp_head.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select an expense head");
          $("#exp_head").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select contra ledger");
          $("#contra").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/edit_expense.php",
               data : {exp_id:exp_id, exp_date:exp_date, exp_head:exp_head, amount:amount, details:details, contra:contra},
               success : function(response){
               $("#reverse_dep").html(response);
               }
          })
     }
     setTimeout(function(){
          $("#reverse_dep").load("reverse_expense.php #reverse_dep");
     }, 1000);
     return false;    
}
//add reasons for removal
function addReason(){
     let reason = document.getElementById("reason").value;
     if(reason.length == 0 || reason.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input reason!");
          $("#reason").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_reason.php",
               data : {reason:reason},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#reason").val('');
     $("#reason").focus();
     return false;
}
//  get item history
function getItemHistory(item){
     let from_date = document.getElementById('from_date').value;
     let to_date = document.getElementById('to_date').value;
     let history_item = item;
     /* authentication */
     if(from_date.length == 0 || from_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date!");
          $("#from_date").focus();
          return;
     }else if(to_date.length == 0 || to_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a date range!");
          $("#to_date").focus();
          return;
     }else if(history_item.length == 0 || history_item.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select an item!");
          $("#history_item").focus();
          return;
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/get_history.php",
               data: {from_date:from_date, to_date:to_date, history_item:history_item},
               success: function(response){
               $(".new_data").html(response);
               }
          });
          $("#sales_item").html('');
          $("#history_item").val('');
     }
     return false;
}

// get sub menus to add to rights
function getSubmenu(menu_id){
     let menu = menu_id;
     // alert(menu_id);
     // return;
     if(menu_id){
          $.ajax({
               type : "POST",
               url :"../controller/get_submenu.php",
               data : {menu:menu},
               success : function(response){
                    $("#sub_menu").html(response);
               }
          })
          return false;
     }else{
          $("#sub_menu").html("<option value'' selected>Select a menu first</option>")
     }
     
}
// get user rights
function getRights(user_id){
     let user = user_id;;
     if(user){
          $.ajax({
               type : "POST",
               url :"../controller/get_rights.php",
               data : {user:user},
               success : function(response){
                    $(".rights").html(response);
               }
          })
          return false;
     }else{
          $(".rights").html("<h3>Select a user</h3>")
     }
     
}
//add user rights
function addRights(right){
     let sub_menu = right;
     let menu = document.getElementById("menu").value;
     let user = document.getElementById("user").value;
     if(user.length == 0 || user.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select user!");
          $("#user").focus();
          return;
     }else if(menu.length == 0 || menu.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a menu!");
          $("#menu").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_right.php",
               data : {user:user, menu:menu, sub_menu:sub_menu},
               success : function(response){
                    $(".info").html(response);
                    getRights(user);
               }              
          })
          return false;
     }

}
//delete right from user
function removeRight(right, user){
     let remove = confirm("Do you want to remove this right from the user?", "");
     if(remove){
          $.ajax({
               type : "GET",
               url : "../controller/delete_right.php?right="+right,
               success : function(response){
                    $(".info").html(response);
                    getRights(user);

               }
          })
     }else{
          return;
     }
}

/* download any table data to excel */
function convertToExcel(table, title){
     $(`#${table}`).table2excel({
          filename: title
     });
}

//show help
/* show frequenty asked questions */
function showFaq(answer){
     let all_answers = document.querySelectorAll(".faq_notes");
     all_answers.forEach(function(notes){
          notes.style.display = "none";
     })
     document.getElementById(answer).style.display = "block";
}

//display items in revenue by category for current date
function viewItems(department_id){
     let department = department_id;
     $.ajax({
          type : "Get",
          url : "../controller/view_revenue_cat_items.php?department="+department,
          success : function(response){
               $(".category_info").html(response);
          }
     })
     return false;
}
//display items in revenue by category for current date
function viewItemsDate(from, to, department_id){
     let department = department_id;
     $.ajax({
          type : "Get",
          url : "../controller/view_revenue_cat_items_date.php?department="+department+"&from="+from+"&to="+to,
          success : function(response){
               $(".category_info").html(response);
          }
     })
     return false;
}

//give discount
function giveDiscount(){
     discount = document.getElementById("discount").value;
     discount_invoice = document.getElementById("discount_invoice").value;
     discount_total = document.getElementById("discount_total").value;
     if(discount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("please enter a discount value!");
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/give_discount.php",
               data : {discount_invoice:discount_invoice, discount_total:discount_total, discount},
               success : function(response){
                    $(".sales_order").html(response);
               }
          })
          return false;
     }

}

//delete individual transfered items from transfer
function deleteTransfer(transfer, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_transfer.php?transfer_id="+transfer+"&item_id="+item,
               success : function(response){
                    $(".stocked_in").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//delete individual issued items from issue
function deleteIssued(issue_id, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_issued.php?issue_id="+issue_id+"&item_id="+item,
               success : function(response){
                    $(".stocked_in").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}

//post transfer
function postTransfer(invoice_number){
     invoice = invoice_number;
     confirmPost = confirm("Are you sure to post this transfer?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/post_transfer.php?invoice="+invoice,
               success : function(response){
                    $("#stockin").html(response);
               }
          })
          return false;
     }else{
          return;
     }
}
//post issued items
function postIssued(invoice_number){
     invoice = invoice_number;
     confirmPost = confirm("Are you sure to issue these items?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/post_issued.php?invoice="+invoice,
               success : function(response){
                    $("#stockin").html(response);
               }
          })
          setTimeout(function(){
               $("#issue_items").load("issue_items.php #issue_items");
          }, 1000);
          return false;
     }else{
          return;
     }
}
//Accept items transferred
function acceptItem(invoice_number){
     invoice = invoice_number;
     confirmPost = confirm("Are you sure to accept this item?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/accept_item.php?transfer_id="+invoice,
               success : function(response){
                    $("#accept_item").html(response);
               }
          })
          setTimeout(function(){
               $("#accept_item").load("accept_items.php #accept_item");
          }, 2000);
          return false
     }else{
          return;
     }
}
//Reject items transferred
function rejectItem(invoice_number){
     invoice = invoice_number;
     confirmPost = confirm("Are you sure to reject this item?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/reject_item.php?transfer_id="+invoice,
               success : function(response){
                    $("#accept_item").html(response);
               }
          })
          setTimeout(function(){
               $("#accept_item").load("accept_items.php #accept_item");
          }, 2000);
          return false
     }else{
          return;
     }
}
//Get stock balance by store
function getStockBalance(store_id){
     store = store_id;
     $.ajax({
          method : "POST",
          url : "../controller/get_stock_balance.php",
          data : {store:store},
          success : function(response){
               $(".store_balance").html(response);
          }
     })
     return false
     
}
//Get stock balance by category
function filterStockBalance(dep){
     dep_id = dep;
     $.ajax({
          method : "POST",
          url : "../controller/filter_cat_balance.php",
          data : {dep_id:dep_id},
          success : function(response){
               $("#all_balance").html(response);
          }
     })
     return false
     
}

// Add new customer
function addCustomer(){
     let customer = document.getElementById("customer").value;
     let phone_number = document.getElementById("phone_number").value;
     let address = document.getElementById("address").value;
     let email = document.getElementById("email").value;
     // let customer_type = document.getElementById("customer_type").value;
     if(customer.length == 0 || customer.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter customer name!");
          $("#customer").focus();
          return;
     }else if(phone_number.length == 0 || phone_number.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter customer phone number");
          $("#phone_number").focus();
          return;
     }else if(address.length == 0 || address.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input customer address");
          $("#address").focus();
          return;
     /* }else if(customer_type.length == 0 || customer_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please eselect customer type");
          $("#customer_type").focus();
          return; */
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_customer.php",
               data : {customer:customer, phone_number:phone_number, email:email, address:address /* customer_type:customer_type */},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#customer").val('');
     $("#email").val('');
     $("#address").val('');
     $("#phone_number").val('');
     $("#customer_type").val('');
     $("#customer").focus();
     return false;    
}

//post other payments
//post other Transfer payments for guest
function postOtherPayment(){
     let mode = document.getElementById("mode").value;
     let posted = document.getElementById("posted").value;
     let customer = document.getElementById("customer").value;
     let invoice = document.getElementById("invoice").value;
     let amount = document.getElementById("amount").value;
     
     $.ajax({
          type : "POST",
          url : "../controller/post_other_payments.php",
          data : {posted:posted, customer:customer, mode:mode, amount:amount, invoice:invoice},
          success : function(response){
               $("#debt_payment").html(response);
          }
     })
     
     return false;    

}

//add menu
function addMenu(){
     let menu = document.getElementById("menu").value;
     if(menu.length == 0 || menu.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input menu!");
          $("#menu").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_menu.php",
               data : {menu:menu},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#menu").val('');
     $("#menu").focus();
     return false;
}
//add sub-menu
function addSubMenu(){
     let menus = document.getElementById("menus").value;
     let sub_menu = document.getElementById("sub_menu").value;
     let sub_menu_url = document.getElementById("sub_menu_url").value;
     if(menus.length == 0 || menus.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select menu!");
          $("#menus").focus();
          return;
     }else if(sub_menu.length == 0 || sub_menu.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input sub-menu!");
          $("#sub_menu").focus();
          return;
     }else if(sub_menu_url.length == 0 || sub_menu_url.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input sub-menu url!");
          $("#sub_menu_url").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_sub_menu.php",
               data : {menus:menus, sub_menu:sub_menu, sub_menu_url:sub_menu_url},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     // $("#menus").val('');
     $("#sub_menu").val('');
     $("#sub_menu_url").val('');
     $("#sub_menu").focus();
     return false;
}
//update submenu details
function updateSubMenu(){
     let sub_menu_id = document.getElementById("sub_menu_id").value;
     let menu = document.getElementById("menu").value;
     let sub_menu = document.getElementById("sub_menu").value;
     let url = document.getElementById("url").value;
     let status = document.getElementById("status").value;
     if(menu.length == 0 || menu.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select menuy!");
          $("#menu").focus();
          return;
     }else if(sub_menu.length == 0 || sub_menu.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input sub-menu!");
          $("#sub_menu").focus();
          return;
     }else if(url.length == 0 || url.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input sub-menu url!");
          $("#url").focus();
          return;
     }else if(status.length == 0 || status.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input sub-menu status!");
          $("#status").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/update_submenu.php",
               data: {sub_menu_id:sub_menu_id, menu:menu, sub_menu:sub_menu, url:url, status:status},
               success : function(response){
                    $("#change_sub_menu").html(response);
               }
          })
          setTimeout(function(){
               $("#change_sub_menu").load("edit_sub_menu.php #change_sub_menu");
          }, 1000);
          return false
     }
 }
 //get customer on key press
function getCustomers(input){
     let invoice = document.getElementById("invoice").value;
     let customer = input;
     $("#search_results").show();
     if(invoice.length == 0 || invoice.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input invoice number!");
          $("#invoice").focus();
          return;
     }else{
          if(input.length >= 3){
               $.ajax({
                    type : "POST",
                    url : "../controller/get_customer_name.php",
                    data : {customer:customer, invoice:invoice},
                    success : function(response){
                         $("#search_results").html(response);
                    }
               })
          }
     }
}
//get customer on key press
function getCustomersName(input, link){
     $("#search_results").show();
     if(input.length >= 3){
          $.ajax({
               type : "POST",
               url : "../controller/"+link+"?input="+input,
               success : function(response){
                    $("#search_results").html(response);
               }
          })
     }
     
}
//get sales rep on key press
function getSalesRep(input){
     $("#search_results").show();
     let invoice = document.getElementById("invoice").value;
     let customer = input;
     if(invoice.length == 0 || invoice.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input invoice number!");
          $("#invoice").focus();
          return;
     }else{
          if(input.length >= 3){
               $.ajax({
                    type : "POST",
                    url : "../controller/get_sales_rep.php",
                    data : {customer:customer, invoice:invoice},
                    success : function(response){
                         $("#search_results").html(response);
                    }
               })
          }
     }
}
 //get customer on key press for editing
function getCustomerEdit(input){
     $("#search_results").show();
     if(input.length >= 3){
          $.ajax({
               type : "POST",
               url : "../controller/get_customer_edit.php?input="+input,
               success : function(response){
                    $("#search_results").html(response);
               }
          })
     }
     
}
// update customer details
function updateCustomer(){
     let customer_id = document.getElementById("customer_id").value;
     let customer = document.getElementById("customer").value;
     let phone_number = document.getElementById("phone_number").value;
     let address = document.getElementById("address").value;
     let email = document.getElementById("email").value;
     if(customer.length == 0 || customer.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter customer name!");
          $("#customer").focus();
          return;
     }else if(phone_number.length == 0 || phone_number.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter customer phone number");
          $("#phone_number").focus();
          return;
     }else if(address.length == 0 || address.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input customer address");
          $("#address").focus();
          return;
     }else if(email.length == 0 || email.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter customer email address");
          $("#email").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/update_customer.php",
               data : {customer_id:customer_id, customer:customer, phone_number:phone_number, email:email, address:address},
               success : function(response){
               $("#update_customer").html(response);
               }
          })
     }
     $("#customer").focus();
     return false;    
}

 //pay debt
 function payDebt(invoice, customer, balance, amount_owed){
     if(parseFloat(amount_owed) > parseFloat(balance)){
          alert("Insufficient balance! Kindly fund customer wallet to continue");
          return;
     }else{
          let confirm_pay = confirm("Are you sure to complete this transaction?", "");
          if(confirm_pay){
               $.ajax({
                    type : "GET",
                    url : "../controller/pay_debt.php?receipt="+invoice+"&customer="+customer+"&amount_owed="+amount_owed,
                    success : function(response){
                         $("#pay_debts").html(response);
                    }
               })
               setTimeout(() => {
                    $("#pay_debts").load("debt_payment.php?customer="+customer + "#pay_debts");
               }, 1500);
               return false;
          }else{
               return;
          }
     }
}

//reverse deposits
function reverseDeposit(deposit, customer){
     let confirm_reverse = confirm("Are you sure you want to reverse this transaction?", "");
     if(confirm_reverse){
          $.ajax({
               type : "GET",
               url : "../controller/reverse_deposit.php?deposit_id="+deposit+"&customer="+customer,
               success : function(response){
                    $("#reverse_dep").html(response);
               }
          })
         /*  setTimeout(() => {
               $("#reverse_dep").load("reverse_deposit.php #reverse_dep");
          }, 1500); */
          return false;
          
     }else{
          return;
     }
}
//reverse expenses
function reverseExpense(expense){
     let confirm_reverse = confirm("Are you sure you want to reverse this transaction?", "");
     if(confirm_reverse){
          $.ajax({
               type : "GET",
               url : "../controller/reverse_expense.php?expense_id="+expense,
               success : function(response){
                    $("#reverse_dep").html(response);
               }
          })
          setTimeout(() => {
               $("#reverse_dep").load("reverse_expense.php #reverse_dep");
          }, 1500);
          return false;
          
     }else{
          return;
     }
}
//reverse other transactions
function reverseTrx(trx){
     let confirm_reverse = confirm("Are you sure you want to reverse this transaction?", "");
     if(confirm_reverse){
          $.ajax({
               type : "GET",
               url : "../controller/reverse_transaction.php?trx_number="+trx,
               success : function(response){
                    $("#reverse_dep").html(response);
               }
          })
          setTimeout(() => {
               $("#reverse_dep").load("reverse_transactions.php #reverse_dep");
          }, 1500);
          return false;
          
     }else{
          return;
     }
}
//edit expense
function editExpense(expense){
     let expense_id = expense;
     $.ajax({
          type : "GET",
          url : "../controller/expense_form.php?expense_id="+expense_id,
          success : function(response){
               $(".info").html(response);
               window.scrollTo(0, 0);
          }
     })
     return false;
}
// Fund customer wallet via deposit 
function deposit(){
     let invoice = document.getElementById("invoice").value;
     let posted = document.getElementById("posted").value;
     let trans_date = document.getElementById("trans_date").value;
     let customer = document.getElementById("customer").value;
     let store = document.getElementById("store").value;
     let amount = document.getElementById("amount").value;
     let payment_mode = document.getElementById("payment_mode").value;
     let details = document.getElementById("details").value;
     let bank = document.getElementById("bank").value;
     let todayDate = new Date();
     if(payment_mode == "POS" || payment_mode == "Transfer"){
          if(bank.length == 0 || bank.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select bank!");
               $("#bank").focus();
               return;
          }    
     }
     if(payment_mode.length == 0 || payment_mode.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select payment_mode!");
          $("#payment_mode").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(trans_date.length == 0 || trans_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction date");
          $("#trans_date").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(new Date(trans_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#trans_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/deposit.php",
               data : {posted:posted, customer:customer, payment_mode:payment_mode, amount:amount, details:details, store:store, invoice:invoice, bank:bank, trans_date:trans_date},
               success : function(response){
               $("#fund_account").html(response);
               }
          })
     }
     return false;    
}
// Fund customer wallet via dcustomer statement 
function customerDeposit(){
     let invoice = document.getElementById("invoice").value;
     let posted = document.getElementById("posted").value;
     let trans_date = document.getElementById("trans_date").value;
     let customer = document.getElementById("customer").value;
     let store = document.getElementById("store").value;
     let amount = document.getElementById("amount").value;
     let payment_mode = document.getElementById("payment_mode").value;
     let details = document.getElementById("details").value;
     let bank = document.getElementById("bank").value;
     if(payment_mode == "POS" || payment_mode == "Transfer"){
          if(bank.length == 0 || bank.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select bank!");
               $("#bank").focus();
               return;
          }    
     }
     if(payment_mode.length == 0 || payment_mode.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select payment_mode!");
          $("#payment_mode").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(trans_date.length == 0 || trans_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction date");
          $("#trans_date").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/customer_deposit.php",
               data : {posted:posted, customer:customer, payment_mode:payment_mode, amount:amount, details:details, store:store, invoice:invoice, bank:bank, trans_date:trans_date},
               success : function(response){
               $("#fund_account").html(response);
               }
          })
          /* setTimeout(function(){
               $("#fund_account").load("fund_account.php?customer="+customer+ "#fund_account");
          }, 100); */
     }
     return false;    
}

// prinit deposit receipt for fund wallet
function printDepositReceipt(invoice){
     window.open("../controller/deposit_receipt.php?receipt="+invoice);
     // alert(item_id);
     /* $.ajax({
          type : "GET",
          url : "../controller/sales_receipt.php?receipt="+invoice,
          success : function(response){
               $("#direct_sales").html(response);
          }
     }) */
     /* setTimeout(function(){
          $("#direct_sales").load("direct_sales.php #direct_sales");
     }, 100); */
     return false;
 
 }
 //get item to check history
function getHistoryItems(item_name){
     let item = item_name;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_history_items.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

//get product to make from raw materials
function getProduct(product){
     let item = product;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(product){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_product.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//add produce for production
function addProduce(id, name){
     let product = document.getElementById("product");
     let item = document.getElementById("item");
     product.value = id;
     item.value = name;
     product.setAttribute('readonly', true);
     item.setAttribute('readonly', true);
     $("#sales_item").html('');
}

//get raw material for production
function getRawItem(raw_item){
     let item_raw = raw_item;
     let item = document.getElementById("item").value;
     let product = document.getElementById("product").value;
     let product_qty = document.getElementById("product_qty").value;
     let product_num = document.getElementById("product_num").value;
     let product_input = document.getElementById("product_qty");
     // return;
     if(product.length == 0 || product.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select product for production!");
          $("#item").focus();
          return;
     }else if(item.length == 0 || item.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter product quantity!");
          $("#item").focus();
          return;
     }else if(product_qty.length == 0 || product_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter product quantity!");
          $("#product_qty").focus();
          return;
     }else if(product_qty <= 0){
          alert("Product quantity can not be less than 1.");
          $("#product_qty");
          return
     }else{
          if(item_raw.length >= 3){
               if(item_raw){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_raw_material_form.php",
                         data : {item_raw:item_raw, product:product, product_qty:product_qty, product_num:product_num},
                         success : function(response){
                              $("#raw_item").html(response);
                         }
                    })
                    product_input.setAttribute('readonly', true);
                    return false;
               }else{
                    $("#raw_item").html("<p>Please enter atleast 3 letters</p>");
               }
               /* alert(item_raw);
               return; */
          }
     }
     
     
}
//display raw material form
function displayRawMaterial(item_id){
     let item = item_id;
     let prod = document.getElementById("product");
          $.ajax({
               type : "GET",
               url : "../controller/get_raw_material_details.php?item="+item,
               success : function(response){
                    $(".info").html(response);
               }
          })
          $("#raw_item").html("");
          $("#item_raw").val('');
          prod.setAttribute('readonly', true);
          return false;
     // }
     
 }

 //add raw material for production
function addRawMaterial(){
     let posted_by = document.getElementById("posted_by").value;
     let store = document.getElementById("store").value;
     let product_number = document.getElementById("product_number").value;
     let product = document.getElementById("product").value;
     let product_qty = document.getElementById("product_qty").value;
     let item_id = document.getElementById("item_id").value;
     let item_quantity = document.getElementById("item_quantity").value;
     if(item_quantity.length == 0 || item_quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity used!");
          $("#item_quantity").focus();
          return;
     }else if(item_quantity <= 0){
          alert("Please input quantity used!");
          $("#item_quantity").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_raw_material.php",
               data : {posted_by:posted_by, store:store, product:product, product_number:product_number, product_qty:product_qty, item_id:item_id, item_quantity:item_quantity},
               success : function(response){
               $(".stocked_in").html(response);
               }
          })
          /* $("#quantity").val('');
          $("#expiration_date").val('');
          $("#quantity").focus(); */
          $(".info").html('');
          return false; 
     }
}

//delete individual raw materials from production
function deleteMaterial(production, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_production_material.php?production_id="+production+"&item_id="+item,
               success : function(response){
                    $(".stocked_in").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}

//post final production
function postProduction(production_number){
     invoice = production_number;
     confirmPost = confirm("Are you sure to post this production?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/post_production.php?invoice="+invoice,
               success : function(response){
                    $("#produce").html(response);
               }
          })
          setTimeout(function(){
               $("#produce").load("make_product.php #produce");
          }, 2000)
          return false;
     }else{
          return;
     }
}
//ice cream section
//get raw material to make product
function getIceMaterial(material){
     let item = material;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(product){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_ice_material.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//add ice cream material for production
function addIceMaterial(id, name){
     let material = document.getElementById("material");
     let item = document.getElementById("item");
     material.value = id;
     item.value = name;
     material.setAttribute('readonly', true);
     item.setAttribute('readonly', true);
     $("#sales_item").html('');
}
//get ice product for production
function getIceProduct(raw_item){
     let product = raw_item;
     let item = document.getElementById("item").value;
     let material = document.getElementById("material").value;
     let material_qty = document.getElementById("material_qty").value;
     let product_num = document.getElementById("product_num").value;
     let product_input = document.getElementById("material_qty");
     // return;
     if(material.length == 0 || material.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select raw material for production!");
          $("#item").focus();
          return;
     }else if(item.length == 0 || item.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter raw material quantity!");
          $("#item").focus();
          return;
     }else if(material_qty.length == 0 || material_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter raw material quantity!");
          $("#product_qty").focus();
          return;
     }else if(material_qty <= 0){
          alert("Raw material quantity can not be less than 1.");
          $("#product_qty");
          return
     }else{
          if(product.length >= 3){
               if(product){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_ice_product_form.php",
                         data : {product:product, material:material, material_qty:material_qty, product_num:product_num},
                         success : function(response){
                              $("#raw_item").html(response);
                         }
                    })
                    product_input.setAttribute('readonly', true);
                    return false;
               }else{
                    $("#raw_item").html("<p>Please enter atleast 3 letters</p>");
               }
               /* alert(item_raw);
               return; */
          }
     }
     
     
}
//display ice product form
function displayIceProduct(item_id){
     let item = item_id;
     let prod = document.getElementById("material");
          $.ajax({
               type : "GET",
               url : "../controller/get_ice_product_details.php?item="+item,
               success : function(response){
                    $(".info").html(response);
               }
          })
          $("#raw_item").html("");
          $("#item_raw").val('');
          prod.setAttribute('readonly', true);
          return false;
     // }
     
 }
 //add ice product for production
function addIceProduct(){
     let posted_by = document.getElementById("posted_by").value;
     let store = document.getElementById("store").value;
     let product_number = document.getElementById("product_number").value;
     let material = document.getElementById("material").value;
     let material_qty = document.getElementById("material_qty").value;
     let item_id = document.getElementById("item_id").value;
     let item_quantity = document.getElementById("item_quantity").value;
     if(item_quantity.length == 0 || item_quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity produced!");
          $("#item_quantity").focus();
          return;
     }else if(item_quantity <= 0){
          alert("Please input quantity produced!");
          $("#item_quantity").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_ice_product.php",
               data : {posted_by:posted_by, store:store, material:material, product_number:product_number, material_qty:material_qty, item_id:item_id, item_quantity:item_quantity},
               success : function(response){
               $(".stocked_in").html(response);
               }
          })
          /* $("#quantity").val('');
          $("#expiration_date").val('');
          $("#quantity").focus(); */
          $(".info").html('');
          return false; 
     }
}
//delete individual products from production
function deleteIceProduct(production, item){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_production_product.php?production_id="+production+"&item_id="+item,
               success : function(response){
                    $(".stocked_in").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}
//post final ice cream production
function postIceProduction(production_number){
     invoice = production_number;
     confirmPost = confirm("Are you sure to post this production?", "");
     if(confirmPost){
          $.ajax({
               method : "GET",
               url : "../controller/post_ice_production.php?invoice="+invoice,
               success : function(response){
                    $("#produce").html(response);
               }
          })
          setTimeout(function(){
               $("#produce").load("make_ice_cream.php #produce");
          }, 2000)
          return false;
     }else{
          return;
     }
}
//get item to transfer quantity from
function getItemToTransfer(product){
     let item = product;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(product){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_item_to_transfer.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

//add item to transfer quantity from
function addItemToTransfer(id, name){
     let transfer_qty_from = document.getElementById("transfer_qty_from");
     let item = document.getElementById("item");
     transfer_qty_from.value = id;
     item.value = name;
     /* transfer_qty_from.setAttribute('readonly', true);
     item.setAttribute('readonly', true); */
     $("#sales_item").html('');
}
//get item to transfer quantity to
function getItemToTransferTo(product){
     let item_to = product;
     // alert(check_room);
     // return;
     if(item_to.length >= 3){
          if(product){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_item_to_transfer_to.php",
                    data : {item_to:item_to},
                    success : function(response){
                         $("#transfer_item").html(response);
                    }
               })
               return false;
          }else{
               $("#transfer_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

//add item to transfer quantity into
function addItemToTransferTo(id, name){
     let transfer_qty_to = document.getElementById("transfer_qty_to");
     let item = document.getElementById("item");
     let item_to = document.getElementById("item_to");
     transfer_qty_to.value = id;
     item_to.value = name;
     // transfer_qty_from.setAttribute('readonly', true);
     item.setAttribute('readonly', true);
     $("#transfer_item").html('');
}

// transfer quantity from one item to another
function transferQty(){
     let transfer_qty_from = document.getElementById("transfer_qty_from").value;
     let transfer_qty_to = document.getElementById("transfer_qty_to").value;
     let remove_qty = document.getElementById("remove_qty").value;
     let add_qty = document.getElementById("add_qty").value;
     if(transfer_qty_to.length == 0 || transfer_qty_to.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Item to transfer quantity into!");
          $("#transfer_qty_to").focus();
          return;    
     }else if(remove_qty.length == 0 || remove_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity to remove!");
          $("#remove_qty").focus();
          return;
     
     }else if(add_qty.length == 0 || add_qty.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity to add!");
          $("#add_qty").focus();
          return;
     }else if(add_qty <= 0 || remove_qty <= 0){
          alert("Quantity cannot be less than or equal to 0!");
          $("#remove_qty").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/transfer_quantity.php",
               data : {transfer_qty_from:transfer_qty_from, transfer_qty_to:transfer_qty_to, remove_qty:remove_qty, add_qty:add_qty},
               success : function(response){
                    $("#transfer_quantities").html(response);
               }
          })
          setTimeout(function(){
               $("#transfer_quantities").load("transfer_qty.php #transfer_quantities");
          }, 1500)
          return false;
     }
}

//post CUSTOMER debt payments
function postDebt(){
     let customer = document.getElementById("customer").value;
     let amount = document.getElementById("amount").value;
     
     if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter amount!");
          $("#amount").focus();
          return;
     
     }else if(amount <= 0){
          alert("Amount can not be less than or  equal to 0");
          return;
     
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_debt.php",
               data: {customer:customer, amount:amount},
               success : function(response){
                    $("#post_debt").html(response);
               }
          })
          setTimeout(function(){
               $("#post_debt").load("post_debt.php #post_debt");
          }, 1500);
          return false
     }
 }
//post vendor balance
function postBalance(){
     let vendor = document.getElementById("vendor").value;
     let amount = document.getElementById("amount").value;
     
     if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter amount!");
          $("#amount").focus();
          return;
     
     }else if(amount <= 0){
          alert("Amount can not be less than or  equal to 0");
          return;
     
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_balance.php",
               data: {vendor:vendor, amount:amount},
               success : function(response){
                    $("#post_debt").html(response);
               }
          })
          setTimeout(function(){
               $("#post_debt").load("post_vendor_balance.php #post_debt");
          }, 1500);
          return false
     }
 }
 //post vendor payment
function postPayment(){
     let vendor = document.getElementById("vendor").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let trans_date = document.getElementById("trans_date").value;
     let todayDate = new Date();
     if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter amount!");
          $("#amount").focus();
          return;
     }else if(trans_date.length == 0 || trans_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#trans_date").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger!");
          $("#contra").focus();
          return;
     
     }else if(amount <= 0){
          alert("Amount can not be less than or  equal to 0");
          $("#amount").focus();

          return;
     }else if(new Date(trans_date) > todayDate){
          alert("You can not post a futuristic transaction");
          $("#trans_date").focus();
          return;
     
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_vendor_payments.php",
               data: {vendor:vendor, amount:amount, trans_date:trans_date, contra:contra},
               success : function(response){
                    $("#post_debt").html(response);
               }
          })
          setTimeout(function(){
               $("#post_debt").load("post_vendor_payments.php #post_debt");
          }, 1500);
          return false
     }
 }

 //post purchases
function postPurchases(){
     let confirmPost = confirm("Are you sure you want to post this purchase?", "");
     if(confirmPost){
          let total_amount = document.getElementById("total_amount").value;
          let waybill = document.getElementById("waybill").value;
          let purchase_invoice = document.getElementById("purchase_invoice").value;
          let store = document.getElementById("store").value;
          let vendor = document.getElementById("vendor").value;
          let payment_type = document.getElementById("payment_type").value;
          let deposited_amount = document.getElementById("deposited_amount");
          let cr_ledger = document.getElementById("cr_ledger");
          let deposit_amount = document.getElementById("deposit_amount").value;
          let contra = document.getElementById("contra").value;
          
          if(deposited_amount.style.display == "block"){
               if(deposit_amount <= 0){
                    alert("Deposit Amount is cannot be less than 0 or equal to 0");
                    $("#deposit_amount").focus();
                    return;
               }
               if(deposit_amount.length == 0 || deposit_amount.replace(/^\s+|\s+$/g, "").length == 0){
                    alert("Please enter deposit amount!");
                    $("#deposit_amount").focus();
                    return;
               }
          }
          
          if(cr_ledger.style.display == "block"){
               
               if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
                    alert("Please select ledger!");
                    $("#contra").focus();
                    return;
               }
          }
          
          if(payment_type.length == 0 || payment_type.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select a payment option!");
               $("#payment_type").focus();
               return;
          }else if(waybill.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter loading/waybill price or enter 0!");
               $("#waybill").focus();
               return;
          }else{
               $.ajax({
                    type : "POST",
                    url : "../controller/post_purchase.php",
                    data : {purchase_invoice:purchase_invoice, payment_type:payment_type, waybill:waybill, store:store, deposit_amount, vendor:vendor, total_amount:total_amount, contra:contra},
                    success : function(response){
                         $("#post_purchase").html(response);
                    }
               })
               setTimeout(function(){
                    $("#post_purchase").load("post_purchase.php #post_purchase");
               }, 1000);
               return false;
          }
     // }
     }else{
          return;
     }
}

//get correct customer to merge files
function getCorCustomer(customer){
     let item = customer;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_cor_customer.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

//add correct customer  for merging files
function addCorCustomer(id, name){
     let correct_customer = document.getElementById("correct_customer");
     let item = document.getElementById("item");
     correct_customer.value = id;
     item.value = name;
     // correct_customer.setAttribute('readonly', true);
     // item.setAttribute('readonly', true);
     $("#sales_item").html('');
}
//get wrong customer to merge files
function getWrongCustomer(customer){
     let item_raw = customer;
     // alert(check_room);
     // return;
     if(item_raw.length >= 3){
          if(item_raw){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_wrong_customer.php",
                    data : {item_raw:item_raw},
                    success : function(response){
                         $("#raw_item").html(response);
                    }
               })
               return false;
          }else{
               $("#raw_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

//add wrong customer  for merging files
function addWrongCustomer(id, name){
     let wrong_customer = document.getElementById("wrong_customer");
     let item_raw = document.getElementById("item_raw");
     wrong_customer.value = id;
     item_raw.value = name;
     // correct_customer.setAttribute('readonly', true);
     // item.setAttribute('readonly', true);
     $("#raw_item").html('');
}

//merge files
function mergeFiles(){
     let correct_customer = document.getElementById("correct_customer").value;
     let wrong_customer = document.getElementById("wrong_customer").value;
     if(correct_customer == wrong_customer){
          alert("You can not merge same customer");
          $("#item").focus();
          return;
     }else if(correct_customer.length == 0 || correct_customer.replace(/^\s+|\s+$/g, "").length == 0){
          alert("please select the correct customer");
          $("#correct_customer").focus();
          return;
     }else if(wrong_customer.length == 0 || wrong_customer.replace(/^\s+|\s+$/g, "").length == 0){
          alert("please select the wrong  customer name");
          $("#wrong_customer").focus();
          return;
     }else{
          let confirmMerge = confirm("Are you sure you want to merge these files?", "");
          if(confirmMerge){
               $.ajax({
                    type : "POST",
                    url : "../controller/merge_files.php",
                    data : {correct_customer:correct_customer, wrong_customer:wrong_customer},
                    success : function(response){
                        $("#merge_files").html(response); 
                    }
               })
               setTimeout(function(){
                    $("#merge_files").load("merge_files.php #merge_files");
               }, 1000);
               return false;
          }else{
               return;
          }
     }
}

//Update invoice
function updateInvoice(){
     let sales_invoice = document.getElementById("sales_invoice").value;
     // let store = document.getElementById("store").value;
     let customer_id = document.getElementById("customer_id").value;
     // let payment_type = document.getElementById("payment_type").value;
     // let post_date = document.getElementById("post_date").value;
     // let todayDate = new Date();
     // let today = todayDate;
     let confirmPost = confirm("Are you sure you want to update this invoice?", "");
     if(confirmPost){
          $.ajax({
               type : "GET",
               url : "../controller/update_customer_invoice.php?invoice="+sales_invoice+"&customer="+customer_id,
               success : function(response){
                    $("#direct_sales").html(response);
               }
          })
          $(".sales_order").html('');
          setTimeout(function(){
               $("#direct_sales").load("update_invoices.php #direct_sales");
          }, 200);
          return false;
     }
     
     
}

// Add new invoice
function addInvoice(){
     let customer = document.getElementById("customer").value;
     let posted_by = document.getElementById("posted_by").value;
     let details = document.getElementById("details").value;
     let invoice = document.getElementById("invoice").value;
     let manual_invoice = document.getElementById("manual_invoice").value;
     let service_order = document.getElementById("service_order").value;
     let price = document.getElementById("price").value;
     let quantity = document.getElementById("quantity").value;
     if(manual_invoice.length == 0 || manual_invoice.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input Invvoice number!");
          $("#manual_invoice").focus();
          return;
     }else if(service_order.length == 0 || service_order.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input service order number!");
          $("#service_order").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description!");
          $("#details").focus();
          return;
     }else if(price.length == 0 || price.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input agreed amount!");
          $("#price").focus();
          return;
     
     }else if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input item quantity!");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0 || price <= 0){
          alert("Quantity or price cannot be less than or equal to zero!");
          $("#price").focus();
          return;
     
     }else{
          document.getElementById("manual_invoice").setAttribute("readonly", true);
          document.getElementById("service_order").setAttribute("readonly", true);
          $.ajax({
               type : "POST",
               url : "../controller/add_invoice.php",
               data : {customer:customer, posted_by:posted_by, invoice:invoice, details:details, price:price, quantity:quantity, manual_invoice:manual_invoice, service_order:service_order},
               success : function(response){
               $(".sales_order").html(response);
               }
          })
     }
     $("#price").val('');
     $("#details").val('');
     $("#quantity").val('');
     return false;    
}
//get form to update details for a single invoice
function updateDetails(id){
     $.ajax({
          type : "GET",
          url : "../controller/edit_invoice.php?item="+id,
          success : function(response){
               $(".show_more").html(response);
               // window.scrollTo(0, 0);
               document.getElementById("showMore").scrollIntoView();
          }
          
     })
     return false;
}
//update details in invoice
function editDetails(){
     let invoice_id = document.getElementById("invoice_id").value;
     let invoice = document.getElementById("invoice").value;
     let amount_update = document.getElementById("amount_update").value;
     let qty_update = document.getElementById("qty_update").value;
     let details_update = document.getElementById("details_update").value;
     /* authentication */
     if(amount_update.length == 0 || amount_update.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter agreed amount!");
          $("#amount_update").focus();
          return;
     }else if(details_update.length == 0 || details_update.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter details!");
          $("#details_update").focus();
          return;
     }else if(qty_update.length == 0 || qty_update.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter quantity!");
          $("#qty_update").focus();
          return;
     }else if(qty_update <= 0 || amount_update <= 0){
          alert("Price or quantity cannot be less than or eqal to zero!");
          $("#qty_update").focus();
          return;
     
     }else{
          $.ajax({
               type: "POST",
               url: "../controller/update_invoice.php",
               data: {invoice_id:invoice_id, amount_update:amount_update, details_update:details_update, invoice:invoice, qty_update:qty_update},
               success: function(response){
               $(".sales_order").html(response);
               }
          });

     }
     $(".show_more").html('');
     return false;
}

//delete details from invoices
function deleteDetails(id, invoice){
     let confirmDel = confirm("Are you sure you want to remove this item?", "");
     if(confirmDel){
          
          $.ajax({
               type : "GET",
               url : "../controller/delete_details.php?invoice="+invoice+"&item_id="+id,
               success : function(response){
                    $(".sales_order").html(response);
               }
               
          })
          return false;
     }else{
          return;
     }
}

//post prescription
function postInvoice(){
     let confirmPost = confirm("Are you sure you want to post this Invoice?", "");
     if(confirmPost){
          let invoice = document.getElementById("invoice").value;
          let trx_date = document.getElementById("trx_date").value;
          let po_number = document.getElementById("po_number").value;
          let due_days = document.getElementById("due_days").value;
          todayDate = new Date();
          if(trx_date.length == 0 || trx_date.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter transaction date!");
               $("#trx_date").focus();
               return;
          }else if(new Date(trx_date) > todayDate){
               alert("You cannot post a futuristic transaction!");
               $("#trx_date").focus();
               return;
          }else if(po_number.length == 0 || po_number.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter po. number!");
               $("#po_number").focus();
               return;
          }else if(due_days.length == 0 || due_days.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please enter invoice due days!");
               $("#due_days").focus();
               return;
          }else if(due_days <= 0){
               alert("Please enter invoice due days!");
               $("#due_days").focus();
               return;
          }else{
               $.ajax({
                    type : "POST",
                    url : "../controller/post_invoice.php",
                    data : {invoice:invoice, trx_date:trx_date, po_number:po_number, due_days:due_days},
                    success : function(response){
                         $("#sales_order").html(response);
                    }
               })
               $(".sales_order").html('');
               
          }
     }else{
          return;
     }
}

//print prescription
function printInvoice(invoice){
     window.open("../controller/invoice_receipt.php?receipt="+invoice);
     
     return false;
 
 }

 // get account sub group from account group for creatig class
function getSubGroup(post_group){
     let group = post_group;
     if(group){
          $.ajax({
               type : "POST",
               url :"../controller/get_sub_group.php",
               data : {group:group},
               success : function(response){
                    $("#sub_group").html(response);
               }
          })
          return false;
     }else{
          $("#sub_group").html("<option value'' selected>Select group first</option>")
     }
     
}
 // get account class from account sub group for creatig class
function getClass(post_sub){
     let sub_group = post_sub;
     // alert(sub_group)
     if(sub_group){
          $.ajax({
               type : "POST",
               url :"../controller/get_class.php",
               data : {sub_group:sub_group},
               success : function(response){
                    $("#account_class").html(response);
               }
          })
          return false;
     }else{
          $("#account_class").html("<option value'' selected>Select sub group first</option>")
     }
     
}

//add asset location
function addLocation(){
     let location = document.getElementById("location").value;
     if(location.length == 0 || location.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input asset location!");
          $("#location").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_asset_location.php",
               data : {location:location},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#location").val('');
     $("#location").focus();
     return false;
}
//add asset
function addAsset(){
     let asset = document.getElementById("asset").value;
     let supplier = document.getElementById("supplier").value;
     let purchase_date = document.getElementById("purchase_date").value;
     let cost = document.getElementById("cost").value;
     let quantity = document.getElementById("quantity").value;
     let salvage_value = document.getElementById("salvage_value").value;
     let useful_life = document.getElementById("useful_life").value;
     let deployment = document.getElementById("deployment").value;
     let location = document.getElementById("location").value;
     let ledger = document.getElementById("ledger").value;
     todayDate = new Date();
     let specification = document.getElementById("specification").value;
     if(asset.length == 0 || asset.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input asset name!");
          $("#asset").focus();
          return;
     }else if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity purchased!");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0){
          alert("Please input quantity purchased!");
          $("#quantity").focus();
          return;
     }else if(supplier.length == 0 || supplier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input supplier name!");
          $("#supplier").focus();
          return;
     }else if(purchase_date.length == 0 || purchase_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter purchase date!");
          $("#purchase_date").focus();
          return;
     }else if(new Date(purchase_date) > todayDate){
          alert("Purchase date can not be futuristic!");
          $("#purchase_date").focus();
          return;
     }else if(new Date(purchase_date) > new Date(deployment)){
          alert("DPurchase date cannot be greater than deployment date!");
          $("#deployment").focus();
          return;
     }else if(cost.length == 0 || cost.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input asset cost!");
          $("#cost").focus();
          return;
     }else if(salvage_value.length == 0 || salvage_value.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input salvage value!");
          $("#salvage_value").focus();
          return;
     }else if(useful_life.length == 0 || useful_life.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input useful life!");
          $("#useful_life").focus();
          return;
     }else if(deployment.length == 0 || deployment.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input deployment date!");
          $("#deployment").focus();
          return;
     }else if(location.length == 0 || location.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select asset location!");
          $("#location").focus();
          return;
     }else if(ledger.length == 0 || ledger.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select asset class!");
          $("#ledger").focus();
          return;
     }else if(specification.length == 0 || specification.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input asset specifications!");
          $("#specification").focus();
          return;
     }else if(cost <= 0 || salvage_value <= 0 || useful_life <= 0){
          alert("Values cannot be less than or equal to 0!");
          $("#salvage_value").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/add_asset.php",
               data : {asset:asset, supplier:supplier, purchase_date:purchase_date, cost:cost, salvage_value:salvage_value, useful_life:useful_life, deployment:deployment, location:location, ledger:ledger, specification:specification, quantity:quantity},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#asset").val('');
     $("#supplier").val('');
     $("#purchase_date").val('');
     $("#deployment").val('');
     $("#cost").val('');
     $("#salvage_value").val('');
     $("#useful_life").val('');
     $("#location").val('');
     $("#ledger").val('');
     $("#specification").val('');
     $("#asset").focus();
     return false;
}

//aalocate/reassign asset
function allocateAsset(){
     let asset_id = document.getElementById("asset_id").value;
     let location = document.getElementById("location").value;
     if(location.length == 0 || location.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select asset location");
          $("#location").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/allocate_asset.php",
               data : {asset_id:asset_id, location:location},
               success :function(response){
                    $("#allocate_asset").html(response);
               }
          })
          setTimeout(function(){
               $("#allocate_asset").load("allocate_asset.php #allocate_asset");
          }, 1500)
          return false;
     }
}
//dispose asset
function disposeAsset(){
     let asset_id = document.getElementById("asset_id").value;
     let reason = document.getElementById("reason").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let quantity = document.getElementById("quantity").value;
     if(reason == "sold"){
          if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please select contra ledger");
               $("#contra").focus();
               return;
          }
          if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
               alert("Please input amount sold");
               $("#amount").focus();
               return;
          }
     }
     if(reason.length == 0 || reason.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input reason for disposition");
          $("#reason").focus();
          return;
     }else if(quantity.length == 0 || quantity.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input quantity to be disposed");
          $("#quantity").focus();
          return;
     }else if(quantity <= 0){
          alert("Please input quantity to be disposed");
          $("#quantity").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/dispose_asset.php",
               data : {asset_id:asset_id, reason:reason, quantity:quantity, contra:contra, amount:amount},
               success :function(response){
                    $("#allocate_asset").html(response);
               }
          })
          setTimeout(function(){
               $("#allocate_asset").load("dispose_asset.php #allocate_asset");
          }, 1500)
          return false;
     }
}
//setup depreciation
function addDepreciation(){
     let asset = document.getElementById("asset").value;
     let start_date = document.getElementById("start_date").value;
     if(start_date.length == 0 || start_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select start date");
          $("#start_date").focus();
          return;
     }else if(asset.length == 0 || asset.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please asset");
          $("#asset").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/setup_depreciation.php",
               data : {asset:asset, start_date:start_date},
               success :function(response){
                    $("#depreciation").html(response);
               }
          })
          setTimeout(function(){
               $("#depreciation").load("setup_depreciation.php #depreciation");
          }, 1500)
          return false;
     }
}

//make invoice readonly when vendor is selected during purchase
function muteInvoice(){
     let invoice = document.getElementById("invoice_number");
     invoice.setAttribute("readonly", true);
}

// Post assets 
function postAsset(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let asset = document.getElementById("asset").value;
     let exp_date = document.getElementById("exp_date").value;
     let exp_head = document.getElementById("exp_head").value;
     let contra = document.getElementById("contra").value;
     // let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(exp_head.length == 0 || exp_head.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select an asset ledger");
          $("#exp_head").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     }else if(asset.length == 0 || asset.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Asset");
          $("#contra").focus();
          return;
     /* }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return; */
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_asset.php",
               data : {posted:posted, exp_date:exp_date, exp_head:exp_head, contra:contra, /* amount:amount, */ details:details, store:store, asset:asset},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#exp_head").val('');
     $("#contra").val('');
     // $("#amount").val('');
     // $("#details").val('');
     $("#exp_date").focus();
     return false;    
}
// Post depreication
function postDepreciation(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let asset = document.getElementById("asset").value;
     let dr_ledger = document.getElementById("dr_ledger").value;
     let contra = document.getElementById("contra").value;
     // let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(dr_ledger.length == 0 || dr_ledger.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select debit ledger");
          $("#dr_ledger").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     /* }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return; */
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(asset.length == 0 || asset.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select asset");
          $("#asset").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_depreciation.php",
               data : {posted:posted, exp_date:exp_date, dr_ledger:dr_ledger, contra:contra, /* amount:amount, */ details:details, store:store, asset:asset},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#dr_ledger").val('');
     $("#contra").val('');
     $("#asset").val('');
     // $("#details").val('');
     $("#exp_date").focus();
     return false;    
}

//get depreciation by year
function getDepreciationYear(year){
     let dep_year = year;
     if(dep_year){
         $.ajax({
             type : "POST",
             url : "../controller/get_yearly_depreciation.php",
             data: {dep_year:dep_year},
             success : function(response){
                 $(".new_data").html(response);
             }
         })
         return false;
     }
 }

 //get monthly financial position
 function getMonthlyFinPos(){
     let fin_month = document.getElementById("fin_month").value;
     let fin_year = document.getElementById("fin_year").value;
     if(fin_month.length == 0 || fin_month.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial month");
          $("#fin_month").focus();
          return;
     }else if(fin_year.length == 0 || fin_year.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial year");
          $("#fin_year").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/monthly_fin_position.php",
               data : {fin_month:fin_month, fin_year:fin_year},
               success : function(response){
                    $(".new_data").html(response)
               }
          })
     }
 }
 //get yearly financial position
 function getYearlyFinPos(){
     let fin_year = document.getElementById("fin_year").value;
     if(fin_year.length == 0 || fin_year.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial year");
          $("#fin_year").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/yearly_fin_position.php",
               data : {fin_year:fin_year},
               success : function(response){
                    $(".new_data").html(response)
               }
          })
     }
 }
 //get yearly income statement
 function getYearlyIncome(){
     let fin_year = document.getElementById("fin_year").value;
     if(fin_year.length == 0 || fin_year.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial year");
          $("#fin_year").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/yearly_income_statement.php",
               data : {fin_year:fin_year},
               success : function(response){
                    $(".new_data").html(response)
               }
          })
     }
 }

 //get account to display account statement
function getAccount(customer_id){
     let customer = customer_id;
     // alert(check_room);
     // return;
     let fromDate = document.getElementById("fromDate").value;
     let toDate = document.getElementById("toDate").value;
     if(fromDate.length == 0 || fromDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select a startb date!");
          $("#fromDate").focus();
          return;
     }else if(toDate.length == 0 || toDate.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select an end date!");
          $("#toDate").focus();
          return;
     }else{
     if(customer.length >= 3){
          if(customer){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_account.php",
                    data : {customer:customer, fromDate:fromDate, toDate:toDate},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               /* $("#fromDate").attr("readonly", true);
               $("#toDate").attr("readonly", true); */
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
}
     
}//display account statement/transaction history
function getAccountStatement(customer_id){
     let customer = customer_id;
          
          $.ajax({
               type : "GET",
               url : "../controller/account_statement.php?customer="+customer,
               success : function(response){
                    $("#customer_statement").html(response);
               }
          })
          $("#sales_item").html("");
          $("#customer").val("")
          return false;
     // }
     
 }

 //get cash flow
 function getCashFlow(){
     let fin_month = document.getElementById("fin_month").value;
     let fin_year = document.getElementById("fin_year").value;
     if(fin_month.length == 0 || fin_month.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial month");
          $("#fin_month").focus();
          return;
     }else if(fin_year.length == 0 || fin_year.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select financial year");
          $("#fin_year").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/monthly_fin_position.php",
               data : {fin_month:fin_month, fin_year:fin_year},
               success : function(response){
                    $(".new_data").html(response)
               }
          })
     }
 }

 // Post loans
function postLoan(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let trans_type = document.getElementById("trans_type").value;
     let financier = document.getElementById("financier").value;
     let contra = document.getElementById("contra").value;
     let loan = document.getElementById("loan").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(financier.length == 0 || financier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select lender");
          $("#financier").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     }else if(loan.length == 0 || loan.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select loan account");
          $("#loan").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_loan.php",
               data : {posted:posted, exp_date:exp_date, financier:financier, contra:contra, amount:amount, details:details, store:store, trans_type:trans_type, loan:loan},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#financier").val('');
     $("#contra").val('');
     $("#amount").val('');
     $("#loan").val('');
     $("#trans_type").val('');
     $("#details").val('');
     $("#exp_date").focus();
     return false;    
}
 // Post directors transaction
function postDirectorTrx(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let trans_type = document.getElementById("trans_type").value;
     let financier = document.getElementById("financier").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(financier.length == 0 || financier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger");
          $("#financier").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_director_trx.php",
               data : {posted:posted, exp_date:exp_date, financier:financier, contra:contra, amount:amount, details:details, store:store, trans_type:trans_type},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#financier").val('');
     $("#contra").val('');
     $("#amount").val('');
     $("#trans_type").val('');
     $("#details").val('');
     $("#exp_date").focus();
     return false;    
}
 // Post inventories/cost of sales transaction
function postInventories(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     /* let trans_type = document.getElementById("trans_type").value;
     let financier = document.getElementById("financier").value;
     let contra = document.getElementById("contra").value; */
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     /* }else if(financier.length == 0 || financier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger");
          $("#financier").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return; */
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     /* }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return; */
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_inventories.php",
               data : {posted:posted, exp_date:exp_date, /* financier:financier, contra:contra,  */amount:amount, details:details, store:store, /* trans_type:trans_type */},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     /* $("#financier").val('');
     $("#contra").val(''); */
     $("#amount").val('');
     // $("#trans_type").val('');
     $("#details").val('');
     $("#exp_date").focus();
     return false;    
}
 // Post finance cost
function postFinanceCost(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let trans_type = document.getElementById("trans_type").value;
     let financier = document.getElementById("financier").value;
     let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(financier.length == 0 || financier.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger");
          $("#financier").focus();
          return;
     }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger")
          $("#contra").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else if(financier == contra){
          alert("Debit and Credit ledger cannot be thesame!");
          $("#financier").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_finance_cost.php",
               data : {posted:posted, exp_date:exp_date, financier:financier, contra:contra, amount:amount, details:details, store:store, trans_type:trans_type},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#financier").val('');
     $("#contra").val('');
     $("#amount").val('');
     $("#trans_type").val('');
     $("#details").val('');
     $("#exp_date").focus();
     return false;    
}

// Post stockin
function postStockin(){
     let sales_invoice = document.getElementById("sales_invoice").value;
     let supplier = document.getElementById("supplier").value;
     let waybill = document.getElementById("waybill").value;
     if(waybill.length == 0 || waybill.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input waybill");
          $("#waybill").focus();
          return;
     }else if(waybill < 0){
          alert("Please input waybill");
          $("#waybill").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_stockin.php",
               data : {sales_invoice:sales_invoice,supplier:supplier, waybill:waybill},
               success : function(response){
               $("#stockin").html(response);
               }
          })
          setTimeout(function(){
               $('#stockin').load("stockin_purchase.php #stockin");
          }, 1500);
          return false;    
     }
}
//get monthly account statement
function monthlyAccountStatement(account, month, year){
     $.ajax({
          type : "GET",
          url : "../controller/monthly_account_statement.php?customer="+account+"&month="+month+"&year="+year,
          success : function(response){
               $(".new_data").html(response);
               window.scrollTo(0, 0);
          }
          
     })
     return false;
}
//get yearly account statement
function yearlyAccountStatement(account, year){
     $.ajax({
          type : "GET",
          url : "../controller/yearly_account_statement.php?customer="+account+"&year="+year,
          success : function(response){
               $(".new_data").html(response);
               window.scrollTo(0, 0);
          }
          
     })
     return false;
}

//get ledger
function getAccountLedger(item_name){
     let ledger = item_name;
     // alert(check_room);
     // return;
     if(ledger.length >= 3){
          if(ledger){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_account_ledger.php",
                    data : {ledger:ledger},
                    success : function(response){
                         $("#search_results").html(response);
                    }
               })
               return false;
          }else{
               $("#search_results").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//get contra ledger
function getContraLedger(item_name){
     let contra = item_name;
     // alert(check_room);
     // return;
     if(contra.length >= 3){
          if(contra){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_contra_ledger.php",
                    data : {contra:contra},
                    success : function(response){
                         $("#transfer_item").html(response);
                    }
               })
               return false;
          }else{
               $("#transfer_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}
//add account ledger while posting opening balance
function addAccount(ledger_id, ledger_name){
     let ledger = document.getElementById("ledger");
     let bal_ledger = document.getElementById("bal_ledger");
     ledger.value = ledger_name;
     bal_ledger.value = ledger_id;
     $("#search_results").html('');
}
//add contra ledger while posting other transactions
function addContra(ledger_id, ledger_name){
     let contra = document.getElementById("contra");
     let contra_ledger = document.getElementById("contra_ledger");
     contra.value = ledger_name;
     contra_ledger.value = ledger_id;
     $("#transfer_item").html('');
     // alert(contra_ledger.value);
}

//post opening balance
function postOpeningBalance(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let trans_type = document.getElementById("trans_type").value;
     let bal_ledger = document.getElementById("bal_ledger").value;
     // let contra = document.getElementById("contra").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(bal_ledger.length == 0 || bal_ledger.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger")
          $("#ledger").focus();
          return;
     /* }else if(contra.length == 0 || contra.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return; */
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_opening_balance.php",
               data : {posted:posted, exp_date:exp_date, bal_ledger:bal_ledger, /* contra:contra, */ amount:amount, details:details, store:store, trans_type:trans_type},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     // $("#exp_date").val('');
     $("#ledger").val('');
     $("#bal_ledger").val('');
     // $("#contra").val('');
     $("#amount").val('');
     $("#trans_type").val('');
     $("#ledger").val('');
     // $("#details").val('');
     $("#exp_date").focus();
     return false;    
}
//post other transactions
function postOtherTrx(){
     let posted = document.getElementById("posted").value;
     let store = document.getElementById("store").value;
     let exp_date = document.getElementById("exp_date").value;
     let trans_type = document.getElementById("trans_type").value;
     let bal_ledger = document.getElementById("bal_ledger").value;
     let contra_ledger = document.getElementById("contra_ledger").value;
     let amount = document.getElementById("amount").value;
     let details = document.getElementById("details").value;
     let todayDate = new Date();
     // let today = todayDate.toLocaleDateString();
     if(exp_date.length == 0 || exp_date.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter transaction date!");
          $("#exp_date").focus();
          return;
     }else if(bal_ledger.length == 0 || bal_ledger.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select ledger")
          $("#ledger").focus();
          return;
     }else if(contra_ledger.length == 0 || contra_ledger.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select Contra ledger");
          $("#contra").focus();
          return;
     }else if(amount.length == 0 || amount.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(amount <= 0){
          alert("Please input transaction amount");
          $("#amount").focus();
          return;
     }else if(details.length == 0 || details.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter description of transaction");
          $("#details").focus();
          return;
     }else if(trans_type.length == 0 || trans_type.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select transaction type");
          $("#trans_type").focus();
          return;
     }else if(new Date(exp_date) > todayDate){
          alert("Transaction date cannot be futuristic!");
          $("#exp_date").focus();
          return;
     }else if(contra_ledger == bal_ledger){
          alert("Contra ledger cannot be same as main ledger!");
          $("#contra").focus();
          return;
     
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/post_other_transactions.php",
               data : {posted:posted, exp_date:exp_date, bal_ledger:bal_ledger, contra_ledger:contra_ledger, amount:amount, details:details, store:store, trans_type:trans_type},
               success : function(response){
               $(".info").html(response);
               }
          })
     }
     $("#exp_date").val('');
     $("#ledger").val('');
     $("#bal_ledger").val('');
     $("#contra").val('');
     $("#contra_ledger").val('');
     $("#amount").val('');
     $("#trans_type").val('');
     $("#ledger").val('');
     // $("#details").val('');
     $("#exp_date").focus();
     return false;    
}

//delete asset
function deleteAsset(item){
     let confirmDel = confirm("Are you sure you want to delete this asset?", "");
     if(confirmDel){
          $.ajax({
               type : "GET",
               url : "../controller/delete_asset.php?item="+item,
               success : function(response){
                    $("#delete_asset").html(response);
               }
          })
          setTimeout(function(){
               $("#delete_asset").load("delete_asset.php #delete_asset");
          }, 1500);
          return false;
          
     }else{
          return;
     }
}

//get ledger
function getAssetLedger(item_name){
     let asset = item_name;
     if(asset){
          $.ajax({
               type : "POST",
               url :"../controller/get_asset_ledger.php",
               data : {asset:asset},
               success : function(response){
                    $("#exp_head").html(response);
               }
          })
          return false;
     }else{
          $("#exp_head").html("<option value'' selected>Select asset first</option>");
     }
     
     
}

//check dispose asset reason
function checkDisposeReason(mode){
     let reason = mode;
     let contra_form = document.getElementById("contra_form");
     let amount_form = document.getElementById("amount_form");
     if(reason == "sold"){
          contra_form.style.display = "block";
          amount_form.style.display = "block";
          
     }else{
          contra_form.style.display = "none";
          amount_form.style.display = "none";
     }
}
//toggle bank and cash
function toggleCash(){
     $(".cash_bank").toggle();
     // $("#cash_equiv").hide();
}
//togle receivables
function toggleReceivables(){
     $(".trade_rec").toggle();
     // $("#receiveables").hide();
}
//togle fixed assets
function toggleFixedAsset(){
     $(".fixed").toggle();
     // $("#receiveables").hide();
}
//togle payables
function togglePayables(){
     $(".payables").toggle();
     // $("#receiveables").hide();
}
//togle fixed assets
function toggleLongDebts(){
     $(".long_debts").toggle();
     // $("#receiveables").hide();
}
//togle expenses
function toggleExpense(){
     $(".expenses").toggle();
     // $("#receiveables").hide();
}

 //get supplier for stockin
 function getSupplier(sup){
     let vendor = sup;
     let invoice = document.getElementById("invoice_number").value;
     if(invoice.length == 0 || invoice.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please input invoice number!");
          $("#invoice_number").focus();
          return;
     }else{
          if(vendor.length >= 3){
               if(vendor){
                    $.ajax({
                         type : "POST",
                         url :"../controller/get_supplier.php",
                         data : {vendor:vendor},
                         success : function(response){
                              $("#transfer_item").html(response);
                         }
                    })
                    $("#invoice").attr("readonly", true);
                    return false;
               }else{
                    $("#transfer_item").html("<p>Please enter atleast 3 letters</p>");
               }
          }
     }
}
//select vendor during stocking
function addvendor(id, vendor_name){
     let supplier = document.getElementById("supplier");
     let vendor = document.getElementById("vendor");
     supplier.value = id;
     vendor.value = vendor_name;
     /* let invoice = document.getElementById("invoice_number");
     invoice.setAttribute("readonly", true); */
     $("#vendor").attr("readonly", true);
     $("#supplier").attr("readonly", true);
     $("#purchase_date").attr("readonly", true);
     $("#invoice_number").attr("readonly", true);
     $("#transfer_item").html('');
}

//get ledger name to update
function getLedger(ledger){
     let item = ledger;
     // alert(check_room);
     // return;
     if(item.length >= 3){
          if(item){
               $.ajax({
                    type : "POST",
                    url :"../controller/get_ledger_details.php",
                    data : {item:item},
                    success : function(response){
                         $("#sales_item").html(response);
                    }
               })
               return false;
          }else{
               $("#sales_item").html("<p>Please enter atleast 3 letters</p>");
          }
     }
     
}

// update ledger details
function updateLedger(){
     let ledger_id = document.getElementById("ledger_id").value;
     let ledger_name = document.getElementById("ledger_name").value;
     let account_class = document.getElementById("account_class").value;
     let sub_group = document.getElementById("sub_group").value;
     let group = document.getElementById("group").value;
     if(ledger_name.length == 0 || ledger_name.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please enter ledger name!");
          $("#ledger_name").focus();
          return;
     }else if(group.length == 0 || group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account group")
          $("#group").focus();
          return;
     }else if(sub_group.length == 0 || sub_group.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account sub-group");
          $("#sub_group").focus();
          return;
     }else if(account_class.length == 0 || account_class.replace(/^\s+|\s+$/g, "").length == 0){
          alert("Please select account class");
          $("#account_class").focus();
          return;
     }else{
          $.ajax({
               type : "POST",
               url : "../controller/update_ledger.php",
               data : {ledger_id:ledger_id, ledger_name:ledger_name, group:group, sub_group:sub_group, account_class:account_class},
               success : function(response){
               $("#update_customer").html(response);
               }
          })
     }
     // $("#customer").focus();
     setTimeout(function(){
          $("#update_customer").load("update_ledger.php #update_customer");
     }, 1000)
     return false;    
}