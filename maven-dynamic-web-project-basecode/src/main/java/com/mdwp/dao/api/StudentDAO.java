package com.mdwp.dao.api;

import java.util.List;

import com.mdwp.dao.entity.Student;

public interface StudentDAO {
	public void insertRow(Student student);
	public List<Student> getAllStudents();
	public Student getOne(int rollNo);
}
