package com.englishbookshop.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.CustomerDAO;
import com.englishbookshop.entity.Category;
import com.englishbookshop.entity.Customer;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

public class CustomerServices extends BaseServices{
	private CustomerDAO customerDao;
	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		customerDao = new CustomerDAO();
	}
	
	public void listAll(String message) throws ServletException, IOException {
		List<Customer> listCustomers = customerDao.listAll();

		if (message != null) {
			request.setAttribute(ServletHelper.MESSAGE, message);
		}

		request.setAttribute("LIST_CUSTOMERS", listCustomers);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CUSTOMER_LIST);
		rd.forward(request, response);
	}

}
