<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="/frontend/stylesheet.jsp" />
<title>404-Page Not Found</title>
</head>
<body>
	<jsp:include page="/frontend/header.jsp"></jsp:include>
	<div class="jumbotron text-center">
		<h3 class="text-info">Sorry, The page could not found.</h3>
		<a href="javascript:history.go(-1)" class="btn btn-primary">Go
			Back</a>
	</div>
	<!-- BEGIN FOOTER & SCRIPTS -->
	<jsp:include page="/frontend/footer.jsp"></jsp:include>