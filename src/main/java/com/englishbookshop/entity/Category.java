package com.englishbookshop.entity;
// Generated Dec 10, 2021, 9:38:01 PM by Hibernate Tools 5.2.12.Final

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.englishbookshop.dao.CategoryDAO;
import com.englishbookshop.dao.UserDAO;
import com.englishbookshop.helper.PersistenceProjectHelper;
import org.hibernate.annotations.CacheConcurrencyStrategy;
/**
 * Category generated by hbm2java
 */
@Entity
@Table(name = "category", catalog = PersistenceProjectHelper.DATABASE_NAME)
@NamedQueries({
	@NamedQuery(name=CategoryDAO.CATEGORY_LIST_ALL, query="SELECT cat FROM Category cat ORDER BY cat.name"),
	@NamedQuery(name=CategoryDAO.CATEGORY_COUNT, query="SELECT COUNT(*) FROM Category"),
	@NamedQuery(name=CategoryDAO.CATEGORY_FIND_BY_NAME, query = "SELECT cat FROM Category cat WHERE name = :name")
})
@Cacheable
@org.hibernate.annotations.Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category implements java.io.Serializable {

	private Integer categoryId;
	private String name;
	private Set<Book> books = new HashSet<Book>(0);

	public Category() {
	}

	public Category(String name) {
		this.name = name;
	}

	public Category(String name, Set<Book> books) {
		this.name = name;
		this.books = books;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "category_id", unique = true, nullable = false)
	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "name", nullable = false, length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "category")
	public Set<Book> getBooks() {
		return this.books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", name=" + name + ", books=" + books + "]";
	}

	
}
