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
	
	// 以下的操作为获取购买的书
	public Book findBook(String bookname) {
		return orderDao.findBook(bookname);
	}
	
	// 以下的操作为获取仓库中的书
	public Warehouse findWarehouseBook(String bookname) {
		return orderDao.findWarehouseBook(bookname);
	}
	
	// 以下为查询某个用户的订单列表
	public List<Order> findOrder(String userName) {
		return orderDao.findOrder(userName);
	}
	
	// 以下为添加新的订单
	public void saveOrUpdateOrder(Order order){
		orderDao.saveOrUpdateOrder(order);
	}
	
	// 以下为用户购买图书，向图书购买表中添加数据
	public void saveOrUpdateBook(Book book){
		orderDao.saveOrUpdateBook(book);
	}
	
	// 以下为添加或更新仓库中的图书信息
	public void saveOrUpdateWarehouseBook(Warehouse warehouse){
		orderDao.saveOrUpdateWarehouseBook(warehouse);
	}
	
}
