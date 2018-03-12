package org.csu.pms.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.csu.pms.domain.Car;

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
public class CarController {
	@Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
	
	 @RequestMapping(value= {"/carMg"})
	  public String carMg(@ModelAttribute("car") Car car) {
	
		return "manager/carMg";
	}
	 
	@RequestMapping(value="/manager/car-list")
	 public void selectRepair(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");

		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		
		Car car = new Car();
		car.setUserId(key);
		
		
		PageVO<Car>  page = pmsService.listCar(car, pageNo, rowMax);

		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
}
	@RequestMapping(value="/manager/addCar")
	 public void addCar(@ModelAttribute("car") Car car){	
		pmsService.addCar(car);
		System.out.println("add car :"+ car.getCarNum());	
		car = null;
	}
   
   @RequestMapping(value="/manager/updateCar")
	 public void updateCar(@ModelAttribute("car") Car car){
		pmsService.modifyCar(car);
		System.out.println("modify Car :"+ car.getCarNum());
	}
   
   
   @RequestMapping(value="/manager/deleteCar")
	 public void deleteCar(@RequestBody Car car, HttpServletResponse response){  	    	   	 
	   String carNum = car.getCarNum();
  	
  	
		pmsService.removeCarById(carNum);
		
		
		System.out.println("delete Car :"+ carNum);	
		
	}
   
   @RequestMapping(value="/manager/loadEditCar")
   @ResponseBody
	 public  Object loadEditCar(@RequestParam(value="carNum",required=false) String carNum){
   	
		Car car = new Car();
		car = pmsService.findCarById(carNum);
		System.out.println("load Car :"+ carNum);
		return car;
	}
}
