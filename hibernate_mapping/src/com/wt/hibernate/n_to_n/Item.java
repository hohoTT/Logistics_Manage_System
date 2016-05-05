package com.wt.hibernate.n_to_n;

import java.util.HashSet;
import java.util.Set;

public class Item {
	
	private Integer itemId;
	private String itemName;
	
	private Set<Category> categories = new HashSet<>();
	
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Set<Category> getCategories() {
		return categories;
	}
	public void setCategories(Set<Category> categories) {
		this.categories = categories;
	}
	
}
