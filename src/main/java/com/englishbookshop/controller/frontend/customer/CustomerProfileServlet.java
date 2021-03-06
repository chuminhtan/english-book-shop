package com.englishbookshop.controller.frontend.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.CustomerServices;

@WebServlet("/customer/customer-profile")
public class CustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerServices cusServices = new CustomerServices(request, response);
		cusServices.showCustomerProfile();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerServices cusServices = new CustomerServices(request, response);
		cusServices.updateCustomerProfile();
	}

}
