package com.englishbookshop.controller.category;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.helper.JSPPathHelper;
import com.englishbookshop.service.CategoryServices;

/**
 * Servlet implementation class EditCategory
 */
@WebServlet("/admin/categories/edit-category")
public class EditCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public EditCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices catServices = new CategoryServices(entityManager,request, response);
		catServices.editCategory();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryServices catServices = new CategoryServices(entityManager,request, response);
		catServices.updateCategory();
	}
}
