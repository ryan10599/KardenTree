<%-- 
    Document   : profileView
    Created on : Nov 26, 2018, 9:47:56 PM
    Author     : llujo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="Layout/Header.jsp?titleName=Profile"></jsp:include>


    <body class="page page-shop header-compact-sticky page-shop navbar-layout-navbar-below">


    <jsp:include page="Layout/Navbar.jsp"></jsp:include>


        <div id="content">
            <div class="container">

                <div id="page-header">
                    <div class="container clearfix">
                        <h3 class="mb-0 float-md-left">
                            User Profile
                        </h3>
                        <!-- Page header breadcrumb -->

                    </div>
                </div>

                <br>




                <div class="row">
                    <div class="col-sm-3"><!--left col-->


                        <div class="text-center">
                            <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar">
                            <h6>Upload a different photo...</h6>

                        </div><br>



                        <ul class="list-group">
                            <li class="list-group-item text-muted">Activity <i class="fa fa-dashboard fa-1x"></i></li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span> 125</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span> 13</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span> 37</li>
                            <li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span> 78</li>
                        </ul> 


                    </div><!--/col-3-->
                    <div class="col-sm-9">


                        <div class="card">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item"> <a class="nav-link active show" href="#profile" data-toggle="tab">Infomations</a> </li>
                                    <li class="nav-item"> <a class="nav-link" href="#Address" data-toggle="tab">Address</a> </li>
                                    <li class="nav-item"> <a class="nav-link" href="#ChangPassword" data-toggle="tab">Changes Password</a> </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="tab-pane active show" id="profile" role="tabpanel">
                                        <form action="profile" method="post">
                                            <input name="accountid" value="${infoCustomer.accountid}" hidden="">
                                        <h4 class="card-title">
                                            informations
                                        </h4>
                                        <table class="table table-user-information">
                                            <tbody>
                                                <tr>
                                                    <td>First Name</td>
                                                    <td><input type="text" name="fname" class="form-control" value="${infoCustomer.fname}"></td>
                                                </tr>
                                                <tr>
                                                    <td>Lastname Name</td>
                                                    <td><input type="text" name="lname" class="form-control" value="${infoCustomer.lname}"></td>
                                                </tr>
                                                <tr>
                                                    <td>Username</td>

                                                    <td>${infoCustomer.username}</td>
                                                </tr>
                                                <tr>
                                                    <td>Email</td>
                                                    <td>${infoCustomer.email}</td>
                                                </tr>

                                                <tr>
                                                    <td>Phone</td>
                                                    <td><input type="text" name="telno" class="form-control" value="${infoCustomer.telno}"></td>
                                                </tr>

                                                <tr>
                                                    <td>Date of Register</td>
                                                    <td>${infoCustomer.updateDate}</td>
                                                </tr>



                                            </tbody>
                                        </table>

                                        <div align="center">
                                            <input type="submit" class="btn  btn-primary btn-lg" value="Edit">
                                        </div>
                                    </form>


                                </div>
                                <div class="tab-pane" id="Address" role="tabpanel">
                                    <h4 class="card-title">
                                        Address for shipping
                                    </h4>
                                    <div class="rows">
                                        <form action="profile" method="post">
                                            <input name="accountid" value="${infoCustomer.accountid}" hidden="">
                                            <div class="col-md4">
                                                <input name="newaddress" class="form-control" placeholder="เพิ่มที่อยู่ใหม่">
                                                <input type="submit" hidden="">
                                            </div>
                                            <div class="col-md-4">

                                            </div>
                                            <div class="col-md-4">

                                            </div>
                                        </form>


                                    </div>
                                    <c:if test="${CustomerAddress != null}">

                                        <c:forEach items="${CustomerAddress}" var="addressCustomer">
                                            <div class="list-group">
                                                <li class="list-group-item justify-content-between"> 
                                                    ${addressCustomer.address}

                                                    <a class="badge badge-danger badge-pill float-right" href="profile?removeAddress=${addressCustomer.addressid}">x</a>
                                                </li>



                                            </div>

                                        </c:forEach>


                                    </c:if>
                                    <c:if test="${CustomerAddress == null}">


                                        ไม่มีที่อยู่

                                    </c:if>

                                </div>
                                <div class="tab-pane" id="ChangPassword" role="tabpanel">
                                    <h4 class="card-title">
                                        เปลี่ยนรหัสผ่าน
                                    </h4>
                                    <form action="profile" method="post">
                                        <label>Current Password</label>
                                        <input type="password" class="form-control"  name="currentPassword">
                                        <label>New Password </label>
                                        <input type="password" class="form-control"  name="newPassword">
                                        <label>Confirm Password </label>
                                        <input type="password" class="form-control"  name="ConfirmPassword">
                                        <br>
                                        <input type="submit" class="btn btn-success" value="Changes">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>


</body>

<jsp:include page="Layout/Footer.jsp"></jsp:include>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
${param.result == "ok" ? '<script>swal("ทำรายการสำเร็จ", "คุณได้ทำรายการสำเร็จแล้ว","success");</script>' : ''}
${param.resultRemove == "ok" ? '<script>swal("ลบข้อมูลสำเร็จ", "ลบข้อมูลที่อยู่เรียบร้อยแล้ว","success");</script>' : ''}
${error == "passwordwrong" ? '<script>swal("เกิดข้อผิดพลาด", "รหัสผ่านเดิมไม่ถูดต้อง","warning");</script>' : ''}
</html>

