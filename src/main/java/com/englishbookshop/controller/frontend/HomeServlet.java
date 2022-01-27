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
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

@WebServlet("")
public class HomeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
    public HomeServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDAO bookDao = new BookDAO();
		
		List<Book> listNewBooks = bookDao.listNewBooks();
		List<Book> listBestSellingBooks = bookDao.listBestSellingBooks();
		List<Book> listMostFavoredBooks = bookDao.listMostFavoredBooks();
		
		request.setAttribute("LIST_BEST_SELLING_BOOKS", listBestSellingBooks);
		request.setAttribute("LIST_NEW_BOOKS", listNewBooks);
		request.setAttribute("LIST_MOST_FAVORED_BOOKS", listMostFavoredBooks);
		request.getRequestDispatcher(JspPathHelper.INDEX).forward(request, response);
	}

}
