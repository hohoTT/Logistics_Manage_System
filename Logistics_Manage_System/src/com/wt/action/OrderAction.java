package com.wt.action;

import java.util.ArrayList;
import java.util.List;
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
import com.wt.entity.Warehouse;
import com.wt.service.OrderService;

public class OrderAction extends ActionSupport implements RequestAware,
ModelDriven<Book>, Preparable{

	private static final long serialVersionUID = 1L;
	
	private OrderService orderService;
	
	ActionContext context = ActionContext.getContext();
	
	HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
	
	HttpSession session = request.getSession();
	
	// 以下为获取参数
	String userName = (String) session.getAttribute("username");
	
	String bookname = request.getParameter("bookname");
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	// 以下为查询用户的购买记录
	public void query() {
		
		// 以下为查询用户的订单列表
		List<Order> orders = orderService.findOrder(userName);
		List<Book> books = new ArrayList<>();
		for (Order order : orders) {
			books.add(order.getBook());
		}

		// 以下为图书列表
		for (Book book : books) {
			System.out.println("book.getBook_name() --- " + book.getBook_name());
			System.out.println("book.getPrice() --- " + book.getPrice());
		}
		
		
		if(books != null){
			Map<String, Object> mapSession = ActionContext.getContext().getSession();
			mapSession.put("books", books);
		}
	}
	
	// 以下为查询用户的购买记录
	public void logisticsQuery() {
		
		// 以下为查询用户的订单列表
		List<Order> orders = orderService.findOrder(userName);
		List<Book> books = new ArrayList<>();
		for (Order order : orders) {
			books.add(order.getBook());
		}

		// 以下为图书列表
//		for (Book book : books) {
//			System.out.println("book.getBook_name() --- " + book.getBook_name());
//			System.out.println("book.getPrice() --- " + book.getPrice());
//		}
		
		// 0 为待揽件、1为运输、2为派送、3为签收
 		
 		// 0 为待揽件
 		List<Book> pendingBooks = new ArrayList<>();
 	
 		for (Book book : books) {
			if(book.getBook_state() == 0){
				pendingBooks.add(book);
			}
		}
 		
 		// 1为运输
 		List<Book> transportBooks = new ArrayList<>();
 	 	
 		for (Book book : books) {
			if(book.getBook_state() == 1){
				transportBooks.add(book);
			}
		}
 		
 		// 2为派送
 		List<Book> sendBooks = new ArrayList<>();
 	 	
 		for (Book book : books) {
			if(book.getBook_state() == 2){
				sendBooks.add(book);
			}
		}
 		
 		// 3为签收
 		List<Book> signBooks = new ArrayList<>();
 	 	
 		for (Book book : books) {
			if(book.getBook_state() == 3){
				signBooks.add(book);
			}
		}
		
		if(books != null){
			Map<String, Object> mapSession = ActionContext.getContext().getSession();
			mapSession.put("books", books);
			mapSession.put("pendingBooks", pendingBooks);
			mapSession.put("transportBooks", transportBooks);
			mapSession.put("sendBooks", sendBooks);
			mapSession.put("signBooks", signBooks);
		}
		
	}
	
	public String save(){
		
		System.out.println("saveOrder");

		String StrQuantity = request.getParameter("quantity");
		int quantity = Integer.parseInt(StrQuantity);
		
		String StrPrice = request.getParameter("price");
		int unit_price = Integer.parseInt(StrPrice);
		
		int price = quantity * unit_price;
		
		// 获取仓库中的图书
		Warehouse w_book = orderService.findWarehouseBook(bookname);
		
		int w_quantity = w_book.getQuantity();
		
		String w_q = Integer.toString(w_quantity);
		
		w_quantity = w_quantity - quantity;
		
		if(w_quantity < 0){
			session.setAttribute("notEnough", "notEnough");
			session.setAttribute("w_q", w_q);
			session.setAttribute("bookname", bookname);
			System.out.println("库存不足");
		}
		else{
			session.removeAttribute("notEnough");
			session.removeAttribute(w_q);
			session.removeAttribute(bookname);
			
			// 新建订单
			Order order = new Order();
			
			Book book = new Book();
			
			book.setBook_name(bookname);
			book.setQuantity(quantity);
			book.setPrice(price);
			book.setBook_state(0);
			
			order.setUser_name(userName);
			
			orderService.saveOrUpdateBook(book);
			order.setBook(book);
			orderService.saveOrUpdateOrder(order);
			
			// 更新仓库中的图书书目
			w_book.setQuantity(w_quantity);
			orderService.saveOrUpdateWarehouseBook(w_book);
		}
		
		query();
		
		return "save";
	}
	
	public String shoppingInfo(){
		
		query();
		
		return "shoppingInfo";
	}
	
	public String logisticsInfo(){
		
		logisticsQuery();
		
		return "logisticsInfo";
	}
	
	

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Book getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
