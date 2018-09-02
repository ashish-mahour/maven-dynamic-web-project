package com.mdwp.dao.implementation;

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
	

}
