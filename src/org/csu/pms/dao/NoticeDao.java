package org.csu.pms.dao;

import static org.csu.pms.util.common.PmsConstants.NOTICETABLE;
import static org.csu.pms.util.common.PmsConstants.USERTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.csu.pms.dao.provider.NoticeDynaSqlProvider;
import org.csu.pms.domain.Notice;


public interface NoticeDao {
	
		@Select("select * from "+ NOTICETABLE+" where noticeType = 0 "+" limit #{start},#{rowMax}")  
	    List<Notice> selectAll( @Param("start")int start, @Param("rowMax")int rowMax);
		
		@Select("select count(*) as count from "+NOTICETABLE+" where noticeType = 0 ")
	    int countAll() ;
		
		@Select("select *from "+NOTICETABLE+" where noticeType=0 and noticeTitle = #{noticeTitle}")
		Notice selectNewsItem( @Param("noticeTitle")String noticeTitle); 
		
		@Select("select * from "+NOTICETABLE+" where noticeType=0 order by noticeId desc limit 3")
		List<Notice> selectTopThree();
		@Select("select * from "+NOTICETABLE+" where noticeType=1 order by noticeId desc limit 2")
		List<Notice> getNoticeTwo();
		
		@Select("select * from "+NOTICETABLE+" where noticeType=2 order by noticeId desc limit 1")
		Notice getMissing();
		
		//根据id查找
		@Select("select * from "+NOTICETABLE+" where noticeId = #{noticeId}")
		Notice selectById(@Param("noticeId")int noticeId);
		
		// 根据id删除通知
		@Delete(" delete from "+NOTICETABLE+" where noticeId = #{noticeId}")
		void deleteByNoticeId(@Param("noticeId")int noticeId);
		
		// 动态修改通知
		@SelectProvider(type=NoticeDynaSqlProvider.class,method="updateNotice")
		void update(Notice notice);
		
		// 动态查询
		@SelectProvider(type=NoticeDynaSqlProvider.class,method="selectWithParam")
		List<Notice> selectByPage(Map<String, Object> params);
		
		// 根据参数查询通知总数
		@SelectProvider(type=NoticeDynaSqlProvider.class,method="count")
		Integer count(Map<String, Object> params);
		
		// 动态插入用户
		@SelectProvider(type=NoticeDynaSqlProvider.class,method="insertNotice")
		void save(Notice notice);
}
