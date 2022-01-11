package com.englishbookshop.controller.frontend;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.service.BookServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewBookServlet
 */
@WebServlet("/view-book")
public class ViewBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public ViewBookServlet() {
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.viewBookDetail();
	}

}
