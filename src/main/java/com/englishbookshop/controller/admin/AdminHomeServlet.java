package com.englishbookshop.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.CustomerDAO;
import com.englishbookshop.dao.OrderDAO;
import com.englishbookshop.dao.ReviewDAO;
import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.entity.BookOrder;
import com.englishbookshop.entity.Review;
import com.englishbookshop.helper.JspPathHelper;

/**
 * Servlet implementation class AdminHomeServlet
 */
@WebServlet("/admin/")
public class AdminHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminHomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO orderDao = new OrderDAO();
		ReviewDAO reviewDao = new ReviewDAO();
		UserDAO userDao = new UserDAO();
		CustomerDAO customerDao = new CustomerDAO();
		BookDAO bookDao = new BookDAO();
		
		List<Review> listMostRecentReviews = reviewDao.listMostRecentReviews();
		List<BookOrder> listMostRecentOrders = orderDao.listMostRecentSales();
		long totalUsers = userDao.count();
		long totalCustomers = customerDao.count();
		long totalBooks = bookDao.count();
		long totalOrders = orderDao.count();
		long totalReviews = reviewDao.count();
		
		request.setAttribute("LIST_MOST_RECENT_ORDERS", listMostRecentOrders);
		request.setAttribute("LIST_MOST_RECENT_REVIEWS", listMostRecentReviews);
		request.setAttribute("TOTAL_USERS", totalUsers);
		request.setAttribute("TOTAL_CUSTOMERS", totalCustomers);
		request.setAttribute("TOTAL_BOOKS", totalBooks);
		request.setAttribute("TOTAL_ORDERS", totalOrders);
		request.setAttribute("TOTAL_REVIEWS", totalReviews);
		
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.DASHBOARD);
		rd.forward(request, response);
	}

}
