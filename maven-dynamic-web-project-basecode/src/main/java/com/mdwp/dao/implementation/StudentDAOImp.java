package com.mdwp.dao.implementation;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.mdwp.dao.api.StudentDAO;
import com.mdwp.dao.entity.Student;;

@Repository
public class StudentDAOImp implements StudentDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	public void insertRow(Student student) {
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		session.persist(student);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<Student> getAllStudents() {
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		@SuppressWarnings("unchecked")
		List<Student> students = session.createQuery("from Student").list();
		session.getTransaction().commit();
		session.close();
		return students;
	}

	@Override
	public Student getOne(int rollNo) {
		Session session = sessionFactory.openSession();
		session.getTransaction().begin();
		Student student = session.find(Student.class, rollNo);
		session.getTransaction().commit();
		session.close();
		return student;
	}
	

}
