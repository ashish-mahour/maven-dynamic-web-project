package com.mdwp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mdwp.dao.api.StudentDAO;
import com.mdwp.dao.entity.Student;

@Controller
public class SpringController {
	
	@Autowired
	StudentDAO dao;
	
	@RequestMapping("/")
	public String getIndexPage() {
		return new String("index");
	}
	
	@RequestMapping(value="/insertData",method=RequestMethod.POST)
	public String insertData(HttpServletRequest request) {
		Student student = new Student(0, request.getParameter("name"), request.getParameter("course"));
		System.out.println(request.getParameter("name")+"\t"+request.getParameter("course"));
		dao.insertRow(student);
		return "index";
	}

}
