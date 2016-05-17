package com.wt.hibernate.n_to_n;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Set;

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
	
	@Test
	public void testGet2() {
		
	}
	
//	@Test
//	public void testGet() {
//		Category category = (Category) session.get(Category.class, 1);
//		System.out.println(category.getCategoryName());
//		
//		// 需要连接中间表
//		Set<Item> items = category.getItems();
//		System.out.println(items.size());
//	}
	
	@Test
	public void testSave(){
		Category category1 = new Category();
		category1.setCategoryName("category_AA");

		Category category2 = new Category();
		category2.setCategoryName("category_BB");
		
		Item item1 = new Item();
		item1.setItemName("item_AA");
		
		Item item2 = new Item();
		item2.setItemName("item_BB");
		
		// 设定 category 中关联关系
		category1.getItems().add(item1);
		category1.getItems().add(item2);
		
		category2.getItems().add(item1);
		category2.getItems().add(item2);
		
		// 设定 item 中关联关系
		item1.getCategories().add(category1);
		item1.getCategories().add(category2);
		
		item2.getCategories().add(category1);
		item2.getCategories().add(category2);
		
		// 执行保存操作
		session.save(category1);
		session.save(category2);
		
		session.save(item1);
		session.save(item2);

	}
	
}
