package org.csu.pms.dao;


import static org.csu.pms.util.common.PmsConstants.REPAIRTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.csu.pms.dao.provider.RepairDynaSqlProvider;
import org.csu.pms.domain.Repair;


public interface RepairDao {
		
		//查询
		@Select("select * from "+REPAIRTABLE+" where repairId = #{repairId} ")
		Repair selectByRepairId(@Param("repairId") int repairId);
				
		
		// 根据车牌号删除车辆
		@Delete(" delete from "+REPAIRTABLE+" where repairId = #{repairId}")
		void deleteByRepairId(@Param("repairId")int repairId);
		
		// 动态修改报修
		@SelectProvider(type=RepairDynaSqlProvider.class,method="updateRepair")
		void update(Repair repair);
		
		// 动态查询
		@SelectProvider(type=RepairDynaSqlProvider.class,method="selectWhitParam")
		List<Repair> selectByPage(Map<String, Object> params);
		
		// 根据参数查询报修总数
		@SelectProvider(type=RepairDynaSqlProvider.class,method="count")
		Integer count(Map<String, Object> params);
		
		// 动态插入报修
		@SelectProvider(type=RepairDynaSqlProvider.class,method="insertRepair")
		void save(Repair repair);
		//业主
		// 动态查询
		@SelectProvider(type=RepairDynaSqlProvider.class,method="selectWhitParamUser")
		List<Repair> selectByPageUser(Map<String, Object> params);
		
		// 根据参数查询用户总数
		@SelectProvider(type=RepairDynaSqlProvider.class,method="countUser")
		Integer countUser(Map<String, Object> params);
		
		// 动态插入用户
		@SelectProvider(type=RepairDynaSqlProvider.class,method="insertRepairUser")
		void saveUser(Repair repair);
}
