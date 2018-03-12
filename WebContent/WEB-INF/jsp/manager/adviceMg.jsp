<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getContextPath()%>/">
<meta charset="utf-8" />
<link rel="stylesheet"  href="css/bootstrap-theme.min.css"/>
<link rel="stylesheet"  href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/jquery.min.js" ></script>
<script type="text/javascript" src="js/bootstrap.min.js" ></script>
<script type="text/javascript" src="js/common.js" ></script>
<title>投诉管理</title>
</head>
<body>
	<%@ include file="../common/navMg.jsp"%>
		<div class="container" style="width: 1500px">

							<div class="col-md-12 column">

						<div class="col-md-3 column">
							<div class="btn-group">
								 <button class="btn btn-default" style="width: 80px; ">投诉状态</button> 
								 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px;" >
								 <span class="caret"></span>
								 </button>
								<ul class="dropdown-menu">
									<li>
										 <a  id="allAdvise">所有</a>
									</li>
									<li>
										 <a  id="undone">未处理</a>
									</li>
									<li>
										 <a  id="done">已处理</a>
									</li>
									
								</ul>
							</div>
							
							
						</div>


									<!-- 根据关键字查询 -->
			<form id="searchForm">
				<div class="input-group" style="float:right;width:200px;">
					  <input type="hidden" name="pageNo" value="1" class="form-control">
					  <input type="hidden" name="rowMax" value="10" class="form-control">
					  <input type="hidden" name="adviceState" value="2" class="form-control" id="adviceState">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
					
				</div>

		  	
		  	<!-- 报修列表 -->
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 建议管理</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered" id="#table">
						<thead>
							<tr>
								<th>投诉编号</th>
								<th>投诉人</th>
								<th>投诉内容</th>
								<th>投诉日期</th>
								<th>投诉状态</th>
								<th>操作</th>
								
							</tr>
						</thead>
						<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="_adviceId"></td>
								<td class="_userId"></td>
								<td class="_adviceContent"></td>
								<td class="_adviceDate"></td>
								<td class="_adviceState"></td>
								<td>								
									<button  type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#roleAddModal">编辑</button>
									<button id="delete" type="button" class="btn btn-danger btn-sm">删除</button>
								</td>
							</tr>
						</tbody>
						<tbody id="datagrid">
							
						</tbody>
					</table>
		 <!-- 添加按钮 -->
			<div class="bs-example" data-example-id="btn-variants" style="display:none">
		    	<button id="edit" type="button" style="float:right;" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#roleAddModal">
		    	报修反馈
		    	</button>
		  	</div>

<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">投诉信息</h4>
      </div>
      <div class="modal-body">
        <form:form  modelAttribute="advice" id="editForm">
        <div class="form-group">
            <label for="recipient-name" class="control-label">投诉编号:</label>
            <form:input type="text" class="form-control" id="adviceId" name="adviceId" path="adviceId"/>
          </div>
        <div class="form-group">
            <label for="message-text" class="control-label">反馈状态:</label>
	            <form:select  class="form-control" style="width:143px;" path="typeId">    			
	    			<form:option value="0">未处理</form:option>
	    			<form:option value="1">已处理</form:option>							    			
				</form:select>
          </div>
        <div class="form-group">
            <label for="recipient-name" class="control-label">投诉内容:</label>
            <form:textarea readonly="readonly" style="height:200px" class="form-control" id="adviceContent" name="adviceContent" path="adviceContent"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">反馈内容:</label>
            <form:textarea  style="height:300px" class="form-control" id="adviceResponse" name="adviceResponse" path="adviceResponse"/>
          </div>
          
          <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary" id="addBtn">提交</button>
      </div>
        </form:form>
      </div>
		<div class="alert alert-warning" style="display:none" id="alertAdd">
			<a href="#" class="close" data-dismiss="alert">
				&times;
			</a>
			<strong>提示！</strong><p id="#alertContent">添加成功</p>
		</div>
		
      
    </div>
  </div>
</div>


				</div>
			</div>
			
		</div>
		
		<div style="text-align: center">
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
		


<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var template = $("#template");
	var template = template.children();
	var datagrid = $("#datagrid");
	var pager = $("#pager");
	var alertContent = $("#alertContent");
	var editForm = $("#editForm");
	searchForm.submit(function(){
		$.post(
			"manager/advice-list",
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
					row.rowNumber = index + 1;
					$.each(row, function (name, value) {
						if (name == "adviceContent") {
							tr.find("._" + name).text(value.substring(0,10) + "...");
						} else if (name == "adviceDate") {						 						     
							tr.find("._" + name).text(dateToString_YMD(new Date(value))); 
						} else if (name == "adviceState") {
							if(value == 0)
								tr.find("._" + name).text("未处理");
							if(value == 1)
								tr.find("._" + name).text("已处理");
						}else {
							tr.find("._" + name).text(value);
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
		
		//添加上一页标签
		var prePage = data.current - 1;
		if(prePage < 1){
			prePage = 1;
		}
		var preLi = $('<li><a href="#" data-page ="'+ prePage + '">上一页</a></li>');
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
		var nextLi = $('<li><a href="#" data-page ="'+ nextPage + '">下一页</a></li>');
		lastLi.before(nextLi);
	}
	
	// 给pager里的每一个a标签绑定click事件
	pager.on("click","a",function(){
		var page = $(this).data("page");
		searchForm.find("[name=pageNo]").val(page);
		searchForm.trigger("submit");
		return false;  // 防止继续调用href中的请求
	});
	//切换报修状态
	$("#allAdvice").click(
			function(){
				$("#adviceState").val("3");
				searchForm.trigger("submit");
			});
	
	$("#undone").click(
			function(){
				$("#adviceState").val("0");
				searchForm.trigger("submit");
			});
	
	$("#done").click(
			function(){
				$("#adviceState").val("1");
				searchForm.trigger("submit");
			});
	

	 editForm.submit(function(){
		 alert("修改成功!");
			$("#edit").click();
			$.post(
				"manager/updateAdvice",
				editForm.serializeArray(),
				function(data){
					
				},"json");
			searchForm.sumit();
			return false;
	});  
	 
	 datagrid.on("click","button",function(){
			var adviceId = $(this).parent().prev().prev().prev().prev().prev().html();
			if($(this).attr("id") == "delete"){
			$.ajax("${pageContext.request.contextPath}/manager/deleteAdvice",// 发送请求的URL字符串。
					{
					dataType : "json", // 预期服务器返回的数据类型。
		   			type : "post", //  请求方式 POST或GET
				   contentType:"application/json", //  发送信息至服务器时的内容编码类型
				   // 发送到服务器的数据。
				   data:JSON.stringify({adviceId:adviceId}),
				   async:  true , // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
			});

			alert("删除投诉"+adviceId+"成功！");
			
		}
			else{
				$.post("${pageContext.request.contextPath}/manager/loadEditAdvice?adviceId="+adviceId,null,
						function(data){
						$("#typeId").val(data.adviceState);
						$("#adviceContent").val(data.adviceContent);
						$("#adviceResponse").val(data.adviceResponse);
						$("#adviceContent").attr("readonly", "readonly");
						$("#adviceId").val(data.adviceId);
						$("#adviceId").attr("readonly", "readonly");
				},"json");
				$("#edit").click();
			
			}
			searchForm.trigger("submit");
			
			return false;  // 防止继续调用href中的请求
		});

}); 
</script>


</body>
</html>