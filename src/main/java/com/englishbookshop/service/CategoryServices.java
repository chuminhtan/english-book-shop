package com.englishbookshop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Category;
import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;

public class CategoryServices extends BaseServices {
	private CategoryDAO categoryDAO;
	private BookDAO bookDAO;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		categoryDAO = new CategoryDAO();
		bookDAO = new BookDAO();
	}

	public void listAll(String message) throws ServletException, IOException {
		List<Category> listCategories = categoryDAO.listAll();

		if (message != null) {
			request.setAttribute(ServletHelper.MESSAGE, message);
		}

		request.setAttribute("LIST_CATEGORIES", listCategories);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CATEGORY_LIST);
		rd.forward(request, response);
	}

	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");

		Category existCategory = categoryDAO.findByName(name);

		if (existCategory != null) {
			request.setAttribute(ServletHelper.ERROR_MESSAGE, "Category name " + ServletHelper.MESSAGE_ALREADY_EXIST);

		} else {
			Category cat = new Category(name);
			categoryDAO.create(cat);

			request.setAttribute(ServletHelper.MESSAGE, "The category " + ServletHelper.MESSAGE_CREATE_SUCCESS);
		}

		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CATEGORY_CREATE);
		rd.forward(request, response);
	}

	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));

		Category cat = categoryDAO.get(categoryId);

		if (cat != null) {
			request.setAttribute("CATEGORY", cat);
			RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CATEGORY_EDIT);
			rd.forward(request, response);

		} else {
			listAll("Could not find the category with ID " + categoryId);
		}

	}

	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("category-id"));
		String name = request.getParameter("name");

		Category catById = categoryDAO.get(categoryId);

		if (catById == null) {
			String message = "Could not find category with ID: " + categoryId;
			listAll(message);
		}

		Category catByName = categoryDAO.findByName(name);

		if ((catByName != null && catByName.getCategoryId() == categoryId) || catByName == null) {
			Category catUpdated = new Category(name);
			catUpdated.setCategoryId(categoryId);

			catById = categoryDAO.update(catUpdated);
			listAll("Category with id " + categoryId + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);

		} else {
			request.setAttribute("CATEGORY", catById);
			request.setAttribute(ServletHelper.ERROR_MESSAGE,
					"The name of category" + ServletHelper.MESSAGE_ALREADY_EXIST);
			RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.CATEGORY_EDIT);
			rd.forward(request, response);
		}
	}

	public void deleteCategory() throws IOException {
		int catId = Integer.parseInt(request.getParameter("id"));
		Map<String, Object> result = new HashMap<String, Object>();

		Category cat = categoryDAO.get(catId);

		if (catId == 1) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_COULD_NOT_DELETE_DEFAULT);
		} else if (cat == null) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_DOES_NOT_EXIST);
		} else {

			if (bookDAO.countByCategory(catId) > 0) {
				result.put(ServletHelper.MESSAGE,
						"Could not delete the category with ID " + catId + " because It currently contains some books");
			} else {
				categoryDAO.delete(catId);
				result.put(ServletHelper.MESSAGE, "The category with ID " + catId + " has been deleted");
			}
		}

		String resultJson = new Gson().toJson(result);

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(resultJson);

	}
}
