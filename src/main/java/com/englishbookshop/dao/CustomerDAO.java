package com.englishbookshop.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import com.englishbookshop.entity.Customer;
import com.englishbookshop.entity.Users;

public class CustomerDAO extends JpaDAO<Customer> implements IGenericDAO<Customer> {
	public static final String CUSTOMER_LIST_ALL = "Customer.listAll";
	public static final String CUSTOMER_COUNT = "Customer.count";
	public static final String CUSTOMER_FIND_BY_EMAIL = "Customer.findByEmail";
	public static final String CUSTOMER_UPDATE_NO_PASSWORD = "Customer.updateNoPassword";
	public static final String CUSTOMER_COUNT_ORDERS_BY_CUSTOMER = "Customer.countOrdersByCustomer";
	public static final String CUSTOMER_COUNT_REVIEWS_BY_CUSTOMER = "Customer.countReviewsByCustomer";
	
	@Override
	public Customer get(Object id) {	
		return super.find(Customer.class, id);
	}

	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		
		String password = customer.getPassword();
		String hashedPass = BCrypt.hashpw(password, BCrypt.gensalt(12));
		customer.setPassword(hashedPass);
		return super.create(customer);
	}

	@Override
	public void delete(Object id) {
		super.delete(Customer.class, id);
	}

	@Override
	public List<Customer> listAll() {
		return super.findWithNamedQuery(CUSTOMER_LIST_ALL);

	}

	@Override
	public long count() {
		return super.countWithNamedQuery(CUSTOMER_COUNT);
	}
	
	public Customer findByEmail(String email) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("email", email);
		
		List<Customer> listCustomers = super.findWithNamedQuery(CUSTOMER_FIND_BY_EMAIL, parameters);
		
		if (listCustomers != null && listCustomers.size() > 0) {
			return listCustomers.get(0);
		}
		
		return null;
	}
	
	public boolean updateNoPassword(Customer customer) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("customerId", customer.getCustomerId());
		parameters.put("email", customer.getEmail());
		parameters.put("fullName", customer.getFullName());
		parameters.put("phone", customer.getPhone());
		parameters.put("address", customer.getAddress());
		parameters.put("city", customer.getCity());
		parameters.put("zipCode", customer.getZipCode());
		parameters.put("country", customer.getCountry());
		
		int result = super.updateWithNamedQuery(CUSTOMER_UPDATE_NO_PASSWORD, parameters);
		
		if (result == 1) {
			return true;
		}
		
		return false;
	}
	
	public Customer update(Customer customer) {
		String password = customer.getPassword();
		String hashedPass = BCrypt.hashpw(password, BCrypt.gensalt(12));
		customer.setPassword(hashedPass);
		System.out.println(hashedPass);
		return super.update(customer);
	}
	
	public Customer checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("email", email);
		
		List<Customer> listCustomers = super.findWithNamedQuery(CUSTOMER_FIND_BY_EMAIL, parameters);
		
		if (listCustomers.size() != 1) {
			return null;
		}
		
		Customer customer = listCustomers.get(0);
		
		// Check password is correct
		String hashPass = customer.getPassword();
		boolean isCorrect = BCrypt.checkpw(password, hashPass);

		if (isCorrect) {
			return customer;
		}
		
		return null;	
	}
	
	public long countOrdersByCustomer(int customerId) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("customerId", customerId);
		return super.countWithNamedQuery(CUSTOMER_COUNT_ORDERS_BY_CUSTOMER, parameters);
	}
	
	public long countReviewsByCustomer(int customerId) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("customerId", customerId);
		return super.countWithNamedQuery(CUSTOMER_COUNT_REVIEWS_BY_CUSTOMER, parameters);
	}
}
