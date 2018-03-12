package org.csu.pms.dao;

import static org.csu.pms.util.common.PmsConstants.CARTABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.csu.pms.dao.provider.CarDynaSqlProvider;
import org.csu.pms.domain.Car;


public interface CarDao {
			// 根据车牌号查询车辆
			@Select("select * from "+CARTABLE+" where carNum = #{carNum} ")
			Car selectByCarNum(@Param("carNum") String carNum);
					
			
			// 根据车牌号删除车辆
			@Delete(" delete from "+CARTABLE+" where carNum = #{carNum}")
			void deleteByCarNum(@Param("carNum")String carNum);
			
			// 动态修改车辆
			@SelectProvider(type=CarDynaSqlProvider.class,method="updateCar")
			void update(Car car);
			
			// 动态查询
			@SelectProvider(type=CarDynaSqlProvider.class,method="selectWhitParam")
			List<Car> selectByPage(Map<String, Object> params);
			
			// 根据参数查询车辆总数
			@SelectProvider(type=CarDynaSqlProvider.class,method="count")
			Integer count(Map<String, Object> params);
			
			// 动态插入车辆
			@SelectProvider(type=CarDynaSqlProvider.class,method="insertCar")
			void save(Car car);
}
