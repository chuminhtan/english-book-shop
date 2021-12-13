<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Users Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2
		class="text-success font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-user"></i> Users Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="create-user" class="btn btn-success"><i
			class="fas fa-plus"></i> Create User</a>
		<h5 class="display-4 text-info text-center">List Of Users</h5>

		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">Index</th>
					<th scope="col">ID</th>
					<th scope="col">Email</th>
					<th scope="col">Full Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${LIST_USERS}" varStatus="status">
					<tr>
						<th scope="row">${status.index + 1}</th>
						<td>${user.userId }</td>
						<td>${user.email }</td>
						<td>${user.fullName }</td>
						<td><a href="edit-user?id=${user.userId }"
							class="btn btn-warning m-1"><i class="fas fa-edit"
								data-toggle="tooltip" title="Edit"></i></a> <a
							href="javascript:confirmDelete(${user.userId },'user')"
							class="btn btn-danger m-1" data-toggle="tooltip" title="Delete"><i
								class="fas fa-trash-alt"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- END LIST -->
	<!-- FOOTER & SCRIPTS -->
	<jsp:include page="../admin-footer.jsp" />

	<script>
	function confirmDelete(id, type) {
		
	    if (id == 1) {
	        Swal.fire({
	            title: 'The default admin user account cannot be deleted',
	            icon: 'info'

	        })
	        
	        return
	    }
	    
	    Swal.fire({
	        title: 'Are you sure you want to delete?',
	        text: 'The' + type + ' with ID ' + id + ' will be deleted',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes, delete it!'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            deleteWithGet('delete-user', id)
	        }
	    })
	}

	async function deleteWithGet(action, id) {
	    const url = action + '?id=' + id;
	    const result = await sendGetData(url, id);

        Swal.fire({
	            title: result.message,
	            icon: 'info',
        }).then((result) => {
        	  if (Swal.DismissReason.backdrop) {
        		  window.location.reload();
        	  }
        	})	
	}

	async function sendGetData(url, id) {
	    const response = await fetch(url, {
	        method: 'GET',
	        mode: 'cors',
	        cache: 'no-cache',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        redirect: 'follow',
	        referrerPolicy: 'no-referrer',
	    });
	    return response.json();
	}
		
	</script>