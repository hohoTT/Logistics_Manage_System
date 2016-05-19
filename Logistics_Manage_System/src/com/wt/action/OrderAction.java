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
import com.wt.entity.Warehouse;
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

		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		HttpSession session = request.getSession();
		
		// 以下为获取参数
		String userName = (String) session.getAttribute("username");
		
		String bookname = request.getParameter("bookname");

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
			
			order.setUser_name(userName);
			
			order.getBooks().add(book);
			book.getOrders().add(order);

			orderService.saveOrUpdateBook(book);
			orderService.saveOrUpdateOrder(order);
			
			// 更新仓库中的图书书目
			w_book.setQuantity(w_quantity);
			orderService.saveOrUpdateWarehouseBook(w_book);
		}
		
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
