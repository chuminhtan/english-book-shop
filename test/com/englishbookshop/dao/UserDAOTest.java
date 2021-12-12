package com.englishbookshop.dao;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Users;

public class UserDAOTest {
	private static EntityManagerFactory entityManagerFactory; 
	private static EntityManager entityManager;
	private static UserDAO userDao;
	
	@BeforeClass
	public static void setUpClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("TheEnglishBookShop");
		entityManager = entityManagerFactory.createEntityManager();	
		userDao = new UserDAO(entityManager);
	}
	
	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setFullName("Mr. Test 2");
		user1.setEmail("mrtest2@gmail.com");
		user1.setPassword("1234");
		
		user1 = userDao.create(user1);
		
		assertTrue("User was added to database", user1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldNotSet() {
		Users user1 = new Users();
		
		userDao.create(user1);
	}
	
	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(12);
		user.setFullName("Hello Update");
		user.setEmail("helloupdate@gmail.com");
		user.setPassword("4444");
		
		Users userUpdated = userDao.update(user);
		
		assertEquals(user.getUserId(), userUpdated.getUserId());
		assertEquals(user.getFullName(), userUpdated.getFullName());
		assertEquals(user.getEmail(), userUpdated.getEmail());
		assertEquals(user.getPassword(), userUpdated.getPassword());	
	}
	
	@Test
	public void testGetUsersFound() {
		Users user = userDao.get(1);
		
		if (user != null) {
			System.out.println(user.getEmail());
		}
		assertNotNull("User is Null", user);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Users user = userDao.get(100);
		assertNull(user);
	}
	
	@Test
	public void testDeleteUsers() {
		Integer userId = 54;
		userDao.delete(userId);
		
		Users user = userDao.get(userId);
		
		assertNull(user);
	}
	
	@Test(expected=EntityNotFoundException.class)
	public void testDeleteNonExistUsers() {
		Integer userId = 54;
		userDao.delete(userId);
	}
	
	@AfterClass
	public static void tearDownClass() {
		entityManager.close();
		entityManagerFactory.close();
	}

}
