<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15-Nov-20
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product</title>
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
                <li class="nav-item ctm-li-margin">
                    <a href="" class="nav-link">
                        <mark>${sessionScope.user.username}</mark>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<!-- main content -->
<div class="container py-2">
    <div class="row">
        <!-- for reach all book -->
        <c:forEach items="${books}" var="book">
            <!-- book -->
            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 text-center py-3 ">
                <div class="card">
                    <img class="card-img-top" src="${book.imgurl}" style="height:260px" alt="Card image">
                    <div class="card-body ">
                        <h5 class="card-title">${book.name}</h5>
                        <ul class="pagination justify-content-center">
                            <li class="page-item">
                                <a class="page-link btn disabled" href="">
                                    ${book.price} <i class="fas fa-dollar-sign"></i>
                                </a>
                            </li>
                            <li class="page-item">
                                <button type="button" class="page-link btn bg-primary text-white" onclick="addToCart(${book.id})">
                                    Add to cart
                                </button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- end of book -->
        </c:forEach>
        <!-- end of foreach all book-->
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

<script type="text/javascript">
    //send ajax request : "add to cart" to server
    function addToCart(bookid){
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                //check response message, ok=> alert ok, false=> redirect to login page
                if(this.responseText=="ok") window.alert("Add to cart successfully");
                if(this.responseText=="false") window.location.href = "login";
            }
        };
        xhttp.open("GET", "addtocart?book="+bookid, true);
        xhttp.send();
    }

</script>

<!-- font awesome -->
<!-- <script src="https://kit.fontawesome.com/5b6dff2a46.js" crossorigin="anonymous"></script> -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<scrip src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></scrip>

<!-- Latest compiled JavaScript -->
<scrip src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></scrip>
</body>
</html>