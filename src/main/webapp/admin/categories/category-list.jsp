<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- HEAD & STYLESHEET -->
<jsp:include page="../stylesheet.jsp" />

<title>Categories Management</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="../admin-header.jsp"></jsp:include>

	<!-- BEGIN MAIN -->
	<h2
		class="text-success font-weight-bold text-uppercase text-center my-4">
		<i class="fas fa-category"></i> Categories Management
	</h2>
	<!-- LIST -->
	<div class="jumbotron">
		<a href="create-category" class="btn btn-success"><i
			class="fas fa-plus"></i> Create Category</a>
		<h5 class="display-4 text-info text-center">List Of Categories</h5>

		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">Index</th>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${LIST_CATEGORIES}" varStatus="status">
					<tr>
						<th scope="row">${status.index + 1}</th>
						<td>${category.categoryId }</td>
						<td>${category.name }</td>
						<td><a href="edit-category?id=${category.categoryId }"
							class="btn btn-warning m-1"><i class="fas fa-edit"
								data-toggle="tooltip" title="Edit"></i></a> <a
							href="javascript:confirmDelete('category',${category.categoryId },'delete-category')"
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
	function confirmDelete(type, id, action) {
		
	    if (id == 1) {
	        Swal.fire({
	            title: 'The default '+ type +' cannot be deleted',
	            icon: 'info'

	        })
	        
	        return
	    }
	    
	    Swal.fire({
	        title: 'Are you sure you want to delete?',
	        text: 'The ' + type + ' with ID ' + id + ' will be deleted',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes, delete it!'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            deleteWithGet(action, id)
	        }
	    })
	}

	async function deleteWithGet(action, id) {
	    const url = action + '?id=' + id;
	    const result = await sendGetData(url, id);

        Swal.fire({
	            title: result.MESSAGE,
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