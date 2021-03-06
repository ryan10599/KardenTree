<%-- 
    Document   : RegisterView
    Created on : Nov 1, 2018, 4:46:46 PM
    Author     : ryan.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Layout/Header.jsp?titleName=Customer Register"></jsp:include>
    <body class="page page-shop header-compact-sticky page-shop navbar-layout-navbar-below">

        <!-- @plugin: page loading indicator, delete to remove loader -->
        <div class="page-loader" data-toggle="page-loader"></div>


        <a id="#top" href="#content" class="sr-only">Skip to content</a> 

    <jsp:include page="Layout/Navbar.jsp"></jsp:include>


        <div id="content">
            <div class="container">
                <!-- Sign Up form -->
                <form method="post" action="Register" class="form-login form-wrapper form-medium" role="form">
                    <h3 class="title-divider">
                        <span>Sign Up</span> 
                        <small class="mt-4">Already signed up? <a href="Login">Login here</a>.</small>
                    </h3>

                    <h5>
                        Account Information
                    </h5>
                    <div class="form-group">
                        <label class="sr-only" for="signup-first-name-page">First Name</label>
                        <input type="text" class="form-control" id="signup-first-name-page" placeholder="First name" name="fname" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-last-name-page">Last Name</label>
                        <input type="text" class="form-control" id="signup-last-name-page" placeholder="Last name" name="lname" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-username-page">Userame</label>
                        <input type="text" class="form-control" id="signup-username-page" placeholder="Username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-username-page">Phone</label>
                        <input type="number" class="form-control" id="signup-username-page" placeholder="Phone" name="tel" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-email-page">Email address</label>
                        <input type="email" class="form-control" id="signup-email-page" placeholder="Email address" name="email" required>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="signup-password-page">Password</label>
                        <input type="password" id="psw" class="form-control" id="signup-password-page" placeholder="Password" name="password" required>
                    </div>
                    <div class="form-group">
                        <input type="password" id="cpsw" class="form-control" id="signup-password-page" placeholder="Confirm password" name="confirm" required>
                        <small id="errorPassword" class="form-text text-muted text-danger"></small>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                            <input id="Conditions" type="checkbox" class="form-check-input">
                            I agree with the Terms and Conditions. 
                        </label>
                    </div>
                    <hr>
                    <button id="btnSubmit" class="btn btn-primary" type="submit">Sign up</button>
                </form>
            </div>
        </div>

    <jsp:include page="Layout/Footer.jsp"></jsp:include>

        <script>

            $(document).ready(function () {


                document.getElementById("btnSubmit").disabled = true;

                $('#cpsw').keyup(function () {

                    if ($('#cpsw').val() != $('#psw').val()) {
                        document.getElementById("btnSubmit").disabled = true;
                        document.getElementById("errorPassword").innerHTML = "รหัสผ่านไม่ตรงกัน";
                        document.getElementById("psw").classList.add("is-invalid");
                        document.getElementById("cpsw").classList.add("is-invalid");
                    } else {

                        document.getElementById("errorPassword").innerHTML = "";
                        document.getElementById("psw").classList.remove("is-invalid");
                        document.getElementById("cpsw").classList.remove("is-invalid");
                    }


                });

                $('#Conditions').change(function () {


                    if ($('#Conditions').prop('checked') == true) {
                        document.getElementById("btnSubmit").disabled = false;
                    } else {
                        document.getElementById("btnSubmit").disabled = true;
                    }

                })


            });

        </script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    ${EmailnotNull == "1" ? '<script>swal("มีปัญหา", "EMail นี้ถูกใช้ไปแล้ว","warning");</script>' : ''}
     ${AcnotNull == "1" ? '<script>swal("มีปัญหา", "ชื่อผู้ใช้นี้ถูกใช้ไปแล้ว","warning");</script>' : ''}


    <!--        <form action="Register" method="post">
                Username <input type="text" name="username" required>
                <br>
                Password<input type="password" name="password" required>
                <br>
                Confirm Password <input type="password" name="confirm" required>
                <br>
                Firstname <input type="text" name="fname" required>
                <br>
                Lastname <input type="text" name="lname" required>
                <br>
                Email <input type="email" name="email" required>
                <br>
                Tel. <input type="number" name="tel" required>
                <br>
                <input type="submit" value="Register">
                               
            </form>
    -->
