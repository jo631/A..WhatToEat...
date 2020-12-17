package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Restaurant;
import dto.Member;

public class RestaurantRepository {
	
	ArrayList<Restaurant> listOfProducts = new ArrayList<Restaurant>();
	private static RestaurantRepository instance = new RestaurantRepository();
	JDBC db;
	
	public static RestaurantRepository getInstance() {
		return instance;
	}
	
	public RestaurantRepository() {
		//DB연결
		db = new JDBC();
	}
	
	public Restaurant getById(int id) throws SQLException {
		return db.getDbById(id);		
	}
	
	public ArrayList<Restaurant> getByCategory(String category, float range, float inputLatitude, float inputLongitude) throws SQLException{
		return db.getDBbyCategory(category,range,inputLatitude,inputLongitude);
	}
	
	
	public int JoinUser(Member m) {
		if(m.getId() == null || m.getPassword() == null || m.getName() == null){ 
			return -1; // 비어있음
		}
		
		return db.join(m);
	}
	
	public Member loginUser(String id, String pw) {
		if(id == null || pw == null){ 
			return null; // 비어있음
		}
		return db.login(id, pw);
	}
}
