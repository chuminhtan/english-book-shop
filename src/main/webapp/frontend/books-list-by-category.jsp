<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${CATEGORY.name }</title>
<jsp:include page="../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<p class="display-6 text-info font-weight-bold">
							<strong>${CATEGORY.name }</strong>
						</p>
						<!----------------- Breadcrumb ----------------->
						<div class="card mb-2">
							<div class="card-body d-flex align-items-center">
								<nav class="flex-fill">
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a
											href="${pageContext.request.contextPath}">Home</a></li>
										<c:if test="${CATEGORY.categoryId == 0}">
											<li class="breadcrumb-item"><a href="all-books">${CATEGORY.name }</a></li>
										</c:if>
										<c:if test="${CATEGORY.categoryId != 0}">
											<li class="breadcrumb-item"><a
												href="view-category?id=${CATEGORY.categoryId }">${CATEGORY.name }</a></li>
										</c:if>

									</ol>
								</nav>
							</div>
						</div>
						<!-- End Breadcrumb -->

						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_BOOKS }">
							<jsp:directive.include file="book-group.jsp" />
						</c:forEach>
					</main>
				</div>
				<!-- row.// -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>