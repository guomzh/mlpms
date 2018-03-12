package org.csu.pms.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.csu.pms.domain.PageVO;
import org.csu.pms.domain.Repair;
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
public class RepairController {
	@Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
	
	 @RequestMapping(value= {"/repairMg"})
	  public String repairMg(@ModelAttribute("repair") Repair repair) {
	
		return "manager/repairMg";
	}
	 
	@RequestMapping(value="/manager/repair-list")
	 public void selectRepair(
			 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		String repairState1 = request.getParameter("repairState");
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		int repairState = Integer.valueOf(repairState1);
		
		Repair repair = new Repair();
		repair.setUserId(key);
		repair.setRepairState(repairState);
		
		
		PageVO<Repair>  page = pmsService.listRepair(repair, pageNo, rowMax);

		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
		
	}
	
	@RequestMapping(value="/manager/updateRepair")
	 public void updateRepair(@ModelAttribute("repair") Repair repair){
		repair.setRepairState(repair.getTypeId());
		pmsService.modifyRepair(repair);
		System.out.println("modify Repair :"+ repair.getRepairId());
	}
  
  
  @RequestMapping(value="/manager/deleteRepair")
	 public void deleteRepair(@RequestBody Repair repair, HttpServletResponse response){  	    	   	 
	   int repairId = repair.getRepairId();
 	
 	
		pmsService.removeRepair(repairId);
		
		
		System.out.println("delete Repair :"+ repairId);	
		
	}
  
  @RequestMapping(value="/manager/loadEditRepair")
  @ResponseBody
	 public  Object loadEditRepair(@RequestParam(value="repairId",required=false) String repairId){
  		int repairId1 = Integer.valueOf(repairId);
  		Repair repair = new Repair();
  		repair = pmsService.findRepair(repairId1);
		System.out.println("load Repair :"+ repairId);
		return repair;
	}
  
  @RequestMapping(value="repair")
	public String repair(Model model) {
		return "user/repair";
	}
	
	@RequestMapping(value="user/repair-list")
	public void selectAdvice(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User user = (User) session.getAttribute("user");
		String pageNoStr = request.getParameter("pageNo");
		String rowMaxStr = request.getParameter("rowMax");
		String repairState = request.getParameter("repairState");
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		System.out.println(beginDate);
		System.out.println(endDate);
		int pageNo = Integer.valueOf(pageNoStr);
		int rowMax = Integer.valueOf(rowMaxStr);
		int reState = Integer.valueOf(repairState);
		Repair repair =new Repair();
		repair.setUserId(user.getUserId());
		repair.setRepairState(reState);
		
		PageVO<Repair>  page = pmsService.listRepair(repair, pageNo, rowMax);
		
		response.reset();
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(JSON.toJSONString(page));
		response.flushBuffer();
	}
	
	 @RequestMapping(value="/user/addRepair")
	 public void addRepair(HttpServletRequest request, HttpServletResponse response, HttpSession session, 
			 @ModelAttribute("repair") Repair repair) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		String buildingNum = request.getParameter("buildingNum");
		String roomNum = request.getParameter("roomNum");
		Date date = (Date) new Timestamp(System.currentTimeMillis());
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		int bdNum = Integer.valueOf(buildingNum);
		int rmNum = Integer.valueOf(roomNum);

		repair.setUserId(userId);
		repair.setRepairDate(date);
		repair.setBuildingNum(bdNum);
		repair.setRoomNum(rmNum);
		repair.setRepairState(0);
		pmsService.addRepair(repair);
		
	}
	 
	 @RequestMapping(value="/user/loadRepair")
   @ResponseBody
	 public Object loadAdvice(@RequestParam(value="repairId",required=false) String repairId){
		 int id = Integer.valueOf(repairId);
  	 Repair repair = new Repair();
		 repair = pmsService.selectRepairByIdUser(id);
		 return repair;
	}
}
