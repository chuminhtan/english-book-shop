<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Place Order Success</title>
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

					<img src="${pageContext.request.contextPath }/images/icon-ok.png"
						alt="success" width="80" />

					<p>Thank you! Your order #${CREATED_ORDER.orderId } has been
						received. We will contact to you soon.</p>

					<a class="btn btn-info"
						href="${pageContext.request.contextPath }/customer/order?id=${CREATED_ORDER.orderId }">See
						Order Details #${CREATED_ORDER.orderId }</a> <a
						class="btn btn-primary" href="${pageContext.request.contextPath }">Continue
						To Shopping</a>
					<!-- FORM -->

				</div>
			</div>
		</section>
		<!-- End Main -->

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>