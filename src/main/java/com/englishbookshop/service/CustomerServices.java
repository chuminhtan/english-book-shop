package com.englishbookshop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.englishbookshop.dao.CustomerDAO;
import com.englishbookshop.entity.Customer;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class CustomerServices extends BaseServices {
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

	public void showCreateForm() throws ServletException, IOException {
		request.getRequestDispatcher(JspPathHelper.CUSTOMER_CREATE).forward(request, response);
	}

	public void createCustomer() throws ServletException, IOException {
		// Check password and confirm-pass valid
		Customer customer = readDataField();
		String passwordConfirm = request.getParameter("password-confirm");

		request.setAttribute("CUSTOMER", customer);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CUSTOMER_CREATE);

		if (!customer.getPassword().equals(passwordConfirm)) {
			String message = "Password confirm is incorrect";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
			return;
		}

		Customer existCustomer = customerDao.findByEmail(customer.getEmail());

		if (existCustomer != null) {
			String message = "The email already exists";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
			return;
		}

		customerDao.create(customer);
		listAll("The customer" + ServletHelper.MESSAGE_CREATE_SUCCESS);
	}

	public void showEditForm() throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDao.get(id);

		if (customer == null) {
			listAll("The customer" + ServletHelper.MESSAGE_DOES_NOT_EXIST);
			return;
		}
		request.setAttribute("CUSTOMER", customer);
		request.getRequestDispatcher(JspPathHelper.CUSTOMER_EDIT).forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {
		Customer cusForm = readDataField();

		int id = Integer.parseInt(request.getParameter("id"));
		cusForm.setCustomerId(id);

		request.setAttribute("CUSTOMER", cusForm);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CUSTOMER_EDIT);

		// Check actual customer is exist
		Customer cusById = customerDao.get(cusForm.getCustomerId());

		if (cusById == null) {
			listAll("The customer with ID " + cusForm.getCustomerId() + ServletHelper.MESSAGE_DOES_NOT_EXIST);
			;
			return;
		}

		// Check duplicate email
		Customer existCustomer = customerDao.findByEmail(cusForm.getEmail());

		if (existCustomer != null && existCustomer.getCustomerId() != cusForm.getCustomerId()) {
			String message = "The email already exists";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);

			return;
		}

		// Case 1: No change password
		if (cusForm.getPassword() == null) {
			customerDao.updateNoPassword(cusForm);
			listAll("The customer with ID " + cusForm.getCustomerId() + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);
			return;
		}

		// Case 2: Have change password
		String passwordConfirm = request.getParameter("password-confirm");

		// Check password value and password-confirm value is match.
		if (!cusForm.getPassword().equals(passwordConfirm)) {
			String message = "Password confirm is incorrect";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
			return;
		}

		customerDao.update(cusForm);
		listAll("The customer with ID " + cusForm.getCustomerId() + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);
	}

	private Customer readDataField() {
		Customer customer = new Customer();
		customer.setEmail(request.getParameter("email"));
		customer.setFullName(request.getParameter("full-name"));
		customer.setPassword(request.getParameter("password"));
		customer.setPhone(request.getParameter("phone"));
		customer.setAddress(request.getParameter("address"));
		customer.setCity(request.getParameter("city"));
		customer.setZipCode(request.getParameter("zip-code"));
		customer.setCountry(request.getParameter("country"));

		return customer;
	}

	public void deleteCustomer() throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		Map<String, String> resultResponse = new HashMap<>();

		Customer existCustomer = customerDao.get(id);

		long numOfOrders = customerDao.countOrdersByCustomer(id);
		long numOfReviews = customerDao.countReviewsByCustomer(id);
		
		if (numOfOrders > 0) {
			resultResponse.put("result", ServletHelper.RESPONSE_FAIL);
			resultResponse.put("MESSAGE", "Could not delete customer with ID " + id + " because he/she placed orders");
			
		} else if (numOfOrders > 0) {
			resultResponse.put("result", ServletHelper.RESPONSE_FAIL);
			resultResponse.put("MESSAGE", "Could not delete customer with ID " + id + " because he/she reviewed books.");
		} 
		
		else if (existCustomer != null) {
			customerDao.delete(id);

			resultResponse.put("result", ServletHelper.RESPONSE_OK);
			resultResponse.put("MESSAGE", "The customer with ID " + id + " has been deleted");
		} else {
			resultResponse.put("result", ServletHelper.RESPONSE_FAIL);
			resultResponse.put("message", "Could not delete the customer with ID " + id + ". The user does not exist");
		}

		String jsonMap = new Gson().toJson(resultResponse);

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(jsonMap);
	}

	public void registerCustomer() throws ServletException, IOException {
		// Check password and confirm-pass valid
		Customer customer = readDataField();
		String passwordConfirm = request.getParameter("password-confirm");

		request.setAttribute("CUSTOMER", customer);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CUSTOMER_REGISTER);

		if (!customer.getPassword().equals(passwordConfirm)) {
			String message = "Password confirm is incorrect";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
			return;
		}

		Customer existCustomer = customerDao.findByEmail(customer.getEmail());

		if (existCustomer != null) {
			String message = "The email already exists";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
			return;
		}

		customerDao.create(customer);
		response.sendRedirect(JspPathHelper.CUSTOMER_REGISTER_SUCCESS);
	}

	public void doLogin() throws IOException {
		JsonObject jsonObject = CommonUtility.getJsonObjectFromRequest(request);

		String email = jsonObject.get("email").getAsString();
		String password = jsonObject.get("password").getAsString();

		Map<String, String> result = new HashMap<>();
		Customer customer = customerDao.checkLogin(email, password);

		if (customer != null) {
			result.put("result", "success");

			HttpSession session = request.getSession();
			session.setAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER, customer);
		} else {
			result.put("result", "fail");
		}

		String jsonMap = new Gson().toJson(result);

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(jsonMap);
	}

	public void doLogout() throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER);
		response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/"));
	}

	public void showCustomerProfile() throws IOException, ServletException {
		Customer loggedCus = (Customer) request.getSession().getAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER);
		System.out.println("Logged Customer: " + loggedCus);
		request.setAttribute("CUSTOMER", loggedCus);
		request.getRequestDispatcher(JspPathHelper.CUSTOMER_PROFILE).forward(request, response);
	}

	public void updateCustomerProfile() throws IOException, ServletException {
		HttpSession session = request.getSession();
		Customer loggedCus = (Customer) session.getAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER);
		Customer cusForm = readDataField();

		int id = loggedCus.getCustomerId();
		cusForm.setCustomerId(id);
		cusForm.setEmail(loggedCus.getEmail());
		request.setAttribute("CUSTOMER", cusForm);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CUSTOMER_PROFILE);

		// Check actual customer is exist
		Customer cusById = customerDao.get(cusForm.getCustomerId());

		if (cusById == null) {
			response.sendRedirect(request.getContextPath());
			return;
		}

		// Case 1: No change password
		if (cusForm.getPassword() == null) {
			customerDao.updateNoPassword(cusForm);
			request.setAttribute(ServletHelper.MESSAGE, "Profile updated successfully");
			session.setAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER, cusForm);
			rd.forward(request, response);
			return;
		}

		// Case 2: Have change password
		String passwordConfirm = request.getParameter("password-confirm");

		// Check password value and password-confirm value is match.
		if (!cusForm.getPassword().equals(passwordConfirm)) {
			String message = "Password confirm is incorrect";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			rd.forward(request, response);
		} else {
			customerDao.update(cusForm);
			request.setAttribute(ServletHelper.MESSAGE, "Profile updated successfully");
			session.setAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER, cusForm);
			rd.forward(request, response);
		}

	}
}
