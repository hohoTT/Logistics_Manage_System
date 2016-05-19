package com.wt.dao;

import java.util.List;

import org.hibernate.Query;

import com.wt.entity.Book;
import com.wt.entity.Order;
import com.wt.entity.Warehouse;

public class OrderDao extends BaseDao{
	
	// 以下的操作为获取购买的书
	public Book findBook(String bookname) {
		Book book = null;
		
		String hql = "FROM Book b LEFT OUTER JOIN FETCH b.orders WHERE b.book_name = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, bookname);
		
		book = (Book) query.uniqueResult();
		
		return book;
	}
	
	// 以下的操作为获取仓库中的书
	public Warehouse findWarehouseBook(String bookname) {
		Warehouse warehouse = null;
		
		String hql = "FROM Warehouse w WHERE w.book_name = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, bookname);
		
		warehouse = (Warehouse) query.uniqueResult();
		
		return warehouse;
	}
	
	// 以下为查询某个用户的订单列表
	@SuppressWarnings("unchecked")
	public List<Order> findOrder(String userName) {
		List<Order> orders = null;
		
		String hql = "FROM Order o LEFT OUTER JOIN FETCH o.book WHERE o.user_name = ?";
		
		Query query = getSession().createQuery(hql);

		orders = query.setString(0, userName).list();
		
		return orders;
	}
	
	// 以下为添加新的订单
	public void saveOrUpdateOrder(Order order){
		getSession().saveOrUpdate(order);
	}
	
	// 以下为用户购买图书，向图书购买表中添加数据
	public void saveOrUpdateBook(Book book){
		getSession().saveOrUpdate(book);
	}
	
	// 以下为添加或更新仓库中的图书信息
	public void saveOrUpdateWarehouseBook(Warehouse warehouse){
		getSession().saveOrUpdate(warehouse);
	}
	
	
	
}
