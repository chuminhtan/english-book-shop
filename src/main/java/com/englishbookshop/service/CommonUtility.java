package com.englishbookshop.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.englishbookshop.entity.Customer;
import com.englishbookshop.helper.ServletHelper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class CommonUtility {
	private static String getBodyRequest(HttpServletRequest request) {
		String body = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			} else {
				stringBuilder.append("");
			}
		} catch (IOException ex) {
			return "";
		} finally {
			if (bufferedReader != null) {
				try {
					bufferedReader.close();
				} catch (IOException ex) {

				}
			}
		}
		body = stringBuilder.toString();
		return body;
	}
	
	public static JsonObject getJsonObjectFromRequest(HttpServletRequest request) {
		String jBody = getBodyRequest(request);
		JsonObject jsonObject = new JsonParser().parse(jBody).getAsJsonObject();
		return jsonObject;
	}
	
	public static void sendJsonRespone(Map<String, Object> result, HttpServletResponse response) throws IOException {
		String jsonMap = new Gson().toJson(result);

		PrintWriter out = response.getWriter();
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		out.print(jsonMap);
	}
	
	public static Customer getCustomerLogged(HttpServletRequest request) {
		return (Customer) request.getSession().getAttribute(ServletHelper.SESSION_LOGGED_CUSTOMER);
	}
}
