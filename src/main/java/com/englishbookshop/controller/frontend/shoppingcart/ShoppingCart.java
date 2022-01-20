package com.englishbookshop.controller.frontend.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.englishbookshop.entity.Book;

public class ShoppingCart {
	private Map<Book, Integer> cart = new HashMap<>();
	
	public void addItem(Book book) {
		if (cart.containsKey(book)) {
			int quantity = cart.get(book) + 1;
			cart.replace(book, quantity);
			
		} else {
			cart.put(book, 1);
		}
	}
	
	public Map<Book, Integer> getItems(){
		return this.cart;
	}
	
	public void removeItem(Book book) {
		cart.remove(book);
	}
	
	public int getTotalQuantity() {
		
		int total = 0;
		
		Iterator<Book> iterator = cart.keySet().iterator();
		
		while(iterator.hasNext()) {
			Book book = iterator.next();
			int quantity = cart.get(book);
			total += quantity;
		}
		
		return total;
	}
	
	public double getTotalAmount() {
		double totalAmount = 0;
		
		Iterator<Book> iterator = cart.keySet().iterator();
		
		while(iterator.hasNext()) {
			Book book = iterator.next();
			int quantity = cart.get(book);
			double price = book.getPrice();
			
			totalAmount += quantity*price;
		}
		
		return totalAmount;
	}
	
	public void clear() {
		cart.clear();
	}
}
