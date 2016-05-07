package com.wt.hibernate.n_to_n;

import java.util.HashSet;
import java.util.Set;

public class Order {
	
	private Integer order_id;
	private String user_name;
	
	private Set<Book> books = new HashSet<>();

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

	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", user_name=" + user_name
				+ ", books=" + books + "]";
	}
	
}
