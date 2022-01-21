package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.englishbookshop.entity.Book;
import com.englishbookshop.entity.BookOrder;
import com.englishbookshop.entity.Customer;
import com.englishbookshop.entity.OrderDetail;

public class OrderDAOTest {
	private static OrderDAO orderDao;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDao = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDao.close();
	}

	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		
		Customer customer = new Customer();
		customer.setCustomerId(1);
		
		order.setCustomer(customer);
		order.setRecipientName("Nguyen Van A");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 South Street, New York");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		OrderDetail orderDetail = new OrderDetail();
		
		Book book = new Book(6);
		orderDetail.setBook(book);
		orderDetail.setBookOrder(order);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(60f);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		BookOrder savedOrder = orderDao.create(order);
		
		assertNotNull(savedOrder);
		
	}

	@Test
	public void testUpdateBookOrder() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteObject() {
		fail("Not yet implemented");
	}

	@Test
	public void testListAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testCount() {
		fail("Not yet implemented");
	}

}
