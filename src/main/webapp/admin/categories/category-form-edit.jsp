<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Create Book</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="category-management-title.jsp" />

		<!-- Main -->
		<!-- LIST -->
		<div class="jumbotron">
			<a href="." class="btn btn-primary"><i
				class="fas fa-arrow-left"></i> Back</a>
			<h2 class="text-primary my-4 text-center">Edit Category</h2>
			<!-- FORM -->
			<form action="edit-category" method="post">
				<div class="form-group">
					<label for="category-id">ID: </label> <span
						class="font-weight-bold">${CATEGORY.categoryId}</span>
				</div>
				<input type="text" name="category-id" id="category-id"
					value="${CATEGORY.categoryId }" style="display: none;">
				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="name"
						class="form-control" id="name" placeholder="Enter Name"
						minlength="2" maxlength="30" required value="${CATEGORY.name }">
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
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>