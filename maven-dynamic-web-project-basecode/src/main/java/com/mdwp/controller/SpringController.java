package com.mdwp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mdwp.dao.api.StudentDAO;
import com.mdwp.dao.entity.Student;

@Controller
public class SpringController {

	@Autowired
	StudentDAO dao;

	@RequestMapping(value = "/")
	public String getIndexPage(HttpServletRequest request) {
		request.setAttribute("status", "");
		return new String("index");
	}

	@RequestMapping(value = "/storeData", method = RequestMethod.POST)
	public String insertData1(HttpServletRequest request) {
		String urlStr = "https://www.google.com/recaptcha/api/siteverify";
		try {
			URL url = new URL(urlStr);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("POST");
			httpURLConnection.setDoInput(true);
			httpURLConnection.setDoOutput(true);

			OutputStream outputStream = (OutputStream) httpURLConnection.getOutputStream();
			String postParams = "secret=6Le89m0UAAAAAPNI45eotLus9w0v6h8j3S5OofLy" + "&response="
					+ request.getParameter("g-recaptcha-response");
			outputStream.write(postParams.getBytes());
			outputStream.flush();
			outputStream.close();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(httpURLConnection.getInputStream()));
			StringBuilder stringBuilder = new StringBuilder();
			String data = "";
			while ((data = bufferedReader.readLine()) != null) {
				stringBuilder.append(data);
			}

			JSONObject json = new JSONObject(stringBuilder.toString());
			if ((boolean) json.get("success")) {
				Student student = new Student(0,request.getParameter("name"),request.getParameter("course"),22);
				dao.insertRow(student);
				request.setAttribute("status", "Data Inserted!!!");
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "index";
	}
	

	// Web service to get all data
	@RequestMapping(value = "/getAllStudents", method = RequestMethod.GET)
	@ResponseBody
	public String getAllData(HttpServletRequest request, HttpServletResponse response) {
		List<Student> students = dao.getAllStudents();
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < students.size(); i++) {
			jsonArray.put(new JSONObject(students.get(i)));
		}
		request.setAttribute("data", jsonArray.toString());
		return jsonArray.toString();
	}

	// Web service to getOne
	@RequestMapping(value = "/getOneStudent/{rollNo}", method = RequestMethod.GET)
	@ResponseBody
	public String getOne(HttpServletRequest request, HttpServletResponse response, @PathVariable("rollNo") int rollNo) {
		Student student = dao.getOne(rollNo);
		JSONObject jsonObject = new JSONObject(student);
		return jsonObject.toString();
	}
	@RequestMapping(value = "/form")
	public String getForm(HttpServletRequest request) {
		return new String("form");
	}
	
	// Web service for JSON 
	@RequestMapping(value = "/getJson", method = RequestMethod.POST)
	@ResponseBody
	public String makeJson(HttpServletRequest request,@RequestBody String jsonString) {
		JSONObject jsonObject = new JSONObject(jsonString);
		System.out.println(jsonObject.toString());
		JSONObject jsonObject2 = new JSONObject();
		jsonObject2.put("status", "success");
		jsonObject2.put("time and date", new Date().toString());
		return jsonObject2.toString();
	}

}
