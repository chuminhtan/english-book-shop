<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="stylesheet.jsp" />

<title>Users Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2 class="text-info font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i>
		Users Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="" class="btn btn-success mb-2"><i class="fas fa-plus"></i> New User</a>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">Index</th>
					<th scope="col">ID</th>
					<th scope="col">Email</th>
					<th scope="col">Full Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>				
				<c:forEach var="user" items="${LIST_USERS}" varStatus="status">
					<tr>
						<th scope="row">${status.index + 1}</th>
						<td>${user.userId }</td>
						<td>${user.email }</td>
						<td>${user.fullName }</td>
						<td>
							<a href=""class="btn btn-warning m-1"><i class="fas fa-edit" data-toggle="tooltip" title="Edit"></i></a>
							<a href="" class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i class="fas fa-trash-alt"></i></a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- END LIST -->

	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="admin-footer.jsp" />