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
			<div class="container">
				<div class="jumbotron text-center">

						<img src="${pageContext.request.contextPath }/images/icon-ok.png" alt="success" width="80"/>

					<p>Congratulation! Your account has been created.</p>
					<a class="btn btn-primary" href="${pageContext.request.contextPath }">Return Home Page</a>
					<!-- FORM -->
					
					<c:if test="${MESSAGE != null}">
						<div class="alert alert-danger mt-3" role="alert">
							<c:out value="${ERROR_MESSAGE}"></c:out>
						</div>
					</c:if>
				</div>
			</div>
		</section>
		<!-- End Main -->

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>