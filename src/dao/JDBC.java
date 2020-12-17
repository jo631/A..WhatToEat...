package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.Restaurant;
import dto.Comment;
import dto.Member;

public class JDBC {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	final String url = "jdbc:mysql://whattoeat.c9ihef0cs7y5.us-east-1.rds.amazonaws.com:3306/WhatToEat?characterEncoding=UTF-8&serverTimezone=UTC";
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
		rs = stmt.executeQuery("SELECT * FROM WhatToEat.restaurant WHERE id=" + id);
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
			String zipCode = rs.getString("zipCode");
			float latitude = rs.getFloat("latitude");
			float longitude = rs.getFloat("longitude");
			String imagePath = rs.getString("imagePath");
			temp = new Restaurant(num, state, city, name, streetName, detailAddr, category, phoneNumber, zipCode,
					latitude, longitude, imagePath);
		}
		return temp;
	}

	public ArrayList<Restaurant> getDBbyCategory(String category, float range, float inputLatitude,
			float inputLongitude) throws SQLException {
		ArrayList<Restaurant> list = new ArrayList<Restaurant>();

		String query = "SELECT *,(6371*acos(cos(radians(" + inputLatitude
				+ "))*cos(radians(latitude))*cos(radians(longitude)\n" + "-radians(" + inputLongitude
				+ "))+sin(radians(" + inputLatitude + "))*sin(radians(latitude))))\n" + "AS distance\n"
				+ "FROM WhatToEat.restaurant\n" + "HAVING distance <= " + range + " && category =\"" + category + "\"\n"
				+ "ORDER BY distance";

		rs = stmt.executeQuery(query);

		while (rs.next()) {
			int num = rs.getInt("id");
			String state = rs.getString("state");
			String city = rs.getString("city");
			String name = rs.getString("name");
			String streetName = rs.getString("streetName");
			String detailAddr = rs.getString("detailAddr");
			String cate = rs.getString("category");
			String phoneNumber = rs.getString("phoneNumber");
			String zipCode = rs.getString("zipCode");
			float latitude = rs.getFloat("latitude");
			float longitude = rs.getFloat("longitude");
			String imagePath = rs.getString("imagePath");
			list.add(new Restaurant(num, state, city, name, streetName, detailAddr, cate, phoneNumber, zipCode,
					latitude, longitude, imagePath));
		}

		return list;
	}

	// 회원가입
	public int join(Member user) {
		String query = "INSERT INTO WhatToEat.member (id, password, name) VALUES (\"" + user.getId() + "\", \""
				+ user.getPassword() + "\", \"" + user.getName() + "\")";

		try {
			return stmt.executeUpdate(query); // 0이면 중복
		} catch (Exception e) {
			return -1; //회원가입 못할떄
		}
	}

	// 로그인
	public Member login(String id, String pw) {
		
		String query = "SELECT * FROM WhatToEat.member where id=\""+id+"\"";
		
		try {
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int number = rs.getInt("number");
				String _id = rs.getString("id");
				String _pw = rs.getString("password");
				String name = rs.getString("name");
				
				if(pw.equals(_pw)) {
					return new Member(number,_id,_pw,name);
				} else {
					return null;
				}
				
			}
		} catch(Exception e) {
			return null;
		}	
		return null;
	}
	
	
	public int reviewInsert(String userName, int restaurantid, String text) {
		String query = "INSERT INTO `WhatToEat`.`board` (`userName`, `restaurantNum`, `Text`) VALUES ('"+userName+"', '"+restaurantid+"', '"+text+"')";
		
		try {
			return stmt.executeUpdate(query);
		} catch(Exception e) {
			return -1;
		}	
	}
	
	public int reviewDelete(int boardNum, String userName) {
		String query = "DELETE FROM WhatToEat.board WHERE boardNum = '"+boardNum+"' AND userName = '"+userName+"'";
		try {
			return stmt.executeUpdate(query);
		} catch(Exception e) {
			return -1;
		}	
	}
	
	public ArrayList<Comment> reviewSearch(int restaurantId) {
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		String query = "SELECT * FROM WhatToEat.board where restaurantNum = "+restaurantId;
		try {
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				int boardNum = rs.getInt("boardNum");
				String username = rs.getString("userName");
				int resNum = rs.getInt("restaurantNum");
				String comment = rs.getString("Text");
				
				list.add(new Comment(boardNum, username, resNum, comment));
			}
			
			return list;
		} catch (SQLException e) {
			return null;
		}			
	}
}
