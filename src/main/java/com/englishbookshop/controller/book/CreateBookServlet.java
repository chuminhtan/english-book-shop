package com.englishbookshop.controller.book;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.service.BookServices;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/books/create-book")
public class CreateBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public CreateBookServlet() {

    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.showCreateForm();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
