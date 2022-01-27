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
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}">Home</a></li>
							<li class="breadcrumb-item"><a
								href="view-category?id=${BOOK.category.categoryId }">${BOOK.category.name }</a></li>
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
							class="col-md-3 d-flex justify-content-center align-items-center">
							<a href="view-book?id=${BOOK.bookId }" class="img-wrap"> <img
								src="data:image/png; base64, ${BOOK.imageBase64 }"
								alt="${BOOK.title }" style="max-width: 100%;">
							</a>
						</aside>
						<main class="col-md-9 border-left">
							<article class="content-body">
								<h2 class="title">${BOOK.title }</h2>

								<div class="rating-wrap mb-3">
									<span class="badge badge-warning"> <i class="fa fa-star"></i>
										<fmt:formatNumber type="number" pattern="#.#"
											value="${BOOK.averageRating }" />
									</span> <small class="text-muted ml-2">${BOOK.numOfRating }
										reviews</small>
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
								<div class="mb-3 d-flex align-items-center">
									<div class="p-2 bg-danger rounded">
										<span class="text-white font-weight-bold h4"><fmt:formatNumber value="${BOOK.price}" type="currency" /></span>
									</div>
									<button id="${BOOK.bookId }" class="btn btn-primary ml-5 py-2 px-4"
										onClick="addBookToCart(this)">
										<i class="fas fa-shopping-cart"></i> Add To Cart
									</button>
								</div>


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
						<div class="content-justify">${BOOK.description }</div>
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
								</header>

								<!-- ========================= ONE REVIEW  ======================== -->
								<c:forEach items="${BOOK.reviews}" var="review">
									<article class="box mb-3">
										<div class="w-100">
											<div>
												<span class="badge badge-warning"> <i
													class="fa fa-star"></i> ${review.rating}
												</span> <span class="font-weight-bold ml-2">${review.headline }</span>
											</div>
											<small class="my-2 text-muted">by
												${review.customer.fullName } on ${review.reviewTime }</small>
										</div>
										<div class="mt-3">
											<small>${review.comment }</small>
										</div>
									</article>
								</c:forEach>
								<c:if test="${empty BOOK.reviews}">
									<article class="box mb-3">
										<small>No comments yet.</small>
									</article>
								</c:if>

								<!-- ========================= ONE REVIEW .//END  ======================== -->
							</div>
							<!-- col.// -->
							<c:if test="${LOGGED_CUSTOMER == null }">
								<div class="col-md-3 text-center">
									<div>
										<button class="btn btn-primary" disabled>
											<i class="fas fa-edit"></i> Write Review
										</button>
									</div>
									<small>You must login to write a review.</small>
								</div>

							</c:if>
							<c:if test="${LOGGED_CUSTOMER != null }">
								<div id="div-contain-button-review" class="col-md-3 text-center">
								</div>
								<!-- ============================== MODAL - WRITE REVIEW ======================= -->

								<!-- Modal -->
								<div class="modal fade" id="modalWriteReview" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalCenterTitle"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered modal-lg"
										role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLongTitle">Write
													Review</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="mb-2">
													<p class="font-weight-bold text-primary">${BOOK.title }</p>
												</div>

												<!-- =========== WRITE REVIEW FORM ==================== -->
												<form id="form-review-by-customer">
													<div class="form-row">
														<div class="form-group col-md-6">
															<label for="review-id">Your Name</label> <input
																type="text" class="form-control"
																value="${LOGGED_CUSTOMER.fullName }" readonly>
														</div>
														<div class="form-group col-md-6">
															<label for="rating">Rating</label> <select id="rating"
																class="form-control" name="rating">
																<option value="1">&starf;</option>
																<option value="2">&starf;&starf;</option>
																<option value="3">&starf;&starf;&starf;</option>
																<option value="4">&starf;&starf;&starf;&starf;</option>
																<option value="5" selected>&starf;&starf;&starf;&starf;&starf;</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label for="headline">Headline</label> <input type="text"
															name="headline" class="form-control" id="headline"
															placeholder="Enter Headline" minlength="2"
															maxlength="100" required value="${REVIEW.headline }">
													</div>
													<div class="form-group">
														<label for="comment">Comment</label>
														<textarea name="comment" class="form-control content"
															id="comment" placeholder="Enter Comment" minlength="2"
															maxlength="500" required>${REVIEW.comment }</textarea>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="submit" class="btn btn-primary"
															id="save-changes">Save changes</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<!-- ============================== MODAL - WRITE REVIEW .//END ================= -->

							<!-- ============================== MODAL - SEE REVIEW WAS WRITTEN  BY CUSTOMER======================= -->

							<!-- Modal -->
							<div class="modal fade" id="modalSeeReviewWritten" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalCenterTitle"
								aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-lg"
									role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLongTitle">Your
												Review For This Book</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="mb-2">
												<p class="font-weight-bold text-primary">${BOOK.title }</p>
											</div>
											<article class="box mb-3">
												<div class="w-100">
													<div>
														<span id="span-review-rating" class="badge badge-warning">
															<i class="fa fa-star"></i>
														</span> <span id="span-review-headline"
															class="font-weight-bold ml-2"></span>
													</div>
													<small id="small-review-by" class="my-2 text-muted"></small>
												</div>
												<div id="div-review-comment" class="mt-3"></div>
											</article>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">OK</button>
										</div>
									</div>
								</div>
							</div>
							<!-- ============================== MODAL - SEE REVIEW WAS WRITTEN  BY CUSTOMER.//END ================= -->

						</div>
						<!-- row.// -->
					</div>
				</div>
				<!-- ==============================   RATING .//END  ============================== -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script>
		// Check the customer has already a review for this book 
		const checkReviewFromCustomer = async () => {
			const divContain = document.getElementById('div-contain-button-review');
			let url ='${pageContext.request.contextPath}/find-review-by-customer?bookId=${BOOK.bookId}'
	        const response = await fetch(url, {
		          method: 'GET',
		          headers: {
		        	 'Content-Type': 'application/x-www-form-urlencoded'
		          }
		        });
			const resultRs = await response.json();
			let btn='';
			
			console.log('resultRs: ', resultRs);
			
			if (resultRs.result === 'no') {
				btn = `<button class="btn btn-primary" data-toggle="modal" data-target="#modalWriteReview"><i class="fas fa-edit"></i> Write Review</button>`

			} else if (resultRs.result === 'yes'){
				btn= `<button class="btn btn-primary" data-toggle="modal" data-target="#modalSeeReviewWritten"><i class="fas fa-eye"></i> Your Review</button>`
				document.getElementById('span-review-rating').insertAdjacentHTML('beforeend', resultRs.rating);
				document.getElementById('span-review-headline').insertAdjacentHTML('beforeend', resultRs.headline);
				document.getElementById('small-review-by').innerHTML = "by ${LOGGED_CUSTOMER.fullName} on " + resultRs.reviewTime; 
				document.getElementById('div-review-comment').insertAdjacentHTML('beforeend', resultRs.comment);
			}
			
			divContain.insertAdjacentHTML("beforeend", btn);
		}

		<c:if test="${LOGGED_CUSTOMER != null}" >
			checkReviewFromCustomer();
		</c:if>

		// Send Review Form
		const sendReviewFormByCustomer = async (event) => {
			   	event.preventDefault();
			   	const bookId = ${BOOK.bookId};
			   	let rating = document.getElementById('rating').value;
		    	let headline = document.getElementById('headline').value;
		    	let comment = document.getElementById('comment').value;

		        const data = {bookId, rating, headline, comment};
		        const url = 'write-review';
		        
		        const response = await fetch(url, {
		          method: 'POST',
		          headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		          },
		          body: JSON.stringify(data)
		        });
		        const result = await response.json();

		        if (result.result === 'success') {
		            	successMessage('Writing review successfully',null);
		            	
		        } else {
						errorMessage('Writing review failed');
		        }
			};
			
		<c:if test="${LOGGED_CUSTOMER != null}" >
			document.getElementById('form-review-by-customer').addEventListener('submit', sendReviewFormByCustomer);			
		</c:if>
	</script>
</body>
</html>