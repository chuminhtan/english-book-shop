<!DOCTYPE html>
<html lang="en">
<head>
<title>The English Book Shop</title>
<jsp:include page="stylesheet.jsp" />
</head>
<body>
	<div class="row justify-content-center">
		<div class="col-md-6 col-sm-3">
			<div class="jumbotron">
				<h3 class="text-info">Admin Login</h3>
				<hr class="my-4">
				<form action="login">
					<div class="form-group">
						<label for="email">Email address</label> <input type="email"
							name="email" class="form-control" id="email"
							aria-describedby="emailHelp" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							class="form-control" id="password" name="password"
							placeholder="Password">
					</div>
					<button type="submit" class="btn btn-success">Submit</button>
				</form>
				<div class="alert alert-danger mt-3" role="alert">Incorrect
					Email or Password</div>
			</div>
		</div>
	</div>
	<jsp:include page="admin-footer.jsp" />