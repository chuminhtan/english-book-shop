package com.englishbookshop.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
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
		customer.setCustomerId(2);
		
		order.setCustomer(customer);
		order.setRecipientName("Nguyen Van B");
		order.setRecipientPhone("123456789");
		order.setShippingAddress("123 South Street, New York");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		
		OrderDetail orderDetail = new OrderDetail();
		Book book = new Book(6);
		orderDetail.setBook(book);
		orderDetail.setBookOrder(order);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(60f);
		
		OrderDetail orderDetail2 = new OrderDetail();
		Book book2 = new Book(8);
		orderDetail2.setBook(book2);
		orderDetail2.setBookOrder(order);
		orderDetail2.setQuantity(3);
		orderDetail2.setSubtotal(120f);
		
		orderDetails.add(orderDetail);
		orderDetails.add(orderDetail2);
		
		order.setOrderDetails(orderDetails);
		
		BookOrder savedOrder = orderDao.create(order);
		
		assertNotNull(savedOrder.getOrderId() > 0 && savedOrder.getOrderDetails().size() > 0);
		
	}

	@Test
	public void testUpdateRecipientName() {
		BookOrder order = orderDao.get(6);
		
		String newRecipientName = "New Name";
		order.setRecipientName(newRecipientName);
		
		BookOrder updatedOrder = orderDao.update(order);
		assertTrue(updatedOrder.getRecipientName().equals(updatedOrder.getRecipientName()));
	}
	
	@Test
	public void testUpdateOrderDetails() {
		BookOrder order = orderDao.get(7);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 10;
		int actualQuantity = 0;
		
		float expectedSubtotal = 300f;
		float actualSubtotal = 0f;
		
		while(iterator.hasNext()) {
			
			OrderDetail orderDetail = iterator.next();
			if (orderDetail.getBook().getBookId() == 6) {
				orderDetail.setQuantity(expectedQuantity);
				orderDetail.setSubtotal(expectedSubtotal);
			}
		}
		
		BookOrder updatedOrder = orderDao.update(order);
		Iterator<OrderDetail> iterator2 = updatedOrder.getOrderDetails().iterator();
		
		while(iterator2.hasNext()) {
			
			OrderDetail orderDetail = iterator2.next();
			if (orderDetail.getBook().getBookId() == 6) {
				actualQuantity =  orderDetail.getQuantity();
				actualSubtotal =  orderDetail.getSubtotal();
			}
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		int orderId = 6;
		BookOrder bookOrder = orderDao.get(orderId);
		System.out.println(bookOrder);
		assertTrue(bookOrder.getOrderId() == 6);
	}

	@Test
	public void testDeleteOrder() {
		int orderId = 6;
		orderDao.delete(orderId);
		
		BookOrder bookOrder = orderDao.get(orderId);
		
		assertNull(bookOrder);
	}

	@Test
	public void testListAll() {
		List<BookOrder> orderLists = orderDao.listAll();
		
		for (BookOrder order : orderLists) {
			System.out.println(order);
		}
		
		assertTrue(orderLists.size() > 0);
	}

	@Test
	public void testCount() {
		long numOfOrders = orderDao.count();
		assertTrue(numOfOrders == 2);
	}

}
