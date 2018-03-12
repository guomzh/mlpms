package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.HOUSETYPETABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.HouseType;

public class HouseTypeDynaSqlProvider {
	// 分页动态查询
				public String selectWhitParam(Map<String, Object> params){
					String sql =  new SQL(){
						{
							SELECT("*");
							FROM(HOUSETYPETABLE);
							if(params.get("houseType") != null){
								HouseType houseType = (HouseType)params.get("houseType");
								if(houseType.getDescription() != null && !houseType.getDescription().equals("")){
									WHERE("  description LIKE CONCAT ('%',#{houseType.description},'%') ");
								}
								if(houseType.getHouseType() != 0) {
									WHERE(" houseType = #{houseType.houseType} ");
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
							FROM(HOUSETYPETABLE);
							if(params.get("houseType") != null){
								HouseType houseType = (HouseType)params.get("houseType");
								if(houseType.getDescription() != null && !houseType.getDescription().equals("")){
									WHERE(" description LIKE CONCAT ('%',#{houseType.description},'%') ");
								}
							}
						}
					}.toString();
				}	
				
				// 动态插入
				public String insertHouseType(HouseType houseType){
					
					return new SQL(){
						{
							INSERT_INTO(HOUSETYPETABLE);
							if(houseType.getDescription() != null && !houseType.getDescription().equals("")){
								VALUES("description", "#{description}");
							}	
							VALUES("area", "#{area}");
							VALUES("houseType", "#{houseType}");
						}
					}.toString();
				}
				// 动态更新
					public String updateHouseType(HouseType houseType){
						
						return new SQL(){
							{
								UPDATE(HOUSETYPETABLE);
								if(houseType.getDescription() != null){
									SET(" description = #{description} ");
								}
									SET(" area = #{area} ");

								
								WHERE(" houseType = #{houseType} ");
							}
						}.toString();
					}
}
