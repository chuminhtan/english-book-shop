package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Category;

import net.sf.ehcache.CacheManager;


public class CategoryDAOTest{

	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
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
		int size = CacheManager.ALL_CACHE_MANAGERS.get(0).getCache("com.englishbookshop.hibernate.cache.model.Category").getSize();

		System.out.println(CacheManager.ALL_CACHE_MANAGERS.get(0).getCache("com.englishbookshop.entity.Category").getSize());
		
		assertNotNull(cat);
	}

	@Test
	public void testDeleteCategory() {
		categoryDAO.delete(8);
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
		long actual = categoryDAO.count();
		assertTrue(actual > 0);
	}
	
	@Test
	public void testFindByName() {
		String name = "Complete IELTS 4-5";
		Category cat = categoryDAO.findByName(name);
		System.out.println(cat);
		assertTrue(cat.getCategoryId() == 2);
	}

}
