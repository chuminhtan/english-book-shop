package com.englishbookshop.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.service.UserServices;

@WebServlet("/admin/users/")
public class ListUsersServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public ListUsersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		UserServices userServices = new UserServices(entityManager,request, response);
		userServices.listAll(null);
	}

}
