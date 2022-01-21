package com.englishbookshop.controller.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.OrderServices;

@WebServlet("/admin/orders/order-detail")
public class OrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public OrderDetailServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderServices orderServices = new OrderServices(request, response);
		orderServices.showOrderDetail();
	}

}
