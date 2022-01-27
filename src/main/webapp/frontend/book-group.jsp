<article class="card card-product-list my-3">
	<div class="row no-gutters">
		<aside class="col-md-2">
			<a href="view-book?id=${book.bookId }" class="img-wrap"><img
				src="data:image/png; base64, ${book.imageBase64 }"
				alt="${book.title }">
			</a>
		</aside>
		<!-- col.// -->
		<div class="col-md-6">
			<div class="info-main">
				<a href="view-book?id=${book.bookId }" class="h5 title"><strong
					class="content-justify">${book.title }</strong></a>
				<p class="content-justify">${book.shortDescription}</p>
			</div>
			<!-- info-main.// -->
		</div>
		<!-- col.// -->
		<aside class="col-sm-3">
			<div class="info-aside">
				<div class="price-wrap">
					<span class="price h5"><strong>$${book.price }</strong></span>
				</div>
				<div class="rating-wrap mb-3">
					<span class="badge badge-warning"> <i class="fa fa-star"></i>
						${book.averageRating }
					</span> <small class="text-muted ml-2">${book.numOfRating }
						reviews</small>
				</div>
				<!-- rating-wrap.// -->
				<br>
				<p>
					<a href="view-book?id=${book.bookId }"
						class="btn btn-outline-primary btn-block"> <span class="text">Detail</span>
					</a>
					<button id="${book.bookId }" class="btn btn-primary btn-block"
						onClick="addBookToCart(this)">
						<i class="fas fa-shopping-cart"></i> Add To Cart
					</button>
				</p>
			</div>
			<!-- info-aside.// -->
		</aside>
		<!-- col.// -->
	</div>
	<!-- row.// -->
</article>