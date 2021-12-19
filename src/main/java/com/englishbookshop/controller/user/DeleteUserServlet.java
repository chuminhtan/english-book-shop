package com.englishbookshop.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Map;
import java.util.HashMap;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.helper.ServletHelper;
import com.englishbookshop.service.UserServices;
import com.google.gson.Gson;

@WebServlet("/admin/users/delete-user")
public class DeleteUserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
    public DeleteUserServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServices userServices = new  UserServices(entityManager,request, response);
		userServices.deleteUser();
	}

}
