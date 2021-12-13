<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Users Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2 class="text-success font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i> Users Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="list-users" class="btn btn-info mb-2"><i class="fas fa-arrow-left"></i>
			Back</a>
		<h5 class="display-4 text-info text-center">Create User</h5>
		<!-- FORM -->
		<form action="create-user" method="post">
			<div class="form-group">
				<label for="fullname">Full Name</label> <input type="text"
					name="full-name" class="form-control" id="full-name"
					placeholder="Enter Full Name" minlength="4" maxlength="30" required>
			</div>
			<div class="form-group">
				<label for="email">Email address</label> <input type="email"
					name="email" class="form-control" id="email"
					aria-describedby="emailHelp" placeholder="Enter email" minlength="6" maxlength="50" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" id="password" name="password"
					placeholder="Password" minlength="6" maxlength="30" required>
			</div>
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-success m-1">Submit</button>
				<a href="list-users" class="btn btn-warning m-1">Cancel</a>			
			</div>
		</form>
		<c:if test="${ERROR_MESSAGE != null}">
			<div class="alert alert-danger mt-3" role="alert"> <c:out value="${MESSAGE_ERROR }"></c:out></div>	
		</c:if>
	</div>
	<!-- END LIST -->

	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="../admin-footer.jsp" />