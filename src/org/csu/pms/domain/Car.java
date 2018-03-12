package org.csu.pms.domain;

import java.io.Serializable;

public class Car implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String carNum;
	
	private String userId;
	
	private String color;
	
	private String brand;
	
	private String description;

	public String getCarNum() {
		return carNum;
	}

	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
