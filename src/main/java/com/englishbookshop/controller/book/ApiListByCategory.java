package com.englishbookshop.controller.book;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.service.BookServices;

@WebServlet("/admin/api/book/list-by-category")
public class ApiListByCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ApiListByCategory() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request, response);
		bookServices.apiListByCategory();
	}

}
