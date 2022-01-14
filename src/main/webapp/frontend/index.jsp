<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>The English Book Shop</title>
<jsp:include page="../css/styles.jsp" />
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<!------------------------------New Books---------------------------------------------->
			<div class="container">
				<p class="display-4  text-primary">
					<strong>New Books</strong>
				</p>

				<div class="row d-flex justify-content-center">
					<main class="col-md-10">

						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_NEW_BOOKS }">
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
												<ul class="rating-stars">
													<li style="width: 80%" class="stars-active"><i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
													<li><i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
												</ul>
												<div class="label-rating">7/10</div>
											</div>
											<!-- rating-wrap.// -->
											<br>
											<p>
												<a href="view-book?id=${book.bookId }" class="btn btn-outline-primary btn-block"> <span
													class="text">Detail</span>
												</a> <a href="#" class="btn btn-primary btn-block"><i
													class="fas fa-shopping-cart"></i> Add To Cart </a>
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
			<!-- container New Books.//  -->

			<!------------------------------Best-selling Books---------------------------------------------->
			<div class="container">
				<p class="display-4  text-primary">
					<strong>Best-selling Books</strong>
				</p>

				<div class="row d-flex justify-content-center">
					<main class="col-md-10">

						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_BOOKS }">
							<article class="card card-product-list my-3">
								<div class="row no-gutters">
									<aside class="col-md-3">
										<a href="#" class="img-wrap"> <img
											src="data:image/png; base64, ${book.imageBase64 }"
											alt="${book.title }">
										</a>
									</aside>
									<!-- col.// -->
									<div class="col-md-6">
										<div class="info-main">
											<a href="#" class="h5 title"><strong
												class="content-justify">${book.title }</strong></a>
											<div class="rating-wrap mb-3">
												<ul class="rating-stars">
													<li style="width: 80%" class="stars-active"><i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
													<li><i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
												</ul>
												<div class="label-rating">7/10</div>
											</div>
											<!-- rating-wrap.// -->

											<p class="content-justify">${book.shortDescription}</p>
										</div>
										<!-- info-main.// -->
									</div>
									<!-- col.// -->
									<aside class="col-sm-3">
										<div class="info-aside">
											<div class="price-wrap">
												<span class="price h5 text-success">$${book.price } </span>
											</div>
											<br> <br>
											<p>
												<a href="#" class="btn btn-light btn-block"> <span
													class="text">Detail</span>
												</a> <a href="#" class="btn btn-primary btn-block"><i
													class="fas fa-shopping-cart"></i> Add To Cart </a>
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
			<!-- container best-selling book.//  -->

			<!------------------------------Most-favored Books---------------------------------------------->
			<div class="container">
				<p class="display-4  text-primary">
					<strong>Most-favored Books</strong>
				</p>

				<div class="row d-flex justify-content-center">
					<main class="col-md-10">

						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_BOOKS }">
							<article class="card card-product-list my-3">
								<div class="row no-gutters">
									<aside class="col-md-3">
										<a href="#" class="img-wrap"> <img
											src="data:image/png; base64, ${book.imageBase64 }"
											alt="${book.title }">
										</a>
									</aside>
									<!-- col.// -->
									<div class="col-md-6">
										<div class="info-main">
											<a href="#" class="h5 title"><strong
												class="content-justify">${book.title }</strong></a>
											<div class="rating-wrap mb-3">
												<ul class="rating-stars">
													<li style="width: 80%" class="stars-active"><i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
													<li><i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i></li>
												</ul>
												<div class="label-rating">7/10</div>
											</div>
											<!-- rating-wrap.// -->

											<p class="content-justify">${book.shortDescription}</p>
										</div>
										<!-- info-main.// -->
									</div>
									<!-- col.// -->
									<aside class="col-sm-3">
										<div class="info-aside">
											<div class="price-wrap">
												<span class="price h5 text-success">$${book.price } </span>
											</div>
											<br> <br>
											<p>
												<a href="#" class="btn btn-light btn-block"> <span
													class="text">Detail</span>
												</a> <a href="#" class="btn btn-primary btn-block"><i
													class="fas fa-shopping-cart"></i> Add To Cart </a>
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