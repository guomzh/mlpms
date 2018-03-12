package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.ADVICETABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.Advice;


public class AdviceDynaSqlProvider {
	// 分页动态查询
			public String selectWhitParam(Map<String, Object> params){
				String sql =  new SQL(){
					{
						SELECT("*");
						FROM(ADVICETABLE);
						if(params.get("advice") != null){
							Advice advice = (Advice)params.get("advice");
							if(advice.getUserId() != null && !advice.getUserId().equals("")){
								WHERE("  userId LIKE CONCAT ('%',#{advice.userId},'%') ");
							}
							if(advice.getAdviceState() != 2) {
								WHERE(" adviceState = #{advice.adviceState} ");
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
						FROM(ADVICETABLE);
						if(params.get("advice") != null){
							Advice advice = (Advice)params.get("advice");
							if(advice.getUserId() != null && !advice.getUserId().equals("")){
								WHERE(" userId LIKE CONCAT ('%',#{advice.userId},'%') ");
							}
						}
					}
				}.toString();
			}	
			
			// 动态插入
			public String insertAdvice(Advice advice){
				return new SQL(){
					{
						INSERT_INTO(ADVICETABLE);
						VALUES("userId", "#{userId}");
						VALUES("adviceDate", "#{adviceDate}");
						VALUES("adviceContent", "#{adviceContent}");
						VALUES("adviceState", "#{adviceState}");
						VALUES("adviceResponse", "#{adviceResponse}");
					}
				}.toString();
			}
			// 动态更新
				public String updateAdvice(Advice advice){
					
					return new SQL(){
						{
							UPDATE(ADVICETABLE);
							if(advice.getAdviceContent() != null){
								SET(" adviceContent = #{adviceContent} ");
							}
							if(advice.getUserId() != null){
								SET(" userId = #{userId} ");
							}
							if(advice.getAdviceDate()!= null){
								SET(" adviceDate = #{adviceDate} ");
							}
							if(advice.getAdviceResponse()!= null){
								SET(" adviceResponse = #{adviceResponse} ");
							}
							if(advice.getAdviceState()!= 2){
								SET(" adviceState = #{adviceState} ");
							}
							WHERE(" adviceId = #{adviceId} ");
						}
					}.toString();
				}
				
			//业主
				// 分页动态查询
				public String selectWhitParamUser(Map<String, Object> params){
					String sql =  new SQL(){
						{
							SELECT("*");
							FROM(ADVICETABLE);
							if(params.get("advice") != null){
								Advice advice = (Advice)params.get("advice");
								if(advice.getUserId() != null && !advice.getUserId().trim().equals("")) {
									WHERE(" userId = #{advice.userId} ");
								}
								if(advice.getAdviceState() != 2) {
									WHERE(" adviceState = #{advice.adviceState} ");
								}
							}
						}
					}.toString();
					
//							if(params.get("pageModel") != null){
//								sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
//							}

					sql += " limit #{start} , #{rowMax}  ";
					return sql;
				}
				
				// 动态查询总数量
				public String countUser(Map<String, Object> params){
					return new SQL(){
						{
							SELECT("count(*)");
							FROM(ADVICETABLE);
							
						}
					}.toString();
				}
}
