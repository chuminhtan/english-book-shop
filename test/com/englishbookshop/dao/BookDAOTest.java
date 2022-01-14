package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.Category;

import junit.runner.BaseTestRunner;

public class BookDAOTest{

	private static BookDAO bookDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		bookDao = new BookDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDao.close();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book book = new Book();
		
		Category category = new Category();
		category.setCategoryId(1);
		category.setName("IT");
		
		book.setCategory(category);
		book.setTitle("Core");
		book.setAuthor("Joshua Bloch");
		book.setDescription("Are you looking for a deeper understanding of the Java� programming language so that you can write code that is clearer, more correct, more robust, and more reusable? Look no further! Effective Java�, Second Edition, brings together seventy-eight indispensable programmer�s rules of thumb: working, best-practice solutions for the programming challenges you encounter every day.\r\n" + 
				" \r\n" + 
				"This highly anticipated new edition of the classic, Jolt Award-winning work has been thoroughly updated to cover Java SE 5 and Java SE 6 features introduced since the first edition. Bloch explores new design patterns and language idioms, showing you how to make the most of features ranging from generics to enums, annotations to autoboxing.\r\n" + 
				" \r\n" + 
				"Each chapter in the book consists of several �items� presented in the form of a short, standalone essay that provides specific advice, insight into Java platform subtleties, and outstanding code examples. The comprehensive descriptions and explanations for each item illuminate what to do, what not to do, and why.");
		book.setIsbn("0321356683");
		book.setPrice(38.87f);
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		book.setPublishDate(publishDate);
		
		String imagePath = "D:\\book-data\\Core Java.JPG";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		book.setImage(imageBytes);
		
		Book bookCreated = bookDao.create(book);
		
		assertTrue(bookCreated.getBookId() > 0);
		
	}
	
	@Test
	public void testUpdateBook() throws ParseException, IOException {
		Book book = new Book();
		book.setBookId(2);
		Category category = new Category();
		category.setCategoryId(1);
		category.setName("IT");
		
		book.setCategory(category);
		book.setTitle("Java Core");
		book.setAuthor("Chu Minh Tan");
		book.setDescription("Are you looking for a deeper understanding of the Java� programming language so that you can write code that is clearer, more correct, more robust, and more reusable? Look no further! Effective Java�, Second Edition, brings together seventy-eight indispensable programmer�s rules of thumb: working, best-practice solutions for the programming challenges you encounter every day.\r\n" + 
				" \r\n" + 
				"This highly anticipated new edition of the classic, Jolt Award-winning work has been thoroughly updated to cover Java SE 5 and Java SE 6 features introduced since the first edition. Bloch explores new design patterns and language idioms, showing you how to make the most of features ranging from generics to enums, annotations to autoboxing.\r\n" + 
				" \r\n" + 
				"Each chapter in the book consists of several �items� presented in the form of a short, standalone essay that provides specific advice, insight into Java platform subtleties, and outstanding code examples. The comprehensive descriptions and explanations for each item illuminate what to do, what not to do, and why.");
		book.setIsbn("0321356683");
		book.setPrice(38.87f);
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		book.setPublishDate(publishDate);
		
		String imagePath = "D:\\book-data\\Effective Java.JPG";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		book.setImage(imageBytes);
		
		Book bookUpdated = bookDao.update(book);
		
		assertTrue(bookUpdated.getTitle().equals("Java Core"));
		
	}

	@Test
	public void testDeleteBook() {
		bookDao.delete(1);
		
		Book bookDeleted = bookDao.get(1);
		
		assertNull(bookDeleted);
	}
	
	@Test
	public void testGetBook() {
		Book book = bookDao.get(1);
		String shortDescription = book.getShortDescription();
		System.out.println(shortDescription);
		assertNotNull(book);
	}
	
	@Test
	public void testGetBookFail() {
		Book book = bookDao.get(1);
		
		assertNull(book);
	}
	
	@Test
	public void testListAll() {
		List<Book> listBooks = bookDao.listAll();
		
		for (Book book : listBooks) {
			System.out.println(book.getTitle() + " - " + book.getAuthor());
		
		}
		
		assertFalse(listBooks.isEmpty());
	}
	
	@Test
	public void testFindByTitle() {
		Book book = bookDao.findByTitle("Java Core");
		System.out.println(book);
		
		assertNotNull(book);
	}
	
	@Test
	public void testCount() {
		long count = bookDao.count();
		System.out.println(count);
		assertTrue(count > 0);
	}
	
	@Test
	public void testCountByCategory() {
		long numberOfBooks = bookDao.countByCategory(7);
		
		assertTrue(numberOfBooks == 4);
	}
	
	@Test
	public void testFindByCategory() {
		int categoryId = 2;
		List<Book> listBooks = bookDao.findByCategory(categoryId);
		
		if (listBooks != null) {
			for (Book book : listBooks) {
				System.out.println(book);
			}
		}
		
		assertNotNull(listBooks);
	}
	
	@Test
	public void testListNewBooks() {
		List<Book> listBooks = bookDao.listNewBooks();
		for (Book b:listBooks) {
			System.out.println(b);
		}
		assertTrue(listBooks.size() == 4);
	}
	
	@Test
	public void testSearchBookByTitle() {
		List<Book> listBooks = bookDao.search("java");
		for (Book b: listBooks) {
			System.out.println(b);
		}
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testSearchBookByAuthor() {
		List<Book> listBooks = bookDao.search("jashua");
		for (Book b: listBooks) {
			System.out.println(b);
		}
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testSearchBookByDescription() {
		List<Book> listBooks = bookDao.search("tests");
		for (Book b: listBooks) {
			System.out.println(b);
		}
		
		assertTrue(listBooks.size() > 0);
	}
}
