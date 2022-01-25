<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
// CREATE LIST OF BOOK FROM CART
let cart = [];
let receivedBooks = [];

<c:forEach var="orderDetail" items="${ORDER.orderDetails }" varStatus="status">
	cart.push({
		index: ${status.index},
		bookId: ${orderDetail.book.bookId},
		imageBase64: '${orderDetail.book.imageBase64 }',
		title: "${orderDetail.book.title }",
		author: '${orderDetail.book.author }',
		price: parseFloat(${orderDetail.book.price }),
		subtotal: ${orderDetail.subtotal},
		quantity: ${orderDetail.quantity}
		});
</c:forEach>
console.log(cart);

//UPATE TOTAL
const updateTotal = () => {
	// Update quantity
	let quantities = document.getElementsByName('quantity');

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
				href="${pageContext.request.contextPath}/view-book?id=%bookId%">%title%</a></td>
			<td>%author%</td>
			<!-- price -->
			<td>$%price%</td>

			<!-- quantity -->
			<td><input id="input-quantity-%bookId%"
				price="%price%" type="number"
				value="%quantity%" name="quantity" min="1"
				max="100" step="1" onChange="changeQuantity(this)"  oninput="this.value = 
					 !!this.value && Math.abs(this.value) > 0 ? Math.abs(this.value) : 1"></td>

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
	tbodyOrderDetail.innerHTML = '';

	for (let i = 0; i < cart.length; i++) {
		let orderDetail = cart[i];
		let newTrHtml = trHtml.replaceAll('%bookId%', orderDetail.bookId);
		newTrHtml = newTrHtml.replaceAll('%title%', orderDetail.title);
		newTrHtml = newTrHtml.replace('%status%',   + 1);
		newTrHtml = newTrHtml.replace('%imageBase64%', orderDetail.imageBase64);
		newTrHtml = newTrHtml.replace('%author%', orderDetail.author);
		newTrHtml = newTrHtml.replaceAll('%price%', orderDetail.price.toFixed(2));
		newTrHtml = newTrHtml.replaceAll('%quantity%', orderDetail.quantity);
		newTrHtml = newTrHtml.replaceAll('%subtotal%',  orderDetail.subtotal.toFixed(2));

		tbodyOrderDetail.insertAdjacentHTML("beforeend", newTrHtml);
	}

	let lastHtml = `<tr><td colspan="6" class="text-info font-weight-bold text-center">TOTAL:</td>
			<td id="totalQuantity" class="text-info font-weight-bold"></td>
			<td id="totalAmount" class="text-info font-weight-bold"></td><td></td></tr>`

	tbodyOrderDetail.insertAdjacentHTML("beforeend", lastHtml);
	updateTotal();
}

// REMOVE BOOK FROM CART
const removeFromCart = (bookId) => {
	if (cart.length == 1) {
		errorMessage('The shopping cart could not empty', 'nothing');
		return;
	}
	const trCollections = document.getElementsByTagName("tr");

	let tr = Array.from(trCollections).filter(element => element.id == bookId)[0];
	tr.remove();

	for (let i = 0; i < cart.length; i++) {
		if (cart[i].bookId == bookId) {
			cart.splice(i, 1);
			break;
		}
	}

	console.log(cart);

	showDetailBooksFromCart();
}

// CHANGE QUANTITY
const changeQuantity = (inQuantity) => {

	// Calculate new value
	const price = parseFloat(inQuantity.getAttribute('price'));
	let quantity = parseInt(inQuantity.value);
	let subtotal = parseInt(price * quantity);


	// Update value 
	let bookId = parseInt(inQuantity.id.split('-')[2]);


	for (let i = 0; i < cart.length; i++) {
		if (cart[i].bookId == bookId) {
			cart[i].quantity = quantity;
		}
	}

	const tdSubtotal = document.getElementById('td-subtotal-' + bookId);
	tdSubtotal.innerHTML = '$' + subtotal.toFixed(2);

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

showDetailBooksFromCart();
</script>