package com.englishbookshop.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.OrderDAO;
import com.englishbookshop.entity.BookOrder;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

public class OrderServices extends BaseServices {
	private OrderDAO orderDao;
	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		orderDao = new OrderDAO();
	}
	
	public void listAll(String message) throws ServletException, IOException {
		List<BookOrder> listOrders = orderDao.listAll();

		if (message != null) {
			request.setAttribute(ServletHelper.MESSAGE, message);
		}

		request.setAttribute("LIST_ORDERS", listOrders);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.ORDER_LIST);
		rd.forward(request, response);
	}

	public void showOrderDetail() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));
		
		BookOrder order = orderDao.get(orderId);
		
		request.setAttribute("ORDER", order);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.ORDER_DETAIL);
		rd.forward(request, response);
		
	}

	public void deleteOrder() {
		
		
	}

}
