package com.wt.entity;

import java.io.Serializable;

public class Warehouse implements Serializable{

	private Integer book_id;
	private String book_name;
	private Integer quantity;
	private double price;

	public Integer getBook_id() {
		return book_id;
	}

	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Warehouse(Integer book_id, String book_name, Integer quantity,
			double price) {
		super();
		this.book_id = book_id;
		this.book_name = book_name;
		this.quantity = quantity;
		this.price = price;
	}

	public Warehouse() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Warehouse [book_id=" + book_id + ", book_name=" + book_name
				+ ", quantity=" + quantity + ", price=" + price + "]";
	}

}
