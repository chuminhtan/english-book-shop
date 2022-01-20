<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="section-header">

	<section class="header-main border-bottom">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-sm-4 col-12">
					<a href="${pageContext.request.contextPath }" class="brand-wrap">
						<img class="logo"
						src="${pageContext.request.contextPath}/images/smiling-sun.png">
						<span><strong>English Book Shop</strong></span>
					</a>
					<!-- brand-wrap.// -->
				</div>
				<div class="col-lg-4 col-xl-5 col-sm-8 col-12">
					<form action="search" class="search" method="get">
						<div class="input-group w-100">
							<input type="text" name="keyword" class="form-control"
								style="width: 55%;" placeholder="Search">
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
					<!-- search-wrap .end// -->
				</div>
				<!-- col.// -->
				<div class="col-lg-5 col-xl-4 col-sm-12">
					<div class="d-flex widgets-wrap float-md-right align-items-center">
						<a href="view-cart"
							class="badge badge-light text-dark p-2 mr-4 d-flex justify-content-center align-items-center">
							<span class="text-primary">Cart</span><i class="fa fa-shopping-cart mr-2 ml-2"
							style="font-size: 21px;"></i> <span class="badge badge-danger"
							style="font-size: 14px;">91</span>
						</a>
						<div class="widget-header dropdown">
							<a href="#" data-toggle="dropdown" data-offset="20,10">
								<div class="icontext ">
									<div class="icon">
										<i class="icon-sm rounded-circle border fa fa-user text-primary"></i>
									</div>
									<div class="text">
										<!-- ============= Show full name logged_customer is NOT null ============= -->
										<c:if test="${LOGGED_CUSTOMER != null }">
											<small class="text-muted font-weight-bold">Welcome, ${LOGGED_CUSTOMER.fullName }</small>
										</c:if>
										<!-- ============= Show sign in| join when logged_customer is null ============= -->
										<c:if test="${LOGGED_CUSTOMER == null }">
											<small class="text-muted">Sign in | Join</small>
										</c:if>
										<div>
											My account <i class="fa fa-caret-down"></i>
										</div>
									</div>
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
							
								<!-- ============= Dropdown when logged_customer is null ============= -->
								<c:if test="${LOGGED_CUSTOMER == null }">
									<form class="px-4 py-3" id="form-login">
										<div class="form-group">
											<label>Email address</label> <input type="email"
												id="email-login" class="form-control"
												placeholder="email@example.com">
										</div>
										<div class="form-group">
											<label>Password</label> <input type="password"
												id="password-login" class="form-control"
												placeholder="Password">
										</div>
										<button type="submit" id="submit-login"
											class="btn btn-primary">Sign in</button>
									</form>
									<hr class="dropdown-divider">
									<a class="dropdown-item text-primary" href="register">Have account? Sign
										up</a>
								</c:if>
								<!-- ============= Dropdown when logged_customer is null .//END============= -->

								<!-- ============= Dropdown when logged_customer is NOT null ============= -->
								<c:if test="${LOGGED_CUSTOMER != null }">
									<a class="dropdown-item py-3 px-4" href="${pageContext.request.contextPath }/customer/customer-profile"><i class="fas fa-user text-primary"></i><span class="ml-3">Profile setting</span></a>
									<a class="dropdown-item py-3 px-4" href="${pageContext.request.contextPath }/customer/customer-orders"><i class="fas fa-file-alt text-primary"></i><span class="ml-3">My orders</span></a>
									<a class="dropdown-item py-3 px-4" href="${pageContext.request.contextPath }/customer/logout"><i class="fas fa-power-off text-primary"></i><span class="ml-3">Logout</span></a>
								</c:if>
								<!-- ============= Dropdown when logged_customer is null .//END============= -->
								
							</div>
							<!--  dropdown-menu .// -->
						</div>
						<!-- widget-header .// -->
					</div>
					<!-- widgets-wrap.// -->
				</div>
				<!-- col.// -->
			</div>
			<!-- row.// -->
		</div>
		<!-- container.// -->
	</section>
	<!-- header-main .// -->
</header>