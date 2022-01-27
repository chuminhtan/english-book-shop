package com.englishbookshop.entity;
// Generated Dec 10, 2021, 9:38:01 PM by Hibernate Tools 5.2.12.Final

import java.util.Base64;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import com.englishbookshop.dao.BookDAO;
import com.englishbookshop.dao.OrderDAO;

/**
 * Book generated by hbm2java
 */
@Entity
@Table(name = "book", catalog = "bookshopdb", uniqueConstraints = @UniqueConstraint(columnNames = "title"))
@NamedQueries({ @NamedQuery(name = BookDAO.BOOK_LIST_ALL, query = "SELECT b FROM Book b"),
		@NamedQuery(name = BookDAO.BOOK_FIND_BY_TITLE, query = "SELECT b FROM Book b WHERE b.title = :title"),
		@NamedQuery(name = BookDAO.BOOK_COUNT, query = "SELECT COUNT(b.bookId) FROM Book b"),
		@NamedQuery(name = BookDAO.BOOK_FIND_BY_CATEGORY, query = "SELECT b FROM Book b JOIN Category c ON b.category.categoryId = c.categoryId"
				+ " WHERE c.categoryId = :categoryId"),
		@NamedQuery(name = BookDAO.BOOK_LIST_NEW_BOOKS, query = "SELECT b FROM Book b ORDER BY b.publishDate DESC"),
		@NamedQuery(name = BookDAO.BOOK_SEARCH, query = "SELECT b FROM Book b WHERE b.title LIKE '%' || :keyword || '%' "
				+ "OR b.author LIKE '%' || :keyword || '%'" + "OR b.description LIKE '%' || :keyword || '%'"),
		@NamedQuery(name = BookDAO.BOOK_COUNT_BY_CATEGORY, query = "SELECT COUNT(b.bookId) FROM Book b WHERE b.category.categoryId = :categoryId"),
		@NamedQuery(name = BookDAO.BOOK_COUNT_ORDERS_BY_BOOK, query = "SELECT COUNT(od.bookOrder) "
				+ "FROM OrderDetail od "
				+ "WHERE od.book.bookId = :bookId"),
@NamedQuery(name = BookDAO.BOOK_COUNT_REVIEWS_BY_BOOK, query = "SELECT COUNT(r) "
		+ "FROM Review r "
		+ "WHERE r.book.bookId = :bookId"),
@NamedQuery(name = BookDAO.ORDER_DETAIL_LIST_BEST_SELLING, query="SELECT od.book FROM OrderDetail od "
		+ "GROUP BY od.book.bookId ORDER BY SUM(od.quantity) DESC")
})
		
public class Book implements java.io.Serializable {

	private Integer bookId;
	private Category category;

	private String title;
	private String author;
	private String description;
	private String shortDescription;
	private String isbn;
	private byte[] image;
	private String imageBase64;
	private float price;
	private Date publishDate;
	private Date lastUpdateTime;
	private Set<Review> reviews = new HashSet<Review>(0);
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	public Book(int bookId) {
		super();
		this.bookId = bookId;
	}

	@Transient
	public String getShortDescription() {
		StringBuilder strBuilder = new StringBuilder(description);

		int start = -1;
		int end = -1;

		while (true) {
			start = strBuilder.indexOf("<");
			end = strBuilder.indexOf(">");

			if (start == -1 || end == -1) {
				break;
			}

			strBuilder.delete(start, end + 1);
		}

		return strBuilder.substring(0, 150).toString() + "...";
	}

	@Transient
	public String getImageBase64() {
		return Base64.getEncoder().encodeToString(this.image);
	}

	@Transient
	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}

	public Book() {
	}

	public Book(Category category, String title, String author, String description, String isbn, byte[] image,
			float price, Date publishDate, Date lastUpdateTime) {
		this.category = category;
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
	}

	public Book(Category category, String title, String author, String description, String isbn, byte[] image,
			float price, Date publishDate, Date lastUpdateTime, Set<Review> reviews, Set<OrderDetail> orderDetails) {
		this.category = category;
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.reviews = reviews;
		this.orderDetails = orderDetails;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "book_id", unique = true, nullable = false)
	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "title", unique = true, nullable = false, length = 128)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "author", nullable = false, length = 64)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "description", nullable = false, length = 16777215)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "isbn", nullable = false, length = 15)
	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Column(name = "image", nullable = false)
	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "price", nullable = false, precision = 12, scale = 0)
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update_time", nullable = false, length = 19)
	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
	public Set<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", title=" + title + ", author=" + author + ", price=" + price + "]";
	}

	@Transient
	public float getAverageRating() {
		float averageRating = 0.0f;
		float sum = 0.0f;

		for (Review review : reviews) {
			sum += review.getRating();
		}

		if (reviews.size() == 0) {
			return 0.0f;
		}
		averageRating = sum / reviews.size();

		return averageRating;
	}

	@Transient
	public int getNumOfRating() {
		return reviews.size();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bookId == null) ? 0 : bookId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (bookId == null) {
			if (other.bookId != null)
				return false;
		} else if (!bookId.equals(other.bookId))
			return false;
		return true;
	}
}
