package com.wt.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Order implements Serializable{
	
	private Integer order_id;
	private String user_name;
	
	// 之前的处理，多对多的映射
//	private Set<Book> books = new HashSet<>();
	
	private Book book;

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Order(Integer order_id, String user_name, Book book) {
		super();
		this.order_id = order_id;
		this.user_name = user_name;
		this.book = book;
	}
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

//	public Set<Book> getBooks() {
//		return books;
//	}
//
//	public void setBooks(Set<Book> books) {
//		this.books = books;
//	}
	
	
	
}
