<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Users Management</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="user-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="jumbotron">
			<a href="javascript:history.go(-1)" class="btn btn-primary mb-2"><i
				class="fas fa-arrow-left"></i> Back</a>
			<h2 class="text-primary my-4 text-center">Edit User</h2>
			<!-- FORM -->
			<form action="edit-user" method="post">
				<div class="form-group">
					<label for="user-id">ID: </label> <span class="font-weight-bold">${USER.userId}</span>
				</div>
				<input type="text" name="user-id" id="user-id"
					value="${USER.userId }" style="display: none;">
				<div class="form-group">
					<label for="fullname">Full Name</label> <input type="text"
						name="full-name" class="form-control" id="full-name"
						placeholder="Enter Full Name" minlength="4" maxlength="30"
						required value="${USER.fullName }">
				</div>
				<div class="form-group">
					<label for="email">Email address</label> <input type="email"
						name="email" class="form-control" id="email"
						aria-describedby="emailHelp" placeholder="Enter email"
						minlength="6" maxlength="50" required value="${USER.email}">
				</div>
				<div class="form-group">
					<input type="checkbox" id="check-change-password" />&nbsp;Change Password		
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="Password" minlength="6" maxlength="30" required
						value="" disabled>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-success m-1">Submit</button>
					<a href="javascript:history.go(-1)" class="btn btn-warning m-1">Cancel</a>1">Cancel</a>
				</div>
			</form>
			<c:if test="${MESSAGE_ERROR != null}">
				<div class="alert alert-danger mt-3" role="alert">
					<c:out value="${MESSAGE_ERROR }"></c:out>
				</div>
			</c:if>
		</div>
		<!-- End Main -->
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
<script>
	const password = document.getElementById("password");
	const checkedChangePassword = document.getElementById("check-change-password");
	checkedChangePassword.addEventListener("change", (e) => {
		if (event.currentTarget.checked) {
			password.disabled = false;
			} 
		else {
			password.disabled = true;
		}
	});
</script>
</html>