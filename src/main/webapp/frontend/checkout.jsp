<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
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
				<div class="card px-1 py-0 my-2">
					<div class="card-body">

						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}">Home</a></li>
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/view-cart">Your
									Cart</a></li>
							<li class="breadcrumb-item active">Checkout</li>
						</ol>

					</div>
					<!-- card-body .// -->
				</div>
				<!-- End Breadcrumb -->
				<!-- ============================ 	DETAIL ================================= -->
				<div class="row">
					<main class="col-md-8">

						<article class="card mb-4">
							<div class="card-body">
								<h4 class="card-title mb-4">Review cart</h4>
								<div class="row">

									<c:set var="cart" value="${sessionScope['CART']}" />

									<c:forEach var="item" items="${cart.items}">
										<!-- ====== ONE ITEM ==== -->
										<div class="col-md-12">
											<figure class="itemside mb-4">
												<div class="aside">
													<img src="data:image/png; base64, ${item.key.imageBase64 }"
														alt="${item.key.title }" class="border img-sm">
												</div>
												<figcaption class="info">
													<p>${item.key.title }</p>
													<span class="text-muted">${item.value} x <fmt:formatNumber
															value="${item.key.price }" type="currency" />= <fmt:formatNumber
															value="${item.key.price*item.value }" type="currency" />
													</span>
												</figcaption>
											</figure>
										</div>
										<!-- col.// -->
									</c:forEach>
								</div>
								<!-- row.// -->
							</div>
							<!-- card-body.// -->
						</article>
						<!-- card.// -->


						<article class="card mb-4">
							<div class="card-body">
								<h4 class="card-title mb-4">Shipping Infomation</h4>
								<form action="">
									<div class="row">
										<div class="form-group col-sm-6">
											<label>Recipient Name</label> <input type="text" value="${LOGGED_CUSTOMER.fullName }"
												name="recipient-name" min="4" max="50"
												placeholder="Type here" class="form-control" required>
										</div>
										<div class="form-group col-sm-6">
											<label>Recipient Phone</label> <input type="text" value="${LOGGED_CUSTOMER.phone }"
												name="recipient-phone" min="10" max="20"
												placeholder="Type here" class="form-control" required>
										</div>
										<div class="form-group col-sm-12">
											<label>Street Address</label> <input type="text" value="${LOGGED_CUSTOMER.address }"
												name="street-address" min="10" max="50" class="form-control"
												required>
										</div>
										<div class="form-group col-sm-4">
											<label>City</label> <input type="text" name="city" value="${LOGGED_CUSTOMER.city }"
												placeholder="Type here" class="form-control" required>
										</div>
										<div class="form-group col-sm-4">
											<label>Zip Code</label> <input type="text" name="zip-code" value="${LOGGED_CUSTOMER.zipCode }"
												placeholder="Type here" class="form-control" required>
										</div>

										<div class="form-group col-sm-4">
											<label>Country</label> <input type="text" name="country" value="${LOGGED_CUSTOMER.country }"
												placeholder="Type here" class="form-control" required>
										</div>
										<div class="form-group col-sm-6">
											<label class="js-check box active"><input
												type="radio" name="payment-method" value="Case On Delivery"
												checked="true">
												<h6 class="title text-primary">Payment Method</h6>
												<p class="text-muted">Cash On Delivery</p> </label>
											<!-- js-check.// -->
										</div>
									</div>
									<!-- row.// -->
							</div>
							<!-- card-body.// -->
						</article>
						<!-- card.// -->

					</main>
					<!-- col.// -->
					<aside class="col-md-4">
						<div class="card shadow">
							<div class="card-body">
								<h4 class="mb-3 text-primary">Overview</h4>
								<dl class="dlist-align">
									<dt class="text-muted">Payment method:</dt>
									<dd>Cash On Delivery</dd>
								</dl>
								<hr>
								<dl class="dlist-align">
									<dt>Total:</dt>
									<dd class="h5">
										<fmt:formatNumber value="${cart.totalAmount }" type="currency" />
									</dd>
								</dl>
								<hr>
								<p class="small mb-3 text-muted">By clicking you are agree
									with terms of condition</p>
								<button type="submit" class="btn btn-danger btn-block"> Place Order </button>
								</form>
							</div>
							<!-- card-body.// -->
						</div>
						<!-- card.// -->
					</aside>
					<!-- col.// -->
				</div>
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script>

	</script>
</body>
</html>