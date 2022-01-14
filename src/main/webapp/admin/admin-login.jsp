<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Login</title>
<jsp:include page="../css/styles.jsp" />
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
								<p
									style="font-size: 2rem; background: -webkit-linear-gradient(#1cc88a, #224abe); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: bold;">English
									Book Shop</p>
							</div>
							<div class="col-lg-6 p-5">
								<form method="post" action="login">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email
											address</label> <input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											name="email">
									</div>
									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input type="password" class="form-control"
											id="exampleInputPassword1" name="password">
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<jsp:include page="admin-footer.jsp"></jsp:include>
	</div>
</body>