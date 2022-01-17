<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>500 - Server Error</title>
<jsp:include page="../css/styles.jsp" />
</head>
<body>
	<jsp:include page="../frontend/header.jsp"></jsp:include>
	<jsp:include page="../frontend/categories.jsp"></jsp:include>
	<div class="container-fluid">
		<!-- Main -->
		<section class="section-content padding-y bg">
			<!------------------------------New Books---------------------------------------------->
			<div class="container text-center">
				<h3 class="text-info">Sorry, The page could not found.</h3>
				<br>
				<a href="${pageContext.request.contextPath }" class="btn btn-primary">Home Page</a>
			</div>
			<jsp:include page="../frontend/footer.jsp"></jsp:include>
		</section>
	</div>
</body>
</html>