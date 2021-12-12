package com.englishbookshop.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.entity.Users;
import com.englishbookshop.service.UserServices;

@WebServlet("/admin/list-users")
public class ListUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListUsersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserServices userServices = new UserServices();
		List<Users> listUsers = userServices.listAll();
		
		request.setAttribute("LIST_USERS", listUsers);
		
		String listPage = "user-list.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(listPage);
		rd.forward(request, response);
	}

}
