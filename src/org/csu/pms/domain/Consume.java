package org.csu.pms.domain;
import java.io.Serializable;
import java.util.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class Consume implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int consumeId;
	
	private int buildingNum;
	
	private int roomNum;
	
	private String userId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Timestamp createDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date consumeDate;
	
	private int consumeType;
	
	private double unitPrice;
	
	private double count;
	
	private double price;
	
	private int consumeState;
	
	private int typeId;
	
	private String date;

	public int getConsumeId() {
		return consumeId;
	}

	public void setConsumeId(int consumeId) {
		this.consumeId = consumeId;
	}

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

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public int getConsumeType() {
		return consumeType;
	}

	public void setConsumeType(int consumeType) {
		this.consumeType = consumeType;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getCount() {
		return count;
	}

	public void setCount(double count) {
		this.count = count;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = unitPrice*count;
	}

	public int getConsumeState() {
		return consumeState;
	}

	public void setConsumeState(int consumeState) {
		this.consumeState = consumeState;
	}

	public Date getConsumeDate() {
		return consumeDate;
	}

	public void setConsumeDate(Date consumeDate) {
		this.consumeDate = consumeDate;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
