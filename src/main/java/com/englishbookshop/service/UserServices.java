package com.englishbookshop.service;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.PersistenceProjectHelper;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;

public class UserServices extends BaseServices{

	private UserDAO userDAO;

	public UserServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super(entityManager, request, response);
		userDAO = new UserDAO(entityManager);
	}

	public void listAll(String message) throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();

		request.setAttribute("LIST_USERS", listUsers);

		if (message != null) {
			request.setAttribute("MESSAGE", message);
		}

		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.USER_LIST);
		rd.forward(request, response);

	}

	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("full-name");
		String password = request.getParameter("password");
		
		Users existUser = userDAO.findByEmail(email);
		
		if (existUser != null) {
			String message = "The email already exists";
			
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);	
			
		} else {		
			Users user = new Users(email, password, fullName);
			userDAO.create(user);
			
			String message = "The user was created successfully";
			request.setAttribute("MESSAGE", message);
		}
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.USER_CREATE);
		rd.forward(request, response);
	}

	public void editUser() throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("id"));
		System.out.println(userId);
		Users user = userDAO.get(userId);
		
		request.setAttribute("USER", user);
		
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.USER_EDIT);
		rd.forward(request, response);
	}

	public void updateUser() throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("user-id"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("full-name");
		String password = request.getParameter("password");
		
		// Check actual user is exist
		Users userById = userDAO.get(userId);
		
		if (userById == null) {
			String message = "Could not find user with ID: " + userId;
			listAll(message);
		}
		
		Users userByEmail = userDAO.findByEmail(email);
		
		String message ="";
		
		if (userByEmail == null || userId==userByEmail.getUserId()) {
			
			Users userUpdated = new Users(userId, email, password, fullName);
			userById = userDAO.update(userUpdated);
			
			message="The user was updated successfully";
			request.setAttribute("MESSAGE", message);
			
		} else {
			message="Could not update user. The email already exist";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
		}
		
		/*
		 * request.setAttribute("USER", userById); RequestDispatcher rd =
		 * request.getRequestDispatcher(JSPPathHelper.USER_EDIT); rd.forward(request,
		 * response);
		 */
		listAll(message);
	}
	
	public void deleteUser() throws ServletException, IOException {
		
	    int userId = Integer.parseInt(request.getParameter("id"));
	    
	    Map<String,String> resultResponse = new HashMap<>();
	    
	    if (userId == 1) {
		    resultResponse.put("result", ServletHelper.RESPONSE_FAIL);
		    resultResponse.put("message", "The default admin user account cannot be deleted");
	    } else {
	    	
		    Users user = userDAO.get(userId);
	    
		    if (user != null) {
		    	userDAO.delete(userId);
		    	
			    resultResponse.put("result", ServletHelper.RESPONSE_OK);
			    resultResponse.put("MESSAGE", "The user with ID "+ userId +" has been deleted");
		    
		    } else {
			    resultResponse.put("result", ServletHelper.RESPONSE_FAIL);
			    resultResponse.put("message", "Could not delete the user with ID "+ userId +". The user does not exist");
		    }
	    }
	    
	    String jsonMap = new Gson().toJson(resultResponse );
	    
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        out.print(jsonMap);
	}
	
	public void login() throws ServletException, IOException{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean loginResult = userDAO.checkLogin(email, password);
		
		if (loginResult) {
			HttpSession session = request.getSession();
			session.setAttribute(ServletHelper.SESSION_USER_EMAIL, email);
			
			response.sendRedirect(request.getContextPath() + "/admin");
		} else {
			String message = "Login failed";
			request.setAttribute(ServletHelper.ERROR_MESSAGE, message);
			
			RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.ADMIN_LOGIN);
			rd.forward(request, response);
		}
	}

	public void logout() throws IOException {
		request.getSession().removeAttribute(ServletHelper.SESSION_USER_EMAIL);
		response.sendRedirect(request.getContextPath() + "/admin/login");
	}

}
