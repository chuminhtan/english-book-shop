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
	<div class="container-fluid">
		<jsp:include page="../frontend/header.jsp"></jsp:include>
		<div class="jumbotron text-center">
			<h3 class="text-info">The server has encountered errors. Please
				try later.</h3>
		</div>
		<jsp:include page="../frontend/footer.jsp"></jsp:include>
	</div>
</body>
</html>