<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Books Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2
		class="text-info font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i> Books Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="create-book" class="btn btn-success"><i
			class="fas fa-plus"></i> Create Book</a>
		<h5 class="display-4 text-success text-center">List Of Books</h5>
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Index</th>
						<th scope="col">ID</th>
						<th scope="col">Image</th>
						<th scope="col">Title</th>
						<th scope="col">Author</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Last Updated</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${LIST_BOOKS}" varStatus="status">
						<tr>
							<th scope="row">${status.index + 1}</th>
							<td>${book.bookId }</td>
							<td><img src="data:image/png; base64, ${book.imageBase64 }" alt="${book.title }" width="80"/></td>
							<td>${book.title }</td>
							<td>${book.author }</td>
							<td>${book.category.name }</td>
							<td>${book.price }$</td>
							<td>${book.lastUpdateTime }</td>
							<td><a href="edit-book?id=${book.bookId }"
								class="btn btn-warning m-1"><i class="fas fa-edit"
									data-toggle="tooltip" title="Edit"></i></a> <a
								href="javascript:confirmDelete('book',${book.bookId },'delete-book')"
								class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i
									class="fas fa-trash-alt"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- END LIST -->
	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="../admin-footer.jsp" />