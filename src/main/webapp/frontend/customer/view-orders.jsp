<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
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
							<header class="card-header">
								<strong class="d-inline-block mr-3 text-primary">My
									Orders</strong>
							</header>
							<div class="card-body">
								<!-- row -->
								<div class="table-responsive">
									<table class="table table-hover">
										<thead>
											<th class="text-primary text-center">#</th>
											<th class="text-primary text-center">Order ID</th>
											<th class="text-primary text-center">Quantity</th>
											<th class="text-primary text-center">Total Amount</th>
											<th class="text-primary text-center">Order Date</th>
											<th class="text-primary text-center">Status</th>
										</thead>
										<tbody>
											<c:forEach var="order" items="${LIST_ORDERS }"
												varStatus="status">
												<tr>
													<td width="65">${status.index }</td>
													<td class="font-weight-bold">${order.orderId }</td>
													<td>${order.bookCopies }</td>
													<td>${order.total }</td>
													<td>${order.orderDate }</td>
													<td>${order.status }</td>
													<td><a
														href="${pageContext.request.contextPath }/customer/order?id=${order.orderId }"
														class="btn btn-outline-primary">Details</a></td>
												</tr>

											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- card-body .// -->

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