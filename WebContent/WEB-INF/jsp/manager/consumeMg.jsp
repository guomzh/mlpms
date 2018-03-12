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
		    <link rel="stylesheet" href="css/bootstrapDatepickr-1.0.0.min.css">
        <script  src="js/bootstrapDatepickr-1.0.0.min.js"></script>
<title>缴费管理</title>
</head>
<body>
	<%@ include file="../common/navMg.jsp"%>
		<div class="container" style="width: 1500px">

							<div class="col-md-12 column">

						<div class="col-md-3 column">
							<div class="btn-group">
								 <button class="btn btn-default" style="width: 80px; ">费用类型</button> 
								 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px;" >
								 <span class="caret"></span>
								 </button>
								<ul class="dropdown-menu">
									<li>
										 <a  id="allConsumeType">所有</a>
									</li>
									<li>
										 <a  id="water">水费</a>
									</li>
									<li>
										 <a  id="electric">电费</a>
									</li>
									<li>
										 <a id="property">物业费</a>
									</li>
								</ul>
							</div>
							
							<div class="btn-group">
								 <button class="btn btn-default" style="width: 80px; ">缴费状态</button> 
								 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px;" >
								 <span class="caret"></span>
								 </button>
								<ul class="dropdown-menu">
									<li>
										 <a  id="allConsumeState">所有</a>
									</li>
									<li>
										 <a  id="no">未支付</a>
									</li>
									<li>
										 <a id="yes">已支付</a>
									</li>
								</ul>
							</div>
							
						</div>


									<!-- 根据关键字查询 -->
			<form id="searchForm">
				<div class="input-group" style="float:right;width:200px;">
					  <input type="hidden" name="pageNo" value="1" class="form-control">
					  <input type="hidden" name="rowMax" value="10" class="form-control">
					  <input type="hidden" name="consumeType" value="3" class="form-control" id="consumeType">
					  <input type="hidden" name="consumeState" value="2" class="form-control" id="consumeState">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
			    </div>
		    </form>
					
				</div>

		  	
		  	<!-- 账单列表 -->
			<div class="panel panel-info" style="margin-top: 65px;">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 缴费管理</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered" id="#table">
						<thead>
							<tr>
								<th>费用类型</th>
								<th>楼栋编号</th>
								<th>住房编号</th>
								<th>业主身份证号码</th>
								<th>计费日期</th>
								<th>单价</th>
								<th>用量</th>
								<th>金额</th>
								<th>缴费状态</th>
								
							</tr>
						</thead>
						<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="_consumeType"></td>
								<td class="_buildingNum"></td>
								<td class="_roomNum"></td>
								<td class="_userId"></td>
								<td class="_consumeDate"></td>
								<td class="_unitPrice"></td>
								<td class="_count"></td>
								<td class="_price"></td>
								<td class="_consumeState"></td>
								
							</tr>
						</tbody>
						<tbody id="datagrid">
							
						</tbody>
					</table>
							    <!-- 添加按钮 -->
			<div class="bs-example" data-example-id="btn-variants">
		    	<button id="edit" type="button" style="float:right;" class="btn btn-primary btn-sm"  data-toggle="modal" data-target="#roleAddModal">
		    	添加账单
		    	</button>
		  	</div>

<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">缴费信息</h4>
      </div>
      <div class="modal-body">
        <form:form  modelAttribute="consume" id="editForm">
        <div class="form-group">
            <label for="message-text" class="control-label">费用类型:</label>
	            <form:select  class="form-control" style="width:143px;" path="typeId">    			
	    			<form:option value="0">水费</form:option>
	    			<form:option value="1">电费</form:option>	
	    			<form:option value="2">物业费</form:option>						    			
				</form:select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">楼栋编号:</label>
            <form:input type="text" class="form-control" id="buildingNum" name="buildingNum" path="buildingNum"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">住房编号:</label>
            <form:input type="text" class="form-control" id="roomNum" name="roomNum" path="roomNum"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">身份证号码:</label>
            <form:input type="text" class="form-control" id="userId" name="userId" path="userId"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">计费日期:</label>
            <form:input type="text" class="form-control" id="date" name="date" path="date"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">单价:</label>
            <form:input type="text" class="form-control" id="unitPrice" name="unitPrice" path="unitPrice"/>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="control-label">用量:</label>
            <form:input type="text" class="form-control" id="count" name="count" path="count"/>
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
			"manager/consume-list",
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
						if (name == "consumeType") {
							 if(value == 0)
								tr.find("._" + name).text("水费");
							if(value == 1)
								tr.find("._" + name).text("电费");
							if(value == 2)
								tr.find("._" + name).text("物业费"); 
						} else if (name == "consumeDate") {						 						     
							tr.find("._" + name).text(dateToString_YMD(new Date(value))); 
						} else if (name == "consumeState") {
							 if(value == 0)
								tr.find("._" + name).text("未支付"); 
							if(value == 1)
								tr.find("._" + name).text("已支付"); 
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
	
	//切换费用类型类型
	$("#allConsumeType").click(
			function(){
				$("#consumeType").val("3");
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
		alert("添加成功!");
		$.post(
			"manager/addConsume",
			editForm.serializeArray(),
			function(data){
				alert("添加成功!");
			},"json");
		$("#close").click();
		return false;
	});  
	
	 $("#edit").click(function(){
			$('#editForm')[0].reset();
		});
	 $("#date").bootstrapDatepickr();
	
	
}); 
</script>


</body>
</html>