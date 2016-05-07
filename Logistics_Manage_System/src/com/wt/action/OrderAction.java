package com.wt.action;

import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wt.entity.Book;
import com.wt.entity.Order;
import com.wt.service.OrderService;

public class OrderAction extends ActionSupport implements RequestAware,
ModelDriven<Book>, Preparable{

	private static final long serialVersionUID = 1L;
	
	private OrderService orderService;
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	public String save(){
		
		System.out.println("saveOrder");
		
		Book book = orderService.findBook("java");
		
		Order order = new Order();
		
		order.setUser_name("hoho");
		order.getBooks().add(book);
		
		orderService.saveOrUpdate(order);
		
		return "save";
	}


	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
