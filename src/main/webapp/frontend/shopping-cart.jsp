<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
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
							<li class="breadcrumb-item active">Your Cart</li>
						</ol>

					</div>
					<!-- card-body .// -->
				</div>
				<!-- End Breadcrumb -->

				<!-- ===================== Cart ====================== -->
				<div class="row">
					<aside class="col-lg-9">
						<div class="card p-2">
							<h3 class="text-center text-primary my-4">Cart</h3>

							<c:set var="cart" value="${sessionScope['CART']}" />

							<c:if test="${cart.totalItems == 0}">
								<div class="text-center">
									<p>Your Cart Is Empty.</p>
									<button class="btn btn-danger">Continue To Shopping</button>
								</div>
							</c:if>

							<c:if test="${cart.totalItems > 0 }">


								<table class="table table-borderless table-shopping-cart">
									<thead class="text-muted">
										<tr class="small text-uppercase">
											<th scope="col">Product</th>
											<th scope="col" width="120">Quantity</th>
											<th scope="col" width="120">Subtotal</th>
											<th scope="col" class="text-right" width="200"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${cart.items}">
											<tr>
												<td>
													<figure class="itemside align-items-center">
														<div class="aside">
															<img
																src="data:image/png; base64, ${item.key.imageBase64 }"
																alt="${item.key.title }" class="img-sm">
														</div>
														<figcaption class="info">
															<a href="#" class="title text-dark"><p class="content-justify">${item.key.title }</p></a>
															<p class="text-muted small">Author:
																${item.key.author }</p>
														</figcaption>
													</figure>
												</td>
												<td><input type="number" value="${item.value }" min="1"
													max="100" step="1"></td>
												<td>
													<div class="price-wrap">
														<var class="price text-danger">
															<fmt:formatNumber value="${item.key.price*item.value }"
																type="currency" />
														</var>
														<small class="text-muted"> <fmt:formatNumber
																value="${item.key.price}" type="currency" /> each
														</small>
													</div> <!-- price-wrap .// -->
												</td>
												<td class="text-right"><a href="" class="btn btn-light">
														<i class="fas fa-times"></i> Remove
												</a></td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
								<!-- card-body.// -->
							</c:if>
						</div>
						<!-- card.// -->

					</aside>
					<!-- col.// -->
					<aside class="col-lg-3">
						<div class="card">
							<div class="card-body">
								<dl class="dlist-align">
									<dt>Total:</dt>
									<dd class="text-right text-primary b">
										<strong> <fmt:formatNumber
												value="${cart.totalAmount }" type="currency" />
f										</strong>
									</dd>
								</dl>
								<hr>
								<c:if test="${cart.totalItems != 0}">
									<a href="#" class="btn btn-danger btn-block text-white">
										Make Purchase </a>
									<a href="#" class="btn btn-primary btn-block">Continue
										Shopping</a>
								</c:if>
							</div>
							<!-- card-body.// -->
						</div>
						<!-- card.// -->

					</aside>
					<!-- col.// -->
				</div>
				<!-- ===================== Cart .//END ====================== -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<script src="../js/bootstrap-input-spinner.js"></script>
	<script>

// Create inputSpinner Jquery
$("input[type='number']").inputSpinner();

// Set Total Price for each item
const totalPriceEachItem = () => {
	
}


</script>
</body>
</html>