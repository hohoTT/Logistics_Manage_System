package com.wt.hibernate.n_to_n;

import java.util.HashSet;
import java.util.Set;

public class Category {
	
	private Integer categoryId;
	private String categoryName;
	
	Set<Item> items = new HashSet<>();

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Set<Item> getItems() {
		return items;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}
	
}
