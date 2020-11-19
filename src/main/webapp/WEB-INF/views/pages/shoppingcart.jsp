<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15-Nov-20
  Time: 5:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>web</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        .ctm-li-margin{
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
                <li class="nav-item ctm-li-margin">
                    <a href="product" class="nav-link" >Product</a>
                </li>
                <li class="nav-item ctm-li-margin">
                    <a href="about" class="nav-link" >About</a>
                </li>
                <li class="nav-item ctm-li-margin">
                    <a href="login" class="nav-link" >login</a>
                </li>
                <li class="nav-item ctm-li-margin">
                    <a href="logout" class="nav-link" >logout</a>
                </li>
                <li class="nav-item ctm-li-margin">
                    <a href="shoppingcart" class="nav-link" ><i class="fas fa-shopping-cart"></i></a>
                </li>
                <c:if test="${sessionScope.username!=null}">
                    <li class="nav-item ctm-li-margin">
                        <a href="" class="nav-link">
                            <mark>${sessionScope.username}</mark>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!--main contnet : -->

<!--head-->
<div class="container mt-3">
    <div class="jumbotron row p-4">
        <div class="col-xs-8 col-sm-10">
            <h4><i class="fab fa-opencart"></i> Shopping cart</h4>
        </div>
        <div class="col-xs-4 col-sm-2">
            <a href="order-1" class="btn btn-primary">
                View order
            </a>
        </div>
    </div>
</div>

<!--cart-->
<div class="container">
    <!-- header -->
    <div class="row bg-secondary text-white text-center p-3 lead">
        <div class="col-1"></div>
        <div class="col-4">Product info</div>
        <div class="col-2">Price</div>
        <div class="col-2">Quantity</div>
        <div class="col-2">Total price</div>
        <div class="col-1">Action</div>
    </div>

    <!-- message when there is no item to display :  -->
    <c:if test="${requestScope.itemList.size()==0}">
        <div class="container text-center pt-5 my-5">
            <img src="resource/img/error/nothinghere.gif" alt="nothing here" class="w-25"/>
            <h3 class="text-danger my-auto d-inline">Oops. Looks like there is nothing here!</h3>
        </div>
    </c:if>

    <c:set var="i" value="${0}" />
    <!-- foreach all item -->
    <c:forEach items="${requestScope.itemList}" var="item">
        <!--  cart item -->
        <div class="row text-center p-3 my-5 lead ctm-item">
            <!--check box-->
            <div class="col-1 my-auto">
<%--                <input type="checkbox" class="ctm-checkbox" onclick="check(${i})">--%>
                <div class="custom-control custom-switch">
                    <input type="checkbox" onclick="check(${i})" class="custom-control-input ctm-checkbox" id="switch${i}" name="example">
                    <label class="custom-control-label" for="switch${i}"></label>
                </div>
            </div>
            <!--product info-->
            <div class="col-4 my-auto">
                <div class="row">
                    <div class="col-4">
                        <img src="${item.book.imgurl}" style="width: 100%;max-height:100px">
                    </div>
                    <div class="col-8 my-auto">
                        <h5 >${item.book.name}</h5>
                        <span style="display: none;" class="ctm-bookid">${item.book.id}</span>
                    </div>
                </div>
            </div>
            <!--price-->
            <div class="col-2 my-auto">
                <mark class="ctm-price">${item.book.price}</mark> <small>vnd</small>
            </div>
            <!--quantity-->
            <div class="col-2 my-auto">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <button type="button" class="page-link" onclick="minus(${i}, ${item.book.id})">
                            -
                        </button>
                    </li>
                    <li class="page-item disabled">
                        <a class="page-link ctm-quantity" href="#" >
                            ${item.quantity}
                        </a>
                    </li>
                    <li class="page-item">
                        <button type="button" class="page-link" onclick="plus(${i}, ${item.book.id})">
                            +
                        </button>
                    </li>
                </ul>
            </div>
            <!--total price-->
            <div class="col-2 my-auto">
                <mark class="ctm-totalprice">${item.totalprice}</mark> <small>vnd</small>
            </div>
            <!--action-->
            <div class="col-1 my-auto">
                <button class="btn btn-outline-dark" onclick="deleteItem(${i}, ${item.book.id})">delete</button>
            </div>
        </div>
        <!--horizontal line-->
        <hr style="border:1px solid grey" class="ctm-hr">
        <!-- end of cart item -->
        <c:set var="i" value="${i+1}" /> <!-- change i = i+1 -->
    </c:forEach>
    <!-- end of foreach all item -->


    <!--total box-->
    <div class="row">
        <div class="jumbotron col-6 ml-auto lead">
            <div class="row">
                <div class="col-8">
                    Total : <input type="text" id="total" value="0" class="bg-light text-dark" disabled/>
                    <small>vnd</small>
                </div>
                <div class="col-4">
                    <button type="button" class="btn btn-outline-success" onclick="purchase()">
                        Purchase
                    </button>
                </div>
            </div>
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

<script src="resource/js/cart.js">
</script>
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