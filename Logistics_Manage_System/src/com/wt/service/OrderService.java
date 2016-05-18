package com.wt.service;

import java.util.List;

import com.wt.dao.OrderDao;
import com.wt.entity.Book;
import com.wt.entity.Order;

public class OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public Book findBook(String bookname) {
		return orderDao.findBook(bookname);
	}
	
	public List<Order> findOrder(String userName) {
		return orderDao.findOrder(userName);
	}
	
	public void saveOrUpdateOrder(Order order){
		orderDao.saveOrUpdateOrder(order);
	}
	
	public void saveOrUpdateBook(Book book){
		orderDao.saveOrUpdateBook(book);
	}
	
}
