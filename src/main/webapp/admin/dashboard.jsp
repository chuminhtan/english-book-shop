<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="stylesheet.jsp" />

<title>Dashboard</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<!-- TITLE -->
	<h2
		class="text-info font-weight-bold text-uppercase text-center my-4">Dashboard</h2>
	<!-- QUICK ACTIONS -->
	<div class="jumbotron">
		<h1 class="display-4 text-info">Quick Actions</h1>
		<div>
			<a href="${pageContext.request.contextPath }/admin/users/create-user" class="btn btn-success">New User</a> <a href="${pageContext.request.contextPath }/admin/categories/create-category"
				class="btn btn-success">New Category</a> <a href="${pageContext.request.contextPath }/admin/books/create-book"
				class="btn btn-success">New Book</a> <a href="#"
				class="btn btn-success">New Customer</a>
		</div>
	</div>
	<!-- END QUICK ACTIONS -->

	<!-- RECENT SALES -->
	<div class="jumbotron">
		<h1 class="display-4 text-info">Recent Sales</h1>
		<table class="table table-striped">
			<thead class="thead-light">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Ordered by</th>
					<th scope="col">Book Copies</th>
					<th scope="col">Total</th>
					<th scope="col">Payment Method</th>
					<th scope="col">Status</th>
					<th scope="col">Order Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mr Tan</td>
					<td>3</td>
					<td>$138</td>
					<td>Cash On Delivery</td>
					<td>Shipping</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td>Mr Tan</td>
					<td>3</td>
					<td>$138</td>
					<td>Cash On Delivery</td>
					<td>Shipping</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td>Mr Tan</td>
					<td>3</td>
					<td>$138</td>
					<td>Cash On Delivery</td>
					<td>Shipping</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- END RECENT SALES -->

	<!-- RECENT REVIEWS -->
	<div class="jumbotron">
		<h1 class="display-4 text-info">Recent Reviews</h1>
		<table class="table table-striped">
			<thead class="thead-light">
				<tr>
					<th scope="col">Book</th>
					<th scope="col">Rating</th>
					<th scope="col">Headline</th>
					<th scope="col">Customer</th>
					<th scope="col">Review On</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Complete IELTS 4-5</td>
					<td>4.0</td>
					<td>Good</td>
					<td>Chu Minh Thy</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td>Complete IELTS 4-5</td>
					<td>4.0</td>
					<td>Good</td>
					<td>Chu Minh Thy</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td>Complete IELTS 4-5</td>
					<td>4.0</td>
					<td>Good</td>
					<td>Chu Minh Thy</td>
					<td>09/10/2021 12:43:21</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- END RECENT REVIEWS -->

	<!-- STATICTIS -->
	<div class="jumbotron">
		<h1 class="display-4 text-info">Statictis</h1>
		<div class="d-flex justify-content-lg-between">
			<span>Total Users: 12</span> <span>Total Books: 12</span> <span>Total
				Customers: 12</span> <span>Total Reviews: 12</span> <span>Total
				Orders: 12</span>
		</div>
	</div>
	<!-- END STATICTIS -->

	<!-- END MAIN -->

	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="admin-footer.jsp" />
