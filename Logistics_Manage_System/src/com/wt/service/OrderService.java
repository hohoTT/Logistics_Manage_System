package com.wt.service;

import java.util.List;

import com.wt.dao.OrderDao;
import com.wt.entity.Book;
import com.wt.entity.Order;
import com.wt.entity.Warehouse;

public class OrderService {
	
	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	
	public Book findBook(String bookname) {
		return orderDao.findBook(bookname);
	}
	
	public Warehouse findWarehouseBook(String bookname) {
		return orderDao.findWarehouseBook(bookname);
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
	
	public void saveOrUpdateWarehouseBook(Warehouse warehouse){
		orderDao.saveOrUpdateWarehouseBook(warehouse);
	}
	
}
