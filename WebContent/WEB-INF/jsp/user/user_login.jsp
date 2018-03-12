<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html>
	<head>
		<title>梅岭物业管理系统</title>
		<meta charset="utf-8" />
		
		<!--bootstrap-->
		<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
		<link rel="stylesheet" href="bootstrap/mine.css">
		<script src="bootstrap/jquery.min.js"></script>
		<script src="bootstrap/bootstrap.min.js"></script>
		
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/mine.css">
	
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">
Date.prototype.Format = function (fmt) {  
    var o = {  
        "M+": this.getMonth() + 1, //月份  
        "d+": this.getDate(), //日  
        "h+": this.getHours(), //小时  
        "m+": this.getMinutes(), //分  
        "s+": this.getSeconds(), //秒  
        "q+": Math.floor((this.getMonth() + 3) / 3),  
        "S": this.getMilliseconds() //毫秒  
    };  
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
    for (var k in o)  
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
    return fmt;  
};
$(document).ready(function(){
	testResponseBody();
	getNotice();
	getMissing();
});

//设置失物招领
function getMissing(){
	$.post("${pageContext.request.contextPath}/getMissing",null,
			function(data){ 
		var date1=  new Date();
		date1.setTime(data.noticeDate); 
		var timeStr1 = date1.Format("yyyy-MM-dd"); 
		$("#miss_title").html(data.noticeTitle);
        $("#miss_pic").attr("src",data.pictureAddress);
		$("#miss_content").html(data.noticeContent);
		$("#miss_date").html(timeStr1);
	},"json");
	
}


//设置公告内容
function getNotice(){
	
	$.post("${pageContext.request.contextPath}/getNotice",null,
			function(data){ 
		var date1=  new Date();
		var date2= new Date();
		date1.setTime(data[0].noticeDate); 
		date2.setTime(data[1].noticeDate); 
		var timeStr1 = date1.Format("yyyy-MM-dd"); 
		var timeStr2 = date2.Format("yyyy-MM-dd");  
		$("#notice_title1").html(data[0].noticeTitle);
		$("#notice_title2").html(data[1].noticeTitle);
		
		$("#notice_content1").html(data[0].noticeContent);
		$("#notice_content2").html(data[1].noticeContent);
		
		$("#notice_date1").html(timeStr1);
		$("#notice_date2").html(timeStr2);
		
	},"json");
} 

//设置轮播内容
function testResponseBody(){
	
	
	$.post("${pageContext.request.contextPath}/testResponseBody",null,
			function(data){ 
		 $("#circle_news1").html(data[0].noticeTitle+"<br/>");
		 $("#circle_news2").html(data[1].noticeTitle+"<br/>"+"<br/>");
		 $("#circle_news3").html(data[2].noticeTitle+"<br/>"+"<br/>");
		 $("#image1").attr("src",data[0].pictureAddress);
		 $("#image2").attr("src",data[1].pictureAddress);
		 $("#image3").attr("src",data[2].pictureAddress);
		 $("#href1").attr("href","news_item?id="+data[0].noticeTitle);
		 $("#href2").attr("href","news_item?id="+data[1].noticeTitle);
		 $("#href3").attr("href","news_item?id="+data[2].noticeTitle);
	/* 	$.each(data,function(){
	/* 		var tr  = $("<tr align='center'/>"); */
			
		
			
         /*    $("<td/>").html(this.id).appendTo(tr);
            $("<td/>").html(this.name).appendTo(tr);
            $("<td/>").html(this.author).appendTo(tr);
            $("#booktable").append(tr); */
     /*    }) */ 
	},"json");
}
</script>
	</head>
	<!-- <body style="background-color:white;"> -->
	<body style="width: 100%;height: 100%;over-flow:hidden;background:url(images/bg.jpg) repeat;">
		<%@ include file="../common/nav.jsp"%>
					
<div class="container" style="width:80%">
	<div class="row clearfix">
		<div class="col-md-3 column" >
			<h3>
		
				梅岭物业管理系统.
			</h3><img alt="140x140" src="images/g.png" />
			<div class="row" style="height: 50px;"></div>
			<div class="row thumbnail" style="border:1px solid #696969; padding: 10px;">
				<!--<ul>
				<li>
					明天停水，请大家提前做好准备
				</li>
				<li>
					下周起水费调整为0.8元一度
				</li>
				
			</ul>-->
			<p>小区公告</p>
				<div class="thumbnail" style="border:groove;">
						<div class="caption">
							<h3 align="center">
								<span id="notice_title1" style="font-weight:bold;"></span>
							</h3>
							<p>
							     &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="notice_content1"></span>
							</p>
							<br/>
	                     <p style="text-align:right;margin:5px;"><span id="notice_date1"></span></p>
						</div>
					</div>
		
			<br/>
			        <div class="thumbnail" style="border:groove;">
						<div class="caption">
							<h3 align="center">
								<span id="notice_title2" style="font-weight:bold;"></span>
							</h3>
							<p>
							     &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="notice_content2"></span>
							</p>
							<br/>
	                     <p style="text-align:right;margin:5px;"><span id="notice_date2"></span></p>
						</div>
					</div>
		
			
			</div>
			<div class="row" style="height: 50px;"></div>			
			<div class="row thumbnail" style="border:1px solid #696969; padding: 10px;">
			      <p>失物招领</p>
				  <div class="thumbnail" style="border:groove;padding:10px;" >
				  	<img id="miss_pic" alt="300x200" src="" />
						<div class="caption">
							<h3 align="center">
								<span id="miss_title" style="font-weight:bold;"></span>
							</h3>
							<p>
							     &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="miss_content"></span>
							</p>
							<br/>
	                     <p style="text-align:right;margin:5px;"><span id="miss_date"></span></p>
						</div>
					</div>
		
					
				
				
			</div>
		</div>
		<div class="col-md-8  column">
			<div class="carousel slide" id="carousel-333416" data-ride="carousel" style="margin-left: 153px;">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-333416">
					</li>
					<li data-slide-to="1" data-target="#carousel-333416">
					</li>
					<li data-slide-to="2" data-target="#carousel-333416">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item active">
						<a id="href1" href="" target="_blank"><img id="image1" alt="" src="images/pic03.jpg" /></a>
						<div  class="carousel-caption">
							<h4><span id="circle_news1"></span><br></h4>
							
						</div>
					</div>
					<div  class="item">
						<a id="href2" href="" target="_blank"><img id="image2" alt="" src="images/pic02.jpg" /></a>
						<div id="circle_news2" class="carousel-caption">
							<h4><span id="circle_news2"></span><br></h4>
						
						</div>
					</div>
					<div class="item">
						<a id="href3" href="#" target="_blank"><img id="image3" alt="" src="images/pic01.jpg" /></a>
						<div id="circle_news3" class="carousel-caption">
								<h4><span id="circle_news2"></span><br></h4>
						</div>
					</div>
				</div> <a class="left carousel-control" href="#carousel-333416" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-333416" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
			<div class="row" style="height: 50px;"></div>
			<div class="row" style="margin-left: 153px;">
				<div class="thumbnail" style="border:1px solid #696969; padding: 10px;width:820;text-align:left;"   >
							<h1>
								小区头条
							</h1>
							<br/>
							<form id="searchForm" style="display:none;">
				<div class="input-group" style="float:left;width:200px;">
					  <input type="hidden" name="pageNo" value="0" class="form-control">
					  <input type="hidden" name="rowMax" value="5" class="form-control">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn" >
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
		 
		    <table id="" class="table table-bordered">
						<tbody id="template" style="display:none;">
							<tr>

								<td ><a class="_noticeTitle" href="#"></a></td>							
							    <td class="_noticeDate"></td>
							
							</tr>
						</tbody>
						<tbody id="datagrid">
							
						</tbody>
					</table>
		
						
                       
           	<div >
			<nav>
			   
		      <ul class="pagination" id="pager">
		        <li><a href="#" data-page="1">首页</a></li>
		        <li class="active"><a href="#" data-page="1">1</a></li>
		        <li><a href="#" data-page="2">2</a></li>
		        <li><a href="#" data-page="3">3</a></li>
		        <li><a href="#" data-page="10">末页</a></li>
		     </ul>
		   </nav>
		</div>
							<br/>
						
					    </div>
					
				
			</div>
		</div>
	</div>
	  <footer class="copyright">  
          Copyright &nbsp; 2017 CSU rights reserved.  
        </footer>
</div>
				
	<script type="text/javascript">
	Date.prototype.Format = function (fmt) {  
	    var o = {  
	        "M+": this.getMonth() + 1, //月份  
	        "d+": this.getDate(), //日  
	        "h+": this.getHours(), //小时  
	        "m+": this.getMinutes(), //分  
	        "s+": this.getSeconds(), //秒  
	        "q+": Math.floor((this.getMonth() + 3) / 3),  /* 季度 */
	        "S": this.getMilliseconds() //毫秒  
	    };  
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
	    for (var k in o)  
	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));  
	    return fmt;  
	};
$(function(){
	var searchForm = $("#searchForm");
	var template = $("#template");
	var template = template.children();
	var datagrid = $("#datagrid");
	var pager = $("#pager");
	var d=  new Date();
	searchForm.submit(function(){
		$.post(
			"news",
			searchForm.serializeArray(),
			function(data){
				loadPager(data);
				// 清空需要显示数据的表格，再重新加载数据
				datagrid.empty();
				
				$.each(data.rows, function(index, row) {
					// 复制行节点
					var tr = template.clone();
					// 追加行节点
		           datagrid.append(tr);
					// 遍历对象的每个属性 
					row.rowNumber = index+1;
					$.each(row, function (name, value) {
				
					if (name == "noticeTitle") {
					 	tr.find("._" + name).text(value); 
					 	tr.find("._" + name).attr("href","news_item?id="+value);
					 	tr.find("._" + name).attr("target","_blank");
													
						} 
						else if (name == "noticeDate") {
							d.setTime(value);  
							var timeStr = d.Format("yyyy-MM-dd");  						     
							tr.find("._" + name).text(timeStr);
						} 
					});
				});
			},"json");
		return false;
	}).submit();
	
	var loadPager = function (data) {
		pager.find("li:not(:first):not(:last)").remove();
		var lastLi = pager.find("li:last");
		lastLi.data("page", data.pageMax);
		
		
		
		var beginIndex = data.current - 5;
		if (beginIndex < 1) {
			beginIndex = 1;
		}
		
		var endIndex = beginIndex + 9;
		if (endIndex > data.pageMax) {
			endIndex = data.pageMax;
		}
		
		if ((endIndex - beginIndex) < (9) && endIndex > 10) {
			beginIndex = endIndex - 9
		}
		
		if (data.pageMax <= 10) {
			beginIndex = 1;
			endIndex = data.pageMax;
		}
		
		var prePage = data.current - 1;
		if(prePage < 1){
			prePage = 1;
		}
		
		
		
		//添加上页标签
		var preLi = $('<li><a href="#" data-page ="'+ prePage + '">上一页</a>');
		lastLi.before(preLi);
		
		//添加每页标签
		for (var i = beginIndex; i <= endIndex; i++ ) {
			var li = $('<li><a href="#" data-page="'+ i +'">'+ i +'</a></li>');
			if (i == data.current) {
				li.addClass("active");
			}
			lastLi.before(li);
		}
		
		//添加下一页标签
		var nextPage = data.current + 1;
		if(nextPage > data.pageMax){
			nextPage = data.pageMax;
		}
		var nextLi = $('<li><a href="#" data-page ="'+ nextPage + '">下一页</a>');
		lastLi.before(nextLi);
	
        
		
	}
	
	
	// 给pager里的每一个a标签绑定click事件
	pager.on("click","a",function(){
		var page = $(this).data("page");
		searchForm.find("[name=pageNo]").val(page);
		searchForm.trigger("submit");
		return false;  // 防止继续调用href中的请求
	});
	
	
	
	
});


</script>
		
	</body>
</html>