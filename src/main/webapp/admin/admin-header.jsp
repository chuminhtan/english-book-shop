<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test-Admin</title>
    <link rel="shortcut icon" type="image/jpg" href="../images/icon.png">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css"
        integrity="sha512-9BwLAVqqt6oFdXohPLuNHxhx36BVj5uGSGmizkmGkgl3uMSgNalKc/smum+GJU/TTP0jy0+ruwC3xNAk3F759A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <!-- BEGIN HEADER -->
    <header>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-info">
            <a class="navbar-brand" href="#">
                <img src="../images/icon.png" width="30" height="30" class="d-inline-block align-top" alt="">
                Admin
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-user"></i> Users</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-align-right"></i> Categories</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-book"></i> Books</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-star"></i> Reviews</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-sticky-note"></i> Orders</a>
                    </li>
                </ul>
                <span>User: Chu Minh Tan</span>
                <a class="btn btn-dark mx-2" href="#" tabindex="-1" aria-disabled="true">Logout</a>
            </div>
        </nav>
        <!-- end nav bar -->
    </header>
    <!-- END HEADER -->

    <!-- MAIN -->
    <div class="container my-2">