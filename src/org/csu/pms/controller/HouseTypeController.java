package org.csu.pms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.csu.pms.domain.HouseType;
import org.csu.pms.domain.PageVO;
import org.csu.pms.service.PmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
@Controller
public class HouseTypeController {
	@Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
	
	 @RequestMapping(value= {"/houseTypeMg"})
	  public String houseTypeMg(@ModelAttribute("houseType") HouseType houseType) {
	
		return "manager/houseTypeMg";
	}
	 
	@RequestMapping(value="/manager/houseType-list")
	 public void selectRepair(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");

		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);

		
		HouseType houseType = new HouseType();
		houseType.setDescription(key);;
		//house.setHouseType(type);
		
		
		PageVO<HouseType>  page = pmsService.listHouseType(houseType, pageNo, rowMax);

		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
}
	
	@RequestMapping(value="/manager/addHouseType")
	 public void addHouseType(@ModelAttribute("houseType") HouseType houseType){	
		pmsService.addHouseType(houseType);
		System.out.println("add HouseType :"+ houseType.getHouseType());	
		houseType = null;
	}
  
  @RequestMapping(value="/manager/updateHouseType")
	 public void updateHouseType(@ModelAttribute("houseType") HouseType houseType){
		pmsService.modifyHouseType(houseType);
		System.out.println("modify HouseType :"+ houseType.getHouseType());
	}
  
  
  @RequestMapping(value="/manager/deleteHouseType")
	 public void deleteHouseType(@RequestBody HouseType houseType, HttpServletResponse response){  	    	   	 
	   int houseType1 = houseType.getHouseType();
		pmsService.removeHouseType(houseType1);;		
		System.out.println("delete HouseType :"+ houseType1);	
		
	}
  
  @RequestMapping(value="/manager/loadEditHouseType")
  @ResponseBody
	 public  Object loadEditHouseType(@RequestParam(value="houseType",required=false) String houseType){
  	
	  HouseType houseType1 = new HouseType();
	  int houseTypeNum = Integer.valueOf(houseType);
	  houseType1 = pmsService.findHouseType(houseTypeNum);
		System.out.println("load HouseType :"+ houseType);
		return houseType1;
	}
}
