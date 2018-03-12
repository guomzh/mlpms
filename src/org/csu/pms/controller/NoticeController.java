package org.csu.pms.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.csu.pms.domain.Notice;
import org.csu.pms.domain.PageVO;

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
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;


@Controller
public class NoticeController {
	private static final long serialVersionUID = 1L;
	
	   @Autowired
	   @Qualifier("pmsService")
	private PmsService pmsService;
   
	   @RequestMapping(value= {"/noticeMg"})
		  public String noticeMg(@ModelAttribute("notice") Notice notice) {
	 	
			return "manager/noticeMg";
		}
	   
	   @RequestMapping(value="/news")
	   public void String (HttpServletRequest request, HttpServletResponse response,@RequestParam("pageNo")String pageNoStr,
			   @RequestParam("rowMax")String rowMaxStr)throws ServletException, IOException  {
		   request.setCharacterEncoding("UTF-8");
			
	
			int pageNo = Integer.valueOf(pageNoStr);
			int rowMax = Integer.valueOf(rowMaxStr);
			
			PageVO<Notice>  page = pmsService.listNotice( pageNo, rowMax);
			
			response.reset();
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().print(JSON.toJSONString(page));
			response.flushBuffer();
	   }
	   @RequestMapping(value="/news_item")
	   public String newsItem(@RequestParam("id")String id,Model model) {
		   Notice notice=pmsService.selectNewsItem(id);
		   model.addAttribute("notice", notice);
		   return "user/news_item";
	   }
		
	    @RequestMapping(value="/testResponseBody")
	    // @ResponseBody会将集合数据转换json格式返回客户端
	    @ResponseBody
	    public Object getJson() {
	    	List<Notice> list = pmsService.selectTopThree();
	    	return list;
	    }
	    
	    @RequestMapping(value="/getNotice")
	    // @ResponseBody会将集合数据转换json格式返回客户端
	    @ResponseBody
	    public Object getNotice() {
	    	List<Notice> list = pmsService.getNoticeTwo();
	    	return list;
	    }
	    @RequestMapping(value="/getMissing")
	    // @ResponseBody会将集合数据转换json格式返回客户端
	    @ResponseBody
	    public Object getMissing() {
	    	Notice notice= pmsService.getMissing();
	    	return notice;
	    }
	    
	    @RequestMapping(value="/manager/notice-list")
		 public void selectNotice(
				 HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	 		request.setCharacterEncoding("UTF-8");
	 		String key = request.getParameter("key");
			String pageNoStr = request.getParameter("pageNo");
			String rowMaxStr = request.getParameter("rowMax");
			String noticeType1 = request.getParameter("noticeType");
			int pageNo = Integer.valueOf(pageNoStr);
			int rowMax = Integer.valueOf(rowMaxStr);
			int noticeType = Integer.valueOf(noticeType1);
			
			Notice notice = new Notice();
			notice.setNoticeTitle(key);
			notice.setNoticeType(noticeType);
			
			PageVO<Notice>  page = pmsService.listNotice(notice, pageNo, rowMax);

			response.reset();
			response.setContentType("text/plain;charset=UTF-8");
			response.getWriter().print(JSON.toJSONString(page));
			response.flushBuffer();
			
		}
	    
	    @RequestMapping(value="/manager/addNotice")
		 public void addNotice(@ModelAttribute("notice") Notice notice){

	    	 System.out.println("add notice :"+ notice.getNoticeTitle());
	    	 notice.setNoticeDate(new Timestamp(System.currentTimeMillis()));
	    	 notice.setNoticeType(notice.getTypeId());
	    	 notice.setChangeDate(new Timestamp(System.currentTimeMillis()));
	    	 File file = new File(notice.getPictureAddress().trim());
	    	 String fileName = file.getName();
	    	 fileName = "images/"+fileName;
	    	 notice.setPictureAddress(fileName);
	  		 pmsService.addNotice(notice);	
			
		}
	    
	    @RequestMapping(value="/manager/updateNotice")
		 public void updateNotice(@ModelAttribute("notice") Notice notice){
			pmsService.modifyNotice(notice);
			System.out.println("modify Notice :"+ notice.getNoticeId());
		}
	   
	   
	   @RequestMapping(value="/manager/deleteNotice")
		 public void deleteNotice(@RequestBody Notice notice, HttpServletResponse response){  	    	   	 
		   int noticeId = notice.getNoticeId();
	  	
	  	
			pmsService.removeNotice(noticeId);
			
			
			System.out.println("delete Notice :"+ noticeId);	
			
		}
	   
	   @RequestMapping(value="/manager/loadEditNotice")
	   @ResponseBody
		 public  Object loadEditNotice(@RequestParam(value="noticeId",required=false) String noticeId){
	   		int noticeId1 = Integer.valueOf(noticeId);
		   Notice notice = new Notice();
		   notice = pmsService.findNotice(noticeId1);
			System.out.println("load Notice :"+ noticeId1);
			return notice;
		}
}
