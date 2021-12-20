<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Categories Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2
		class="text-success font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-category"></i> Categories Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="create-category" class="btn btn-success"><i
			class="fas fa-plus"></i> Create Category</a>
		<h5 class="display-4 text-info text-center">List Of Categories</h5>

		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">Index</th>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${LIST_CATEGORIES}" varStatus="status">
					<tr>
						<th scope="row">${status.index + 1}</th>
						<td>${category.categoryId }</td>
						<td>${category.name }</td>
						<td><a href="edit-category?id=${category.categoryId }"
							class="btn btn-warning m-1"><i class="fas fa-edit"
								data-toggle="tooltip" title="Edit"></i></a> <a
							href="javascript:confirmDelete('category',${category.categoryId },'delete-category')"
							class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i
								class="fas fa-trash-alt"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- END LIST -->
	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="../admin-footer.jsp" />