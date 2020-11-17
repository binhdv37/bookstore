<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15-Nov-20
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product manager</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>

<div class="container-fluid">
    <div class="row bg-light">
        <!--left side bar-->
        <div class="col-2 p-0 sticky-top" style="height:100vh">
            <div class="list-group h-100  bg-secondary lead">
                <a href="" class="bg-dark text-white list-group-item list-group-item-action text-center disabled">
                    <img src="resource/img/avatar/avatar.png" class="rounded-circle w-50">
                </a>
                <a href="" class="bg-dark text-white list-group-item list-group-item-action text-center disabled ">
                    <h5>Admin</h5>
                </a>
                <a href="a-productmanager" class=" text-white list-group-item list-group-item-action" style="background-color: #545a5f;">
                    <small><i class="fas fa-book"></i></small> &nbsp; Product manager
                </a>
                <a href="a-usermanager" class="bg-secondary text-white list-group-item list-group-item-action">
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
                <a href="a-addproduct" class="btn btn-outline-success">Add product</a>
            </h4>
            <div class="container-fluid">
                <div class="row p-0" style="background-color: #ecf0f1;">
                    <div class="col-1 text-center p-3">
                        <h5>ID</h5>
                    </div>
                    <div class="col-3 text-center p-3">
                        <h5>Book</h5>
                    </div>
                    <div class="col-1 text-center p-3">
                        <h5>Price</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Author</h5>
                    </div>
                    <div class="col-1 text-center p-3">
                        <h5>Info</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Image Url</h5>
                    </div>
                    <div class="col-2 text-center p-3">
                        <h5>Action</h5>
                    </div>
                </div>
                <!-- foreach all book -->
                <c:forEach items="${books}" var="book">
                    <!--item : -->
                    <div class="row  p-0 lead bg-white" style="height:150px">
                        <!--id-->
                        <div class="col-1 text-center mh-100 my-auto" >
                            ${book.id}
                        </div>
                        <!--book image -->
                        <div class="col-1 text-center h-75 my-auto">
                            <img src="${book.imgurl}" class="h-100" alt="book">
                        </div>
                        <!--book name-->
                        <div class="col-2 text-center mh-100 my-auto">
                            <div>
                                ${book.name}
                            </div>
                        </div>
                        <!--price-->
                        <div class="col-1 text-center mh-100 my-auto">
                            <mark>${book.price}</mark><small>vnd</small>
                        </div>
                        <!--author-->
                        <div class="col-2 text-center mh-100 my-auto">
                            ${book.author}
                        </div>
                        <!--info-->
                        <div class="col-1 text-center mh-100 my-auto">
                            ${book.info}
                        </div>
                        <!--url-->
                        <div class="col-2 text-center mh-100 my-auto">
                            <small>
                                <a href="${book.imgurl}" class="text-decoration-none">
                                    ${book.imgurl}
                                </a>
                            </small>
                        </div>
                        <!--action-->
                        <div class="col-2 text-center mh-100 my-auto">
                            <a href="a-editproduct?book=${book.id}" class="btn btn-outline-success btn-sm">Edit</a>
                            <a href="a-deleteproduct?book=${book.id}" class="btn btn-outline-success btn-sm">Delete</a>
                        </div>
                    </div>
                    <hr class=" m-0"/>
                    <!-- end of item-->
                </c:forEach>
                <!-- end of foreach all book -->
            </div>
        </div>
        <!--end of right content-->
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