package com.englishbookshop.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.englishbookshop.dao.ReviewDAO;
import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;
import com.englishbookshop.entity.Customer;
import com.englishbookshop.entity.Review;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ReviewServices extends BaseServices {
	private ReviewDAO reviewDao;

	public ReviewServices(HttpServletRequest request, HttpServletResponse response) {
		super(request, response);
		reviewDao = new ReviewDAO();
	}

	public void listAll(String message) throws ServletException, IOException {
		List<Review> listReviews = reviewDao.listAll();

		if (message != null) {
			request.setAttribute(ServletHelper.MESSAGE, message);
		}

		request.setAttribute("LIST_REVIEWS", listReviews);
		RequestDispatcher rd = request.getRequestDispatcher(JspPathHelper.REVIEW_LIST);
		rd.forward(request, response);
	}

	public void showEditForm() throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Review review = reviewDao.get(id);

		request.setAttribute("REVIEW", review);
		request.getRequestDispatcher(JspPathHelper.REVIEW_EDIT).forward(request, response);
	}

	public void updateReview() throws ServletException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("review-id"));
		Review reviewForm = readFormDataByAdmin();

		if (reviewForm == null) {
			String message = "Could not find review with ID: " + reviewId;
			listAll(message);
			return;
		}
		
		reviewDao.update(reviewForm);
		listAll("Review with ID " + reviewId + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);
	}

	private Review readFormDataByAdmin() {
		int reviewId = Integer.parseInt(request.getParameter("review-id"));
		Review reviewById = reviewDao.get(reviewId);

		if (reviewById == null) {
			return null;
		}

		Review reviewForm = new Review();
		reviewForm.setReviewId(reviewId);
		reviewForm.setBook(reviewById.getBook());
		reviewForm.setCustomer(reviewById.getCustomer());
		reviewForm.setHeadline(request.getParameter("headline"));
		reviewForm.setComment(request.getParameter("comment"));
		reviewForm.setRating(reviewById.getRating());

		return reviewForm;
	}
	
	private Review readFormDataByCustomer() {

		return null;
	}

	public void deleteReview() throws IOException {
		int reviewId = Integer.parseInt(request.getParameter("id"));
		
		Map<String, Object> result = new HashMap<String, Object>();

		Review review = reviewDao.get(reviewId);

		if (reviewId == 1) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_COULD_NOT_DELETE_DEFAULT);
		} else if (review == null) {
			result.put(ServletHelper.MESSAGE, ServletHelper.MESSAGE_DOES_NOT_EXIST);
		} else {

			reviewDao.delete(reviewId);
			result.put(ServletHelper.MESSAGE, "The review with ID " + reviewId + " has been deleted");
		}

		String resultJson = new Gson().toJson(result);

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(resultJson);
	}

	public void createReviewByCustomer() throws IOException {
		Map<String, Object> result = new HashMap<>();
		
		// Check logged customer
		Customer customer =  CommonUtility.getCustomerLogged(request);
		
		System.out.println("Customer Session: " + customer);
		if (customer == null) {
			result.put("result", "fail");
			CommonUtility.sendJsonRespone(result, response);
			return;
		}
	
		JsonObject jsonObject = CommonUtility.getJsonObjectFromRequest(request);
	
		int bookId = Integer.parseInt(jsonObject.get("bookId").getAsString());
		int rating = Integer.parseInt(jsonObject.get("rating").getAsString());
		String headline = jsonObject.get("headline").getAsString();
		String comment = jsonObject.get("comment").getAsString();
		
		Review review = new Review();
		
		Book book = new Book();
		book.setBookId(bookId);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setRating(rating);
		review.setHeadline(headline);
		review.setComment(comment);
		
		Review createdReview = reviewDao.create(review);
		
		if (createdReview == null) {		
			result.put("result", "fail");
			
		} else {
			result.put("result", "success");		
		}

		CommonUtility.sendJsonRespone(result, response);
	}

	public void findReviewByCustomer() throws IOException {
		Customer loggedCustomer = CommonUtility.getCustomerLogged(request);
		
		if (loggedCustomer == null) {
			return;
		}
		
		Map<String, Object> result = new HashMap<>();
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int customerId = loggedCustomer.getCustomerId();

		Review review = reviewDao.findByCustomerAndBook(customerId, bookId);
		
		if (review == null) {
			result.put("result", "no");	
		} else {
			result.put("result", "yes");
			result.put("headline", review.getHeadline());
			result.put("comment", review.getComment());
			result.put("reviewTime", review.getReviewTime());
			result.put("rating", review.getRating());
		}
	
		CommonUtility.sendJsonRespone(result, response);
	}
}