package com.englishbookshop.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;

@WebServlet("")
public class HomeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public HomeServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDao = new BookDAO();
		
		List<Book> listNewBooks = bookDao.listNewBooks();
		
		request.setAttribute("LIST_NEW_BOOKS", listNewBooks);
		
		String homePage = "frontend/index.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(homePage);
		rd.forward(request, response);
	}

}
