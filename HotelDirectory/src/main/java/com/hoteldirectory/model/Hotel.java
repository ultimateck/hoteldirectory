package com.hoteldirectory.model;

public class Hotel {
	private int id;
	private String name;
	private String address;
	private int city;
	
	public Hotel(){
	
	}
	
	public Hotel(int id, String name, String address, int city) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.city = city;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public int getCity() {
		return city;
	}

	public void setCity(int city) {
		this.city = city;
	}
	

}
