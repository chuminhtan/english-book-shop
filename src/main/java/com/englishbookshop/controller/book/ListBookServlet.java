package com.englishbookshop.controller.book;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.service.BookServices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/books/")
public class ListBookServlet extends BaseServlet {

	public ListBookServlet() {
		super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.listBooks(null,null);
	}

}
