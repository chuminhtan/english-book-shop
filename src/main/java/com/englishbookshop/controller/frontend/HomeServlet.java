package com.englishbookshop.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Category;

@WebServlet("")
public class HomeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CategoryDAO catDAO = new CategoryDAO(entityManager);
		List<Category>listCategories = catDAO.listAll();
		request.setAttribute("LIST_CATEGORIES", listCategories);
		
		
		
		String homePage = "frontend/index.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(homePage);
		rd.forward(request, response);
	}

}
