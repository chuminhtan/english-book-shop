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
		<h3 class="text-info">Sorry, The page could not found.</h3>
		<a href="javascript:history.go(-1)" class="btn btn-primary">Go
			Back</a>
		<jsp:include page="../frontend/footer.jsp"></jsp:include>
	</div>
</body>
</html>