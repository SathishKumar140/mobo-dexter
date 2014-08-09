<?php
require_once 'conf/config.php';
?>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login And Registration</title>
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
        <script src="jquery/jquery-1.11.0.js"></script>
    </head>
    <body>
        <div id="container_demo" >
            <!--hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4-->  
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>
            <div id="wrapper">
                <div id="login" class="animate form">
                    <form  action="login_register.php" autocomplete="on" method="post"> 
                        <p class="change_link">
                            Not a member yet ?
                            <a href="#toregister" class="to_register">Join us</a>
                        </p>
                        <h1>ViewFindAR Login</h1> 
                        <p> 
                            <label for="username" class="uname" data-icon="u" > Email: </label>
                            <input id="username" name="usermail" required="required" type="text" placeholder="User Name"/>
                        </p>
                        <p> 
                            <label for="password" class="youpasswd" data-icon="p"> Password: </label>
                            <input id="password" name="password" required="required" type="password" placeholder="Password" /> 
                        </p>
<!--                        <p class="keeplogin"> 
                            <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
                            <label for="loginkeeping">Keep me logged in</label>
                        </p>-->
                        <p class="login button"> 
                            <input type="submit" value="Login" name="login" /> 
                        </p>

                    </form>
                </div>

                <div id="register" class="animate form">
                    <form  action="login_register.php" autocomplete="on" method="post">  
                        <p class="change_link">  
                            Already a member ?
                            <a href="#tologin" class="to_register"> Go and log in </a>
                        </p>
                        <h1> ViewFindAR Sign Up</h1> 
                        <p> 
                            <label for="firstname" class="uname" > First Name: </label>
                            <input id="firstname" name="firstname" required="required" type="text" placeholder="First Name" />
                        </p>
                        <p> 
                        <p> 
                            <label for="lastname" class="uname" > Last Name: </label>
                            <input id="lastname" name="lastname" type="text" placeholder="Last Name" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Nick Name: </label>
                            <input id="nickname" name="nickname" type="text" placeholder="Nick Name" />
                        </p>
                        <p> 
                            <label for="emailsignup" class="youmail" > E-Mail: </label>
                            <input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com"/> 
                        </p>
                        <p> 
                            <label for="passwordsignup" class="youpasswd" > Password: </label>
                            <input id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                        </p>
                        <p> 
                            <label for="passwordsignup_confirm" class="youpasswd" > Confirm Password </label>
                            <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Mobile No: </label>
                            <input id="mobno" name="mobno" type="text" placeholder="Mobile No" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Phone No: </label>
                            <input id="phno" name="phno" type="text" placeholder="Phone No" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > #No: </label>
                            <input id="doorno" name="doorno" type="text" placeholder="Door No" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Street: </label>
                            <input id="street" name="street" type="text" placeholder="Street" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Area: </label>
                            <input id="area" name="area" type="text" placeholder="Area" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > City: </label>
                            <input id="city" name="city" type="text" placeholder="City" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Area Code: </label>
                            <input id="areacode" name="areacode" type="text" placeholder="Area Code" />
                        </p>
                        <p> 
                            <label for="lastname" class="uname" > Country: </label>
                            <input id="country" name="country" type="text" placeholder="Country" />
                        </p>
                        <p class="signin button"> 
                            <input type="submit" value="Sign up" name="register"/> 
                        </p>

                    </form>
                </div>

            </div>
        </div>  
        <?php
        // put your code here
        ?>

        <script>
            $(document).ready(function() {

//                ########################## To Find The Duplicate username ##########################################
                $('#emailsignup').change(function() {
                    var email = $('#emailsignup').val();
                    $.ajax({
                        type: 'POST',
                        url: 'ajax/dup_user.php',
                        data: "email=" + email,
                        success: function(d) {

                            if (d === 'Duplicate') {
                                alert('Please Enter a different User Entered UserName already in Use')
                                $('#emailsignup').val('');
                            }

                        }
                    });
                });

//                ########################## Allow Only Numbers ##########################################
                $('#mobno').keydown(function(event) {
                    // Allow special chars + arrows 
                    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                            || event.keyCode == 27 || event.keyCode == 13
                            || (event.keyCode == 65 && event.ctrlKey === true)
                            || (event.keyCode >= 35 && event.keyCode <= 39)) {
                        return;
                    } else {
                        // If it's not a number stop the keypress
                        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                            event.preventDefault();
                        }
                    }
                });


                $('#phno').keydown(function(event) {
                    // Allow special chars + arrows 
                    if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                            || event.keyCode == 27 || event.keyCode == 13
                            || (event.keyCode == 65 && event.ctrlKey === true)
                            || (event.keyCode >= 35 && event.keyCode <= 39)) {
                        return;
                    } else {
                        // If it's not a number stop the keypress
                        if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                            event.preventDefault();
                        }
                    }
                });

//                ############################################ Confirm Password Match ###################################

                $('#passwordsignup_confirm').change(function() {
                    var psswrd = $('#passwordsignup').val();
                    var conf_psswrd = $('#passwordsignup_confirm').val();

                    if (psswrd != conf_psswrd) {
                        alert('Password Mismatch');
                        $('#passwordsignup').val('');
                        $('#passwordsignup_confirm').val('');
                    }

                });

            });
        </script>

    </body>
</html>
