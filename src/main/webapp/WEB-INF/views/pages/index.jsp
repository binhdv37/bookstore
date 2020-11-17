<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14-Nov-20
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DV Shop</title>
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

<!--     main slide     -->
<div id="slides" class="carousel slide" data-ride="carousel">
    <!--    indicator   -->
    <ul class="carousel-indicators">
        <li data-target="#slides" data-slide-to="0" class="active"></li>
        <li data-target="#slides" data-slide-to="1"></li>
        <li data-target="#slides" data-slide-to="2"></li>
    </ul>
    <!--    carousel : -->
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="resource/img/slide/slide1.jpg" />
            <div class="carousel-caption">
                <h2>DV Shop</h2>
                <h4>Book store for programer</h4>
                <a href="about">
                    <button type="button" class="btn btn-outline-light btn-lg">Explore</button>
                </a>
                <a href="product">
                    <button type="button" class="btn btn-primary btn-lg">Show product</button>
                </a>
            </div>
        </div>
        <div class="carousel-item ">
            <img src="resource/img/slide/slide2.jpg"  />
            <div class="carousel-caption">
                <h2>DV Shop</h2>
                <h4>Book store for programer</h4>
            </div>
        </div>
        <div class="carousel-item ">
            <img src="resource/img/slide/slide3.jpg"/>
            <div class="carousel-caption">
                <h2>DV Shop</h2>
                <h4>Book store for programer</h4>
            </div>
        </div>
    </div>
</div>

<!-- jumbotron -->
<div class="container-fluid pb-5">
    <div class="row jumbotron">
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 col-xs-10">
            <p class="lead">DV bookstore is a favored destination
                not only for the people of Hanoi but also for foreigners.
                With the variety of prestigious titles, quality,
                DV bookstore meets the demand for the books you read, the hottest of the readers.
            </p>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 col-xs-2">
            <button class="btn btn-outline-info btn-lg">Read more</button>
        </div>
    </div>
</div>

<!-- welcome session -->
<div class="container py-5">
    <div class="row text-center">
        <div class="col-12">
            <h1 class="display-4">Welcome to our book store!</h1>
        </div>
        <div class="col-12">
            <p class="lead">
                DV bookstore attracted a large number of readers.
                This is the world of all kinds of books, both in foreign and Vietnamese.
                science books such as literature, history, culture, medicine, physics, chemistry …;
            </p>
        </div>
    </div>
</div>
<div class="container">
    <hr>
</div>

<!-- image session : -->
<div class="container-fluid py-5">
    <div class="row text-center">
        <div class="col-xs-12 col-sm-6 col-md-4 ">
            <i class="fab fa-java fa-7x"></i>
            <h3>Java book</h3>
            <p>Book for java programmer</p>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-4 ">
            <i class="fab fa-js-square fa-7x"></i>
            <h3>Javascript book</h3>
            <p>Book for javascript programmer</p>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 ">
            <i class="fab fa-python fa-7x"></i>
            <h3>Python book</h3>
            <p>Book for python programmer</p>
        </div>
    </div>
</div>

<div class="container">
    <hr>
</div>

<!-- card profile : -->
<div class="container-fluid py-5">
    <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <img class="card-img-top" src="resource/img/avatar/avatar.png" alt="Card image">
                <div class="card-body ">
                    <h4 class="card-title">Binh dv</h4>
                    <p class="card-text">Binh is a professional java programmer. He was also the man who
                        created this website in 2020.
                    </p>
                    <a href="#" class="btn btn-info">See Profile</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-4">
            <div class="card">
                <img class="card-img-top" src="resource/img/avatar/avatar.png" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">Binh dv</h4>
                    <p class="card-text">Binh is a professional java programmer. He was also the man who
                        created this website in 2020.
                    </p>
                    <a href="#" class="btn btn-info">See Profile</a>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-4">
            <div class="card">
                <img class="card-img-top" src="resource/img/avatar/avatar.png" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">Binh dv</h4>
                    <p class="card-text">Binh is a professional java programmer. He was also the man who
                        created this website in 2020.
                    </p>
                    <a href="#" class="btn btn-info">See Profile</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!--  contact  -->
<div class="container-fluid py-5">
    <div class="row text-center">
        <div class="col-12 pt-5 pb-3">
            <h1>Contact us</h1>
        </div>
        <div class="col-12">
            <a href="#" class="px-5" style="color: blue">
                <i class="fab fa-facebook fa-3x" ></i>
            </a>
            <a href="#" class="px-5" style="color: red">
                <i class="fab fa-youtube fa-3x"></i>
            </a>
            <a href="#" class="px-5" style="color: #007bff">
                <i class="fab fa-twitter-square fa-3x"></i>
            </a>
            <a href="#" class="px-5" style="color:crimson">
                <i class="fab fa-google fa-3x"></i>
            </a>
        </div>
    </div>
</div>

<div class="container">
    <hr>
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
