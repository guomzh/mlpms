package org.csu.pms.dao;

import static org.csu.pms.util.common.PmsConstants.CONSUMETABLE;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.csu.pms.dao.provider.ConsumeDynaSqlProvider;

import org.csu.pms.domain.Consume;


public interface ConsumeDao {	
	
	@SelectProvider(type=ConsumeDynaSqlProvider.class, method="insertConsume")
	void insertConsume(Consume consume);
	
	@UpdateProvider(type=ConsumeDynaSqlProvider.class, method="updateConsume")
	void updateConsume(Consume consume);
	
	// 动态查询
	@SelectProvider(type=ConsumeDynaSqlProvider.class,method="selectWithParam")
	List<Consume> selectByPage(Map<String, Object> params);
	
	// 根据参数查询用户总数
	@SelectProvider(type=ConsumeDynaSqlProvider.class,method="count")
	Integer count(Map<String, Object> params);
	
	// 动态插入用户
	@SelectProvider(type=ConsumeDynaSqlProvider.class,method="insertConsume")
	void save(Consume consume);
	
	//业主
	// 动态查询
			@SelectProvider(type=ConsumeDynaSqlProvider.class,method="selectConsumeWhitParamUser")
			List<Consume> selectConsumeByPageUser(Map<String, Object> params);
			
			// 根据参数查询总数
			@SelectProvider(type=ConsumeDynaSqlProvider.class,method="countUser")
			Integer countConsumeUser(Map<String, Object> params);
			
			//支付一项消费
			@Update("update "+CONSUMETABLE+" set consumeState = 1 where consumeId=#{consumeId} ")
			void updateConsumeUser(@Param("consumeId") int consumeId );
			
}
