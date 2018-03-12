package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.NOTICETABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.Notice;

public class NoticeDynaSqlProvider {
	
	public String insertNotice(Notice notice){
		return new SQL(){
			{
				INSERT_INTO(NOTICETABLE);
				VALUES(" noticeType", "#{noticeType} ");
				VALUES(" noticeDate", "#{noticeDate} ");
				VALUES(" changeDate", "#{changeDate} ");
				VALUES(" noticeTitle", "#{noticeTitle} ");
				VALUES(" noticeContent", "#{noticeContent} ");
				if(notice.getPictureAddress() != null && !notice.getPictureAddress().equals(""))
				VALUES(" pictureAddress", "#{pictureAddress} ");
			}
		}.toString();
	}
	
	public String updateNotice(Notice notice){
		return new SQL(){
			{
				UPDATE(NOTICETABLE);
				if(notice.getNoticeType() != 3) {
				SET(" noticeType = #{noticeType} ");
				}
				if(notice.getNoticeDate() != null) {
				SET(" noticeDate = #{noticeDate} ");
				}
				if(notice.getChangeDate() != null) {
				SET(" changeDate = #{changeDate} ");
				}
				if(notice.getNoticeTitle() != null && !notice.getNoticeTitle().equals("")) {
				SET(" noticeTitle = #{noticeTitle} ");
				}
				if(notice.getNoticeContent() != null && !notice.getNoticeContent().equals("")) {
				SET(" noticeContent = #{noticeContent} ");
				}
				if(notice.getPictureAddress() != null && !notice.getPictureAddress().equals("")) {
				SET(" pictureAddress = #{notice.pictureAddress} ");
				}
				WHERE(" noticeId = #{noticeId} ");
			}
		}.toString();
	}
	
	// 动态查询总数量
	public String count(Map<String, Object> params){
		return new SQL(){
			{
				SELECT("count(*)");
				FROM(NOTICETABLE);
				if(params.get("notice") != null){
					Notice notice = (Notice)params.get("notice");
					if(notice.getNoticeTitle() != null && !notice.getNoticeTitle().equals("")){
						WHERE(" noticeTitle LIKE CONCAT ('%',#{notice.noticeTitle},'%') ");
					}
				}
			}
		}.toString();
	}
	
	public String selectWithParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(NOTICETABLE);
				if(params.get("notice") != null){
					Notice notice = (Notice)params.get("notice");
					if(notice.getNoticeTitle() != null && !notice.getNoticeTitle().equals("")){
						WHERE(" noticeTitle LIKE CONCAT ('%',#{notice.noticeTitle},'%') ");
					}
					if(notice.getNoticeType() != 3){
						WHERE(" noticeType = #{notice.noticeType} ");
					}
					if(notice.getNoticeDate() != null) {
						WHERE(" noticeDate = #{notice.noticeDate}");
					}
				}
			}
		}.toString();
		
		sql += " limit #{start} , #{rowMax}  ";
		
		return sql;
	}	
}
