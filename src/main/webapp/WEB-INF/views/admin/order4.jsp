<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17-Nov-20
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18-Nov-20
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Userorder - Canceled</title>
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
                    <small><i class="fas fa-wrench"></i></small> &nbsp; Account setting
                </a>
            </div>
        </div>
        <!--right content : -->
        <div class="col-10 p-0" style="margin-bottom: 20%;">
            <!-- head : -->
            <div class="jumbotron sticky-top row m-0 p-3 w-100 ">
                <span class=" col-2 ml-auto lead text-primary">Welcome, ${sessionScope.admin}</span>
                <a href="a-logout" class="btn btn-outline-danger">logout</a>
            </div>

            <!-- button top -->
            <h4 class="ml-3 my-4 ">
                <a href="a-usermanager" class="btn btn-outline-success">User list</a>
            </h4>

            <!--heading-->
            <div class="container-fluid text-center bg-white p-3">
                <h1 class="font-weight-light">${requestScope.username}'s order</h1>
            </div>
            <!-- end of heading--->

            <!-- navigate bar : -->
            <div class="container-fluid p-0 my-3">
                <ul class="nav nav-tabs lead text-center">
                    <li class="nav-item w-25">
                        <a class="nav-link " href="a-vieworder-${requestScope.userid}-1">Waiting for confirmation</a>
                    </li>
                    <li class="nav-item w-25">
                        <a class="nav-link" href="a-vieworder-${requestScope.userid}-2">Delivering</a>
                    </li>
                    <li class="nav-item w-25">
                        <a class="nav-link" href="a-vieworder-${requestScope.userid}-3">Delivered</a>
                    </li>
                    <li class="nav-item w-25">
                        <a class="nav-link  active text-danger disabled" href="a-vieworder-${requestScope.userid}-4">Canceled</a>
                    </li>
                </ul>
            </div>
            <!-- end of navigate bar-->


            <!-- content : -->

            <!-- item  list : -->
            <div class="container p-0">
                <!-- foreach all item -->
                <c:set var="i" value="${1}"/>
                <c:forEach items="${requestScope.itemList}" var="item">
                    <!--  cart item  -->
                    <div class="row text-center p-3 my-5 lead ctm-item">
                        <!-- no. -->
                        <div class="col-1 my-auto">
                                ${i}
                        </div>
                        <!--product info-->
                        <div class="col-3 my-auto">
                            <div class="row">
                                <div class="col-5">
                                    <img src="${item.book.imgurl}" style="width: 100%;max-height:100px">
                                </div>
                                <div class="col-7 my-auto">
                                    <h5 >${item.book.name}</h5>
                                </div>
                            </div>
                        </div>
                        <!--price-->
                        <div class="col-2 my-auto">
                            <mark class="ctm-price">${item.book.price}</mark> <small>vnd</small>
                        </div>
                        <!--quantity-->
                        <div class="col-2 my-auto">
                            <strong class="display-4">&times;<mark>${item.quantity}</mark></strong>
                        </div>
                        <!--total price-->
                        <div class="col-2 my-auto">
                            <mark class="ctm-totalprice">${item.totalprice}</mark> <small>vnd</small>
                        </div>
                        <!--action-->
                        <div class="col-2 my-auto">
                            <a href="#item${item.id}" class="btn btn-outline-dark" data-toggle="collapse" >More info</a>
                        </div>
                    </div>
                    <!-- end of item 1 -->

                    <!-- confirm action-->
                    <div class="collapse" id="item${item.id}">
                        <form  class="form-inline" >
                            <label for="placedtime" class="mr-sm-2">Placed time:</label>
                            <input type="text" id="placedtime" disabled class="form-control mb-2 mr-sm-5" value="${item.placedTime}">
                            <label for="canceltime" class="mr-sm-2">Canceled time:</label>
                            <input type="text" id="canceltime" disabled class="form-control mb-2 mr-sm-5" value="${item.cancelTime}">
                        </form>
                    </div>
                    <!--end of confirm action-->

                    <!--horizontal line-->
                    <hr style="border:1px solid grey">
                    <!--end of horizontal line-->
                    <c:set var="i" value="${i+1}"/>
                </c:forEach>
                <!-- end of foreach all item -->
            </div>
            <!-- end of itemlist-->
            <!-- end of contnet-->
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