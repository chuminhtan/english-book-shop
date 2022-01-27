package com.englishbookshop.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.BookOrder;

public class OrderDAO extends JpaDAO<BookOrder> implements IGenericDAO<BookOrder> {
	
	public static final String ORDER_LIST_ALL = "Order.listAll";
	public static final String ORDER_COUNT = "Order.count";
	public static final String ORDER_LIST_BY_CUSTOMER = "Order.listByCustomer";
	public static final String ORDER_FIND_BY_ID_AND_CUSTOMER = "Order.findByIdAndCustomer";

	
	@Override
	public BookOrder create(BookOrder order) {
		order.setOrderDate(new Date());
		order.setPaymentMethod("Cash On Delivery");
		order.setStatus("Processing");
		return super.create(order);
	}

	@Override
	public BookOrder update(BookOrder order) {
		return super.update(order);
	}

	@Override
	public BookOrder get(Object orderId) {
		return super.find(BookOrder.class, orderId);
	}
	

	public BookOrder get(Object orderId, Object customerId) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("customerId", customerId);
		parameters.put("orderId", orderId);
		List<BookOrder> listOrders =  super.findWithNamedQuery(ORDER_FIND_BY_ID_AND_CUSTOMER, parameters);
		
		if (listOrders.size() == 1) {
			return listOrders.get(0);
		}
		
		return null;
	}

	@Override
	public void delete(Object orderId) {
		super.delete(BookOrder.class, orderId);
		
	}

	@Override
	public List<BookOrder> listAll() {
		return super.findWithNamedQuery(ORDER_LIST_ALL);
	}

	@Override
	public long count() {
		return super.countWithNamedQuery(ORDER_COUNT);
	}
	
	
	public List<BookOrder> listByCustomer(int customerId) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("customerId", customerId);
		return super.findWithNamedQuery(ORDER_LIST_BY_CUSTOMER, parameters);
	}
	

}
