<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Customers Management</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="customer-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="jumbotron">
			<a href="create-user" class="btn btn-primary"><i
				class="fas fa-plus"></i> Create Customers</a>

			<h2 class="text-primary my-4 text-center">List Of Customers</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Index</th>
							<th scope="col">ID</th>
							<th scope="col">Email</th>
							<th scope="col">Full Name</th>
							<th scope="col">City</th>
							<th scope="col">Country</th>
							<th scope="col">Registered Date</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="customer" items="${LIST_CUSTOMERS}" varStatus="status">
							<tr>
								<th scope="row">${status.index + 1}</th>
								<td>${customer.customerId }</td>
								<td>${customer.email }</td>
								<td>${customer.fullName }</td>
								<td>${customer.city }</td>
								<td>${customer.country }</td>
								<td>${customer.registerDate }</td>
								<td><a href="edit-user?id=${customer.customerId  }"
									class="btn btn-warning m-1"><i class="fas fa-edit"
										data-toggle="tooltip" title="Edit"></i></a> <a
									href="javascript:confirmDelete('customer',${customer.customerId  },'delete-customer')"
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