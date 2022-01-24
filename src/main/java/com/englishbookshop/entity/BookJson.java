package com.englishbookshop.entity;

public class BookJson {
	private int bookId;
	private String title;
	private String author;
	private String imageBase64;
	private double price;
	private double rating;
	private int numOfReviews;
	
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getNumOfReviews() {
		return numOfReviews;
	}
	public void setNumOfReviews(int numOfReviews) {
		this.numOfReviews = numOfReviews;
	}
	public String getImageBase64() {
		return imageBase64;
	}
	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}
	
	
	
}
