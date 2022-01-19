package com.englishbookshop.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.englishbookshop.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements IGenericDAO<Review> {
	public static final String REVIEW_LIST_ALL = "Review.listAll";
	public static final String REVIEW_COUNT = "Review.count";
	public static final String REVIEW_FIND_BY_CUSTOMER_AND_BOOK = "Review.findByCustomerAndBook";
	
	@Override
	public Review create(Review review) {
		review.setReviewTime(new Date());
		return super.create(review);
	}
	@Override
	public Review get(Object id) {
		return super.find(Review.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Review.class, id);
	}

	@Override
	public List<Review> listAll() {
		
		return super.findWithNamedQuery(REVIEW_LIST_ALL);
	}

	@Override
	public long count() {
		
		return super.countWithNamedQuery(REVIEW_COUNT);
	}
	
	@Override
	public Review update(Review review) {
		return super.update(review);
	}
	
	public Review findByCustomerAndBook(int customerId, int bookId) {
		
		Map<String, Object> parameters = new HashMap<>();
		
		parameters.put("customerId", customerId);
		parameters.put("bookId", bookId);
		
		List<Review> listReviews = super.findWithNamedQuery(REVIEW_FIND_BY_CUSTOMER_AND_BOOK, parameters);
		
		if (listReviews.size() != 1) {
			return null;
		}
		
		return listReviews.get(0);
	}
	

}
