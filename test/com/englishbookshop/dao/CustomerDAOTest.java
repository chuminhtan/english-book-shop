package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Customer;

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
		customer.setFullname("Minh Tan");
		customer.setCity("Ho Chi Minh");
		customer.setAddress("123 Phan Van Hon");
		customer.setCountry("Viet Nam");
		customer.setPassword("123456");
		customer.setPhone("0906664444");
		customer.setZipcode("700000");
		
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
		customer.setFullname(fullName);;
		Customer updatedCustomer = customerDao.update(customer);
		assertTrue(updatedCustomer.getFullname().contentEquals(fullName));
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

}
