package com.wt.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionContext;
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
		
		//Book book = orderService.findBook("java");

		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		HttpSession session = request.getSession();
		
		String userName = (String) session.getAttribute("username");
		
		String bookname = request.getParameter("bookname");

		String StrQuantity = request.getParameter("quantity");
		int quantity = Integer.parseInt(StrQuantity);
		
		String StrPrice = request.getParameter("price");
		int unit_price = Integer.parseInt(StrPrice);
		
		int price = quantity * unit_price;
		
		Order order = new Order();
		
		Book book = new Book();
		
		book.setBook_name(bookname);
		book.setQuantity(quantity);
		book.setPrice(price);
		
		order.setUser_name(userName);
		
		order.getBooks().add(book);
		book.getOrders().add(order);

		orderService.saveOrUpdateBook(book);
		orderService.saveOrUpdateOrder(order);
		
		
//		Order order = orderService.findOrder(userName);
//		
//		if(order != null){
//			
//		}
		
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
