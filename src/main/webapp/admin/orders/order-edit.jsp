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
									<div class="d-flex justify-content-between">
										<h4 class="modal-title text-primary">Add Book</h4>
										<button type="button" class="close text-danger"
											data-dismiss="modal" aria-label="Close">
											<i class="fas fa-times"></i>
										</button>
									</div>
									<!-- Search Box -->
									<div class="form-group row mt-3">
										<label for="staticEmail"
											class="col-sm-2 col-form-label">Search</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="input-search-book"
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
						<tbody  id="tbody-book-ordered">

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
	// CREATE LIST OF BOOK FROM CART
	let cart = [];
	let receivedBooks = [];
	
	<c:forEach var="orderDetail" items="${ORDER.orderDetails }" varStatus="status">
		cart.push({
			index: ${status.index},
			bookId: ${orderDetail.book.bookId},
			imageBase64: '${orderDetail.book.imageBase64 }',
			title: '${orderDetail.book.title }',
			author: '${orderDetail.book.author }',
			price: parseFloat(${orderDetail.book.price }),
			subtotal: ${orderDetail.subtotal},
			quantity: ${orderDetail.quantity}
			});
	</c:forEach>
	console.log(cart);
	
	// UPATE TOTAL
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
	
	// SHOW ORDERED BOOKS
	const showDetailBooksFromCart = () => {	
		
		let trHtml = `<tr id="%bookId%">
			<td>%status%</td>
			<td><img src="data:image/png; base64,%imageBase64%" alt="%title%" width="65"></td>
			<th>%bookId%</th>
			<input type="hidden" value="%bookId%" name="id">
			<td><a target="_blank"
				href="${pageContext.request.contextPath }/view-book?id=%bookId%">%title%</a></td>
			<td>%author%</td>
			<!-- price -->
			<td>$%price%</td>

			<!-- quantity -->
			<td><input id="input-quantity-%bookId%"
				price="%price%" type="number"
				value="%quantity%" name="quantities" min="1"
				max="100" step="1" onChange="changeQuantity(this)"></td>

			<!-- subtotal -->
			<td id="td-subtotal-%bookId%"
				name="subtotal">$%subtotal%</td>

			<td class="text-center">
				<button type="button" id="%bookId%"
					class="btn btn-danger" onClick="removeFromCart(this.id)">
					<i class="fas fa-times"></i>
				</button>
			</td>
		</tr>`;

		let tbodyOrderDetail = document.getElementById('tbody-book-ordered');
		tbodyOrderDetail.innerHTML ='';
		
		for(let i = 0; i < cart.length; i++) {
			let orderDetail = cart[i];
			let newTrHtml = trHtml.replaceAll('%bookId%', orderDetail.bookId);
			newTrHtml = newTrHtml.replaceAll('%title%',orderDetail.title);
			newTrHtml = newTrHtml.replace('%status%',i+1);
			newTrHtml = newTrHtml.replace('%imageBase64%',orderDetail.imageBase64);
			newTrHtml = newTrHtml.replace('%author%',orderDetail.author);
			newTrHtml = newTrHtml.replaceAll('%price%',orderDetail.price.toFixed(2));
			newTrHtml = newTrHtml.replaceAll('%quantity%',orderDetail.quantity);
			newTrHtml = newTrHtml.replaceAll('%subtotal%',orderDetail.subtotal.toFixed(2));

			tbodyOrderDetail.insertAdjacentHTML("beforeend", newTrHtml);
		}

		let lastHtml = `<tr><td colspan="6" class="text-info font-weight-bold text-center">TOTAL:</td>
			<td id="totalQuantity" class="text-info font-weight-bold"></td>
			<td id="totalAmount" class="text-info font-weight-bold"></td><td></td></tr>`
			
			tbodyOrderDetail.insertAdjacentHTML("beforeend", lastHtml);
		updateTotal();
	}
	
	showDetailBooksFromCart();

	// REMOVE BOOK FROM CART
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

	// CHANGE QUANTITY
	const changeQuantity = (inQuantity) => {

		// Calculate new value
		const price = parseFloat(inQuantity.getAttribute('price'));
		let quantity = parseInt(inQuantity.value);
		let subtotal = parseInt(price*quantity);


		// Update value 
		let bookId = parseInt(inQuantity.id.split('-')[2]);
	

		for(let i = 0; i < cart.length; i++) {
			if (cart[i].bookId == bookId) {
				cart[i].quantity = quantity;
			}
		}

		const tdSubtotal = document.getElementById('td-subtotal-' + bookId);
		tdSubtotal.innerHTML = '$'+ subtotal.toFixed(2);

		updateTotal();
	};

	// ADD BOOK TO CARD
	const addBook = (btn) => {
		const bookId = parseInt(btn.id);

		let isExist = false;
		for(let i = 0; i < cart.length; i++) {
			if (cart[i].bookId == bookId) {
				infoMessage('The book already exists in the shopping cart');
				isExist = true;
				break;
			}
		}

		if (isExist == false) {
			receivedBooks.forEach(book => {
				if (book.bookId == bookId) {
					cart.push({
						index: cart.length + 1,
						bookId: bookId,
						imageBase64: book.imageBase64,
						title: book.title,
						author: book.author,
						price: book.price,
						subtotal: book.price,
						quantity: 1
						});
				}

				showDetailBooksFromCart();

				successMessage('The book has added to shopping cart successfully.', 'nothing');
			});
		}
		
	};

	// GET BOOKS
	const sendRequestGetBooks = async (url) => {

		const response = await fetch(url, {
			   method: 'GET',
			   
			   headers: {
			     'Content-Type': 'application/json'
			   },
		});
		const listBooks = await response.json();

		// Set listBooks for receivedBooks variable
		receivedBooks = listBooks;
		console.log('ReceivedBooks: ', receivedBooks);
		return listBooks;
	};

	// SHOW BOOKS
	const showBooks = (listBooks) => {
		let htmlBook = `
			<article class="card card-product-list my-3">
			<div class="row no-gutters">
				<aside class="col-md-2">
					<a target="_blank"
						href="${pageContext.request.contextPath }/view-book?id=%bookId%"
						class="img-wrap"> <img
						src="data:image/png; base64,%imageBase64%"
						alt="Java Core">
					</a>
				</aside>
				<!-- col.// -->
				<div class="col-md-7">
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
							<button type="button" id="%bookId%" class="btn btn-primary btn-block"
								onclick="addBook(this)">
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
		
		let divBooks = document.getElementById("div-books");
		divBooks.innerHTML='';
		
		listBooks.forEach((book) => {

			let newHtmlBook = htmlBook.replace('%title%', book.title);
			newHtmlBook = newHtmlBook.replaceAll('%bookId%', book.bookId);
			newHtmlBook = newHtmlBook.replace('%imageBase64%', book.imageBase64);
			newHtmlBook = newHtmlBook.replace('%author%', book.author);
			newHtmlBook = newHtmlBook.replace('%price%', parseFloat(book.price).toFixed(2));
			newHtmlBook = newHtmlBook.replace('%rating%', book.rating);
			newHtmlBook = newHtmlBook.replace('%numOfReviews%', book.numOfReviews);

			divBooks.insertAdjacentHTML("beforeend", newHtmlBook);
		})
	};


	// GET BOOK WITH CATEGORY
	const getBooksWithCategory = async (btnCategory)=>{
		const listButtons = document.getElementById("div-categories").children;

		Array.from(listButtons).forEach(e => {
			if (e.nodeName == 'BUTTON') {
				e.classList.remove('active');
			}
		});
		btnCategory.classList.add('active');

		let url ='';
		const categoryId = btnCategory.id;
		
		if (categoryId == 0) {
			url = '${pageContext.request.contextPath }/admin/api/book/list-all';
		} else {
			url = '${pageContext.request.contextPath }/admin/api/book/list-by-category?id=' + categoryId;
		}
		
		let listBooks = await sendRequestGetBooks(url);
		showBooks(listBooks);
	};

	// GET BOOK WITH KEYWORD
	
	const searchBook = async () => {
		
		let inputSearch = document.getElementById('input-search-book');
		let keyword = inputSearch.value.trim();

		if (keyword === '') {
			return;
		}
		url = '${pageContext.request.contextPath }/admin/api/book/list-by-keyword?keyword=' + keyword;
		
		let listBooks = await sendRequestGetBooks(url);
		console.log(listBooks);
		showBooks(listBooks);
	};
	
	$(document).keypress(
			  function(event){
			    if (event.which == '13') {
			      event.preventDefault();
			    }
	});
	
	</script>
</body>
</html>