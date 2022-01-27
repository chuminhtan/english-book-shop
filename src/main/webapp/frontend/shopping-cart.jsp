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
				<p class=" display-6 font-weight-bold text-center text-primary my-4">Cart</p>
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


							<c:set var="cart" value="${sessionScope['CART']}" />

							<c:if test="${cart.totalItems == 0}">
								<div class="text-center">
									<p>Your Cart Is Empty.</p>
								</div>
							</c:if>

							<c:if test="${cart.totalItems > 0 }">

								<form action="update-cart" method="post">
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
																<a href="#" class="title text-dark"><p
																		class="content-justify">${item.key.title }</p></a>
																<p class="text-muted small">Author:
																	${item.key.author }</p>
															</figcaption>
														</figure>
													</td>
													<input type="hidden" name="bookId"
														value="${item.key.bookId }" />
														
													<!-- quantity -->
													<td><input type="number" id="${item.key.bookId }" value="${item.value }"
														name="quantity" min="1" max="100" step="1" onChange="updateTotal(this)"></td>
													
													<!-- subtotal -->
													<td>
														<div class="price-wrap">
															<var class="price text-primary" name="subtotal" price="${item.key.price*item.value }" id="subtotal-${item.key.bookId }">
																<fmt:formatNumber value="${item.key.price*item.value }"
																	type="currency" />
															</var>
															<small class="text-muted"> <fmt:formatNumber
																	value="${item.key.price}" type="currency" /> each
															</small>
														</div> <!-- price-wrap .// -->
													</td>
													<td class="text-right"><a
														href="remove-from-cart?bookId=${item.key.bookId }"
														class="btn btn-light"> <i class="fas fa-times"></i>
															Remove
													</a></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>

									<!-- card-body.// -->
									<div class="d-flex justify-content-around">
										<a href="clear-cart" class="btn btn-outline-danger mx-2 px-4"><i
											class="fas fa-times"></i> Remove All</a>
										<button type="submit" class="btn btn-outline-primary mx-2 px-5">Update</button>
									</div>
								</form>
							</c:if>
						</div>
						<!-- card.// -->

					</aside>
					<!-- col.// -->
					<aside class="col-lg-3">
						<div class="card">
							<div class="card-body">
								<dl class="dlist-align">
									<dt class="text-primary">Total:</dt>
									<h3 id="totalAmount" class="text-center text-danger font-weight-bold b">
										<fmt:formatNumber value="${cart.totalAmount }" type="currency" />
									</h3>

								</dl>
								<c:if test="${cart.totalItems != 0}">
									<hr>
									<a href="checkout"
										class="btn btn-info btn-block text-white my-3 "> Checkout
									</a>
								</c:if>
								<a href="${pageContext.request.contextPath }"
									class="btn btn-primary btn-block">Continue Shopping</a>
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
	
	<script>
	//UPATE TOTAL
	
	let updateTotal = (input) => {

		let quantity = parseInt(input.value);
		let id = input.id;

		let subtotalElement = document.getElementById("subtotal-" + id);
		let price = parseFloat(subtotalElement.getAttribute("price"));

		let subtotal = quantity * price;
		subtotalElement.innerHTML = "$" + subtotal.toFixed(2);
		
		// Update subtotal

		let subtotals = document.getElementsByName("subtotal");
		console.log(subtotals);
		
		let totalAmount = 0;
		//subtotals.forEach(e => totalAmount += parseFloat(e.textContent.substring(1)));
		subtotals.forEach(e => {
			let number = parseFloat(e.innerText.substring(1));
			totalAmount += number;
		});
		
		document.getElementById("totalAmount").innerHTML = '$' + totalAmount.toFixed(2);
	};
	</script>
</body>
</html>