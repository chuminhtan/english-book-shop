package com.englishbookshop.controller.frontend.customer;

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

@WebFilter("/*")
public class CustomerLoginFilter implements Filter {
	private static final String[] loginRequiredURL = new String[] {
			"/checkout", "/place-order-success"
			};
    public CustomerLoginFilter() {
    }


	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());	
		
		if (path.startsWith("/admin")) {
			chain.doFilter(request, response);			
			return;
		}
			
		HttpSession session = httpRequest.getSession(false);
		boolean loggedIn = (session != null) && (session.getAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER) != null);
		System.out.println("Path: " + path);
		System.out.println("LoggedIn: " + loggedIn);
		
		boolean isPathNeedLogin = path.startsWith("/customer") || path.endsWith("/checkout") || path.endsWith("place-order-success");
		
		if (!loggedIn && isPathNeedLogin) {
			httpResponse.sendRedirect(httpRequest.getContextPath());
		} else {
			chain.doFilter(request, response);			
		}	
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
