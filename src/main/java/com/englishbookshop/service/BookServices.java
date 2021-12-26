package com.englishbookshop.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.text.DateFormatter;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

public class BookServices extends BaseServices {
	private BookDAO bookDao;
	private CategoryDAO catDao;

	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		super(entityManager, request, response);
		bookDao = new BookDAO(entityManager);
		catDao = new CategoryDAO(entityManager);
	}

	public void listBooks(String typeMsg,String msg) throws IOException, ServletException {
		List<Book> listBooks = bookDao.listAll();

		request.setAttribute("LIST_BOOKS", listBooks);
		
		if (typeMsg != null) {
			request.setAttribute(typeMsg, msg);			
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_LIST);
		dispatcher.forward(request, response);
	}

	public void showCreateForm() throws ServletException, IOException {
		List<Category> listCategories = catDao.listAll();

		request.setAttribute("LIST_CATEGORIES", listCategories);

		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_CREATE);
		dispatcher.forward(request, response);

	}

	public void createBook() throws ServletException, IOException {

		String title = request.getParameter("title"); 

		Book existBook = bookDao.findByTitle(title);
		
		if (existBook != null) {
			listBooks(ServletHelper.MESSAGE, title + ServletHelper.MESSAGE_CREATE_EXIST);
			return;
		}
			
		Book newBook = new Book();
		readBookFields(newBook);
		
		newBook = bookDao.create(newBook);
		
		if (newBook.getBookId() > 0) {
			listBooks(ServletHelper.MESSAGE, title + ServletHelper.MESSAGE_CREATE_SUCCESS);
		}
	}
	
	//TODO
	public void updateBook() throws IOException, ServletException {
		int bookId = Integer.parseInt(request.getParameter("book-id"));	
		String title = request.getParameter("title"); 
		
		Book bookWithTitle = bookDao.findByTitle(title);
		
		if (bookWithTitle != null && bookWithTitle.getBookId() != bookId) {
			listBooks(ServletHelper.MESSAGE, "The book with title " + title + ServletHelper.MESSAGE_CREATE_EXIST);
			return;
		}
		
		Book bookWithId = bookDao.get(bookId);
		
		if (bookWithId == null) {
			listBooks(ServletHelper.MESSAGE, "The book with id " + bookId + ServletHelper.MESSAGE_DOES_NOT_EXIST);
			return;
		}
		
		Book bookNeedUpdate = new Book();
		bookNeedUpdate.setBookId(bookId);
		readBookFields(bookNeedUpdate);
		
		if (bookNeedUpdate.getImage() == null) {
			bookNeedUpdate.setImage(bookWithId.getImage());
		}
		
		bookNeedUpdate = bookDao.update(bookNeedUpdate);
		System.out.println("Book After Update: " + bookNeedUpdate);
		
		listBooks(ServletHelper.MESSAGE, "The book with title " + title + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);
	}

	public void showEditForm() throws ServletException, IOException{
		int bookId = Integer.parseInt(request.getParameter("id"));
		
		Book existBook = bookDao.get(bookId);
		
		if (existBook == null) {
			listBooks(ServletHelper.MESSAGE, "The book with id " + bookId + ServletHelper.MESSAGE_DOES_NOT_EXIST);
			return;
		}
		
		List<Category> listCategories = catDao.listAll();

		request.setAttribute("LIST_CATEGORIES", listCategories);
		request.setAttribute("BOOK", existBook);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_EDIT_FORM);
		dispatcher.forward(request, response);
	}
	
	private void readBookFields(Book book) throws ServletException, IOException {
		String title = request.getParameter("title"); 
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String author = request.getParameter("author");
		String isbn = request.getParameter("isbn");
		String description = request.getParameter("description");
		Float price = Float.parseFloat(request.getParameter("price"));

		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date publishDate;
		try {
			publishDate = dateFormat.parse(request.getParameter("publish-date"));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date dd/mm/yyyy");
		}
		
		Category category = new Category();
		category.setCategoryId(categoryId);

		book.setTitle(title);
		book.setAuthor(author);
		book.setIsbn(isbn);
		book.setCategory(category);
		book.setDescription(description);
		book.setPrice(price);
		book.setPublishDate(publishDate);
		
		Part part = request.getPart("image");

		if (part != null && part.getSize() > 0) {
			int size = (int) part.getSize();

			byte[] imageBytes = new byte[size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		} else {
			book.setImage(null);
		}
	}

}
