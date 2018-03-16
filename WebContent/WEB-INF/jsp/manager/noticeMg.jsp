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
<title>通知管理</title>
</head>
<body>
	<%@ include file="../common/navMg.jsp"%>
		<div class="container" style="width: 1500px">

							<div class="col-md-12 column">

						<div class="col-md-3 column">
							<div class="btn-group">
								 <button class="btn btn-default" style="width: 80px; ">通知类型</button> 
								 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px;" >
								 <span class="caret"></span>
								 </button>
								<ul class="dropdown-menu">
									<li>
										 <a  id="allNotice">所有</a>
									</li>
									<li>
										 <a  id="news">新闻</a>
									</li>
									<li>
										 <a  id="board">公告</a>
									</li>
									<li>
										 <a id="found">失物招领</a>
									</li>
								</ul>
							</div>
							
							
						</div>


									<!-- 根据关键字查询 -->
			<form id="searchForm">
				<div class="input-group" style="float:right;width:200px;">
					  <input type="hidden" name="pageNo" value="1" class="form-control">
					  <input type="hidden" name="rowMax" value="10" class="form-control">
					  <input type="hidden" name="noticeType" value="3" class="form-control" id="noticeType">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
					
				</div>

		  	
		  	<!-- 通知列表 -->
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 通知管理</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered" id="#table">
						<thead>
							<tr>
								<th>通知编号</th>
								<th>通知类型</th>
								<th>通知标题</th>
								<th>通知内容</th>
								<th>通知发布日期</th>
								<th>操作</th>
								
							</tr>
						</thead>
						<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="_noticeId"></td>
								<td class="_noticeType"></td>
								<td class="_noticeTitle"></td>
								<td class="_noticeContent"></td>
								<td class="_noticeDate"></td>
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
		    	添加通知
		    	</button>
		  	</div>

<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">通知信息</h4>
      </div>
      <div class="modal-body">
        <form:form  modelAttribute="notice"  id="editForm">
         <div class="form-group" style="display:none">
            <label for="recipient-name" class="control-label">通知编号:</label>
            <form:input type="text" class="form-control" id="noticeId" name="noticeId" path="noticeId"/>
          </div>
        <div class="form-group">
            <label for="message-text" class="control-label">通知类型:</label>
	            <form:select  class="form-control" style="width:143px;" path="typeId">    			
	    			<form:option value="0">新闻</form:option>
	    			<form:option value="1">公告</form:option>	
	    			<form:option value="2">失物招领</form:option>						    			
				</form:select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">通知标题:</label>
            <form:input type="text" class="form-control" id="noticeTitle" name="noticeTitle" path="noticeTitle"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">通知内容:</label>
            <form:textarea style="height:400px" class="form-control" id="noticeContent" name="noticeContent" path="noticeContent"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">图片地址:</label>
            <form:input  type="text" class="form-control" id="pictureAddress" name="pictureAddress" path="pictureAddress"/>
          		<button id="choose" for="file" type="button" style="margin-left:500px" class="btn btn-primary btn-sm" >
		    	选择图片
		    	</button>         
          </div>
          <input style="display: none" type="file" id="file1" name="pic" accept="image/*" onchange="document.getElementById('pictureAddress').value=this.value">
          <div class="modal-footer">
        <button id="close" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
			"manager/notice-list",
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
						if (name == "noticeContent") {
							tr.find("._" + name).text(value.substring(0,10) + "...");
						} else if (name == "noticeDate") {						 						     
							tr.find("._" + name).text(dateToString_YMD(new Date(value))); 
						} else if (name == "noticeType") {
							if(value == 0)
								tr.find("._" + name).text("新闻");
							if(value == 1)
								tr.find("._" + name).text("公告");
							if(value == 2)
								tr.find("._" + name).text("失物招领");
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
	//切换通知类型
	$("#allNotice").click(
			function(){
				$("#noticeType").val("3");
				searchForm.trigger("submit");
			});
	
	$("#news").click(
			function(){
				$("#noticeType").val("0");
				searchForm.trigger("submit");
			});
	
	$("#board").click(
			function(){
				$("#noticeType").val("1");
				searchForm.trigger("submit");
			});
	//切换费用类型类型
	$("#found").click(
			function(){
				$("#noticeType").val("2");
				searchForm.trigger("submit");
			});
	$("#water").click(
			function(){
				$("#consumeType").val("0");
				searchForm.trigger("submit");
			});
	
	$("#electric").click(
			function(){
				$("#consumeType").val("1");
				searchForm.trigger("submit");
			});
	
	$("#property").click(
			function(){
				$("#consumeType").val("2");
				searchForm.trigger("submit");
			});
	//切换缴费状态
	$("#allConsumeState").click(
			function(){
				$("#consumeState").val("2");
				searchForm.trigger("submit");
			});
	
	$("#no").click(
			function(){
				$("#consumeState").val("0");
				searchForm.trigger("submit");
			});
	$("#yes").click(
			function(){
				$("#consumeState").val("1");
				searchForm.trigger("submit");
			});

	 editForm.submit(function(){
		 if($("#editType").val() == 0){
				alert("添加成功!");
				$("#close").click();
				$.post(
					"manager/addNotice",
					editForm.serializeArray(),
					function(data){						
					},"json");
				}else{
					alert("修改成功!");
					 $("#close").click();
					$.post(
						"manager/updateNotice",
						editForm.serializeArray(),
						function(data){
							
						},"json");
					
				}
				searchForm.submit();
		return false;
	});  
	 
	 $("#edit").click(function(){
			$('#editForm')[0].reset();
			$("#noticeId").removeAttr("readonly");
			$("#editType").val(0);
		});
	 
	 datagrid.on("click","button",function(){
			var noticeId = $(this).parent().prev().prev().prev().prev().prev().html();
			if($(this).attr("id") == "delete"){
			$.ajax("${pageContext.request.contextPath}/manager/deleteNotice",// 发送请求的URL字符串。
					{
					dataType : "json", // 预期服务器返回的数据类型。
		   			type : "post", //  请求方式 POST或GET
				   contentType:"application/json", //  发送信息至服务器时的内容编码类型
				   // 发送到服务器的数据。
				   data:JSON.stringify({noticeId:noticeId}),
				   async:  true , // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
			});

			alert("删除通知"+noticeId+"成功！");
			
		}
			else{
				$.post("${pageContext.request.contextPath}/manager/loadEditNotice?noticeId="+noticeId,null,
						function(data){
						$("#editType").val(1);
						$("#noticeId").val(data.noticeId);
						$("#noticeId").attr("readonly", "readonly");
						$("#noticeTitle").val(data.noticeTitle);
						$("#noticeContent").val(data.noticeContent);
						$("#pictureAddress").val(data.pictureAddress);
						$("#typeId").val(data.noticeType);
				
				},"json");
				$("#edit").click();
			}
			searchForm.trigger("submit");
			
			
			return false;  // 防止继续调用href中的请求
		});
	 $("#choose").click(function(){
		 $("#file1").click();
	 });
}); 
</script>


</body>
</html>