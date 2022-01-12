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

@WebServlet("/admin/categories/edit-category")
public class EditCategoryServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public EditCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices catServices = new CategoryServices(request, response);
		catServices.editCategory();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices catServices = new CategoryServices(request, response);
		catServices.updateCategory();
	}
}
