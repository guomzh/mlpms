package org.csu.pms.dao.provider;

import static org.csu.pms.util.common.PmsConstants.CONSUMETABLE;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.Consume;
import org.csu.pms.domain.User;
public class ConsumeDynaSqlProvider {
	
	public String insertConsume(Consume consume){
		return new SQL(){
			{
				INSERT_INTO(CONSUMETABLE);
				VALUES(" consumeId", "#{consumeId} ");
				VALUES(" buildingNum", "#{buildingNum} ");
				VALUES(" roomNum", "#{roomNum} ");
				VALUES(" userId", "#{userId} ");
				VALUES(" createDate", "#{createDate} ");
				VALUES(" consumeDate", "#{consumeDate} ");
				VALUES(" consumeType", "#{consumeType} ");
				VALUES(" unitPrice", "#{unitPrice} ");
				VALUES(" count", "#{count} ");
				VALUES(" price", "#{price} ");
				VALUES(" consumeState", "#{consumeState} ");
			}
		}.toString();
	}
	
	public String updateConsume(Consume consume){
		return new SQL(){
			{
				UPDATE(CONSUMETABLE);
				SET(" buildingNum = #{buildingNum} ");
				SET(" roomNum = #{roomNum} ");
				if(consume.getUserId() != null){
					SET(" userId = #{userId} ");
				}
				SET(" createDate = #{createDate} ");
				SET(" consumeDate = #{consumeDate} ");
				SET(" consumeType = #{consumeType} ");
				SET(" unitPrice = #{unitPrice} ");
				SET(" count = #{count} ");
				SET(" price = #{price} ");
				SET(" consumeState = #{consumeState} ");
				WHERE(" consumeId = #{consumeId} ");
			}
		}.toString();
	}
	
	// 动态查询总数量
	public String count(Map<String, Object> params){
		return new SQL(){
			{
				SELECT("count(*)");
				FROM(CONSUMETABLE);
				if(params.get("consume") != null){
					Consume advice = (Consume)params.get("consume");
					if(advice.getUserId() != null && !advice.getUserId().equals("")){
						WHERE(" userId LIKE CONCAT ('%',#{consume.userId},'%') ");
					}
				}
			}
		}.toString();
	}
	//分页动态查询
	public String selectWithParam(Map<String, Object> params){
		String sql =  new SQL(){
			{
				SELECT("*");
				FROM(CONSUMETABLE);
				if(params.get("consume") != null){
					Consume consume = (Consume)params.get("consume");
					if(consume.getUserId() != null && !consume.getUserId().equals("")){
						WHERE(" userId LIKE CONCAT ('%',#{consume.userId},'%') ");
					}
					if(consume.getConsumeType()!=3) {
						WHERE(" consumeType = #{consume.consumeType} ");
					}
					if(consume.getConsumeState()!=2) {
						WHERE(" consumeState = #{consume.consumeState} ");
					}
					if(consume.getConsumeDate() != null){
						WHERE(" consumeDate = #{consume.consumeDate} ");
					}
					
				}
			}
		}.toString();
		
		sql += " limit #{start} , #{rowMax}  ";		
		
		return sql;
	}	
	
	//业主
	// 分页动态查询
				public String selectConsumeWhitParamUser(Map<String, Object> params){
					String sql =  new SQL(){
						{
							if(params.get("user")!=null) {
								User user = (User)params.get("user");
								SELECT(" * ");
								FROM(CONSUMETABLE);
								WHERE("userId = #{user.userId}");
								
								if(((String)params.get("consumeType")).equals("0")) {
								
									if(((String)params.get("select")).equals("水费")) {
										WHERE("consumeType = 0");
									}
									 if(((String)params.get("select")).equals("电费")) {
										WHERE("consumeType = 1");
									}
									 if(((String)params.get("select")).equals("物业费")) {
										WHERE("consumeType = 2");
									}
									 if(!((String)(params.get("calendar"))).equals("")) {
										String c=(String)(params.get("calendar"));
										c+=" 00:00:00";															
										c="'"+c+"'";
										System.out.println(c);
										WHERE(" consumeDate >= "+c);
									  
									}
									 if(!((String)(params.get("calendar1"))).equals("")) {
										String c1=(String)(params.get("calendar1"));
										c1+=" 23:59:59";
										c1="'"+c1+"'";
										System.out.println(c1);
										WHERE(" consumeDate < "+ c1) ;
									}
	
									WHERE("consumeState =1");
								   
								}
								
								else {
									WHERE("consumeState = 0");
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
						
							if(params.get("user")!=null) {
								User user = (User)params.get("user");
								SELECT("count(*)");
								FROM(CONSUMETABLE);
								WHERE("userId = #{user.userId}");
								
								if(((String)params.get("consumeType")).equals("0")) {
									
									if(((String)params.get("select")).equals("水费")) {
										WHERE("consumeType = 0");
									}
									 if(((String)params.get("select")).equals("电费")) {
										WHERE("consumeType = 1");
									}
									 if(((String)params.get("select")).equals("物业费")) {
										WHERE("consumeType = 2");
									}
									 if(!((String)(params.get("calendar"))).equals("")) {
										String c=(String)(params.get("calendar"));
										c+=" 00:00:00";															
										c="'"+c+"'";
										System.out.println(c);
										WHERE(" consumeDate >= "+c);
									  
									}
									 if(!((String)(params.get("calendar1"))).equals("")) {
										String c1=(String)(params.get("calendar1"));
										c1+=" 23:59:59";
										c1="'"+c1+"'";
										System.out.println(c1);
										WHERE(" consumeDate < "+ c1) ;
									}
									WHERE("consumeState =1");
								}
								
								else {
									WHERE("consumeState = 0");
								}
							}
						}
					}.toString();
				}	
}
