package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Locale;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Customer;
import com.github.javafaker.Faker;

public class CustomerDAOTest {
	private static CustomerDAO customerDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	public void testGet() {
		Integer customerId = 1;
		Customer customer = customerDao.get(customerId);
		
		assertTrue(customer != null);
	}

	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("minhtan@mail.com");
		customer.setFullName("Minh Tan");
		customer.setCity("Ho Chi Minh");
		customer.setAddress("123 Phan Van Hon");
		customer.setCountry("Viet Nam");
		customer.setPassword("123456");
		customer.setPhone("0906664444");
		customer.setZipCode("700000");
		
		Customer savedCustomer = customerDao.create(customer);
	
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	public void testDeleteCustomer() {
		Integer customerId = 1;
		customerDao.delete(customerId);
		
		Customer customer = customerDao.get(customerId);
		assertNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(1);
		String fullName="Thao Le";
		customer.setFullName(fullName);;
		Customer updatedCustomer = customerDao.update(customer);
		assertTrue(updatedCustomer.getFullName().contentEquals(fullName));
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test
	public void testCount() {
		long totalCustomers = customerDao.count();
		
		assertTrue(totalCustomers == 1);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "minhtan@mail.com";
		Customer customer = customerDao.findByEmail(email);
		assertTrue(customer.getCustomerId() == 2);
	}
	
	@Test
	public void testUpdateNoPassword() {
		Customer customer = customerDao.get(5);
		System.out.println(customer);
		customer.setEmail("changedEmail@gmail.com");
		customer.setFullName("changed Full Name");
		customer.setPhone("1112223334");
		customer.setAddress("changed Address");
		customer.setCity("changed city");
		customer.setZipCode("changed zipcode");
		customer.setCountry("changed country");
	
		boolean result = customerDao.updateNoPassword(customer);
			
		assertTrue(result);
	}
	
	@Test
	public void testUpdate() {
		Customer customer = customerDao.get(5);
		System.out.println(customer);
		customer.setEmail("new@gmail.com");
		customer.setFullName("new Full Name");
		customer.setPhone("new phone");
		customer.setAddress("new Address");
		customer.setCity("new city");
		customer.setZipCode("new zipcode");
		customer.setCountry("new country");
		customer.setPassword("28101999");
		
		Customer updatedCus = customerDao.update(customer);
		System.out.println(updatedCus);
		assertNotNull(updatedCus);
	}

	@Test
	public void testCheckLoginSuccess() {
		String email="nguyenvanc@gmail.com";
		String password="123456";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		if (customer != null) {
			System.out.println(customer);
		}
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckLoginFail() {
		String email="nguyenvanc@gmail.com";
		String password="123456";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		if (customer != null) {
			System.out.println(customer);
		}
		
		assertNull(customer);
	}
	
	@Test
	public void testCountOrdersByCustomer() {
		int customerId = 2;
		long numOfOrders = customerDao.countOrdersByCustomer(customerId);
		System.out.println(numOfOrders);
		assertTrue(numOfOrders > 0);
	}
	
	@Test
	public void testCountReviewsByCustomer() {
		int customerId = 2;
		long numOfReviews = customerDao.countReviewsByCustomer(customerId);
		System.out.println(numOfReviews);
		assertTrue(numOfReviews > 0);
	}
	
	@Test
	public void createMultipleCustomers() {
		Faker faker = new Faker(new Locale("en-US"));

		String name = faker.name().fullName(); // Miss Samanta Schmidt
		String firstName = faker.name().firstName(); // Emory
		String lastName = faker.name().lastName(); // Barton

		String streetAddress = faker.address().streetAddress() + ", " + faker.address().city() + ", " + faker.address().country();
		
		for (int i = 0; i < 10 ; i++) {
			Customer customer = new Customer();
			customer.setEmail(faker.internet().emailAddress());
			customer.setPassword("123456");
			customer.setFullName(faker.name().fullName());
			customer.setPhone(faker.phoneNumber().cellPhone());
			customer.setCity(faker.address().city());
			customer.setCountry(faker.address().country());
			customer.setZipCode(faker.address().zipCode());
			customer.setAddress(faker.address().streetAddress());
			
			customer = customerDao.create(customer);
			assertTrue(customer.getCustomerId() > 0);
		}
	}
}
