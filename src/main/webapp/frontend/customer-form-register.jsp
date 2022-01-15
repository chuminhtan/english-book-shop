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
				<div class="jumbotron">
					<h2 class="text-primary my-4 text-center">Register New Account</h2>
					<!-- FORM -->
					<form action="register" method="post">
						<div class="form-group">
							<label for="email">E-mail</label> <input type="text" name="email"
								class="form-control" placeholder="Enter Email" minlength="2"
								maxlength="100" value="${CUSTOMER.email }">
						</div>
						<div class="form-group">
							<label for="full-name">Full Name</label> <input type="text"
								name="full-name" class="form-control" id="author"
								placeholder="Enter Full Name" minlength="2" maxlength="100"
								value="${CUSTOMER.fullName }" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								placeholder="Enter Password" class="form-control"
								name="password" minlength="2" maxlength="100" required value="">
						</div>
						<div class="form-group">
							<label for="password-confirm">Confirm Password</label> <input
								placeholder="Confirm Password" type="password"
								class="form-control" name="password-confirm" minlength="2"
								maxlength="100" required value="">
						</div>
						<div class="form-group">
							<label for="phone">Phone Number</label> <input type="text"
								placeholder="Enter Phone Number" class="form-control"
								name="phone" minlength="10" maxlength="20" required
								value="${CUSTOMER.phone }">
						</div>
						<div class="form-group">
							<label for="address">Address</label> <input type="text"
								placeholder="Enter Address" class="form-control" name="address"
								minlength="10" maxlength="100" required
								value="${CUSTOMER.address }">
						</div>
						<div class="form-group">
							<label for="city">City</label> <input type="text"
								placeholder="Enter City" class="form-control" name="city"
								minlength="5" maxlength="50" required value="${CUSTOMER.city }">
						</div>
						<div class="form-group">
							<label for="zip-code">Zip Code</label> <input type="text"
								placeholder="Enter Zip Code" class="form-control"
								name="zip-code" minlength="2" maxlength="20" required
								value="${CUSTOMER.zipCode }">
						</div>
						<div class="form-group">
							<label for="country">Country</label> <input type="text"
								placeholder="Enter Country" class="form-control" name="country"
								minlength="2" maxlength="20" required
								value="${CUSTOMER.country }">
						</div>
						<div class="d-flex justify-content-center">
							<button type="submit" class="btn btn-success m-1">Submit</button>
							<a href="javascript:history.go(-1)" class="btn btn-warning m-1">Cancel</a>
						</div>
					</form>
					<c:if test="${ERROR_MESSAGE != null}">
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