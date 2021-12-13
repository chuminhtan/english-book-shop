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
import com.englishbookshop.helper.PersistenceProjectInfo;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;

public class UserServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public UserServices(HttpServletRequest request, HttpServletResponse response) {
		entityManagerFactory = Persistence.createEntityManagerFactory(PersistenceProjectInfo.PERSISTENCE_UNIT_NAME);
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
		this.request = request;
		this.response = response;
	}

	public void listAll(String message) throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();

		request.setAttribute("LIST_USERS", listUsers);

		if (message != null) {
			request.setAttribute("MESSAGE", message);
//			response.sendRedirect(request.getContextPath() + "/admin/users/list-users");
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

}
