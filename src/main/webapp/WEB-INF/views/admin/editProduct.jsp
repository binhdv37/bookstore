<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15-Nov-20
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit product</title>
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
                    <small><i class="fas fa-wrench"></i></small> &nbsp; Account setting
                </a>
            </div>
        </div>
        <!--right content : -->
        <div class="col-10 p-0" >
            <!-- head : -->
            <div class="jumbotron sticky-top row m-0 p-3 w-100 ">
                <span class=" col-2 ml-auto lead text-primary">Welcome, ${sessionScope.admin}</span>
            </div>
            <!-- content -->
            <h4 class="ml-3 my-4 ">
                <a href="a-productmanager" class="btn btn-outline-success">Product list</a>
            </h4>
            <div class="container w-50 rounded bg-white my-5 p-5">
                <h2 class="text-center">Edit product</h2>
                <form:form modelAttribute="book" action="a-editproduct" method="post" cssClass="lead">
                    <input type="hidden" name="id"  value="${book.id}">
                    <div class="form-group">
                        <label for="name">Product name:</label>
                        <form:input path="name"  cssClass="form-control" />
                        <form:errors path="name" cssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="price">Price:</label>
                        <form:input type="number" path="price" cssClass="form-control" />
                        <form:errors path="price" cssClass="text-danger" />
                    </div>
                    <div class="form-group">
                        <label for="author">Author:</label>
                        <form:input path="author" cssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="info">Info:</label>
                        <form:input path="info" cssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="imgurl">Image Url:</label>
                        <form:input path="imgurl" cssClass="form-control" />
                        <form:errors path="imgurl" cssClass="text-danger" />
                    </div>
                    <button type="submit" class="btn btn-primary">Update  </button>
                    <a href="a-productmanager" class="btn btn-outline-success ml-3">Cancel</a>
                </form:form>
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