package org.csu.pms.domain;

import java.io.Serializable;

public class HouseType implements Serializable{
      private int houseType;
      private double area;
      private String description;
	public int getHouseType() {
		return houseType;
	}
	public double getArea() {
		return area;
	}
	public String getDescription() {
		return description;
	}
	public void setHouseType(int houseType) {
		this.houseType = houseType;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public void setDescription(String description) {
		this.description = description;
	}
      
}
