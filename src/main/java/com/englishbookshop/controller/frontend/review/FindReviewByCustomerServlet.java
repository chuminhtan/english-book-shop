package com.englishbookshop.controller.frontend.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.ReviewServices;

@WebServlet("/find-review-by-customer")
public class FindReviewByCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindReviewByCustomerServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewServices reviewServices = new ReviewServices(request, response);
		reviewServices.findReviewByCustomer();
	}
}
