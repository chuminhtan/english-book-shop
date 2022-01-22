package com.englishbookshop.controller.frontend.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.OrderServices;

@WebServlet("/customer/view-orders")
public class ViewOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewOrdersServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.listOrdersByCustomer();
	}

}
