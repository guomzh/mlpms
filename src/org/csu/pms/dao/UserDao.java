package org.csu.pms.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.csu.pms.domain.User;
import org.csu.pms.dao.provider.UserDynaSqlProvider;
import static org.csu.pms.util.common.PmsConstants.USERTABLE;



public interface UserDao{
	// 根据登录名和密码查询业主
	@Select("select * from "+USERTABLE+" where userId = #{userId} and password = #{password}")
	User selectByUserIdAndPassword(
			@Param("userId") String userId,
			@Param("password") String password);
	
	// 根据id查询用户
	@Select("select * from "+USERTABLE+" where userId = #{userId}")
	User selectByUserId(String userId);
	
/*	// 根据用户名查询用户
	@Select("select * from "+USERTABLE+" where userName = #{userName}")
	List<User selectByUserName(String userName);*/
	
	// 根据id删除用户
	@Delete(" delete from "+USERTABLE+" where userId = #{userId}")
	void deleteByUserId(String userId);
	
	// 动态修改用户
	@SelectProvider(type=UserDynaSqlProvider.class,method="updateUser")
	void update(User user);
	
	// 动态查询
	@SelectProvider(type=UserDynaSqlProvider.class,method="selectWhitParam")
	List<User> selectByPage(Map<String, Object> params);
	
	// 根据参数查询用户总数
	@SelectProvider(type=UserDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入用户
	@SelectProvider(type=UserDynaSqlProvider.class,method="insertUser")
	void save(User user);

	@Update("update "+USERTABLE+" set password=#{password} , phone=#{phone} where userId=#{userId}")
	void change( @Param("password")String password, @Param("phone")String phone,@Param("userId")String userId);
}