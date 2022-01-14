package com.englishbookshop.dao;

import java.util.Date;
import java.util.List;

import com.englishbookshop.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements IGenericDAO<Customer> {
	public static final String CUSTOMER_LIST_ALL = "Customer.listAll";
	public static final String CUSTOMER_COUNT = "Customer.count";

	@Override
	public Customer get(Object id) {	
		return super.find(Customer.class, id);
	}

	@Override
	public Customer create(Customer customer) {
		customer.setRegisterDate(new Date());
		
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

}
