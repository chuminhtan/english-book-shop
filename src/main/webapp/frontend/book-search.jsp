<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Result</title>
<jsp:include page="../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<p class="display-4 text-center text-primary">
			<strong>Result</strong>
		</p>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<!----------------- Breadcrumb ----------------->
						<div class="card mb-2">
							<div class="card-body">
								<p>
									Keyword: <em>"${KEYWORD }"</em>
								</p>
								<c:if test="${empty LIST_BOOKS }">
									<p>Key word not found.</p>
								</c:if>
							</div>
						</div>
						<!-- End Breadcrumb -->
						<!-- ============================ COMPONENT IF NOT NULL ================================= -->
						<c:if test="${not empty LIST_BOOKS }">
							<c:forEach var="book" items="${LIST_BOOKS }">
								<jsp:directive.include file="book-group.jsp" />
							</c:forEach>
						</c:if>

						<!-- card-product .// -->
						<!-- ============================ COMPONENT IF NOT NULL .//END ================================= -->

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