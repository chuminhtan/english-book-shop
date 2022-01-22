<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
<jsp:include page="../../css/styles.jsp" />

</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../header.jsp"></jsp:include>

		<p class="display-4 text-center text-primary">
			<strong>${CATEGORY.name }</strong>
		</p>

		<!-- Main -->
		<section class="section-content padding-y bg">
			<div class="container">
				<div class="row">

					<!--   SIDEBAR   -->
					<aside class="col-md-3">
						<!--   SIDEBAR   -->
						<ul class="list-group">
							<a class="list-group-item active"
								href="${pageContext.request.contextPath }/customer/customer-profile">Profile
								Setting</a>
							<a class="list-group-item"
								href="${pageContext.request.contextPath }/customer/view-orders">My
								Orders</a>
						</ul>
						<!--   SIDEBAR .//END   -->
					</aside>
					<!--   SIDEBAR .//END   -->

					<!-- MAIN -->
					<main class="col-md-9">
						<article class="card">
							<header class="card-header">
								<span class="text-primary font-weight-bold">Email: </span><strong
									class="d-inline-block mr-3"> ${LOGGED_CUSTOMER.email}</strong>
								<span class="text-primary font-weight-bold">Your ID:</span><span>
									${LOGGED_CUSTOMER.customerId }</span>
							</header>
							<div class="card-body">
								<!-- form -->
								<form
									action="${pageContext.request.contextPath }/customer/customer-profile"
									method="POST">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputPhone" class="text-primary font-weight-bold">Phone</label>
											<input type="text" class="form-control" id="inputPhone"
												name="phone" placeholder="Your Phone"
												value="${LOGGED_CUSTOMER.phone }">
										</div>
										<div class="form-group col-md-6">
											<label for="inputFullName"
												class="text-primary font-weight-bold">Full Name</label> <input
												type="text" class="form-control" id="inputFullName"
												name="full-name" placeholder="Your Name"
												value="${LOGGED_CUSTOMER.fullName }">
										</div>
									</div>
									<div class="form-group">
										<label for="inputAddress2"
											class="text-primary font-weight-bold">Address</label> <input
											type="text" class="form-control" id="inputAddress2"
											name="address" placeholder="Apartment, studio, or floor"
											value="${LOGGED_CUSTOMER.address }">
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputCity" class="text-primary font-weight-bold">City</label>
											<input type="text" placeholder="City" class="form-control"
												id="inputCity" name="city" value="${LOGGED_CUSTOMER.city }">
										</div>
										<div class="form-group col-md-2">
											<label for="inputZip" class="text-primary font-weight-bold">Zip</label>
											<input type="text" class="form-control" id="inputZip"
												name="zip-code" placeholder="Zip Code"
												value="${LOGGED_CUSTOMER.zipCode }" required>
										</div>
										<div class="form-group col-md-4">
											<label for="input-country"
												class="text-primary font-weight-bold">Country</label> <input
												type="text" input-country" class="form-control"
												placeholder="Country" name="country"
												value="${LOGGED_CUSTOMER.country }" required>
										</div>
									</div>
									<div class="form-group">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="check-change-password"> <label
												class="form-check-label" for="check-change-password">
												Change Password</label>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<div class="form-group">
												<label for="password" class="text-primary font-weight-bold">New
													Password</label> <input type="password"
													placeholder="Enter Password" id="password"
													class="form-control" name="password" minlength="2"
													maxlength="100" disabled>
											</div>

										</div>
										<div class="form-group col-md-6">
											<div class="form-group">
												<label for="password-confirm"
													class="text-primary font-weight-bold">Confirm New
													Password</label> <input placeholder="Confirm Password"
													type="password" id="password-confirm" class="form-control"
													name="password-confirm" minlength="2" maxlength="100"
													disabled value="">
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-primary m-1">Update
											Your Profile</button>
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
						<!-- order-group.// -->
					</main>
					<!-- MAIN .// END -->
				</div>
				<!-- row.// -->
			</div>
			<!-- container .//  -->
		</section>
		<!-- End Main -->
		<jsp:include page="../footer.jsp"></jsp:include>
	</div>

	<!-- Change Password -->
	<script>
	const password = document.getElementById("password");
	const passwordConfirm = document.getElementById("password-confirm");
	const checkedChangePassword = document.getElementById("check-change-password");
	checkedChangePassword.addEventListener("change", (e) => {
		if (event.currentTarget.checked) {
			password.disabled = false;
			passwordConfirm.disabled = false;
			} 
		else {
			password.disabled = true;
			passwordConfirm.disabled = true;
		}
	})
</script>
</body>
</html>