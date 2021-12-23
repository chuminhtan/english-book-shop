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
	<h2 class="text-info font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i> Books Management
	</h2>
	<!-- FORM CREATE -->
	<div class="jumbotron">
		<a href="." class="btn btn-info mb-2"><i class="fas fa-arrow-left"></i>
			Back</a>
		<h5 class="display-4 text-success text-center">Create Book</h5>
		<!-- FORM -->
		<form action="create-book" method="post">
			<div class="form-group">
				<label class="my-1 mr-2" for="category">Category</label> <select
					class="custom-select my-1 mr-sm-2" name="category" id="category">


					<c:forEach items="${LIST_CATEGORIES}" var="category">
						<option value="${category.categoryId }">${category.name }</option>
					</c:forEach>

				</select>
			</div>
			<div class="form-group">
				<label for="title">Title</label> <input type="text" name="title"
					class="form-control" id="title" placeholder="Enter Title"
					minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label for="author">Author</label> <input type="text" name="author"
					class="form-control" id="author" placeholder="Enter Author"
					minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label for="isbn">ISBN</label> <input type="text"
					class="form-control" id="isbn" name="isbn" placeholder="Enter ISBN"
					minlength="2" maxlength="100" required>
			</div>
			<div class="form-group">
				<label for="publish-date">Publish Date</label> <input
					class="form-control" type="date" name="publish-date"
					placeholder="dd-mm-yyyy" value="2021-12-31" min="1997-01-01"
					max="2021-12-31">
			</div>
			<div class="form-group">
				<label for="image">Image</label> <input type="file"
					class="form-control" id="image-file" name="image" accept="image/*">
					<img id="image-preview" src="" height="200"/>
			</div>
			<div class="form-group">
				<label for="price">Price</label> <input type="number"
					class="form-control" id="price" name="price"
					placeholder="Enter Price" minlength="1" maxlength="100" required>
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="3"></textarea>
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
	<!-- END LIST -->

	<!-- FOOTER & SCRIPTS -->
	<script>
		const imageFile = document.getElementById("image-file");
		const imagePreview = document.getElementById("image-preview");

		imageFile.onchange = (evt) => {
			  const [file] = imageFile.files
			  if (file) {
			    imagePreview.src = URL.createObjectURL(file)
			  }
		}
	
	</script>
	<jsp:include page="../admin-footer.jsp" />