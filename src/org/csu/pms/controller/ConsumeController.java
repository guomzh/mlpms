package org.csu.pms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.csu.pms.domain.Consume;
import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.User;
import org.csu.pms.service.PmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

@Controller
public class ConsumeController {
	@Autowired
    @Qualifier("pmsService")
    private PmsService pmsService;
	
	@RequestMapping(value= {"/consumeMg"})
	  public String consumeMg(@ModelAttribute("consume") Consume consume) {
 	
		return "manager/consumeMg";
	}
	
	 @RequestMapping(value="/manager/consume-list")
	 public void selectConsume(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
 		request.setCharacterEncoding("UTF-8");
 		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		String consumeType1 = request.getParameter("consumeType");
		String consumeState1 = request.getParameter("consumeState");
		
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		int consumeType = Integer.valueOf(consumeType1);
		int consumeState = Integer.valueOf(consumeState1);
		
		Consume consume = new Consume();
		consume.setUserId(key);
		consume.setConsumeState(consumeState);
		consume.setConsumeType(consumeType);
		
		System.out.println(consume.getConsumeState());
		
		PageVO<Consume>  page = pmsService.listConsume(consume, pageNo, rowMax);
		
		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
		
	}
     
  
     @RequestMapping(value="/manager/addConsume")
	 public void addConsume(@ModelAttribute("consume") Consume consume){
 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		String dateStr = consume.getDate()+ " 00:00:00";
 		Date date = Timestamp.valueOf(dateStr);
 		consume.setConsumeDate(date);
    	 System.out.println("add consume :"+ consume.getUserId());
  		consume.setConsumeType(consume.getTypeId());
  		consume.setCreateDate(new Timestamp(System.currentTimeMillis()));
  		consume.setPrice(consume.getCount() * consume.getUnitPrice());
  		consume.setConsumeState(0);
  		pmsService.addConsume(consume);	
		
	}
     
     @RequestMapping(value="/pay")
     public String pay() {
     	return "user/pay";
     }
     
     @RequestMapping(value="/list_consume")
   	 public void selectConsume(
   			 HttpServletRequest request, HttpServletResponse response,HttpSession session)throws ServletException, IOException{
    		request.setCharacterEncoding("UTF-8");
   		String pageNoStr = request.getParameter("pageNo");
   		String rowMaxStr = request.getParameter("rowMax");
   		String consumeType = request.getParameter("consumeType");
   		int pageNo = Integer.valueOf(pageNoStr);
   		int rowMax = Integer.valueOf(rowMaxStr);
   	    String select=request.getParameter("select");
   		User user=(User)session.getAttribute("user");
   		Map<String, Object> map=new HashMap<>();
   		
   		String calendar=request.getParameter("calendar");
         String calendar1=request.getParameter("calendar1");
         
         map.put("calendar", calendar);
         map.put("calendar1", calendar1);
         System.out.println(calendar+"9");
         System.out.println(calendar1+"10");
   		map.put("consumeType", consumeType);
   		map.put("user", user);
   	    map.put("select", select);

   		PageVO<Consume>  page = pmsService.listConsumeUser(map, pageNo, rowMax);
   		
   		response.reset();
   		response.setContentType("text/plain;charset=UTF-8");
   		response.getWriter().print(JSON.toJSONString(page));
   		response.flushBuffer();
   		
   	}
     
     @RequestMapping(value="/payconsume")
     public void payconsume(HttpServletRequest request, HttpServletResponse response) {
     	String[] list = request.getParameterValues("list");
     
     	for (String item : list) {
 			int consumeId=Integer.valueOf(item);
 			pmsService.payOneItem(consumeId);
 		}    
   
     }
}
