package com.englishbookshop.controller.frontend.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.entity.Customer;
import com.englishbookshop.service.CustomerServices;
import com.google.gson.Gson;

@WebServlet("/login")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerLoginServlet() {
        super();
    }

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerServices customerServices = new CustomerServices(request, response);
		customerServices.doLogin();
	}

}
