package com.wt.hibernate.n_to_1;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.jdbc.Work;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HibernateText {

	private SessionFactory sessionFactory;
	private Session session;
	private Transaction transaction;

	@Before
	public void init() {
		// 测试用
		// System.out.println("init");

		Configuration configuration = new Configuration().configure();
		ServiceRegistry serviceRegistry = new ServiceRegistryBuilder()
				.applySettings(configuration.getProperties())
				.buildServiceRegistry();

		sessionFactory = configuration.buildSessionFactory(serviceRegistry);

		session = sessionFactory.openSession();

		transaction = session.beginTransaction();
	}

	@After
	public void destroy() {
		// 测试用
		// System.out.println("destroy");

		transaction.commit();
		session.close();
		sessionFactory.close();
	}
	
//	@Test
//	public void testDelete() {
//		// 在不设定级联关系的情况下，且 1 这一端的对象  有 n 个对象在引用，不能直接删除 1 这一端的对象 
//		Customer customer = (Customer) session.get(Customer.class, 1);
//		session.delete(customer);
//	}
//	
//	@Test
//	public void testUpdate() {
//		Order order = (Order) session.get(Order.class, 1);
//		order.getCustomer().setCustomerName("AAA");
//	}
//	
//	@Test
//	public void testManyToOneGet() {
//		// 1. 若查询多的一端的一个对象，则默认情况下，只查询了多的一端的对象，
//		// 而没有查询的关联的一的一端的对象，这个叫做延迟加载
//		Order order = (Order) session.get(Order.class, 1);
//		System.out.println(order.getOrderName());
//		
//		// 2. 在需要使用到关联的对象时，才发送对应的 SQL 语句
//		Customer customer = order.getCustomer();
//		System.out.println(customer.getCustomerName());
//		
//		
//		// 3. 在查询 Customer 对象时，由多的一端导航到一的一端时，
//		// 可能会发生 LazyInitializationException 异常
//		
//		// 4. 获取 Order 对象时，默认情况下，其关联的 Customer 对象是一个代理对象
//		System.out.println(customer.getClass().getName());
//	}
	
	@Test
	public void testManyToOneSave() {
		System.out.println("testManyToOneSave");
		Customer customer = new Customer();
		customer.setCustomerName("BB");
		
//		Order order1 = new Order();
//		order1.setOrderName("ORDER-3");
		
		Order order2 = new Order();
		order2.setOrderName("ORDER-4");

		// 设定关联关系
//		order1.setCustomer(customer);
		order2.setCustomer(customer);
		
		// 执行 save 操作 先插入 customer，再插入 order ，结果为执行三条insert
		// 先插入一的一端，再插入多的一端，只有 insert 语句
		session.save(customer);
		
//		session.save(order1);
		session.save(order2);	
//		
//		// 执行 save 操作 先插入 order，再插入  customer
//		// 结果为执行三条 insert，两条 update 
//		// 先插入多的一端，再插入一的一端，会多出 update 语句
//		// 因为在插入多的一端时无法确实一的一端的外键值，所以只能等一的一端插入，再额外发送 update 语句
//		// 推荐先插入一的一端，后插入多的一端
//		session.save(order1);
//		session.save(order2);	
//		
//		session.save(customer);
		
	}

}
