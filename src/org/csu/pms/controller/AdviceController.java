package org.csu.pms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.csu.pms.domain.Advice;
import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.User;
import org.csu.pms.service.PmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
@Controller
public class AdviceController {
	@Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
	
	@RequestMapping(value= {"/adviceMg"})
	  public String adviceMg(@ModelAttribute("advice") Advice advice) {
	
		return "manager/adviceMg";
	}
	
	@RequestMapping(value="advice")
	public String advice(Model model) {
		return "user/advice";
	}
	
	@RequestMapping(value="/manager/advice-list")
	 public void selectRepair(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		String adviceState1 = request.getParameter("adviceState");
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		int adviceState = Integer.valueOf(adviceState1);
		
		Advice advice = new Advice();
		advice.setUserId(key);
		advice.setAdviceState(adviceState);
		
		
		PageVO<Advice>  page = pmsService.listAdvice(advice, pageNo, rowMax);

		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
}
	
	@RequestMapping(value="/manager/updateAdvice")
	 public void updateAdvice(@ModelAttribute("advice") Advice advice){
		advice.setAdviceState(advice.getTypeId());
		pmsService.modifyAdvice(advice);
		System.out.println("modify Advice :"+ advice.getAdviceId());
	}
 
 
 @RequestMapping(value="/manager/deleteAdvice")
	 public void deleteAdvice(@RequestBody Advice advice, HttpServletResponse response){  	    	   	 
	    int adviceId = advice.getAdviceId();
		pmsService.removeAdvice(adviceId);
		System.out.println("delete Advice :"+ adviceId);	
		
	}
 
 @RequestMapping(value="/manager/loadEditAdvice")
 @ResponseBody
	 public  Object loadEditAdvice(@RequestParam(value="adviceId",required=false) String adviceId){
 		int adviceId1 = Integer.valueOf(adviceId);
 		Advice advice = new Advice();
 		advice = pmsService.findAdvice(adviceId1);
		System.out.println("load Advice :"+ adviceId);
		return advice;
	}
 
 @RequestMapping(value="user/advice-list")
	public void selectAdvice(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User user = (User) session.getAttribute("user");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		String adviceState = request.getParameter("adviceState");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		System.out.println(beginDate);
		System.out.println(endDate);
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		int adState = Integer.valueOf(adviceState);
		Advice advice =new Advice();
		advice.setUserId(user.getUserId());
		advice.setAdviceState(adState);
		
		PageVO<Advice>  page = pmsService.listAdvice(advice, pageNo, rowMax);
		
		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
	}
 
 @RequestMapping(value="/user/addAdvice")
 public void addAdvice(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
		 @ModelAttribute("advice") Advice advice) throws ServletException, IOException{
	request.setCharacterEncoding("UTF-8");
	Date date = (Date) new Timestamp(System.currentTimeMillis());
	User user = (User) session.getAttribute("user");
	String userId = user.getUserId();
	//String adviceContent = request.getParameter("adviceContent");
	
	advice.setUserId(userId);
	advice.setAdviceDate(date);
	//advice.setAdviceContent(adviceContent);
	advice.setAdviceState(0);

		pmsService.addAdvice(advice);
		//System.out.println(advice.getAdviceContent());
}
 
 @RequestMapping(value="/user/loadAdvice")
 @ResponseBody
 public Object loadAdvice(@RequestParam(value="adviceId",required=false) String adviceId){
	 int id = Integer.valueOf(adviceId);
	 Advice advice = new Advice();
	 advice = pmsService.findAdvice(id);
	 return advice;
}
}
