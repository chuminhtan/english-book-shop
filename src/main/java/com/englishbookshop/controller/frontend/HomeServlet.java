package com.englishbookshop.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;

@WebServlet("")
public class HomeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	BookDAO bookDao = new BookDAO(entityManager);
	CategoryDAO catDAO = new CategoryDAO(entityManager);
    
    public HomeServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDao = new BookDAO(entityManager);
		CategoryDAO catDAO = new CategoryDAO(entityManager);
		
		List<Category> listCategories = catDAO.listAll();
		List<Book> listNewBooks = bookDao.listNewBooks();
		
		request.setAttribute("LIST_CATEGORIES", listCategories);
		request.setAttribute("LIST_NEW_BOOKS", listNewBooks);
		
		String homePage = "frontend/index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(homePage);
		rd.forward(request, response);
	}

}
