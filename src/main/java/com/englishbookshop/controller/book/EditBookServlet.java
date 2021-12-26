package com.englishbookshop.controller.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.controller.BaseServlet;
import com.englishbookshop.service.BookServices;

@WebServlet("/admin/books/edit-book")
@MultipartConfig(
		fileSizeThreshold = 1024*10,
		maxFileSize = 1024*300,
		maxRequestSize = 1024*1024
)
public class EditBookServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public EditBookServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.showEditForm();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(entityManager, request, response);
		bookServices.updateBook();
	}

}
