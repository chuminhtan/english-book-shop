<jsp:include page="header.jsp"/>
	            <div class="row justify-content-center">
                <div class="col-md-6 col-sm-3">
                    <div class="jumbotron">
                        <h1 class="display-4 text-info">Login</h1>
                        <hr class="my-4">
                        <form action="login">
                            <div class="form-group">
                                <label for="email">Email address</label> <input type="email"
                                    name="email" class="form-control" id="email"
                                    aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label> <input type="password"
                                    class="form-control" id="password" name="password"
                                    placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <div class="alert alert-danger mt-3" role="alert">
                            Incorrect Email or Password
                          </div>
                    </div>
                </div>
            </div>
<jsp:include page="footer.jsp" />