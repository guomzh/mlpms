package org.csu.pms.domain;

import java.io.Serializable;

public class House implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int buildingNum;
	
	private int roomNum;
	
	private String userId;
	
	private int houseType;
	
	private double area;
	
	private String description;

	public int getBuildingNum() {
		return buildingNum;
	}

	public void setBuildingNum(int buildingNum) {
		this.buildingNum = buildingNum;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHouseType() {
		return houseType;
	}

	public void setHouseType(int houseType) {
		this.houseType = houseType;
	}

	public double getArea() {
		return area;
	}

	public void setArea(double area) {
		this.area = area;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
