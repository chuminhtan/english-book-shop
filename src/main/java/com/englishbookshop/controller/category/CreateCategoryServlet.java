package com.englishbookshop.controller.category;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.service.CategoryServices;

@WebServlet("/admin/categories/create-category")
public class CreateCategoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public CreateCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CATEGORY_CREATE);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices categoryServices = new CategoryServices(request, response);
		categoryServices.createCategory();
	}

}
