<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Orders Management</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="order-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="jumbotron">

			<h2 class="text-primary my-4 text-center">List Of Orders</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Index</th>
							<th scope="col">Order ID</th>
							<th scope="col">Order By</th>
							<th scope="col">Book Copies</th>
							<th scope="col">Total</th>
							<th scope="col">Payment Method</th>
							<th scope="col">Status</th>
							<th scope="col">Order Date</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="order" items="${LIST_ORDERS}" varStatus="status">
							<tr>
								<th scope="row">${status.index + 1}</th>
								<th scope="row">${order.orderId}</th>
								<td>${order.customer.fullName }</td>
								<td>${order.bookCopies }</td>
								<td>${order.total }</td>
								<td>${order.paymentMethod }</td>
								<td>${order.status}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd H:m"
										value="${order.orderDate}" /></td>
								<td><a href="order-detail?id=${order.orderId }"
									class="btn btn-info m-1"><i class="fas fa-shopping-bag"
										data-toggle="tooltip" title="Detail"></i></a>
								<a href="edit-order?id=${order.orderId }"
									class="btn btn-warning m-1"><i class="fas fa-edit"
										data-toggle="tooltip" title="Edit"></i></a> <a
									href="javascript:confirmDelete('order',${order.orderId },'delete-order')"
									class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i
										class="fas fa-trash-alt"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- End Main -->
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>