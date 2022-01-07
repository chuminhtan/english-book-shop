<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container my-5">
	<h4 class="text-center my-5">Book Categories</h4>
	<div class="row d-flex justify-content-center">
		<c:forEach items="${LIST_CATEGORIES}" var="category">
			<a href="view-category?id=${category.categoryId }"
				class="btn btn-primary m-1">${category.name } Book</a>
		</c:forEach>
	</div>
</div>