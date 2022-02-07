<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Dashboard</title>
<jsp:include page="../css/styles.jsp" />
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="admin-header.jsp"></jsp:include>
		<!-- Main -->

		<h2 class="text-primary text-uppercase text-center my-4">
			<strong><i class="fas fa-tachometer-alt"></i> Dashboard</strong>
		</h2>

		<div class="container">
			<div class="d-flex justify-content-center my-4">
				<a class="btn btn-success mx-1"
					href="${pageContext.request.contextPath }/admin/books/create-book">New
					Book</a> <a class="btn btn-success mx-1"
					href="${pageContext.request.contextPath }/admin/users/create-user">New
					User</a> <a class="btn btn-success mx-1"
					href="${pageContext.request.contextPath }/admin/categories/create-category">New
					Category</a> <a class="btn btn-success mx-1"
					href="${pageContext.request.contextPath }/admin/customers/create-customer">New
					Customer</a>
			</div>
			<div class="d-flex justify-content-between my-5">
				<div>
					<h4 class="text-primary font-weight-bold">Total Users: </h4><h4 class="text-danger">${TOTAL_USERS }</h4>

				</div>
				<div>
					<h4 class="text-primary font-weight-bold">Total Customers: </h4><h4 class="text-danger">${TOTAL_CUSTOMERS }</h4>

				</div>
				<div>
					<h4 class="text-primary font-weight-bold">Total Orders: </h4><h4 class="text-danger">${TOTAL_ORDERS }</h4>

				</div>
				<div>
					<h4 class="text-primary font-weight-bold">Total Reviews: </h4><h4 class="text-danger">${TOTAL_REVIEWS }</h4>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<h2 class="text-primary my-4 text-center">Recent Sales</h2>
					<div class="table-responsive">
						<table class="table table-hover table-striped">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Order ID</th>
									<th scope="col">Order By</th>
									<th scope="col">Book Copies</th>
									<th scope="col">Total</th>
									<th scope="col">Payment Method</th>
									<th scope="col">Status</th>
									<th scope="col">Order Date</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="order" items="${LIST_MOST_RECENT_ORDERS}"
									varStatus="status">
									<tr>
										<th scope="row">${order.orderId}</th>
										<td>${order.customer.fullName }</td>
										<td>${order.bookCopies }</td>
										<td>${order.total }</td>
										<td>${order.paymentMethod }</td>
										<td>${order.status}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd H:m"
												value="${order.orderDate}" /></td>
										<td><a
											href="${pageContext.request.contextPath}/admin/orders/order-detail?id=${order.orderId }"
											class="btn btn-info m-1"><i class="fas fa-shopping-bag"
												data-toggle="tooltip" title="Detail"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- REVIEWS -->
			<h2 class="text-primary my-4 text-center">Recent Reviews</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Index</th>
							<th scope="col">ID</th>
							<th scope="col">Book</th>
							<th scope="col">Rating</th>
							<th scope="col">Headline</th>
							<th scope="col">Customer</th>
							<th scope="col">Review On</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${LIST_MOST_RECENT_REVIEWS}"
							varStatus="status">
							<tr>
								<th scope="row">${status.index + 1}</th>
								<td>${review.reviewId }</td>
								<td>${review.book.title }</td>
								<td>${review.rating }</td>
								<td>${review.headline }</td>
								<td>${review.customer.fullName }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd H:m"
										value="${review.reviewTime }" /></td>
								<td><a
									href="${pageContext.request.contextPath}/admin/reviews/edit-review?id=${review.reviewId }"
									class="btn btn-warning m-1"><i class="fas fa-edit"
										data-toggle="tooltip" title="Edit"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- End Main -->
		<jsp:include page="admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>