<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE jsp>
<html>
	<head>
		<base href="<%=request.getContextPath()%>/">
		<meta charset="utf-8" />
		<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
				<link rel="stylesheet" href="bootstrap/mine.css">
		<link rel="stylesheet" href="bootstrap/hky.css">
		<script src="bootstrap/jquery.min.js"></script>
		<script src="bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/common.js" ></script>
		<link rel="stylesheet"  href="css/bootstrap-theme.min.css"/>
		<link rel="stylesheet"  href="css/bootstrap.min.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>我的投诉</title>
		    <link rel="stylesheet" href="css/bootstrapDatepickr-1.0.0.min.css">
        <script src="js/bootstrapDatepickr-1.0.0.min.js"></script>
		
		<script>
			jQuery(document).ready(function(){
				jQuery("#button-search").click
	            (
	                function ()
	                {
	                	jQuery("#alert-1").hide();
	                	jQuery("#modal-478749").hide();
	                }
	            );
				jQuery("#button-pay").click
	            (
	                function ()
	                {
	                	jQuery("#alert-1").show();
	                	jQuery("#modal-478749").show();
	                }
	            );
				jQuery.noConflict(); 
				$("#calendar").bootstrapDatepickr();
				$("#calendar1").bootstrapDatepickr();
				
			/* 	jQuery('#mydatepicker1').dcalendarpicker({
			        format: 'yyyy-mm-dd'
			    });
				jQuery('#mydatepicker2').dcalendarpicker({
			        format: 'yyyy-mm-dd'
			    }); */
			});
		</script>
		
		<script>
			$(document).ready(function() {
				$("#calendar").bootstrapDatepickr();
				$("#calendar1").bootstrapDatepickr();
			});
		</script>
		<script>
			$(function() { 
				$("[data-toggle='popover']").popover({ 
			    html : true,  
			    title: title(),  
			    delay:{show:500, hide:1000}, 
			    content: function() { 
			     return content();  
			    }  
			  }); 
			});

			function title() { 
			  return '个人详细资料'; 
			} 
  
			//模拟动态加载内容(真实情况可能会跟后台进行ajax交互) 
			function content() { 
			  var data = $("<form style='width: 400px;height: 500px;'><ul><li><span aria-hidden='true' class='icon_globe'></span> <font>楼栋号:</font>7389223</li>" + 
			       "<li><span aria-hidden='true' class='icon_piechart'></span> <font>房间号:</font>265</li>" + 
			       "<li><span aria-hidden='true' class='icon_search_alt'></span> <font>性别:</font>男</li>" + 
			       "<li><span aria-hidden='true' class='icon_pens_alt'></span> <font>联系电话:</font>12365465615</li>" + 
			       "<input id='btn' type='button' value='登出' onclick='test()'/></form>"); 
			    
			  return data; 
			} 
			//模拟悬浮框里面的按钮点击操作 
			function test() { 
			  alert('成功退出'); 
			}
		</script>
	</head>
	<!-- <body style="background-color:white;"> -->
	<body style="width: 100%;height: 100%;over-flow:hidden;background:url(images/bg.jpg) repeat;">
		<%@ include file="../common/nav.jsp"%>
		
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-3 column">
					<img class="img-thumbnail" src="images/repair1.jpg" style="margin-top:20px"/>
					<label style="margin-top:20px;color:white;">报修流程一览</label>
					<img class="img-thumbnail" src="images/repair2.png"/>
				</div>
					
								
				<div class="col-md-9 column ">
					<h2><font size="6">报修申请：&nbsp;我们将尽最快速度为您处理！</font></h2>
					<p>我们致力于打造一个方便智能化小区，如果您生活中遇到什么问题需保修，请您在这里联系我们~~
					</p>
					<div class="tabbable thumbnail " id="tabs-815426" style="margin-top:50px">
						<ul class="nav nav-tabs">
							<li class="active">
								 <a href="#panel-90510" data-toggle="tab">我的报修</a>
							</li>
							<li>	 
								 <a href="#panel-982094" data-toggle="tab">我要报修</a>
							</li>
							<li>
								<div class="btn-group" style="margin-bottom: 15px;position: relative;right: -535px">
									<input type="button" id="choose" class="btn btn-default" style="width: 80px; height: 40px;" value="全部"/>
									<!-- <button id="choose" class="btn btn-default" style="width: 80px; height: 40px;">全部</button>  -->
									<button data-toggle="dropdown" class="btn btn-default dropdown-toggle" style="width: 40px; height: 40px;" >
										<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li>
											<a id="all">全部</a>
										</li>
										<li>
											<a id="repairBegin">审核中</a>
										</li>
										<li>
											<a id="repairHandle">处理中</a>
										</li>
										<li>
											<a id="repairOk">已处理</a>
										</li>
									</ul>
								</div>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panel-90510">
								<section>
									<form id="searchForm" style="display:none;">
										<div class="input-group" style="float:left;width:200px;">
										  <input type="hidden" name="pageNo" value="0" class="form-control">
										  <input type="hidden" name="rowMax" value="5" class="form-control">
										  <input type="hidden" name="beginDate" class="form-control">
										  <input type="hidden" name="endDate" class="form-control">
										  <input type="hidden" name="repairState" value="3" class="form-control" id="repairState">
								          <input type="text" name="key" class="form-control" placeholder="关键字">
								          <span class="input-group-btn" >
								            <button class="btn btn-default" type="submit">
								            	<i class="glyphicon glyphicon-search"></i>
								            </button>
								          </span>
								    	</div>
						    		</form>
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th style="width:100px;">
													报修编号
												</th>
												<th style="width:200px;">
													报修时间
												</th>
												<th>
													报修内容
												</th>
												<th style="width:100px;">
													报修状态
												</th>
											</tr>
										</thead>
										<tbody id="template" style="display:none;">
											<tr>
												<td class="_repairId"></td>
												<td class="_repairDate"></td>
												<td class="_repairContent"></td>
												<td ><a class="_repairState" data-toggle="modal" data-target="#myModal"></a></td>
												<!-- <td class="_adviceResponse"></td> -->
											</tr>
										</tbody>
										<tbody id="datagrid">
										
										</tbody>
									</table>
									<nav>
								    	<ul class="pagination" style="position:absolute;top: 475px;" id="pager">
									        <li><a href="#" data-page="1">首页</a></li>		        
									        <li class="active"><a href="#" data-page="1">1</a></li>
									        <li><a href="#" data-page="10">末页</a></li>
								     	</ul>
								    </nav>
										
								</section>
							</div>
							<div class="tab-pane" id="panel-982094">
								<form:form  modelAttribute="repair" id="editForm">
									<div style="margin-top:20px">
									    <div class="col-md-6 column">
											<label>楼栋编号</label>
											<input type="text" id="buildingNum" name="buildingNum" placeholder="楼栋编号"/>
										</div>
										<div class="col-md-6 column">
											<label>住房编号</label>
											<input type="text" id="roomNum" name="roomNum" placeholder="住房编号"/>
										</div>
									</div>
									<br/>
									<br/>
									<span class="input-group-addon" style="size: a3;">内容</span>  
									<textarea style="height: 300px;width: 835px;" name="repairContent" id="repairContent" path="repairContent"></textarea>
									<br/>
									<button type="summit" class="btn btn-primary" id="addBtn" style="margin-top: 15px;position: relative;right: -780px">提交</button>
								</form:form>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin-top: 40px;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="row uniform">
							<div class="col-md-6 column">
								<label>楼栋编号</label>
								<input type="text" id="buildingNum1" name="buildingNum1" placeholder="楼栋编号" disabled="true"/>
							</div>
							<div class="col-md-6 column">
								<label>住房编号</label>
								<input type="text" id="roomNum1" name="roomNum1" placeholder="住房编号" disabled="true"/>
							</div>
							<br/>
							<div class="col-md-12 column">
								<label>反馈信息</label>
								<textarea name="demo-message" id="demoMessage" placeholder="管理员还没有来得及查看" style="height: 300px;width: 568px;" disabled="true"></textarea>
							</div>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->	
		</div>
		<div class="row" style="height:50px;"></div>
   <footer class="copyright">  
          Copyright &nbsp; 2017 CSU rights reserved.  
        </footer>  
			

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
				var alertContent = $("#alertContent");
				var editForm = $("#editForm");
				var d = new Date();
				searchForm.submit(function(){
					$.post(
						"user/repair-list",
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
									/* if (name == "content") {
										tr.find("._" + name).text(value.substring(0,10) + "...");
									} else if (name == "gmtCreate") {
										tr.find("._" + name).text(dateToString(new Date(value)));
									} else  */
									if (name == "repairDate") {
										d.setTime(value);
										var timeStr = d.Format("yyyy-MM-dd");
										tr.find("._" + name).text(timeStr);
									} else if (name == "repairState") {
										if(value == "0")
											tr.find("._" + name).text("审核中");
										else if(value == "1")
											tr.find("._" + name).text("处理中");
										else
											tr.find("._" + name).text("已处理");
									} else{
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
				$("#all").click(
						function(){
							$("#repairState").val("3");
							$("#choose").val("全部");
							searchForm.trigger("submit");
						});
				$("#repairBegin").click(
						function(){
							$("#repairState").val("0");
							$("#choose").val("审核中");
							searchForm.trigger("submit");
						});
				
				$("#repairHandle").click(
						function(){
							$("#repairState").val("1");
							$("#choose").val("处理中");
							searchForm.trigger("submit");
						});
				
				$("#repairOk").click(
						function(){
							$("#repairState").val("2");
							$("#choose").val("已处理");
							searchForm.trigger("submit");
						});
			
				editForm.submit(function(){
					alert("添加成功!");
					$.post(
						"user/addRepair",
						editForm.serializeArray(),
						function(data){
							
						},"json");
					$("#repairContent").clear();
					return false;
				}).submit;
				
				datagrid.on("click","a",function(){
					var repairId = $(this).parent().prev().prev().prev().html();

					$.post("${pageContext.request.contextPath}/user/loadRepair?repairId="+repairId,null,
						function(data){
						$("#buildingNum1").val(data.buildingNum);
						$("#roomNum1").val(data.roomNum);
						$("#demoMessage").val(data.repairResponse);
					},"json"); 

				});
			}); 
		</script>
	</body>
</html>