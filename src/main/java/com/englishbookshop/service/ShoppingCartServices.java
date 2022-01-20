package com.englishbookshop.service;

import java.io.IOException;

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

	public ShoppingCartServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
	}
	
	public void showCart() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object spCartObj = session.getAttribute(ServletHelper.SESSION_CART);
		
		if (spCartObj == null) {
			ShoppingCart shoppingCart = new ShoppingCart();
			session.setAttribute(ServletHelper.SESSION_CART, shoppingCart); 
		}
		
		ShoppingCart spCart = (ShoppingCart) session.getAttribute(ServletHelper.SESSION_CART);
		
		BookDAO bookDao = new BookDAO();
		
		Book book = bookDao.get(1);
		spCart.addItem(book);
		
		Book book2 = bookDao.get(6);
		spCart.addItem(book2);
		

		request.getRequestDispatcher(JspPathHelper.SHOPPING_CART).forward(request, response);
	}

}
