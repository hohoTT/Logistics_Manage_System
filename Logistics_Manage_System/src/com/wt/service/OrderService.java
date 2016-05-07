package com.wt.service;

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
	
	public void saveOrUpdate(Order order){
		orderDao.saveOrUpdate(order);
	}

}
