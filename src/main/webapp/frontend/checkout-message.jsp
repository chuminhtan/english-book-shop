<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Checkout Message</title>
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

					<img src="${pageContext.request.contextPath }/images/icon-fail.png"
						alt="message" width="80" />

					<c:if test="${MESSAGE_LOGIN != NULL}">
						<p>Oop! You must login to checkout . Please register an
							account if you do not have account.</p>
						<a class="btn btn-info"
							href="${pageContext.request.contextPath }/register">Register</a>

						<!-- FORM -->
					</c:if>
					<c:if test="${MESSAGE_CART != NULL}">
						<p>Oop! You can not checkout the empty cart.</p>
						<a class="btn btn-info" href="${pageContext.request.contextPath }">Continue
							Shopping</a>
						<!-- FORM -->
					</c:if>
					<a class="btn btn-primary"
						href="${pageContext.request.contextPath }">Return Home Page</a>
				</div>
			</div>
		</section>
		<!-- End Main -->

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>