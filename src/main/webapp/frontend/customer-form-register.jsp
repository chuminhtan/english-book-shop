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

				<!-- ==================== CARD ============================== -->
				<article class="card">
					<div class="card-body">
						<p class="display-6 font-weight-bold text-info mb-5 text-center">Register New
							Account</p>
						<!-- form -->
						<form action="${pageContext.request.contextPath }/register"
							method="POST">
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputFullName"
										class="text-primary font-weight-bold">Full Name</label> <input
										type="text" class="form-control" id="inputFullName"
										name="full-name" placeholder="Your Name"
										value="${CUSTOMER.fullName }">
								</div>
								<div class="form-group col-md-2">
									<label for="inputPhone" class="text-primary font-weight-bold">Phone</label>
									<input type="text" class="form-control" id="inputPhone"
										name="phone" placeholder="Your Phone"
										value="${CUSTOMER.phone }">
								</div>

								<div class="form-group col-md-6">
									<label for="inputAddress2"
										class="text-primary font-weight-bold">Address</label> <input
										type="text" class="form-control" id="inputAddress2"
										name="address" placeholder="Apartment, studio, or floor"
										value="${CUSTOMER.address }">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity" class="text-primary font-weight-bold">City</label>
									<input type="text" placeholder="City" class="form-control"
										id="inputCity" name="city" value="${CUSTOMER.city }">
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip" class="text-primary font-weight-bold">Zip</label>
									<input type="text" class="form-control" id="inputZip"
										name="zip-code" placeholder="Zip Code"
										value="${CUSTOMER.zipCode }" required>
								</div>
								<div class="form-group col-md-4">
									<label for="input-country"
										class="text-primary font-weight-bold">Country</label> <input
										type="text" input-country" class="form-control"
										placeholder="Country" name="country"
										value="${CUSTOMER.country }" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<div class="form-group">
										<label for="email" class="text-primary font-weight-bold">Email</label>
										<input placeholder="Email" type="email" id="email"
											class="form-control" name="email" minlength="2"
											maxlength="100" value="${CUSTOMER.email }" required>
									</div>
								</div>
								<div class="form-group col-md-4">
									<div class="form-group">
										<label for="password" class="text-primary font-weight-bold">New
											Password</label> <input type="password" placeholder="Enter Password"
											id="password" class="form-control" name="password"
											minlength="2" maxlength="100" required>
									</div>

								</div>
								<div class="form-group col-md-4">
									<div class="form-group">
										<label for="password-confirm"
											class="text-primary font-weight-bold">Confirm New
											Password</label> <input placeholder="Confirm Password"
											type="password" id="password-confirm" class="form-control"
											name="password-confirm" minlength="2" maxlength="100"
											value="" required>
									</div>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button type="submit" class="btn btn-success m-1">Register</button>
								<a href="${pageContext.request.contextPath }" class="btn btn-warning m-1">Cancel</a>
							</div>
						</form>
						<!-- form.// -->
						<c:if test="${ERROR_MESSAGE != null}">
							<div class="alert alert-danger mt-3" role="alert">
								<c:out value="${ERROR_MESSAGE}"></c:out>
							</div>
						</c:if>
					</div>
					<!-- card-body .// -->

				</article>
			</div>
		</section>
		<!-- End Main -->

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>