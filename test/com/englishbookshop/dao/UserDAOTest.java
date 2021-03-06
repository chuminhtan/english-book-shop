package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Users;
import com.englishbookshop.helper.PersistenceProjectHelper;

public class UserDAOTest{

	private static UserDAO userDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		userDao = new UserDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		userDao.close();
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
		user.setUserId(61);
		user.setFullName("Chu Minh Tan");
		user.setEmail("chuminhtan@gmail.com");
		user.setPassword("09101995");
		
		Users userUpdated = userDao.update(user);
		
		assertEquals(user.getUserId(), userUpdated.getUserId());
		assertEquals(user.getFullName(), userUpdated.getFullName());
		assertEquals(user.getEmail(), userUpdated.getEmail());
		assertEquals(user.getPassword(), userUpdated.getPassword());	
	}
	
	@Test
	public void testUpdateNoPassword() {
		Users user = new Users();
		user.setUserId(61);
		user.setFullName("Nguyen Thi Le");
		user.setEmail("NguyenThiLe@gmail.com");
		
		int numUpdated = userDao.updateNoPassword(user);
		assertEquals(numUpdated,1);
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
	
	@Test
	public void testListAllUsers() {
		List<Users> listUser = userDao.listAll();
		
		if (listUser != null) {
			for(Users u : listUser) {
				System.out.println(u);
			}
		}
		
		assertTrue(listUser.size() > 0);
	}
	
	@Test
	public void testCountUsers() {
		long count = userDao.count();
		System.out.println(count);
		assertTrue(count > 0);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "chuminhtan@gmail.com";
		Users user = userDao.findByEmail(email);
		System.out.println(user);
		assertNotNull(user);
	}
	
	@Test
	public void testFindByEmailNonExits() {
		String email = "cmt@gmail.com";
		Users user = userDao.findByEmail(email);
		System.out.println(user);
		assertNull(user);
	}
	
	@Test
	public void testUserLoginSuccess() {
		String email = "admin2@gmail.com";
		String password ="hello";
		
		boolean result = userDao.checkLogin(email, password);
		System.out.println(result);
		assertTrue(result);
	}
	
	@Test
	public void testUserLoginFail() {
		String email = "chuminhtan@gmail.com";
		String password ="1234569878";
		
		boolean result = userDao.checkLogin(email, password);
		
		assertFalse(result);
	}
	
}
