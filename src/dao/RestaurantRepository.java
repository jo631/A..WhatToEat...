package dao;

import java.util.ArrayList;

import dto.Restaurant;

public class RestaurantRepository {
	
	ArrayList<Restaurant> listOfProducts = new ArrayList<Restaurant>();
	private static RestaurantRepository instance = new RestaurantRepository();
	
	public static RestaurantRepository getInstance() {
		return instance;
	}
	
	//DB연결
	
	//위도경도 값 받아서 리스트 출력
	
	
	
}
