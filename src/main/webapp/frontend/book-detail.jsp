<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${BOOK.title }</title>
<jsp:include page="../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<!----------------- Breadcrumb ----------------->
				<div class="card px-2">
					<div class="card-body">

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item"><a href="#">${BOOK.category.name }</a></li>
							<li class="breadcrumb-item active">${BOOK.title }</li>
						</ol>

					</div>
					<!-- card-body .// -->
				</div>
				<!-- End Breadcrumb -->

				<!-- ============================ 	DETAIL ================================= -->
				<div class="card my-2">
					<div class="row no-gutters">
						<aside
							class="col-md-4 d-flex justify-content-center align-items-center">
							<a href="view-book?id=${BOOK.bookId }" class="img-wrap"> <img
								src="data:image/png; base64, ${BOOK.imageBase64 }"
								alt="${BOOK.title }">
							</a>
						</aside>
						<main class="col-md-8 border-left">
							<article class="content-body">
								<h2 class="title">${BOOK.title }</h2>

								<div class="rating-wrap mb-3">
									<span class="badge badge-warning"> <i class="fa fa-star"></i>
										3.8
									</span> <small class="text-muted ml-2">45 reviews</small>
								</div>
								<!-- rating-wrap.// -->

								<dl class="row">
									<dt class="col-sm-3">Author</dt>
									<dd class="col-sm-9">${BOOK.author }</dd>

									<dt class="col-sm-3">ISBN</dt>
									<dd class="col-sm-9">${BOOK.isbn }</dd>

									<dt class="col-sm-3">Publish Date</dt>
									<dd class="col-sm-9">
										<fmt:formatDate pattern="yyyy-MM-dd"
											value="${BOOK.publishDate }" />
									</dd>
								</dl>

								<hr>
								<!-- row.// -->
								<div class="mb-3 d-flex">
									<span class="price h4 align-self-center"">$230.00</span>
								</div>
								<a href="#" class="btn btn-primary"> <span class="text">Add
										to cart</span> <i class="fas fa-shopping-cart"></i></a>

							</article>
							<!-- product-info-aside .// -->
						</main>
						<!-- col.// -->
					</div>
					<!-- row.// -->
				</div>
				<!-- ============================ DETAIL .//END ================================= -->

				<!-- ============================   DESCRIPTION  =========================== -->
				<article class="card my-2">
					<div class="card-body">
						<h3>Description</h3>
						<p class="content-justify">${BOOK.description }</p>
					</div>
					<!-- card-body.// -->
				</article>
				<!-- ============================   DESCRIPTION .//END =========================== -->

				<!-- ==============================   RATING   ===================================== -->
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-9">
								<header class="section-heading">
									<h3>Customer Reviews</h3>
									<div class="rating-wrap mb-3">
										<span class="badge badge-warning"> <i
											class="fa fa-star"></i> 3.8
										</span> <small class="text-muted ml-2">45 reviews</small>
									</div>
								</header>

								<!-- ========================= ONE REVIEW  ======================== -->
								<article class="box mb-3">
									<div class="icontext w-100">
										<img
											src="${pageContext.request.contextPath }/images/icons-person-female.png"
											class="img-xs icon rounded-circle">
										<div class="text">
											<span class="date text-muted float-md-right">24.04.2020
											</span>
											<h6 class="mb-1">Alex Pushkin</h6>
											<ul class="rating-stars">
												<li style="width: 50%" class="stars-active"><i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i></li>
												<li><i class="fa fa-star"></i> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i></li>
											</ul>
											<span class="label-rating">3.5/5</span>
										</div>
									</div>
									<!-- icontext.// -->
									<div class="mt-3">
										<p>Not good item for dummy text item Lorem ipsum dolor sit
											amet, consectetur adipisicing elit, sed do eiusmod tempor
											incididunt ut labore et dolore magna aliqua.</p>
									</div>
								</article>
								<!-- ========================= ONE REVIEW .//END  ======================== -->

							</div>
							<!-- col.// -->
						</div>
					</div>
				</div>
				<!-- ==============================   RATING .//END  ============================== -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>