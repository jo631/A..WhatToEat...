package dao;

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
		//DB연결
		db = new JDBC();
	}
	
	
	//위도경도 값 받아서 리스트 출력
	public Restaurant[] getRestaurant(String name,float latitude, float longitude) {
		Restaurant a = new Restaurant(id, state, city, name, streetName, detailAddr, category, phoneNumber, zipCode, latitude, longitude, imagePath);
		
		//db에서 쿼리로 카테고리별로 스트링 받음
		
		//위도 경도 해서 일정위치 내 있는것만 리스트로 받음 
		
		
	}
}
