package com.englishbookshop.dao;

import java.util.List;

import com.englishbookshop.entity.Review;

public class ReviewDAO extends JpaDAO<Review> implements IGenericDAO<Review> {
	public static final String REVIEW_LIST_ALL = "Review.listAll";
	public static final String REVIEW_COUNT = "Review.count";
	
	@Override
	public Review create(Review review) {
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
	

}
