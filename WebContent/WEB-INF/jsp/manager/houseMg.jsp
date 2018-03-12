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
<title>住房管理</title>
</head>
<body>
	<%@ include file="../common/navMg.jsp"%>
		<div class="container" style="width: 1500px">

							<div class="col-md-12 column">

						<div class="col-md-3 column">
							
						</div>

									<!-- 根据关键字查询 -->
			<form id="searchForm">
				<div class="input-group" style="float:right;width:200px;">
					  <input type="hidden" name="pageNo" value="1" class="form-control">
					  <input type="hidden" name="rowMax" value="10" class="form-control">
					  <input type="hidden" name="roleType" value="3" class="form-control" id="roleType">
			          <input type="text" name="key"  class="form-control" placeholder="关键字用户Id">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
					
				</div>

		  	
		  	<!-- 住房列表 -->
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 住房管理</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered" id="#table">
						<thead>
							<tr>
								<th>楼栋编号</th>
								<th>住房编号</th>
								<th>身份证号码</th>
								<th>户型</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="_buildingNum"></td>
								<td class="_roomNum"></td>
								<td class="_userId"></td>
								<td class="_houseType"></td>
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

<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">住房信息</h4>
      </div>
      <div class="modal-body">
        <form:form  modelAttribute="house" id="editForm">
          <div class="form-group">
            <label for="recipient-name" class="control-label">楼栋编号:</label>
            <form:input type="text" class="form-control" id="buildingNum" name="buildingNum" path="buildingNum"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">住房编号:</label>
            <form:input type="text" class="form-control" id="roomNum" name="roomNum" path="roomNum"/>
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">业主ID:</label>
            <form:input type="text" class="form-control" id="userId" name="userId" path="userId"/>
          </div>
           <div class="form-group">
            <label for="message-text" class="control-label">户型:</label>
            <form:input type="text" class="form-control" id="houseType" name="houseType" path="houseType"/>
          </div>
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
			"manager/house-list",
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
	
	//添加住房
	editForm.submit(function(){
		if($("#editType").val() == 0){
		alert("添加成功!");
		$("#close").click();
		$.post(
			"manager/addHouse",
			editForm.serializeArray(),
			function(data){
				
			},"json");
		searchForm.trigger("submit");
		return false;
		}
		else{
			alert("修改成功!");
			 $("#close").click();
			$.post(
				"manager/updateHouse",
				editForm.serializeArray(),
				function(data){
					
				},"json");
			searchForm.submit();
		}
	}).submit; 
	
	$("#edit").click(function(){
		$('#editForm')[0].reset();
		$("#buildingNum").removeAttr("readonly");
		$("#roomNum").removeAttr("readonly");
		$("#editType").val(0);
	});
	
	datagrid.on("click","button",function(){
		var buildingNum = $(this).parent().prev().prev().prev().prev().html();
		var roomNum = $(this).parent().prev().prev().prev().html();
		if($(this).attr("id") == "delete"){
		$.ajax("${pageContext.request.contextPath}/manager/deleteHouse",// 发送请求的URL字符串。
				{
				dataType : "json", // 预期服务器返回的数据类型。
	   			type : "post", //  请求方式 POST或GET
			   contentType:"application/json", //  发送信息至服务器时的内容编码类型
			   // 发送到服务器的数据。
			   data:JSON.stringify({buildingNum:buildingNum,roomNum:roomNum}),
			   async:  true , // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
		});

		alert("删除楼栋"+buildingNum+" 住房"+roomNum+" 成功！");
		searchForm.trigger("submit");
	}
		else{
			$.post("${pageContext.request.contextPath}/manager/loadEditHouse?buildingNum="+buildingNum+"&&roomNum="+roomNum,
					null,
					function(data){
					$("#editType").val(1);
					$("#buildingNum").val(data.buildingNum);
					$("#buildingNum").attr("readonly", "readonly");
					$("#roomNum").val(data.roomNum);
					$("#roomNum").attr("readonly", "readonly");
					$("#userId").val(data.userId);
					$("#houseType").val(data.houseType);
			
			},"json");
			$("#edit").click();
		}

		
		
		return false;  // 防止继续调用href中的请求
	});
}); 
</script>


</body>
</html>