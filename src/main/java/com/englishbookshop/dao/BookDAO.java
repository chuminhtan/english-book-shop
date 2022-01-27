package com.englishbookshop.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.englishbookshop.entity.Book;

public class BookDAO extends JpaDAO<Book> implements IGenericDAO<Book> {
	public static final String BOOK_LIST_ALL = "Book.listAll";
	public static final String BOOK_FIND_BY_TITLE = "Book.findByTitle";
	public static final String BOOK_COUNT = "Book.count";
	public static final String BOOK_FIND_BY_CATEGORY = "Book.findByCategory";
	public static final String BOOK_LIST_NEW_BOOKS = "Book.listNewBooks";
	public static final String BOOK_SEARCH = "Book.search";
	public static final String BOOK_COUNT_BY_CATEGORY = "Book.countByCategory";
	public static final String BOOK_COUNT_ORDERS_BY_BOOK = "Book.countOrdersByBook";
	public static final String BOOK_COUNT_REVIEWS_BY_BOOK = "Book.countReviewsByBook";
	
	public BookDAO() {
	}

	@Override
	public Book get(Object id) {
		return super.find(Book.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Book.class, id);
	}

	@Override
	public List<Book> listAll() {
		return super.findWithNamedQuery(BOOK_LIST_ALL);
	}

	@Override
	public long count() {
		return super.countWithNamedQuery(BOOK_COUNT);
	}
	
	@Override
	public Book update(Book book) {
		book.setLastUpdateTime(new Date());
		return super.update(book);
	}
	
	@Override
	public Book create(Book book) {
		book.setLastUpdateTime(new Date());
		return super.create(book);
	}
	
	public Book findByTitle(String title) {
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("title", title);
		List<Book> listBooks =  super.findWithNamedQuery(BOOK_FIND_BY_TITLE, parameters);
		
		if (listBooks.size() > 0) {
			return listBooks.get(0);
		}
		
		return null;
	}
	
	public List<Book> findByCategory(int categoryId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("categoryId", categoryId);
		
		return super.findWithNamedQuery(BOOK_FIND_BY_CATEGORY, parameters);
	}
	
	public List<Book> listNewBooks(){
		return super.findWithNamedQuery(BOOK_LIST_NEW_BOOKS, 0, 4);
	}
	
	public List<Book> search(String keyword) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("keyword", keyword);
		return super.findWithNamedQuery(BOOK_SEARCH, parameters);
	}

	public long countByCategory(int categoryId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("categoryId", categoryId);
		
		return super.countWithNamedQuery(BOOK_COUNT_BY_CATEGORY, parameters);
	}
	
	public long countOrdersByBook(int bookId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bookId", bookId);
		
		return super.countWithNamedQuery(BOOK_COUNT_ORDERS_BY_BOOK, parameters);
	}
	
	public long countReviewsByBook(int bookId) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("bookId", bookId);
		
		return super.countWithNamedQuery(BOOK_COUNT_REVIEWS_BY_BOOK, parameters);
	}
	
	public List<Book> listBestSellingBooks() {
		
		return super.findWithNamedQuery(ORDER_DETAIL_LIST_BEST_SELLING,0,4);
	}
	
	public static final String ORDER_DETAIL_LIST_BEST_SELLING = "Order.listBestSelling";

}
