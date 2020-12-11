package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.Restaurant;

public class JDBC {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	final String url = "jdbc:mysql://localhost:3306/WhatToEat?characterEncoding=UTF-8&serverTimezone=UTC";
	final String userName = "root";
	final String pw = "database";

	public JDBC() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, userName, pw);
			System.out.println("연결 성공");
			stmt = conn.createStatement();

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		}
	}

	public Restaurant getDbById(int id) throws SQLException {
		rs = stmt.executeQuery("SELECT * FROM whattoeat.restaurant WHERE id=" + id);
		Restaurant temp = null;
		while (rs.next()) {
			int num = rs.getInt("id");
			String state = rs.getString("state");
			String city = rs.getString("city");
			String name = rs.getString("name");
			String streetName = rs.getString("streetName");
			String detailAddr = rs.getString("detailAddr");
			String category = rs.getString("category");
			String phoneNumber = rs.getString("phoneNumber");
			float latitude = Float.parseFloat(rs.getString("latitude"));
			float longitude = Float.parseFloat(rs.getString("longitude"));
			String imagePath = rs.getString("imagePath");
			temp = new Restaurant(num, state, city, name, streetName, detailAddr, category, phoneNumber, latitude,
					longitude, imagePath);
		}
		return temp;
	}
	
	public ArrayList<Restaurant> getDBbyCategory(String category) throws SQLException {
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();
		
		rs = stmt.executeQuery("SELECT * FROM whattoeat.restaurant HAVING category = \""+category+"\"");
		
		while (rs.next()) {
			int num = rs.getInt("id");
			String state = rs.getString("state");
			String city = rs.getString("city");
			String name = rs.getString("name");
			String streetName = rs.getString("streetName");
			String detailAddr = rs.getString("detailAddr");
			String cate = rs.getString("category");
			String phoneNumber = rs.getString("phoneNumber");
			float latitude = Float.parseFloat(rs.getString("latitude"));
			float longitude = Float.parseFloat(rs.getString("longitude"));
			String imagePath = rs.getString("imagePath");
			list.add(new Restaurant(num, state, city, name, streetName, detailAddr, cate, phoneNumber, latitude,
					longitude, imagePath));
		}
		
		
		return list;
	}

	public void Test() throws SQLException {
		rs = stmt.executeQuery("SELECT * FROM whattoeat.restaurant WHERE id=1");
		while (rs.next()) {
			String state = rs.getString("state");
			String city = rs.getString("city");
			String name = rs.getString("name");

			System.out.println(state + city + " " + name);
		}
	}

}
