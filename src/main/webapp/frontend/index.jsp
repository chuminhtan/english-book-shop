<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>The English Book Shop</title>
<jsp:include page="../css/styles.jsp" />
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="categories.jsp"></jsp:include>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<!------------------------------New Books---------------------------------------------->
			<div class="container mb-5">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<p class="display-4  text-info">
							<strong>New Books</strong>
						</p>
						<c:forEach var="book" items="${LIST_NEW_BOOKS }">
							<jsp:directive.include file="book-group.jsp" />
						</c:forEach>
					</main>
				</div>
				<!-- row.// -->
			</div>
			<!-- container New Books.//  -->

			<!------------------------------Best-selling Books---------------------------------------------->
			<div class="container my-5">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<p class="display-4  text-info">
							<strong>Best-selling Books</strong>
						</p>
						<c:forEach var="book" items="${LIST_BEST_SELLING_BOOKS }">
							<jsp:directive.include file="book-group.jsp" />
						</c:forEach>
					</main>
				</div>
			</div>
			<!--======================== container best-selling book.//  =========================================-->

			<!------------------------------MOST-FAVORED BOOKS---------------------------------------------->
			<div class="container my-4">
				<div class="row d-flex justify-content-center">
					<main class="col-md-10">
						<p class="display-4  text-info">
							<strong>Most-Favored Books</strong>
						</p>
						<!-- ============================ COMPONENT ================================= -->
						<c:forEach var="book" items="${LIST_MOST_FAVORED_BOOKS }">
							<jsp:directive.include file="book-group.jsp" />
						</c:forEach>

						<!-- card-product .// -->
						<!-- ============================ COMPONENT 3 .//END ================================= -->
					</main>
				</div>
				<!-- row.// -->
			</div>
			<!-- MOST-FAVORED BOOKS .// END  -->
		</section>
		<!-- End Main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>