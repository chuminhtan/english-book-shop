<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container-fluid">
		<!-- BEGIN HEADER -->
		<header>
			<!-- nav bar -->
			<nav class="navbar navbar-expand-lg navbar navbar-dark bg-info">
				<a class="navbar-brand" href="#"> <img src="images/icon.png"
					width="30" height="30" class="d-inline-block align-top" alt="">
					The English Book Shop
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active mx-1"><a class="nav-link" href="#"><i
								class="fas fa-home"></i> Home</a></li>
						<li class="nav-item active mx-1"><a class="nav-link" href="#"><i
								class="fas fa-align-justify"></i> All Books</a></li>
						<li class="nav-item active mx-1"><a class="nav-link" href="#"><i
								class="fas fa-baby-carriage"></i> Cart</a></li>
					</ul>
					<a class="btn btn-warning m-1" href="#" tabindex="-1"
						aria-disabled="true">Sign In</a> <a class="btn btn-success m-1"
						href="#" tabindex="-1" aria-disabled="true">Register</a>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</nav>
			<!-- end nav bar -->
		</header>
		<!-- END HEADER -->
		<div class="container my-5">
			<h4 class="text-center my-5">Book Categories</h4>
			<div class="row d-flex justify-content-center">
				<c:forEach items="${LIST_CATEGORIES}" var="category">	
					<a href="view-category?id=${category.categoryId }" class="btn btn-outline-dark m-1">${category.name } Book</a>
				</c:forEach>
			</div>
		</div>
		<div class="my-3 container">