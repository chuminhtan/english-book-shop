<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Result</title>
<jsp:include page="../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<p class="display-4 text-center text-primary">
			<strong>Result</strong>
		</p>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<!----------------- Breadcrumb ----------------->
						<div class="card mb-2">
							<div class="card-body">
								<p>
									Keyword: <em>"${KEYWORD }"</em>
								</p>
								<c:if test="${empty LIST_BOOKS }">
									<p>Key word not found.</p>
								</c:if>
							</div>
						</div>
						<!-- End Breadcrumb -->
						<!-- ============================ COMPONENT IF NOT NULL ================================= -->
						<c:if test="${not empty LIST_BOOKS }">
							<c:forEach var="book" items="${LIST_BOOKS }">
								<article class="card card-product-list my-3">
									<div class="row no-gutters">
										<aside class="col-md-3">
											<a href="view-book?id=${book.bookId }" class="img-wrap">
												<img src="data:image/png; base64, ${book.imageBase64 }"
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
													<a href="#" class="btn btn-outline-primary btn-block">
														<span class="text">Detail</span>
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
						</c:if>

						<!-- card-product .// -->
						<!-- ============================ COMPONENT IF NOT NULL .//END ================================= -->

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