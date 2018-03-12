package org.csu.pms.dao;

import static org.csu.pms.util.common.PmsConstants.HOUSETABLE;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import org.csu.pms.dao.provider.HouseDynaSqlProvider;

import org.csu.pms.domain.House;


public interface HouseDao {
		//查找住房
	
		@Select(" select * from "+HOUSETABLE+" where buildingNum = #{buildingNum} and roomNum = #{roomNum}")
		House findHouseByBuildingNumAndRoomNum(
				@Param("buildingNum") int buildingNum,
				@Param("roomNum") int roomNum);
		
		// 根据楼栋号和住房号删除住房
		@Delete(" delete from "+HOUSETABLE+" where buildingNum = #{buildingNum} and roomNum = #{roomNum}")
		void deleteByBuildingNumAndRoomNum(
				@Param("buildingNum") int buildingNum,
				@Param("roomNum") int roomNum);
		
		// 动态修改住房
		@SelectProvider(type=HouseDynaSqlProvider.class,method="updateHouse")
		void update(House house);
		
		// 动态查询
		@SelectProvider(type=HouseDynaSqlProvider.class,method="selectWhitParam")
		List<House> selectByPage(Map<String, Object> params);
		
		// 根据参数查询住房总数
		@SelectProvider(type=HouseDynaSqlProvider.class,method="count")
		Integer count(Map<String, Object> params);
		
		// 动态插入住房
		@SelectProvider(type=HouseDynaSqlProvider.class,method="insertHouse")
		void save(House house);
}
