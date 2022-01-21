package com.englishbookshop.dao;

import java.util.Date;
import java.util.List;

import com.englishbookshop.entity.BookOrder;

public class OrderDAO extends JpaDAO<BookOrder> implements IGenericDAO<BookOrder> {

	@Override
	public BookOrder create(BookOrder order) {
		order.setOrderDate(new Date());
		order.setPaymentMethod("Cash On Delivery");
		order.setStatus("Processing");
		return super.create(order);
	}

	@Override
	public BookOrder update(BookOrder t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BookOrder get(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Object obj) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookOrder> listAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
