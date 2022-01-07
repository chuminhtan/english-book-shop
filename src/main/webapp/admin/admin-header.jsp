    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- BEGIN HEADER -->
    <header>
        <!-- nav bar -->
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary text-white">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/smiling-sun.png" width="30" height="30" class="d-inline-block align-top" alt="">
                The English Book Shop
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/users/"><i class="fas fa-user"></i> Users</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/categories/"><i class="fas fa-align-right"></i> Categories</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/books/"><i class="fas fa-book"></i> Books</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-star"></i> Reviews</a>
                    </li>
                    <li class="nav-item active mx-1">
                        <a class="nav-link" href="#"><i class="fas fa-sticky-note"></i> Orders</a>
                    </li>
                </ul>
                <span class="text-white">Welcome, <c:out value="${sessionScope.USER_EMAIL}" /></span>
                <a class="btn btn-dark mx-2" href="${pageContext.request.contextPath}/admin/logout" tabindex="-1" aria-disabled="true">Logout</a>
            </div>
        </nav>
        <!-- end nav bar -->
    </header>
    <!-- END HEADER -->
    <!-- MAIN -->
    <div class="container my-2">