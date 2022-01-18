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

import com.englishbookshop.dao.ReviewDAO;
import com.englishbookshop.entity.Category;
import com.englishbookshop.entity.Review;
import com.englishbookshop.helper.JspPathHelper;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;

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
		Review reviewForm = readFormData();

		if (reviewForm == null) {
			String message = "Could not find review with ID: " + reviewId;
			listAll(message);
			return;
		}
		
		reviewDao.update(reviewForm);
		listAll("Review with ID " + reviewId + ServletHelper.MESSAGE_UPDATE_SUCCESSFULLY);
	}

	private Review readFormData() {
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
}