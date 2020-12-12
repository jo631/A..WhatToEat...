package dto;

import java.io.Serializable;

public class Restaurant implements Serializable {
	private int id;
	private String state;
	private String city;
	private String name;
	private String streetName;
	private String detailAddr;
	private String category;
	private String phoneNumber;
	private String zipCode;
	private float latitude;
	private float longitude;
	private String imagePath;

	private static final long serialVersionUID = -4274700572038677000L;

	public Restaurant(int id,String state, String city, String name, String streetName, String detailAddr, String category,
			String phoneNumber,String zipCode ,float latitude, float longitude, String imagePath) {
		super();
		this.id = id;
		this.state = state;
		this.city = city;
		this.name = name;
		this.streetName = streetName;
		this.detailAddr = detailAddr;
		this.category = category;
		this.phoneNumber = phoneNumber;
		this.zipCode = zipCode;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imagePath = imagePath;
	}
	
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getDetailAddr() {
		return detailAddr;
	}

	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
