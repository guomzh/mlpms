package org.csu.pms.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Advice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int adviceId;
	
	private String userId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date adviceDate;
	
	private String adviceContent;
	
	private int adviceState;
	
	private String adviceResponse;
	
	private int typeId;

	public int getAdviceId() {
		return adviceId;
	}

	public void setAdviceId(int adviceId) {
		this.adviceId = adviceId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getAdviceDate() {
		return adviceDate;
	}

	public void setAdviceDate(Date adviceDate) {
		this.adviceDate = adviceDate;
	}

	public String getAdviceContent() {
		return adviceContent;
	}

	public void setAdviceContent(String adviceContent) {
		this.adviceContent = adviceContent;
	}

	public int getAdviceState() {
		return adviceState;
	}

	public void setAdviceState(int adviceState) {
		this.adviceState = adviceState;
	}

	public String getAdviceResponse() {
		return adviceResponse;
	}

	public void setAdviceResponse(String adviceResponse) {
		this.adviceResponse = adviceResponse;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
}
