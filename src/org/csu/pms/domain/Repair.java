package org.csu.pms.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Repair implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int repairId;
	
	private int buildingNum;
	
	private int roomNum;
	
	private String userId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date repairDate;
	
	private String repairContent;
	
	private int repairState;
	
	private String repairResponse;
	
	private int typeId;

	public int getRepairId() {
		return repairId;
	}

	public void setRepairId(int repairId) {
		this.repairId = repairId;
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

	public Date getRepairDate() {
		return repairDate;
	}

	public void setRepairDate(Date repairDate) {
		this.repairDate = repairDate;
	}

	public String getRepairContent() {
		return repairContent;
	}

	public void setRepairContent(String repairContent) {
		this.repairContent = repairContent;
	}

	public int getRepairState() {
		return repairState;
	}

	public void setRepairState(int repairState) {
		this.repairState = repairState;
	}

	public String getRepairResponse() {
		return repairResponse;
	}

	public void setRepairResponse(String repairResponse) {
		this.repairResponse = repairResponse;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	
}
