<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Create User</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="user-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="jumbotron">
			<a href="javascript:history.go(-1)" class="btn btn-outline-info mb-2"><i
				class="fas fa-arrow-left"></i> Back</a>
			<h2 class="text-info my-4 text-center">Create User</h2>
			<!-- FORM -->
			<form action="create-user" method="post">
				<div class="form-group">
					<label for="fullname">Full Name</label> <input type="text"
						name="full-name" class="form-control" id="full-name"
						placeholder="Enter Full Name" minlength="4" maxlength="30"
						required>
				</div>
				<div class="form-group">
					<label for="email">Email address</label> <input type="email"
						name="email" class="form-control" id="email"
						aria-describedby="emailHelp" placeholder="Enter email"
						minlength="6" maxlength="50" required>
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="Password" minlength="6" maxlength="30" required>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-success m-1">Submit</button>
					<a href="." class="btn btn-warning m-1">Cancel</a>
				</div>
			</form>
			<c:if test="${ERROR_MESSAGE != null}">
				<div class="alert alert-danger mt-3" role="alert">
					<c:out value="${ERROR_MESSAGE}"></c:out>
				</div>
			</c:if>
		</div>
		<!-- End Main -->
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>