package com.englishbookshop.controller.category;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.service.CategoryServices;

@WebServlet("/admin/categories/delete-category")
public class DeleteCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			CategoryServices catServices = new CategoryServices(entityManager,request, response);
			catServices.deleteCategory();
	}

}
