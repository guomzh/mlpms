package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.REPAIRTABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.Repair;


public class RepairDynaSqlProvider {
	// 分页动态查询
			public String selectWhitParam(Map<String, Object> params){
				String sql =  new SQL(){
					{
						SELECT("*");
						FROM(REPAIRTABLE);
						if(params.get("repair") != null){
							Repair repair = (Repair)params.get("repair");
							if(repair.getUserId() != null && !repair.getUserId().equals("")){
								WHERE("  userId LIKE CONCAT ('%',#{repair.userId},'%') ");
							}
							if(repair.getRepairState() != 3) {
								WHERE(" repairState = #{repair.repairState} ");
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
						FROM(REPAIRTABLE);
						if(params.get("repair") != null){
							Repair repair = (Repair)params.get("repair");
							if(repair.getUserId() != null && !repair.getUserId().equals("")){
								WHERE(" userId LIKE CONCAT ('%',#{repair.userId},'%') ");
							}
						}
					}
				}.toString();
			}	
			
			// 动态插入
			public String insertRepair(Repair repair){
				
				return new SQL(){
					{
						INSERT_INTO(REPAIRTABLE);
						VALUES(" repairId", "#{repairId} ");
						VALUES(" userId", "#{userId} ");
						VALUES(" buildingNum", "#{buildingNum} ");
						VALUES(" roomNum", "#{roomNum} ");
						VALUES(" repairDate", "#{repairDate} ");
						VALUES(" repairContent", "#{repairContent} ");
						VALUES(" repairState", "#{repairState} ");
						VALUES(" repairResponse", "#{repairResponse} ");
					}
				}.toString();
			}
			// 动态更新
				public String updateRepair(Repair repair){
					
					return new SQL(){
						{
							UPDATE(REPAIRTABLE);
							SET(" repairResponse = #{repairResponse} ");
							SET(" repairState = #{repairState}");
							WHERE(" repairId = #{repairId} ");
						}
					}.toString();
				}
			//业主
				// 分页动态查询
				public String selectWhitParamUser(Map<String, Object> params){
					String sql =  new SQL(){
						{
							SELECT("*");
							FROM(REPAIRTABLE);
							if(params.get("repair") != null){
								Repair repair = (Repair)params.get("repair");
								if(repair.getUserId() != null && !repair.getUserId().trim().equals("")) {
									WHERE(" userId = #{repair.userId} ");
								}
								if(repair.getRepairState() != 3) {
									WHERE(" repairState = #{repair.repairState} ");
								}
							}
						}
					}.toString();					

					sql += " limit #{start} , #{rowMax}  ";
					return sql;
				}
				
				// 动态查询总数量
				public String countUser(Map<String, Object> params){
					return new SQL(){
						{
							SELECT("count(*)");
							FROM(REPAIRTABLE);
							
						}
					}.toString();
				}
				
				// 动态插入
				public String insertRepairUser(Repair repair){
					return new SQL(){
						{
							INSERT_INTO(REPAIRTABLE);
							VALUES("userId", "#{userId}");
							VALUES("buildingNum", "#{buildingNum}");
							VALUES("roomNum", "#{roomNum}");
							VALUES("repairDate", "#{repairDate}");
							VALUES("repairContent", "#{repairContent}");
							VALUES("repairState", "#{repairState}");
							VALUES("repairResponse", "#{repairResponse}");
						}
					}.toString();
				}
}
