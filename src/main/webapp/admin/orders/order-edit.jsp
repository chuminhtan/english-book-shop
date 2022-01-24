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

		<!-- Main -->
		<div class="container">
			<div class="cart">
				<div class="cart-body">
					<a href="javascript:history.back()" class="btn btn-outline-primary"><i
						class="fas fa-arrow-left"></i> Back</a>
					<h2 class="text-primary my-4 text-center">Edit Order ID
						${ORDER.orderId }</h2>

					<!-- ================== FORM ============================== -->
					<form action="#" method="post" id="form-update">
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

									<!-- Search Box -->
									<div class="form-group row">
										<label for="staticEmail"
											class="col-sm-2 col-form-label text-primary">Search</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="search-book"
												placeholder="Enter title, author, ...">
										</div>
										<div class="col-sm-2">
											<button class="btn btn-primary">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
									<!-- Search Box .//END-->
									<!-- Categories -->
									<h4 class="text-center my-2">Book Categories</h4>
									<div id="div-categories"
										class="row d-flex justify-content-center">
										<button type="button" id="0"
											class="btn btn-outline-primary m-1 active"
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

									</main>
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
							<c:forEach var="orderDetail" items="${ORDER.orderDetails }"
								varStatus="status">
								<tr id="${orderDetail.book.bookId}">
									<td>${status.index + 1 }</td>
									<th>${orderDetail.book.bookId}</th>
									<td><a target="_blank"
										href="${pageContext.request.contextPath }/view-book?id=${orderDetail.book.bookId}">
											${orderDetail.book.title }</a></td>
									<td>${orderDetail.book.author }</td>

									<!-- price -->
									<td><fmt:formatNumber value="${orderDetail.book.price }"
											type="currency" /></td>

									<!-- quantity -->
									<td><input id="input-quantity-${orderDetail.book.bookId }"
										price="${orderDetail.book.price}" type="number"
										value="${orderDetail.quantity }" name="quantities" min="1"
										max="100" step="1" onChange="changeQuantity(this)"></td>

									<!-- subtotal -->
									<td id="td-subtotal-${orderDetail.book.bookId }"
										name="subtotal"><fmt:formatNumber
											value="${orderDetail.subtotal }" type="currency" /></td>

									<td class="text-center">
										<button type="button" id="${orderDetail.book.bookId}"
											class="btn btn-danger" onClick="removeFromCart(this.id)">
											<i class="fas fa-times"></i>
										</button>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" class="text-info font-weight-bold text-center">TOTAL:</td>
								<td id="totalQuantity" class="text-info font-weight-bold">${ORDER.bookCopies }</td>
								<td id="totalAmount" class="text-info font-weight-bold"><fmt:formatNumber
										value="${ORDER.total}" type="currency" /></td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- =============================== FORM .//END ==================================== -->
				<!-- =================== TABLE ODERED BOOKS .//END ====================== -->
				<div class="text-center">
					<button type="submit" class="btn btn-primary">Update</button>
				</div>
				</form>
			</div>
		</div>
		<!-- End Main -->
	</div>
	<jsp:include page="../admin-footer.jsp"></jsp:include>
	</div>

	<script>
	
	const updateTotal = () => {
		// Update quantity
		let quantities = document.getElementsByName('quantities');

		let totalQuantity = 0;
		quantities.forEach(e => totalQuantity += parseInt(e.value));
		document.getElementById("totalQuantity").innerHTML = totalQuantity;

		// Update subtotal
		let subtotals = document.getElementsByName("subtotal");
		let totalAmount = 0;
		subtotals.forEach(e => totalAmount += parseFloat(e.textContent.substring(1)))
		document.getElementById("totalAmount").innerHTML = '$' + totalAmount.toFixed(2);
	};

	const removeFromCart = (bookId) => {
		const trCollections = document.getElementsByTagName("tr");
		/*
		// Loop a HTMLCollections
		Array.from(trCollections).forEach((element) => {
	        console.log(element.id);
	      });
	     */
	    let tr = Array.from(trCollections).filter(element => element.id == bookId)[0];
	    tr.remove();

	    updateTotal();
	}

	const changeQuantity = (inQuantity) => {

		// Calculate new value
		const price = parseFloat(inQuantity.getAttribute('price'));
		let quantity = parseInt(inQuantity.value);
		let subtotal = price*quantity;


		// Update value 
		const bookId = inQuantity.id.split('-')[2];
		const tdSubtotal = document.getElementById('td-subtotal-' + bookId);
		tdSubtotal.innerHTML = '$'+ subtotal.toFixed(2);

		updateTotal();
	};

	// Get BOOKS
		const sendRequestGetBooks = async (categoryId) => {
		let url = '';

		if (categoryId == 0) {
			url = '${pageContext.request.contextPath}/admin/api/book/list-all';
		} else {
			url = '${pageContext.request.contextPath}/admin/api/book/list-by-category?id=' + categoryId;
		}

		const response = await fetch(url, {
			   method: 'GET',
			   
			   headers: {
			     'Content-Type': 'application/json'
			   },
		});
		const data = await response.json();
		return data
	};

	const showBooks = (listBooks) => {

		let htmlBook = `
			<article class="card card-product-list my-3">
			<div class="row no-gutters">
				<aside class="col-md-3">
					<a target="_blank"
						href="${pageContext.request.contextPath }/view-book?id=%bookId%"
						class="img-wrap"> <img
						src="data:image/png; base64,%imageBase64%"
						alt="Java Core">
					</a>
				</aside>
				<!-- col.// -->
				<div class="col-md-6">
					<div class="info-main">
						<a target="_blank"
							href="${pageContext.request.contextPath }/view-book?id=%bookId%"
							class="h5 title"><strong class="content-justify">%title%</strong></a>
						<p class="content-justify">Author: %author%</p>
					</div>
					<!-- info-main.// -->
				</div>
				<!-- col.// -->
				<aside class="col-sm-3">
					<div class="info-aside">
						<div class="price-wrap">
							<span class="price h5"><strong>$%price%</strong></span>
						</div>
						<div class="rating-wrap mb-3">
							<span class="badge badge-warning"> <i
								class="fa fa-star"></i> %rating%
							</span> <small class="text-muted ml-2">%numOfReviews% reviews</small>
						</div>
						<!-- rating-wrap.// -->
						<br>
						<p>
							<a target="_blank"
								href="${pageContext.request.contextPath }/view-book?id=%bookId%"
								class="btn btn-outline-primary btn-block"> <span
								class="text">Detail</span>
							</a>
							<button id="%bookId%" class="btn btn-primary btn-block"
								onclick="addBookToCart(this)">
								<i class="fas fa-shopping-cart"></i> Add To Cart
							</button>
						</p>
					</div>
					<!-- info-aside.// -->
				</aside>
				<!-- col.// -->
			</div>
			<!-- row.// -->
		</article>`
		
		const divBooks = document.getElementById("div-books");
		
		listBooks.forEach((book) => {
			console.log(book)
			let newHtmlBook = htmlBook.replace('%title%', book.title);
			newHtmlBook = newHtmlBook.replaceAll('%bookId%', book.bookId);
			newHtmlBook = newHtmlBook.replace('%imageBase64%', book.imageBase64);
			newHtmlBook = newHtmlBook.replace('%author%', book.author);
			newHtmlBook = newHtmlBook.replace('%price%', parseFloat(book.price).toFixed(2));
			newHtmlBook = newHtmlBook.replace('%rating%', book.rating);
			newHtmlBook = newHtmlBook.replace('%numOfReviews%', book.numOfReviews);

			divBooks.insertAdjacentHTML("afterend", newHtmlBook);
		})
	};

	
	const getBooksWithCategory = async (btnCategory) =>{
		const listButtons = document.getElementById("div-categories").children;

		Array.from(listButtons).forEach(e => {
			if (e.nodeName == 'BUTTON') {
				e.classList.remove('active');
			}
		});
		btnCategory.classList.add('active');

		let categoryId = btnCategory.id;
		let listBooks = await sendRequestGetBooks(categoryId);
		showBooks(listBooks);
	};

	
	</script>
</body>
</html>