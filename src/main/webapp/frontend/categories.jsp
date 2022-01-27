<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container my-3">
	<h4 class="text-center my-2 text-info">Categories</h4>
	<div class="row d-flex justify-content-center">
		<a href="${pageContext.request.contextPath }/all-books" class="btn btn-outline-primary m-1">All</a>
		<c:forEach items="${LIST_CATEGORIES}" var="category">
			<a href="${pageContext.request.contextPath }/view-category?id=${category.categoryId }"
				class="btn btn-outline-primary m-1">${category.name }</a>
		</c:forEach>
	</div>
</div>