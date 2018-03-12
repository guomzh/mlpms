package org.csu.pms.dao;


import static org.csu.pms.util.common.PmsConstants.HOUSETYPETABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import org.csu.pms.dao.provider.HouseTypeDynaSqlProvider;

import org.csu.pms.domain.HouseType;

public interface HouseTypeDao {
			// 根据户型id查询户型
			@Select("select * from "+HOUSETYPETABLE+" where houseType = #{houseType} ")
			HouseType selectByHouseType(@Param("houseType") int houseType);
					
			
			// 根据户型id删除户型
			@Delete(" delete from "+HOUSETYPETABLE+" where houseType = #{houseType}")
			void deleteByHouseType(int houseType);
			
			// 动态修改户型
			@SelectProvider(type=HouseTypeDynaSqlProvider.class,method="updateHouseType")
			void update(HouseType houseType);
			
			// 动态查询
			@SelectProvider(type=HouseTypeDynaSqlProvider.class,method="selectWhitParam")
			List<HouseType> selectByPage(Map<String, Object> params);
			
			// 根据参数查询户型总数
			@SelectProvider(type=HouseTypeDynaSqlProvider.class,method="count")
			Integer count(Map<String, Object> params);
			
			// 动态插入住房
			@SelectProvider(type=HouseTypeDynaSqlProvider.class,method="insertHouseType")
			void save(HouseType houseType);
}
