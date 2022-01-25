<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../css/styles.jsp" />
<title>Edit Order No.${ORDER.orderId }</title>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="../admin-header.jsp"></jsp:include>
		<jsp:include page="order-management-title.jsp"></jsp:include>
		<!-- ================== FORM ============================== -->
		<form action="edit-order" method="post" id="form-update">
			<!-- Main -->
			<div class="container">
				<div class="cart">
					<div class="cart-body">
						<a href="javascript:history.back()"
							class="btn btn-outline-primary"><i class="fas fa-arrow-left"></i>
							Back</a>
						<h2 class="text-primary my-4 text-center">Edit Order ID
							${ORDER.orderId }</h2>



						<input type="hidden" name="order-id" value="${ORDER.orderId }" />
						<!-- ================ SHIPPING INFOMATION ======================= -->
						<h4 class="text-primary">Shipping Infomation</h4>
						<div class="table-responsive mb-2">
							<table class="table table-hover table-striped">
								<tbody>
									<tr>
										<th>Ordered by</th>
										<td>${ORDER.customer.fullName }</td>
									</tr>
									<tr>
										<th>Book Copies</th>
										<td>${ORDER.bookCopies}</td>
									</tr>
									<tr>
										<th>Recipient Name</th>
										<td><input type="text" name="recipient-name"
											class="form-control" placeholder="Enter Here" minlength="2"
											maxlength="100" value="${ORDER.recipientName}"></td>
									</tr>
									<tr>
										<th>Recipient Phone</th>
										<td><input type="text" name="recipient-phone"
											class="form-control" placeholder="Enter Here" minlength="10"
											maxlength="20" value="${ORDER.recipientPhone}"></td>
									</tr>
									<tr>
										<th>Ship To</th>
										<td><input type="text" name="shipping-address"
											class="form-control" placeholder="Enter Here" minlength="10"
											maxlength="150" value="${ORDER.shippingAddress}"></td>
									</tr>
									<tr>
										<th>Payment Method</th>
										<td>${ORDER.paymentMethod}</td>
									</tr>
									<tr>
										<th>Order Status</th>
										<td><input type="text" name="status" class="form-control"
											placeholder="Enter Here" minlength="2" maxlength="150"
											value="${ORDER.status}"></td>
									</tr>
									<tr>
										<th>Order Date</th>
										<td>${ORDER.orderDate}</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- =================== TABLE OVERVIEW .//END ================== -->

						<!-- =================== TABLE ODERED BOOKS ====================== -->
						<div class="d-flex justify-content-between my-3">
							<h4 class="text-primary">Ordered Books</h4>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target=".modal-add-book">
								<i class="fas fa-plus"></i> Add Book
							</button>
						</div>


						<!-- MODAL ADD BOOK	 -->
						<div class="modal fade modal-add-book" tabindex="-1" role="dialog"
							aria-labelledby="myLargeModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content p-3">
									<div class="d-flex justify-content-between">
										<h4 class="modal-title text-primary">Add Book</h4>
										<button type="button" class="close text-danger"
											data-dismiss="modal" aria-label="Close">
											<i class="fas fa-times"></i>
										</button>
									</div>
									<!-- Search Box -->
									<div class="form-group row mt-3">
										<label for="staticEmail" class="col-sm-2 col-form-label">Search</label>
										<div class="col-sm-8">
											<input type="text" class="form-control"
												id="input-search-book"
												placeholder="Enter id, title, author, ...">
										</div>
										<div class="col-sm-2">
											<button type="button" class="btn btn-primary">
												<i class="fas fa-search" onClick="searchBook()"></i>
											</button>
										</div>
									</div>
									<hr>
									<!-- Search Box .//END-->
									<!-- Categories -->
									<h4 class="text-center my-2">Book Categories</h4>
									<div id="div-categories"
										class="row d-flex justify-content-center">
										<button type="button" id="0"
											class="btn btn-outline-primary m-1"
											onClick="getBooksWithCategory(this)">All Book</button>
										<c:forEach items="${LIST_CATEGORIES}" var="category">
											<button type="button" id="${category.categoryId}"
												class="btn btn-outline-primary m-1"
												onClick="getBooksWithCategory(this)">${category.name }
												Book</button>
										</c:forEach>
									</div>
									<!-- Categories .//END-->


									<!-- LIST OF BOOKS -->

									<div id="div-books"></div>
								</div>
								<!-- Books .//END-->
							</div>
						</div>
					</div>


					<div class="table-responsive">
						<table class="table table-hover table-striped">
							<thead>
								<tr>
									<th scope="col" class="text-primary">Index</th>
									<th scope="col" class="text-primary">Image</th>
									<th scope="col" class="text-primary">ID</th>
									<th scope="col" class="text-primary">Book Title</th>
									<th scope="col" class="text-primary">Author</th>
									<th scope="col" class="text-primary">Price</th>
									<th scope="col" class="text-primary">Quantity</th>
									<th scope="col" class="text-primary">Sub Total</th>
									<th scope="col" class="text-primary">Remove</th>
								</tr>
							</thead>
							<tbody id="tbody-book-ordered">

							</tbody>
						</table>
					</div>
					<!-- =============================== FORM .//END ==================================== -->
					<!-- =================== TABLE ODERED BOOKS .//END ====================== -->
					<div class="text-center">
						<button id = "submitButton" type="submit" class="btn btn-primary px-4">Save</button>
					</div>

				</div>
			</div>
		</form>
		<!-- End Main -->
	</div>
	<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>
		<script>
		$(() => {
	        // function will get executed 
	        // on click of submit button
	        $("#submitButton").click(function(ev) {
		        ev.preventDefault();
	            var form = $("#form-update");
	            var url = form.attr('action');
	            $.ajax({
	                type: "POST",
	                url: url,
	                data: form.serialize(),
	                success: function(data) {
	                      
	                    successMessage('Updated Successfully','nothing');
	                },
	                error: function(data) {
	                	errorMessage('Something wrong','nothing');
	                }
	            });
	        });
	    });

	//document.getElementById('form-update').addEventListener('submit', sendForm);
	</script>
	<jsp:include page="../../js/handling-shopping-cart-js.jsp"></jsp:include>
</body>
</html>