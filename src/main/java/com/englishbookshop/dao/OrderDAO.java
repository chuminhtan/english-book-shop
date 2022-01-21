package com.englishbookshop.dao;

import java.util.Date;
import java.util.List;

import com.englishbookshop.entity.BookOrder;

public class OrderDAO extends JpaDAO<BookOrder> implements IGenericDAO<BookOrder> {
	
	public static final String ORDER_LIST_ALL = "Order.listAll";
	
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

	@Override
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookOrder> listAll() {
		return super.findWithNamedQuery(ORDER_LIST_ALL);
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
