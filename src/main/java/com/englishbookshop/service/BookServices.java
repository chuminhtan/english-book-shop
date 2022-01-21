package com.englishbookshop.service;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.google.gson.Gson;

public class BookServices extends BaseServices {
	private BookDAO bookDao;
	private CategoryDAO catDao;

	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		bookDao = new BookDAO();
		catDao = new CategoryDAO();
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
			listBooks(ServletHelper.MESSAGE, title + ServletHelper.MESSAGE_ALREADY_EXIST);
			return;
		}
			
		Book newBook = new Book();
		readBookFields(newBook);
		
		newBook = bookDao.create(newBook);
		
		if (newBook.getBookId() > 0) {
			listBooks(ServletHelper.MESSAGE, title + ServletHelper.MESSAGE_CREATE_SUCCESS);
		}
	}
	
	public void updateBook() throws IOException, ServletException {
		int bookId = Integer.parseInt(request.getParameter("book-id"));	
		String title = request.getParameter("title"); 
		
		Book bookWithTitle = bookDao.findByTitle(title);
		
		if (bookWithTitle != null && bookWithTitle.getBookId() != bookId) {
			listBooks(ServletHelper.MESSAGE, "The book with title " + title + ServletHelper.MESSAGE_ALREADY_EXIST);
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
		String publishDateRequest = request.getParameter("publish-date");
		System.out.println("publishDate: " + publishDateRequest);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date publishDate;
		try {
			publishDate = dateFormat.parse(request.getParameter("publish-date"));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date dd/MM/yyyy");
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

	public void deleteBook() throws IOException {
		int bookId = Integer.parseInt(request.getParameter("id"));
		
		Book bookWithId = bookDao.get(bookId);
		Map<String,Object> result = new HashMap<>();
		
		long numOfOrders = bookDao.countOrdersByBook(bookId);
		
		if (bookId == 1) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_COULD_NOT_DELETE_DEFAULT);
		} else if (bookWithId == null) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_DOES_NOT_EXIST);
		} else if (numOfOrders > 0) {			
			result.put(ServletHelper.MESSAGE, "Could not delete the book because it has already existed in some orders.");
		} else {
			bookDao.delete(bookId);
			result.put(ServletHelper.MESSAGE, "The book with ID "+ bookId +" has been deleted");
		}
		
		String resultJson = new Gson().toJson(result);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(resultJson);
	}
	
	public void listBooksByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		
//		List<Book> listBooks = bookDao.findByCategory(categoryId);
		Category category = catDao.get(categoryId);
		List<Book> listBooks = new ArrayList<>(category.getBooks());
		
		for (Book b : listBooks) {
			System.out.println(b);
		}
		
		request.setAttribute("LIST_BOOKS", listBooks);
		request.setAttribute("CATEGORY", category);
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOKS_LIST_BY_CATEGORY);
		dispatcher.forward(request, response);
	}

	public void viewBookDetail() throws IOException, ServletException{
		int bookId = Integer.parseInt(request.getParameter("id"));		
		Book book = bookDao.get(bookId);	
		
		request.setAttribute("BOOK", book);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_DETAIL);
		dispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Book> listBooks = null;
		
		if (keyword.isEmpty()) {
			listBooks = bookDao.listAll();
		} else {
			listBooks = bookDao.search(keyword);			
		}

		request.setAttribute("KEYWORD", keyword);
		request.setAttribute("LIST_BOOKS", listBooks);			
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.BOOK_SEARCH);
		dispatcher.forward(request, response);
	}
}
