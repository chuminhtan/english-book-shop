<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="stylesheet.jsp" />

<title>Users Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2 class="text-info font-weight-bold text-uppercase text-center my-4">Users
		Management</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="" class="btn btn-success mb-2">New User</a>
		<table class="table table-striped">
			<thead class="thead-light">
				<tr>
					<th scope="col">Index</th>
					<th scope="col">ID</th>
					<th scope="col">Email</th>
					<th scope="col">Full name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>3</td>
					<td>minhtan@gmail.com</td>
					<td>Mr Tan</td>
					<td><a href="" class="btn btn-danger m-1"
						data-toggle="tooltip" title="Delete"><i
							class="fas fa-trash-alt"></i></a> <a href=""
						class="btn btn-warning m-1"><i class="fas fa-edit"
							data-toggle="tooltip" title="Edit"></i></a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- END LIST -->

	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="admin-footer.jsp" />