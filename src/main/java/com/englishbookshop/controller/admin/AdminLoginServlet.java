package com.englishbookshop.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.service.UserServices;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public AdminLoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.ADMIN_LOGIN);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserServices userServices = new UserServices(request, response);
		userServices.login();
	}

}
