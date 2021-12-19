<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Edit Category</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2
		class="text-success font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i> Categories Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="." class="btn btn-info mb-2"><i
			class="fas fa-arrow-left"></i> Back</a>
		<h5 class="display-4 text-info text-center">Edit Category</h5>
		<!-- FORM -->
		<form action="edit-category" method="post">
			<div class="form-group">
				<label for="category-id">ID: </label>
				<span class="font-weight-bold">${CATEGORY.categoryId}</span>
			</div>
			<input type="text"
					name="category-id" id="category-id"
					value="${CATEGORY.categoryId }"
					style="display:none;"
					>
			<div class="form-group">
				<label for="name">Name</label> <input type="text"
					name="name" class="form-control" id="name"
					placeholder="Enter Name" minlength="2" maxlength="30" required
					value="${CATEGORY.name }">
			</div>
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-success m-1">Submit</button>
				<a href="." class="btn btn-warning m-1">Cancel</a>
			</div>
		</form>
		<c:if test="${MESSAGE_ERROR != null}">
			<div class="alert alert-danger mt-3" role="alert">
				<c:out value="${MESSAGE_ERROR }"></c:out>
			</div>
		</c:if>
	</div>
	<!-- END LIST -->

	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="../admin-footer.jsp" />