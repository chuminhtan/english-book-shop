package com.englishbookshop.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.englishbookshop.controller.frontend.shoppingcart.ShoppingCart;
import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

public class ShoppingCartServices extends BaseServices {
	private static BookDAO bookDao;
	private static HttpSession session;
	private static ShoppingCart spCart;
	
	public ShoppingCartServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		bookDao = new BookDAO();
		session = request.getSession();
		
		Object spCartObj = session.getAttribute(ServletHelper.SESSION_CART);
		
		if (spCartObj == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			session.setAttribute(ServletHelper.SESSION_CART, shoppingCart); 
		}
		
		spCart = (ShoppingCart) session.getAttribute(ServletHelper.SESSION_CART);
	}
	
	public void showCart() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object spCartObj = session.getAttribute(ServletHelper.SESSION_CART);
		
		if (spCartObj == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			session.setAttribute(ServletHelper.SESSION_CART, shoppingCart); 
		}
				
		/*
		 * Book book = bookDao.get(1); spCart.addItem(book);
		 * 
		 * Book book2 = bookDao.get(6); spCart.addItem(book2);
		 */
		request.getRequestDispatcher(JspPathHelper.SHOPPING_CART).forward(request, response);
	}

	public void addBookToCart() throws IOException {	
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		
		Book book = bookDao.get(bookId);
		spCart.addItem(book);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("result", "OK");
		result.put("totalQuantity", spCart.getTotalQuantity());
		
		CommonUtility.sendJsonRespone(result, response);
	}

	public void removeBookFromCart() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		
		Book book = bookDao.get(bookId);
		spCart.removeItem(book);
		
		request.setAttribute(ServletHelper.MESSAGE, "The book has deleted successfully");
		request.getRequestDispatcher(JspPathHelper.SHOPPING_CART).forward(request, response);
	}

	public void updateCart() throws ServletException, IOException {
		String[] arrBookIds = request.getParameterValues("bookId");
		String[] arrQuantities = request.getParameterValues("quantities");
		
		int[] bookIds = CommonUtility.convertStringArrToIntArr(arrBookIds);
		int[] quantities = CommonUtility.convertStringArrToIntArr(arrQuantities);
		
		spCart.updateCart(bookIds, quantities);
		
		request.setAttribute(ServletHelper.MESSAGE, "Your cart has been updated successfully");
		request.getRequestDispatcher(JspPathHelper.SHOPPING_CART).forward(request, response);	
	}

}
