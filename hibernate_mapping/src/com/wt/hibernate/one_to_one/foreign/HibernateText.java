package com.wt.hibernate.one_to_one.foreign;

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
		// 在查询没有外键的实体对象，使用左连接查询，一并查询出其关联的对象
		// 并已经进行初始化，
		Manager manager = (Manager) session.get(Manager.class, 1);
		System.out.println(manager.getManagerName());
		System.out.println(manager.getDepartment().getDepartmentName());
	}
	
	@Test
	public void testGet() {
		// 1. 默认情况下，对关联属性使用懒加载
		Department department = (Department) session.get(Department.class, 1);
		System.out.println(department.getDepartmentName());

		// 2. 所以会出现懒加载的异常的问题
//		session.close();
//		Manager manager = new Manager();
//		System.out.println(manager.getManagerName());

		// 3. 查询 Manager 对象的连接条件应该是 department.manager_id = manager.manager_id
		// 而不应该是 department.department_id = manager.manager_id 
		Manager manager = department.getManager();
		System.out.println(manager.getManagerName());
	}
	
	@Test
	public void test(){
		
		Department department = new Department();
		department.setDepartmentName("AA");
		
		Manager manager = new Manager();
		manager.setManagerName("Manager_AA");
		
		// 设定关联关系
		department.setManager(manager);
		manager.setDepartment(department);
		
		// 保存操作 
		// 建议先保存没有外键的那个对象，这样会减少 update 语句
		session.save(manager);
		session.save(department);
		
	}
	
}
