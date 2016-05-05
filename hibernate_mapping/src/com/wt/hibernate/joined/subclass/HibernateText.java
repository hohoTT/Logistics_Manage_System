package com.wt.hibernate.joined.subclass;

import static org.junit.Assert.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
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
	
	/**
	 * 使用 joined-Subclass 的 优点：
	 * 1. 不需要使用了辨别者列
	 * 2. 子类独有的字段能添加非空约束
	 * 3. 没有冗余的字段
	 */
	/**
	 * 查询：
	 * 1. 查询父类记录，做一个左外连接查询
	 * 2. 对于子类记录，做一个内连接查询
	 */
	@Test
	public void testQuery() {
		List<Person> persons = session.createQuery("FROM Person").list();
		System.out.println(persons.size());
		

		List<Student> students = session.createQuery("FROM Student").list();
		System.out.println(students.size());
	}
	
	/**
	 *  插入操作：
	 *  1. 对于子类记录至少需要插入到两张数据表中
	 */
	@Test
	public void testSave(){
		
		Person person = new Person();
		person.setName("AA");
		person.setAge(11);
		
		session.save(person);
		
		Student student = new Student();
		student.setName("BB");
		student.setAge(22);
		student.setSchool("QDU");
		
		session.save(student); 
		
	}
	
}
