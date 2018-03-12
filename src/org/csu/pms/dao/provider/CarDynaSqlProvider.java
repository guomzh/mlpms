package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.CARTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.Car;

public class CarDynaSqlProvider {
	// 分页动态查询
				public String selectWhitParam(Map<String, Object> params){
					String sql =  new SQL(){
						{
							SELECT("*");
							FROM(CARTABLE);
							if(params.get("car") != null){
								Car car = (Car)params.get("car");
								if(car.getUserId() != null && !car.getUserId().equals("")){
									WHERE("  userId LIKE CONCAT ('%',#{car.userId},'%') ");
								}
								if(car.getCarNum() != null && !car.getCarNum().equals("")) {
									WHERE(" carNum = #{car.carNum} ");
								}
								
							}
						}
					}.toString();				

						sql += " limit #{start} , #{rowMax}  ";
					
					
					return sql;
				}	
				// 动态查询总数量
				public String count(Map<String, Object> params){
					return new SQL(){
						{
							SELECT("count(*)");
							FROM(CARTABLE);
							if(params.get("car") != null){
								Car car = (Car)params.get("car");
								if(car.getUserId() != null && !car.getUserId().equals("")){
									WHERE(" userId LIKE CONCAT ('%',#{car.userId},'%') ");
								}
								if(car.getCarNum() != null && !car.getCarNum().equals("")) {
									WHERE(" carNum LIKE CONCAT ('%',#{car.carNum},'%') ");
								}
							}
						}
					}.toString();
				}	
				
				// 动态插入
				public String insertCar(Car car){
					
					return new SQL(){
						{
							INSERT_INTO(CARTABLE);
							if(car.getUserId() != null && !car.getUserId().equals("")){
								VALUES("userId", "#{userId}");
							}
							
							VALUES("carNum", "#{carNum}");
							VALUES("color", "#{color}");
							VALUES("brand", "#{brand}");
							VALUES("description", "#{description}");
							
							
						}
					}.toString();
				}
				// 动态更新
					public String updateCar(Car car){
						
						return new SQL(){
							{
								UPDATE(CARTABLE);
								if(car.getUserId() != null){
									SET(" userId = #{userId} ");
								}
								if(car.getDescription()!= null){
									SET(" description = #{description} ");
								}
								if(car.getBrand()!= null){
									SET(" brand = #{brand} ");
								}
								if(car.getColor()!= null){
									SET(" color = #{color} ");
								}
								
								WHERE(" carNum = #{carNum} ");
							}
						}.toString();
					}
}
