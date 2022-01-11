<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Categories Management</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="category-management-title.jsp"></jsp:include>

		<!-- Main -->
	<div class="jumbotron">
		<a href="create-category" class="btn btn-primary"><i
			class="fas fa-plus"></i> Create Category</a>
			
		<h2 class="text-primary my-4 text-center">List Of Categories</h2>
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Index</th>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="category" items="${LIST_CATEGORIES}"
						varStatus="status">
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
	</div>
		<!-- End Main -->
		<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
</body>
</html>