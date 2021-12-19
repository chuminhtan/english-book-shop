package com.englishbookshop.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.admin.BaseServlet;
import com.englishbookshop.helper.JSPPathHelper;
import com.englishbookshop.service.UserServices;

@WebServlet("/admin/users/create-user")
public class CreatUserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public CreatUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(JSPPathHelper.USER_CREATE);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServices userServices = new UserServices(entityManager,request, response);
		userServices.createUser();
	}

}
