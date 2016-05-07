package com.wt.dao;

import org.hibernate.Query;

import com.wt.entity.Book;
import com.wt.entity.Order;

public class OrderDao extends BaseDao{
	
	public Book findBook(String bookname) {
		Book book = null;
		
		String hql = "FROM Book b WHERE b.book_name = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, bookname);
		
		book = (Book) query.uniqueResult();
		
		return book;
	}
	
	public void saveOrUpdate(Order order){
		getSession().saveOrUpdate(order);
	}
	
}
