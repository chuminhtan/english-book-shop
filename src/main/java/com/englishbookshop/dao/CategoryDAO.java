package com.englishbookshop.dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.englishbookshop.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements IGenericDAO<Category>{
	public static final String CATEGORY_LIST_ALL = "CategoryDAO.listAll";
	public static final String CATEGORY_COUNT = "CategoryDAO.count";
	
	public CategoryDAO(EntityManager entityManager) {
		super(entityManager);
		
	}
	
	@Override
	public Category create(Category category) {
		return super.create(category);
	}
	
	@Override
	public Category update(Category category) {
		return super.update(category);
	}

	@Override
	public Category get(Object categoryId) {
		return super.find(Category.class, categoryId);
	}

	@Override
	public void delete(Object categoryId) {
		super.delete(Category.class, categoryId);
		
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery(CATEGORY_LIST_ALL);
	}

	@Override
	public long count() {
		return super.countWithNamedQuery(CATEGORY_COUNT);
	}

}
