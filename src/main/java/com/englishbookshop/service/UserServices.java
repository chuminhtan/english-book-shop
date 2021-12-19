package com.englishbookshop.service;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.JSPPathHelper;
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

		RequestDispatcher rd = request.getRequestDispatcher(JSPPathHelper.USER_LIST);
		rd.forward(request, response);

	}

	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("full-name");
		String password = request.getParameter("password");
		
		Users existUser = userDAO.findByEmail(email);
		
		if (existUser != null) {
			String message = "The email already exists";
			
			request.setAttribute("MESSAGE_ERROR", message);	
			
		} else {			
			Users user = new Users(email, password, fullName);
			userDAO.create(user);
			
			String message = "The user was created";
			request.setAttribute("MESSAGE", message);

		}
		RequestDispatcher rd = request.getRequestDispatcher(JSPPathHelper.USER_CREATE);
		rd.forward(request, response);
	}

	public void editUser() throws ServletException, IOException{
		int userId = Integer.parseInt(request.getParameter("id"));
		System.out.println(userId);
		Users user = userDAO.get(userId);
		
		request.setAttribute("USER", user);
		
		RequestDispatcher rd = request.getRequestDispatcher(JSPPathHelper.USER_EDIT);
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
		
		if (userByEmail == null || userId==userByEmail.getUserId()) {
			
			Users userUpdated = new Users(userId, email, password, fullName);
			userById = userDAO.update(userUpdated);
			
			String message="The user was updated";
			request.setAttribute("MESSAGE", message);
			
		} else {
			String message="Could not update user. The email already exist";
			request.setAttribute("MESSAGE_ERROR", message);
		}
		
		request.setAttribute("USER", userById);
		RequestDispatcher rd = request.getRequestDispatcher(JSPPathHelper.USER_EDIT);
		rd.forward(request, response);
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
			    resultResponse.put("message", "The user with ID "+ userId +" has been deleted");
		    
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

}
