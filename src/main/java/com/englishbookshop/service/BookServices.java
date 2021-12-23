package com.englishbookshop.service;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;
import com.englishbookshop.helper.JspPathHelper;

public class BookServices extends BaseServices {
	private BookDAO bookDao;
	private CategoryDAO catDao;
	
	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super(entityManager, request, response);
		bookDao = new BookDAO(entityManager);
		catDao = new CategoryDAO(entityManager);
	}
	
	public void listBooks() throws IOException, ServletException{
		List<Book> listBooks = bookDao.listAll();
		
		request.setAttribute("LIST_BOOKS",listBooks);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_LIST);
		dispatcher.forward(request, response);
	}

	public void showCreateForm() throws ServletException, IOException {
		List<Category> listCategories = catDao.listAll();
		
		request.setAttribute("LIST_CATEGORIES", listCategories);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_CREATE);
		dispatcher.forward(request, response);
		
	}

}
