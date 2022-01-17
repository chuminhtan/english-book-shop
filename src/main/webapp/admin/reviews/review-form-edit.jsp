<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Edit Review</title>
</head>
<body>
	<div class="container-fluid">

		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="review-management-title.jsp" />

		<div class="jumbotron">
			<a href="javascript:history.back()" class="btn btn-primary"><i
				class="fas fa-arrow-left"></i> Back</a>
			<h2 class="text-primary my-4 text-center">Edit Review</h2>

			<!-- FORM -->
			<form action="edit-review" method="post">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="review-id">ID</label> <input type="text"
							name="review-id" class="form-control" id="review-id"
							value="${REVIEW.reviewId }" readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="rating">Rating</label> <input type="text"
							name="rating" class="form-control" id="review-id"
							value="${REVIEW.rating }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="book-title">Book</label> <input type="text"
						class="form-control" id="book-title" value="${REVIEW.book.title }"
						readonly>
				</div>
				<div class="form-group">
					<label for="customer-full-name">Customer</label> <input type="text"
						class="form-control" id="customer-full-name"
						value="${REVIEW.customer.fullName }" readonly>
				</div>
				<div class="form-group">
					<label for="headline">Headline</label> <input type="text"
						name="headline" class="form-control" id="headline"
						placeholder="Enter Headline" minlength="2" maxlength="100"
						required value="${REVIEW.headline }">
				</div>
				<div class="form-group">
					<label for="comment">Comment</label>
					<textarea name="comment" class="form-control content" id="comment"
						placeholder="Enter Comment" minlength="2" maxlength="500" required>${REVIEW.comment }</textarea>
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" class="btn btn-success m-1">Submit</button>
					<a href="javascript:history.go(-1)" class="btn btn-warning m-1">Cancel</a>
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