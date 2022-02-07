<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order No.${ORDER.orderId}</title>
<jsp:include page="../../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp"></jsp:include>

		<p class="display-4 text-center text-primary">
			<strong>${CATEGORY.name }</strong>
		</p>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row">

					<!--   SIDEBAR   -->
					<aside class="col-md-3">
						<!--   SIDEBAR   -->
						<ul class="list-group">
							<a class="list-group-item"
								href="${pageContext.request.contextPath }/customer/customer-profile">Profile
								Setting</a>
							<a class="list-group-item active"
								href="${pageContext.request.contextPath }/customer/view-orders">My
								Orders</a>
						</ul>
						<!--   SIDEBAR .//END   -->
					</aside>
					<!--   SIDEBAR .//END   -->

					<!-- MAIN -->
					<main class="col-md-9">
						<article class="card">
							<c:if test="${ORDER != NULL }">
							<header class="card-header">
								<a href="${pageContext.request.contextPath }/customer/view-orders" class="btn btn-primary"><i
									class="fas fa-arrow-left"></i> Back</a>
								<h3 class="mr-3 text-primary text-center font-weight-bold">Order
									ID #${ORDER.orderId }</h3>
							</header>
							<div class="card-body">
								<!-- ================ TABLE OVERVIEW ======================= -->
								<h4 class="text-primary">Overview</h4>
								<div class="table-responsive mb-2">
									<table class="table table-hover table-striped">
										<tbody>
											<tr>
												<th>Ordered by</th>
												<td>${ORDER.customer.fullName }</td>
											</tr>
											<tr>
												<th>Book Copies</th>
												<td>${ORDER.bookCopies}</td>
											</tr>
											<tr>
												<th>Recipient Name</th>
												<td>${ORDER.recipientName}</td>
											</tr>
											<tr>
												<th>Recipient Phone</th>
												<td>${ORDER.recipientPhone}</td>
											</tr>
											<tr>
												<th>Ship To</th>
												<td>${ORDER.shippingAddress}</td>
											</tr>
											<tr>
												<th>Payment Method</th>
												<td>${ORDER.paymentMethod}</td>
											</tr>
											<tr>
												<th>Order Status</th>
												<td>${ORDER.status}</td>
											</tr>
											<tr>
												<th>Order Date</th>
												<td>${ORDER.orderDate}</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- =================== TABLE OVERVIEW .//END ================== -->
								<!-- =================== TABLE ODERED BOOKS ====================== -->
								<h4 class="text-primary">Ordered Books</h4>
								<div class="table-responsive">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th scope="col" class="text-primary text-center">Index</th>
												<th scope="col" class="text-primary text-center">Iamge</th>
												<th scope="col" class="text-primary text-center">Book
													Title</th>
												<th scope="col" class="text-primary text-center">Author</th>
												<th scope="col" class="text-primary text-center">Price</th>
												<th scope="col" class="text-primary text-center">Quantity</th>
												<th scope="col" class="text-primary text-center">Sub
													Total</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="orderDetail" items="${ORDER.orderDetails }"
												varStatus="status">
												<tr>
													<th>${status.index + 1 }</th>
													<td><img
											src="data:image/png; base64, ${orderDetail.book.imageBase64 }"
											alt="${book.title }" width="65"></td>
													<td><a
														target="_blank" href="${pageContext.request.contextPath }/view-book?id=${orderDetail.book.bookId}">
															${orderDetail.book.title }</a></th>
													<td>${orderDetail.book.author }</td>
													<td><fmt:formatNumber
															value="${orderDetail.book.price }" type="currency" /></td>
													<td>${orderDetail.quantity }</td>
													<td><fmt:formatNumber value="${orderDetail.subtotal }"
															type="currency" /></td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="5"
													class="text-danger font-weight-bold text-center">TOTAL:</td>
												<td class="text-danger font-weight-bold">${ORDER.bookCopies }</td>
												<td class="text-danger font-weight-bold"><fmt:formatNumber
														value="${ORDER.total}" type="currency" /></td>
											</tr>

										</tbody>
									</table>
								</div>
								<!-- =================== TABLE ODERED BOOKS .//END ====================== -->
							</div>
							<!-- card-body .// -->
							</c:if>
							<c:if test="${ORDER == NULL }">
														<header class="card-header">
								<a href="${pageContext.request.contextPath }/customer/view-orders" class="btn btn-primary"><i
									class="fas fa-arrow-left"></i> Back</a>
								<h3 class="mr-3 text-primary text-center font-weight-bold">Oop! You can not see this order details.</h3>
							</header>
							
							</c:if>

						</article>
						<!-- order-group.// -->
					</main>
					<!-- MAIN .// END -->
				</div>
				<!-- row.// -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
</body>
</html>