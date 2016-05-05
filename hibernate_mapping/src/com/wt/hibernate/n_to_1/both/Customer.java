package com.wt.hibernate.n_to_1.both;

import java.util.HashSet;
import java.util.Set;

public class Customer {

	private Integer customerId;
	private String customerName;
	
	/**
	 * 1. 声明集合类型时，需要使用接口类型，因为 hibernate 在获取集合类型时
	 * 返回的是 Hibernate 内置的集合类型，而不是 JavaSE 一个标准的集合实现
	 * 2. 需要把集合进行初始化，可以防止空指针异常
	 */
	private Set<Order> orders = new HashSet<>();
	
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	
}
