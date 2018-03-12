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
<title>信息管理</title>
</head>
<body>
	<%@ include file="../common/navMg.jsp"%>
		<div class="container" style="width: 1500px">

							<div class="col-md-12 column">

						<div class="col-md-3 column">
							<div class="btn-group">
								 <button class="btn btn-default" style="width: 80px; ">用户类型</button> 
								 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px;" >
								 <span class="caret"></span>
								 </button>
								<ul class="dropdown-menu">
									<li>
										 <a  id="all">全部</a>
									</li>
									<li>
										 <a  id="manager">管理员</a>
									</li>
									<li>
										 <a id="user">业主</a>
									</li>
								</ul>
							</div>
						</div>


									<!-- 根据关键字查询 -->
			<form id="searchForm">
				<div class="input-group" style="float:right;width:200px;">
					  <input type="hidden" name="pageNo" value="1" class="form-control">
					  <input type="hidden" name="rowMax" value="10" class="form-control">
					  <input type="hidden" name="roleType" value="3" class="form-control" id="roleType">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
					
				</div>

		  	
		  	<!-- 用户列表 -->
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 用户管理</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered" id="#table">
						<thead>
							<tr>
								<th>身份证号码</th>
								<th>密码</th>
								<th>姓名</th>
								<th>性别</th>
								<th>联系方式</th>
								<th>用户类型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="_userId"></td>
								<td class="_password"></td>
								<td class="_userName"></td>
								<td class="_sex"></td>
								<td class="_phone"></td>
								<td class="_roleType"></td>
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
			<div class="bs-example" data-example-id="btn-variants">
			<input type="hidden" id="editType" value="1" class="form-control">
		    	<button id="edit" type="button" style="float:right;" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#roleAddModal">
		    	添加
		    	</button>
		  	</div>
<!-- 添加模态框 -->
<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">用户信息</h4>
      </div>
      <div class="modal-body">
        <form:form  modelAttribute="user" id="editForm">
          <div class="form-group">
            <label for="recipient-name" class="control-label">身份证号码:</label>
            <form:input type="text" class="form-control" id="userId" name="userId" path="userId"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">密码:</label>
            <form:input type="password" class="form-control" id="password" name="password" path="password"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">姓名:</label>
            <form:input type="text" class="form-control" id="userName" name="userName" path="userName"/>
          </div>
           <div class="form-group">
            <label for="message-text" class="control-label">性别:</label>
            <form:select class="form-control" style="width:143px;" path="sexId">
	    			<form:option value="0">男</form:option>	    			
	    			<form:option value="1">女</form:option>						    			
				</form:select>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">联系方式:</label>
            <form:input type="text" class="form-control" id="phone" name="phone" path="phone"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">用户类型:</label>
	            <form:select  class="form-control" style="width:143px;" path="typeId">  
	            <form:option value="2">业主</form:option>	  			
	    			<form:option value="0">管理员</form:option>					    			
				</form:select>
          </div>
          <div class="modal-footer">
        <button type="button" id="close" class="btn btn-default" data-dismiss="modal">关闭</button>
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
			"user/user-list",
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
						if (name == "roleType") {
							if(value == 2)
							tr.find("._" + name).text("业主");
							else
							tr.find("._" + name).text("管理员");
						} else if (name == "gmtCreate") {
							tr.find("._" + name).text(dateToString(new Date(value)));
						} else {
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
	//切换用户类型
	$("#user").click(
			function(){
				$("#roleType").val("2");
				searchForm.trigger("submit");
			});
	
	$("#manager").click(
			function(){
				$("#roleType").val("0");
				searchForm.trigger("submit");
			});
	
	$("#all").click(
			function(){
				$("#roleType").val("3");
				searchForm.trigger("submit");
			});
	//添加和编辑用户
	editForm.submit(function(){
		if($("#editType").val() == 0){
		alert("添加成功!");
		 $("#close").click();
		$.post(
			"user/addUser",
			editForm.serializeArray(),
			function(data){
				
			},"json");
		searchForm.submit(); 
		}
		else{
			alert("修改成功!");
			 $("#close").click();
			$.post(
				"user/updateUser",
				editForm.serializeArray(),
				function(data){
					
				},"json");
			searchForm.submit();
		}
		return false;
	}).submit; 
	
	$("#edit").click(function(){
		$('#editForm')[0].reset();
		$("#userId").removeAttr("readonly");
		$("#editType").val(0);
	});
	
	datagrid.on("click","button",function(){
		var userId = $(this).parent().prev().prev().prev().prev().prev().prev().html();
		
		if($(this).attr("id") == "delete"){
		$.ajax("${pageContext.request.contextPath}/user/deleteUser",// 发送请求的URL字符串。
				{
				dataType : "json", // 预期服务器返回的数据类型。
	   			type : "post", //  请求方式 POST或GET
			   contentType:"application/json", //  发送信息至服务器时的内容编码类型
			   // 发送到服务器的数据。
			   data:JSON.stringify({userId:userId}),
			   async:  true , // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
		});

		alert("删除用户"+userId+"成功！");
		searchForm.trigger("submit");
	}
		else{
			$.post("${pageContext.request.contextPath}/user/loadEditUser?name="+userId,null,
					function(data){
				$("#editType").val(1);
					$("#userId").val(data.userId);
					$("#userId").attr("readonly", "readonly");
					if(data.sex == "男")
						$("#sexId").val(0);
					else
						$("#sexId").val(1);
					if(data.roleType == 0)
						$("#typeId").val(0);
					else
						$("#typeId").val(2);
					$("#phone").val(data.phone);
					$("#userName").val(data.userName);
					$("#password").val(data.password);
			
			},"json");
			$("#edit").click();
		}

		
		
		return false;  // 防止继续调用href中的请求
	});
}); 
</script>


</body>
</html>