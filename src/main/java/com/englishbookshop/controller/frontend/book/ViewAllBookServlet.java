package com.englishbookshop.controller.frontend.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.BookServices;

@WebServlet("/all-books")
public class ViewAllBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewAllBookServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request, response);
		bookServices.viewAllBooks();
	}

}
