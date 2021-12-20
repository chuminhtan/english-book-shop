package com.englishbookshop.controller.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;

@WebFilter("/admin/*")
public class AdminFilterServlet implements Filter {

    public AdminFilterServlet() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		
		boolean isLoggedIn = session != null && session.getAttribute(ServletHelper.SESSION_USER_EMAIL) != null;
		String loginUrl = httpRequest.getContextPath() + "/admin/login";
		boolean isLoginRequest = httpRequest.getRequestURI().equals(loginUrl);
		boolean isLoginPage = httpRequest.getRequestURI().endsWith(JspPathHelper.ADMIN_LOGIN);
		
		if (isLoggedIn && (isLoginRequest || isLoginPage)) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.ADMIN_HOME);
//			dispatcher.forward(request, response);
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/");
			
		} else if (isLoggedIn || isLoginRequest) {
			chain.doFilter(request, response);	
			
		} else {
//			RequestDispatcher dispatcher = request.getRequestDispatcher(JspPathHelper.ADMIN_LOGIN);
//			dispatcher.forward(request, response);
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/login");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
