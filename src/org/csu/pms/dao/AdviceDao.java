package org.csu.pms.dao;

import static org.csu.pms.util.common.PmsConstants.ADVICETABLE;


import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.csu.pms.dao.provider.AdviceDynaSqlProvider;

import org.csu.pms.domain.Advice;
import org.csu.pms.domain.House;


public interface AdviceDao {

		
		// 根据id查询投诉
		@Select("select * from "+ADVICETABLE+" where adviceId = #{adviceId}")
		Advice selectByAdviceId(@Param("adviceId")int adviceId);	
		
		// 根据id删除投诉
		@Delete(" delete from "+ADVICETABLE+" where adviceId = #{adviceId}")
		void deleteByAdviceId(@Param("adviceId")int adviceId);
		
		// 动态修改投诉
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="updateAdvice")
		void update(Advice advice);
		
		// 动态查询
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="selectWhitParam")
		List<Advice> selectByPage(Map<String, Object> params);
		
		// 根据参数查询用户总数
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="count")
		Integer count(Map<String, Object> params);
		
		// 动态插入用户
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="insertAdvice")
		void save(Advice advice);
		
		//业主
		// 动态查询
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="selectWhitParamUser")
		List<Advice> selectByPageUser(Map<String, Object> params);
		
		// 根据参数查询用户总数
		@SelectProvider(type=AdviceDynaSqlProvider.class,method="countUser")
		Integer countUser(Map<String, Object> params);
}
