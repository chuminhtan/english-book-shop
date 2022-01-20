package com.englishbookshop.controller.frontend.shoppingcart;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.Map;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Book;

public class ShoppingCartTest {
	private static ShoppingCart cart;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		cart = new ShoppingCart();
		Book book = new Book(1);
		book.setPrice(20);
		cart.addItem(book);
	}

	@Test
	public void testAddItem() {
		Book book = new Book(2);
		cart.addItem(book);
		
		Map<Book, Integer> listItems = cart.getItems();
		assertEquals(2, listItems.size());
	}
	
	@Test
	public void testRemoveItem() {
		cart.removeItem(new Book(1));
		System.out.println(cart.getItems().size());
		assertTrue(cart.getItems().isEmpty());
	}
	
	@Test
	public void testGetTotalQuantity(){
		Book book2 = new Book(2);
		cart.addItem(book2);
		cart.addItem(book2);
		cart.addItem(book2);
		assertEquals(4, cart.getTotalQuantity());
	}
	
	@Test
	public void testGetTotalAmount() {
		Book book2 = new Book(2);
		book2.setPrice(15);
		cart.addItem(book2);
		cart.addItem(book2);
		cart.addItem(book2); 
		cart.addItem(book2); 

		assertTrue(cart.getTotalAmount() == 80);
	}
	
	@Test
	public void testClear() {
		cart.clear();
		
		assertEquals(0, cart.getTotalQuantity());
	}
}
