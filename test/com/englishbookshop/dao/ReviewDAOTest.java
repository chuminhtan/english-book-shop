package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Customer;
import com.englishbookshop.entity.Review;

public class ReviewDAOTest {
	private static ReviewDAO reviewDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDao = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDao.close();
	}
	
	@Test
	public void testCreate() {
		Review review = new Review();
		
		Book book = new Book();
		book.setBookId(1);
		
		Customer customer = new Customer();
		customer.setCustomerId(2);
		
		review.setBook(book);
		review.setCustomer(customer);
		review.setHeadline("This book is very good!");
		review.setComment("I have been reading it for five months, and it is very interesting.");
		review.setRating(5);
		review.setReviewTime(new Date());
		
		review = reviewDao.update(review);

		assertTrue(review.getReviewId() > 0);
	}

	@Test
	public void testGet() {
		int id = 1;
		Review review = reviewDao.get(id);
		System.out.println(review.toString());
		assertNotNull(review);
	}

	@Test
	public void testDeleteReview() {
		int id = 2;
		reviewDao.delete(id);
		
		Review review = reviewDao.get(id);
		System.out.println("Deleted Review: " + review);
		
		assertNull(review);
	}

	@Test
	public void testListAll() {
		List<Review> listReviews = reviewDao.listAll();
		
		for (Review review: listReviews) {
			System.out.println(review);
		}
		
		assertNotNull(listReviews);
	}

	@Test
	public void testCount() {
		long numberOfReviews = reviewDao.count();
		assertEquals(numberOfReviews,2);
	}
	
	@Test
	public void testUpdate() {
		Review review = reviewDao.get(1);
		review.setHeadline("Very bad");
		review.setRating(1);
		
		Review updatedReview = reviewDao.update(review);
		assertEquals(updatedReview.getHeadline(), review.getHeadline());
	}
	
	@Test
	public void testFindByCustomerAndBook() {
		int customerId = 2;
		int bookId = 1;
		
		Review findedReview = reviewDao.findByCustomerAndBook(customerId, bookId);
		System.out.println(findedReview);
		assertNotNull(findedReview);
	}

	@Test
	public void testListRecentReviews() {
		List<Review> listRecentReviews = reviewDao.listMostRecentReviews();
		
		assertTrue(listRecentReviews.size() == 5);
	}
}
