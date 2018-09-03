package com.mdwp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
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

	@RequestMapping(value = "/")
	public String getIndexPage(HttpServletRequest request) {
		request.setAttribute("status", "");
		return new String("index");
	}

	@RequestMapping(value = "/storeData", method = RequestMethod.POST)
	public String insertData(HttpServletRequest request) {
		Student student = new Student(0, request.getParameter("name"), request.getParameter("course"), 22);
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

			JSONObject jsonObject = new JSONObject(stringBuilder.toString());
			if((boolean) jsonObject.get("success")) {
				request.setAttribute("status", "Data Inserted");
				dao.insertRow(student);
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "index";
	}

}
