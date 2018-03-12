package org.csu.pms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.csu.pms.domain.House;
import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.User;
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
public class HouseController {
	@Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
	
	 @RequestMapping(value= {"/houseMg"})
	  public String houseMg(@ModelAttribute("house") House house) {
	
		return "manager/houseMg";
	}
	 
	@RequestMapping(value="/manager/house-list")
	 public void selectRepair(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		//String type1 = request.getParameter("type");
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		//int type = Integer.valueOf(type1);
		
		House house = new House();
		house.setUserId(key);
		//house.setHouseType(type);
		
		
		PageVO<House>  page = pmsService.listHouse(house, pageNo, rowMax);

		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
}
    @RequestMapping(value="/manager/addHouse")
	 public void addUser(@ModelAttribute("house") House house){
		
		pmsService.addHouse(house);
		
		System.out.println("add house :"+ house.getUserId());	
		house = null;
	}
    
    @RequestMapping(value="/manager/updateHouse")
	 public void updateHouse(@ModelAttribute("house") House house){
   	 //User user = new User();

 		pmsService.modifyHouse(house);
		
		System.out.println("modify House :"+ house.getBuildingNum()+" "+ house.getRoomNum());

		
	}
    
    
    @RequestMapping(value="/manager/deleteHouse")
	 public void deleteHouse(@RequestBody House house, HttpServletResponse response){  	    	   	 
   	int buildingNum = house.getBuildingNum();
   	int roomNum = house.getRoomNum();
   	
		pmsService.removeHouse(buildingNum,roomNum);
		
		
		System.out.println("delete house :"+ buildingNum + " " + roomNum);	
		
	}
    
    @RequestMapping(value="/manager/loadEditHouse")
    @ResponseBody
	 public  Object loadEditHouse(
			 @RequestParam(value="buildingNum",required=false) String buildingNum,
			 @RequestParam(value="roomNum",required=false) String roomNum){
    	House house = new House();
    	int bNum = Integer.valueOf(buildingNum);
		int rNum = Integer.valueOf(roomNum);
    	house = pmsService.findHouse(bNum, rNum);
		System.out.println("load House :"+ buildingNum + " "+roomNum);
		return house;
	}
}
