package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.HOUSETABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.House;

public class HouseDynaSqlProvider {
	// 分页动态查询
			public String selectWhitParam(Map<String, Object> params){
				String sql =  new SQL(){
					{
						SELECT("*");
						FROM(HOUSETABLE);
						if(params.get("house") != null){
							House house = (House)params.get("house");
							if(house.getUserId() != null && !house.getUserId().equals("")){
								WHERE("  userId LIKE CONCAT ('%',#{house.userId},'%') ");
							}
							if(house.getHouseType() != 0) {
								WHERE(" houseType = #{house.houseType} ");
							}
							if(house.getBuildingNum() != 0) {
								WHERE(" buildingNum = #{house.buildingNum} ");
							}
							if(house.getRoomNum() != 0) {
								WHERE(" roomNum = #{house.roomNum} ");
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
						FROM(HOUSETABLE);
						if(params.get("house") != null){
							House house = (House)params.get("house");
							if(house.getUserId() != null && !house.getUserId().equals("")){
								WHERE(" userId LIKE CONCAT ('%',#{house.userId},'%') ");
							}
						}
					}
				}.toString();
			}	
			
			// 动态插入
			public String insertHouse(House house){
				
				return new SQL(){
					{
						INSERT_INTO(HOUSETABLE);
						if(house.getUserId() != null && !house.getUserId().equals("")){
							VALUES("userId", "#{userId}");
						}
						
						VALUES("buildingNum", "#{buildingNum}");
						VALUES("roomNum", "#{roomNum}");
						VALUES("houseType", "#{houseType}");
						
						
					}
				}.toString();
			}
			// 动态更新
				public String updateHouse(House house){
					
					return new SQL(){
						{
							UPDATE(HOUSETABLE);
							if(house.getUserId() != null){
								SET(" userId = #{userId} ");
							}
							if(house.getHouseType()!= 0){
								SET(" houseType = #{houseType} ");
							}

							
							WHERE(" buildingNum = #{buildingNum} and roomNum = #{roomNum} ");
						}
					}.toString();
				}
}
