<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15-Nov-20
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        .custom-li-margin{
            margin: 0px 20px;
        }
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .carousel-caption{
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
<!-- navigate bar :  -->
<nav class="navbar navbar-expand-md bg-light navbar-light sticky-top">
    <div class="container">
        <!--logo-->
        <a class="navbar-brand" href="home"><i class="fas fa-home"></i> Home</a>
        <!--collapse button-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapseNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--navbar link-->
        <div class="navbar-collapse collapse" id="collapseNavbar">
            <ul class="navbar-nav ml-auto" >
                <li class="nav-item custom-li-margin">
                    <a href="product" class="nav-link" >Product</a>
                </li>
                <li class="nav-item custom-li-margin">
                    <a href="about" class="nav-link" >About</a>
                </li>
                <li class="nav-item custom-li-margin">
                    <a href="login" class="nav-link" >login</a>
                </li>
                <li class="nav-item custom-li-margin">
                    <a href="logout" class="nav-link" >logout</a>
                </li>
                <li class="nav-item custom-li-margin">
                    <a href="shoppingcart" class="nav-link" ><i class="fas fa-shopping-cart"></i></a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!--login form : -->
<div class="container">
    <div class="jumbotron w-50 mx-auto my-5">
        <h3 class="mb-3">Login form :</h3>
        <form:form modelAttribute="user" action="login" method="post" >
            <div class="form-group">
                <label for="username">Username : </label>
                <form:input path="username" cssClass="form-control" placeholder="Enter username" />
                <form:errors path="username" cssClass="text-danger"/>
            </div>
            <div class="form-group">
                <label for="password">Password :</label>
                <form:password path="password" cssClass="form-control" placeholder="Enter password"/>
                <form:errors path="password" cssClass="text-danger" />
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form:form>
        <div class="text-danger mt-3">${requestScope.errMessage}</div>
        <div class="mt-4">
            <a href="register">
                <span class="lead">Does not have account yet? Register here!</span>
            </a>
        </div>
    </div>
</div>


<!-- footer -->
<div class="container-fluid pt-5">
    <div class="row text-center text-white bg-dark py-3">
        <div class="col-md-4">
            <h3>Contact info</h3>
            <hr>
            <p>0123 456 788</p>
            <p>myEmail@gmail.com</p>
            <p>101 Vu Dong street</p>
            <p>Thai Binh city</p>
        </div>
        <div class="col-md-4">
            <h3>Open hour</h3>
            <hr>
            <p>Monday - Friday : 6 - 17h</p>
            <p>Saturday : 6 - 11h</p>
            <p>Sunday : Close</p>
        </div>
        <div class="col-md-4">
            <h3>State</h3>
            <hr>
            <p>state info</p>
            <p>myEmail@gmail.com</p>
            <p>101 Vu Dong street</p>
            <p>Thai Binh city</p>
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