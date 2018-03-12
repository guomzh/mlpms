package org.csu.pms.dao.provider;

import java.util.Map;
import org.apache.ibatis.jdbc.SQL;
import org.csu.pms.domain.User;
import static org.csu.pms.util.common.PmsConstants.USERTABLE;


public class UserDynaSqlProvider {
	// 分页动态查询
		public String selectWhitParam(Map<String, Object> params){
			String sql =  new SQL(){
				{
					SELECT("*");
					FROM(USERTABLE);
					if(params.get("user") != null){
						User user = (User)params.get("user");
						if(user.getUserName() != null && !user.getUserName().equals("")){
							WHERE("  userName LIKE CONCAT ('%',#{user.userName},'%') ");
						}
						if(user.getRoleType() != 3) {
							WHERE(" roleType = #{user.roleType} ");
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
					FROM(USERTABLE);
					if(params.get("user") != null){
						User user = (User)params.get("user");
						if(user.getUserName() != null && !user.getUserName().equals("")){
							WHERE(" username LIKE CONCAT ('%',#{user.userName},'%') ");
						}
					}
				}
			}.toString();
		}	
		
		// 动态插入
		public String insertUser(User user){
			
			return new SQL(){
				{
					INSERT_INTO(USERTABLE);
					if(user.getUserId() != null && !user.getUserId().equals("")){
						VALUES("userId", "#{userId}");
					}
					if(user.getUserName() != null && !user.getUserName().equals("")){
						VALUES("userName", "#{userName}");
					}

					if(user.getPassword() != null && !user.getPassword().equals("")){
						VALUES("password", "#{password}");
					}
					if(user.getSex() != null && !user.getSex().equals("")){
						VALUES("sex", "#{sex}");
					}
					if(user.getPhone() != null && !user.getPhone().equals("")){
						VALUES("phone", "#{phone}");
					}
					if(user.getRoleType() == 0 || user.getRoleType() == 1 || user.getRoleType() == 2){
						VALUES("roleType", "#{roleType}");
					}
				}
			}.toString();
		}
		// 动态更新
			public String updateUser(User user){
				
				return new SQL(){
					{
						UPDATE(USERTABLE);
						if(user.getUserName() != null){
							SET(" userName = #{userName} ");
						}
						if(user.getPassword()!= null){
							SET(" password = #{password} ");
						}
						if(user.getSex()!= null){
							SET(" sex = #{sex} ");
						}
						if(user.getPhone()!= null){
							SET(" phone = #{phone} ");
						}
						if(user.getRoleType() == 0 || user.getRoleType() == 1 || user.getRoleType() == 2){
							SET(" roleType = #{roleType} ");
						}
						WHERE(" userId = #{userId} ");
					}
				}.toString();
			}
}
