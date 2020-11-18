<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17-Nov-20
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>

<div class="container-fluid">
    <div class="row bg-light">
        <!--left side bar-->
        <div class="col-2 p-0 sticky-top" style="height:100vh">
            <div class="list-group h-100  bg-secondary lead">
                <a href="#" class="bg-dark text-white list-group-item list-group-item-action text-center disabled">
                    <img src="resource/img/avatar/avatar.png" class="rounded-circle w-50">
                </a>
                <a href="" class="bg-dark text-white list-group-item list-group-item-action text-center disabled ">
                    <h5>Admin</h5>
                </a>
                <a href="a-productmanager" class="bg-secondary text-white list-group-item list-group-item-action" >
                    <small><i class="fas fa-book"></i></small> &nbsp; Product manager
                </a>
                <a href="a-usermanager" class="text-white list-group-item list-group-item-action" style="background-color: #545a5f;">
                    <small><i class="fas fa-user"></i></small> &nbsp; User manager
                </a>
                <a href="a-ordermanager" class="bg-secondary text-white list-group-item list-group-item-action">
                    <small><i class="fas fa-shopping-cart"></i></small> &nbsp; Order manager
                </a>
                <a href="a-accountsetting" class="bg-secondary text-white list-group-item list-group-item-action">
                    <small><i class="fas fa-wrench"></i></small> &nbsp; Acount setting
                </a>
            </div>
        </div>
        <!--right content : -->
        <div class="col-10 p-0" >
            <!-- head : -->
            <div class="jumbotron sticky-top row m-0 p-3 w-100 ">
                <span class=" col-2 ml-auto lead text-primary">Welcome, ${sessionScope.admin}</span>
                <a href="a-logout" class="btn btn-outline-danger">logout</a>
            </div>
            <!-- content -->
            <h4 class="ml-3 my-4 ">
                <a href="a-addnewuser" class="btn btn-outline-success">Add user</a>
            </h4>
            <div class="container-fluid">
                <div class="row p-0" style="background-color: #ecf0f1;">
                    <div class="col-1 text-center p-3">
                        <h5>No.</h5>
                    </div>
                    <div class="col-1 text-center p-3">
                        <h5>Username</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Password</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Full name</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Phone</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Address</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Action</h5>
                    </div>
                </div>
                <!-- foreach all item-->
                <c:set var="i" value="${1}" />
                <c:forEach items="${requestScope.userList}" var="user">
                    <!--item : -->
                    <div class="row  p-0 lead bg-white" style="height:150px">
                        <!--id-->
                        <div class="col-1 text-center mh-100 my-auto" >
                            ${i}
                        </div>
                        <!--    username  -->
                        <div class="col-1 text-center mh-100 my-auto">
                            ${user.username}
                        </div>
                        <!--    password    -->
                        <div class="col-2 text-center mh-100 my-auto">
                            <div>
                                ${user.password}
                            </div>
                        </div>
                        <!--    Full name   -->
                        <div class="col-2 text-center mh-100 my-auto">
                            <mark>${user.fullname}</mark>
                        </div>
                        <!--    Phone   -->
                        <div class="col-2 text-center mh-100 my-auto">
                            ${user.phone}
                        </div>
                        <!--    Address -->
                        <div class="col-2 text-center mh-100 my-auto">
                            ${user.address}
                        </div>
                        <!--action-->
                        <div class="col-2 text-center mh-100 my-auto ">
                            <a href="a-edituser?user=${user.id}" class="btn btn-outline-success btn-sm">Edit</a>
                            <a href="a-deleteuser?user=${user.id}" class="btn btn-outline-success btn-sm">Delete</a>
                            <a href="a-vieworder-${user.id}-1" class="btn btn-outline-success btn-sm">Order</a>
                        </div>
                    </div>
                    <!--end of item -->
                    <c:set var="i" value="${i+1}" />
                </c:forEach>
                <!--  end of foreach all item-->
            </div>
        </div>
    </div>
</div>


<!-- font awesome -->
<!-- <script src="https://kit.fontawesome.com/5b6dff2a46.js" crossorigin="anonymous"></script> -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>