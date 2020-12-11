package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Restaurant;

public class RestaurantRepository {
	
	ArrayList<Restaurant> listOfProducts = new ArrayList<Restaurant>();
	private static RestaurantRepository instance = new RestaurantRepository();
	JDBC db;
	
	public static RestaurantRepository getInstance() {
		return instance;
	}
	
	public RestaurantRepository() {
		//DB¿¬°á
		db = new JDBC();
	}
	
	public Restaurant getById(int id) throws SQLException {
		return db.getDbById(id);		
	}
	
	public ArrayList<Restaurant> getByCategory(String category) throws SQLException{
		return db.getDBbyCategory(category);
	}
	
}
