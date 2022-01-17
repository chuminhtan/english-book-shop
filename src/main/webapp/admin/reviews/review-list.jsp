<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Reviews Management</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="review-management-title.jsp"></jsp:include>

		<!-- Main -->
		<div class="jumbotron">

			<h2 class="text-primary my-4 text-center">List Of Reviews</h2>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Index</th>
							<th scope="col">ID</th>
							<th scope="col">Book</th>
							<th scope="col">Rating</th>
							<th scope="col">Headline</th>
							<th scope="col">Customer</th>
							<th scope="col">Review On</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${LIST_REVIEWS}" varStatus="status">
							<tr>
								<th scope="row">${status.index + 1}</th>
								<td>${review.reviewId }</td>
								<td>${review.book.title }</td>
								<td>${review.rating }</td>
								<td>${review.headline }</td>
								<td>${review.customer.fullName }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd H:m"
										value="${review.reviewTime }" /></td>
								<td><a href="edit-review?id=${review.reviewId }"
									class="btn btn-warning m-1"><i class="fas fa-edit"
										data-toggle="tooltip" title="Edit"></i></a> <a
									href="javascript:confirmDelete('review',${review.reviewId },'delete-review')"
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