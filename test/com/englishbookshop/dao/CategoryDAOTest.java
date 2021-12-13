package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Category;
import com.englishbookshop.helper.PersistenceProjectInfo;

public class CategoryDAOTest extends BaseDAOTest{

	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setUpBeforeClass();
		categoryDAO = new CategoryDAO(entityManager);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		BaseDAOTest.tearDownAfterClass();
	}

	@Test
	public void testCreateCategory() {
		Category category = new Category("TOEIC LR");
		
		category = categoryDAO.create(category);
		
		assertTrue(category != null && category.getCategoryId() > 0);
	}
	
	@Test
	public void testUpdateCategory() {
		Category cat = new Category("IT");
		cat.setCategoryId(1);
		
		Category catUpdated = categoryDAO.update(cat);
		
		assertEquals(cat.getName(), catUpdated.getName());
	}

	@Test
	public void testGet() {
		Category cat = categoryDAO.get(1);
		
		System.out.println(cat);
		
		assertNotNull(cat);
	}

	@Test
	public void testDeleteObject() {
		categoryDAO.delete(4);
		Category cat = categoryDAO.get(4);
	
		assertNull(cat);
	}

	@Test
	public void testListAll() {
		List<Category> listCat = categoryDAO.listAll();
		
		System.out.println(listCat);
		assertTrue(listCat.size() > 0);
	}

	@Test
	public void testCount() {
		long expected = 3;
		long actual = categoryDAO.count();
		
		System.out.println(actual);
		assertEquals(expected, actual);
	}

}
