package org.csu.pms.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Notice implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int noticeId;
	
	private int noticeType;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date noticeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date changeDate;
	
	private String noticeTitle;
	
	private String noticeContent;
	
	private String pictureAddress;
	
	private int typeId;

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public int getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(int noticeType) {
		this.noticeType = noticeType;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public Date getChangeDate() {
		return changeDate;
	}

	public void setChangeDate(Date changeDate) {
		this.changeDate = changeDate;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	
}
