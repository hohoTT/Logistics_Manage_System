package com.wt.dao;

import org.hibernate.Query;

import com.wt.entity.Book;
import com.wt.entity.Order;

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
	
	public Order findOrder(String userName) {
		Order oreder = null;
		
		String hql = "FROM Order o LEFT OUTER JOIN FETCH o.books WHERE o.user_name = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, userName);
		
		oreder = (Order) query.uniqueResult();
		
		return oreder;
	}
	
	public void saveOrUpdateOrder(Order order){
		getSession().saveOrUpdate(order);
	}
	
	public void saveOrUpdateBook(Book book){
		getSession().saveOrUpdate(book);
	}
	
}
