<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Login</title>
<jsp:include page="stylesheet.jsp" />
</head>
<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div
								class="col-lg-6 d-flex justify-content-center align-items-center">
								<p style="font-size: 2rem; background: -webkit-linear-gradient(#1cc88a, #224abe); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: bold;">English Book Shop</p>
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Login</h1>
									</div>
									<form class="user" method="POST"
										action="login">
										<div class="form-group">
											<input type="email" name="email"
												class="form-control form-control-user" id="user_email"
												aria-describedby="emailHelp" required
												placeholder="Enter Email...">
										</div>
										<div class="form-group">
											<input type="password" name="password"
												class="form-control form-control-user" id="user_password"
												required placeholder="Enter password...">
										</div>

										<button type="submit"
											class="btn btn-primary btn-user btn-block">Login
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="scripts.jsp" />

</body>