<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Order No.${ORDER.orderId }</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="order-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="container">
			<div class="jumbotron">
			<a href="javascript:history.back()" class="btn btn-outline-primary"><i
				class="fas fa-arrow-left"></i> Back</a>
				<h2 class="text-primary my-4 text-center">Details of Order ID
					${ORDER.orderId }</h2>
				<!-- ================ TABLE OVERVIEW ======================= -->
				<h4>Overview</h4>
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
				<h4>Ordered Books</h4>
				<div class="table-responsive">
					<table class="table table-hover table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Index</th>
								<th scope="col">Book Title</th>
								<th scope="col">Author</th>
								<th scope="col">Price</th>
								<th scope="col">Quantity</th>
								<th scope="col">Sub Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderDetail" items="${ORDER.orderDetails }"
								varStatus="status">
								<tr>
									<th>${status.index + 1 }</th>
									<th>${orderDetail.book.title }</th>
									<td>${orderDetail.book.author }</td>
									<td><fmt:formatNumber value="${orderDetail.book.price }"
											type="currency" /></td>
									<td>${orderDetail.quantity }</td>
									<td><fmt:formatNumber value="${orderDetail.subtotal }"
											type="currency" /></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="4">TOTAL:</td>
								<td>${ORDER.bookCopies }</td>
								<td>${ORDER.total}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- =================== TABLE ODERED BOOKS .//END ====================== -->
				<div class="text-center">
					<a href="edit-order?id=${order.orderId }"
						class="btn btn-warning m-1"><i class="fas fa-edit"
						data-toggle="tooltip" title="Edit"></i> Edit Order</a> <a
						href="javascript:confirmDelete('order',${order.orderId },'delete-order')"
						class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i
						class="fas fa-trash-alt"></i> Delete Order</a>
				</div>
			</div>
			<!-- End Main -->
		</div>
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>