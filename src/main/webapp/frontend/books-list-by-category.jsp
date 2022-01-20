<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${CATEGORY.name }</title>
<jsp:include page="../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<p class="display-4 text-center text-primary">
			<strong>${CATEGORY.name }</strong>
		</p>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">

						<!----------------- Breadcrumb ----------------->
						<div class="card mb-2">
							<div class="card-body d-flex align-items-center">
								<nav class="flex-fill">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a
											href="${pageContext.request.contextPath}">Home</a></li>
										<li class="breadcrumb-item"><a
											href="view-category?id=${CATEGORY.categoryId }">${CATEGORY.name }</a></li>
									</ol>
								</nav>
							</div>
						</div>
						<!-- End Breadcrumb -->

						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_BOOKS }">
							<article class="card card-product-list my-3">
								<div class="row no-gutters">
									<aside class="col-md-3">
										<a href="view-book?id=${book.bookId }" class="img-wrap"> <img
											src="data:image/png; base64, ${book.imageBase64 }"
											alt="${book.title }">
										</a>
									</aside>
									<!-- col.// -->
									<div class="col-md-6">
										<div class="info-main">
											<a href="view-book?id=${book.bookId }" class="h5 title"><strong
												class="content-justify">${book.title }</strong></a>
											<p class="content-justify">${book.shortDescription}</p>
										</div>
										<!-- info-main.// -->
									</div>
									<!-- col.// -->
									<aside class="col-sm-3">
										<div class="info-aside">
											<div class="price-wrap">
												<span class="price h5"><strong>$${book.price
														}</strong></span>
											</div>
											<div class="rating-wrap mb-3">
												<span class="badge badge-warning"> <i
													class="fa fa-star"></i> ${book.averageRating }
												</span> <small class="text-muted ml-2">${book.numOfRating } reviews</small>
											</div>
											<!-- rating-wrap.// -->
											<br>
											<p>
												<a href="view-book?id=${book.bookId }"
													class="btn btn-outline-primary btn-block"> <span
													class="text">Detail</span>
												</a> <button id="${book.bookId }" class="btn btn-primary btn-block" onClick="addBookToCart(this)"><i
													class="fas fa-shopping-cart"></i> Add To Cart </button>
											</p>
										</div>
										<!-- info-aside.// -->
									</aside>
									<!-- col.// -->
								</div>
								<!-- row.// -->
							</article>
						</c:forEach>


						<!-- card-product .// -->
						<!-- ============================ COMPONENT 3 .//END ================================= -->
					</main>
				</div>
				<!-- row.// -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>