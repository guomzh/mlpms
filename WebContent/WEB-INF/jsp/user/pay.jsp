<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<html>
	<head >
		<meta charset="utf-8" />
		<META http-equiv="Content-Script-Type" content="text/javascript">
		<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
		<link rel="stylesheet" href="bootstrap/hky.css">
		<link rel="stylesheet" href="css/dcalendar.picker.css">
        <script type="text/javascript" src="js/dcalendar.picker.js"></script>
		<script src="bootstrap/jquery.min.js"></script>
		<script src="bootstrap/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/mine.css">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>我的缴费</title>
		    <link rel="stylesheet" href="css/bootstrapDatepickr-1.0.0.min.css">
        <script  src="js/bootstrapDatepickr-1.0.0.min.js"></script>
		
		<script>	
		
		jQuery(document).ready(function(){
			/* $("._check").change(function() { 
				alert("checked"); 
				});  */
			
			jQuery("#button-search").click
            (
                function ()
                {
                	jQuery("#alert-1").hide();
                	jQuery("#modal-478749").hide();
                	document.getElementById("tip").innerHTML="<h3>缴费历史&nbsp;:</h3>";
                	 var adom = document.getElementsByClassName('check_all');
                     for(var i = 0;i<adom.length;i++)
                          adom[i].style.display="none";
                }
            );
			jQuery("#button-pay").click
            (
                function ()
                {
                	jQuery("#alert-1").show();
                	jQuery("#modal-478749").show();
                	document.getElementById("tip").innerHTML="<h3>未缴费账单&nbsp;:</h3>";
                	 var adom = document.getElementsByClassName('check_all');
                     for(var i = 0;i<adom.length;i++)
                          adom[i].style.display="";
                }
            );
			jQuery.noConflict(); 
			$("#calendar").bootstrapDatepickr();
			$("#calendar1").bootstrapDatepickr();
			
	/* 		$('#mydatepicker1').dcalendarpicker({
		        format: 'yyyy-mm-dd'
		    }); */
			/*jQuery('#mydatepicker2').dcalendarpicker({
		        format: 'yyyy-mm-dd'
		    }); */
});
		

     </script>
		

	</head>
<!-- 	<body style="background-color:white;"> -->
<body style="width: 100%;height: 100%;over-flow:hidden;background:url(images/bg.jpg) repeat;">
	<%@ include file="../common/nav.jsp"%> 
	<%-- 	<jsp:include page="../common/nav.jsp"/> --%>
		
		<div class="container" style="width:80%">
	<div class="row clearfix">
		<div class="col-md-3 column" >
			<h3>
		
				梅岭物业管理系统.
			</h3><img alt="140x140" src="images/g.png" />
			<div class="row" style="height: 30px;"></div>
			<div class="row" style="padding: 10px;">
			
			<h2>我的缴费历史</h2>
			
			<br/>
				<div class="thumbnail" style="border:groove;text-align: center">
						<div class="caption">
						
						<form id="searchForm">
				
					  <div style="display:none;">
					    <input type="hidden" name="pageNo" value="0" class="form-control">
					  <input type="hidden" name="rowMax" value="5" class="form-control">
					  <!-- 1表示继续缴费显示所有未缴费的记录 -->
					  <input type="hidden" name="consumeType" value="1" class="form-control" id="consumeType">
			          <input type="text" name="key" class="form-control" placeholder="关键字">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">
			            	<i class="glyphicon glyphicon-search"></i>
			            </button>
			          </span>
					  </div>
					  
					
			             <h4><strong>起始日期：</strong></h4>
                         <input type="text" name="calendar" id="calendar"  placeholder="查询开始日期" class="form-control">
                         <br/>
                         <br/>
                            <h4><strong>终止日期：</strong></h4>
                        <input type="text" name="calendar1" id="calendar1" placeholder="查询结束日期" class="form-control">
                        <br/>
                        <br/>
                       <label><input type="radio" name="select" value="所有" checked=true />所有</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input name="select" value="水费" type="radio" />水费</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input name="select" value="电费" type="radio" />电费</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input name="select" value="物业费" type="radio" />物业费</label
		               </form>
						
						
						
						</div>
						
						<br/>
							<button type="button"  class="btn btn-danger btn-sm" id="button-search" style="width: 100px;height: 45px; margin: 15px;">历史查询</button>
							<br/>
						    <button type="button"  class="btn btn-info btn-sm" id="button-pay" style="width: 100px; height: 45px; margin: 15px;">继续缴费</button>
				</div>
		
			<br/>
			       
			
			</div>
			<div class="row" style="height: 50px;"></div>			
		
		</div>
		<div class="col-md-8  column">		
			<div class="row" style="margin-left: 120px;">
				<div style="border:1px solid #696969; padding: 10px;width:920;text-align:left;"   >
							<h1 align="center">
								缴费信息
							</h1>
							<div id="tip">
						               <h3>未缴费账单&nbsp;:</h3>
					        </div>
							<br/>
			<div class="panel panel-info" style="margin-top: 25px;">
				<div class="panel-heading" >
					<h3 class="panel-title"><i class="glyphicon glyphicon-volume-down"></i> 缴费管理</h3>
				</div>
				
					
				
				<div class="panel-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="check_all">
									<input class="_check1" type="checkbox" name="abc" onclick="swapCheck()"  value="0"/>全选
								</th>
								<th>账单id</th>
								<th>费用类型</th>
								<th>楼栋编号</th>
								<th>住房编号</th>
								<th>计费日期</th>
								<th>单价</th>
								<th>用量</th>
								<th>状态</th>
								<th>金额</th>
							</tr>
						</thead>
						
							<tbody id="template" style="display:none;">
							<tr>
								<!-- <th scope="row" class="_rowNumber"></th> -->
								<td class="check_all"><input class="_check" type="checkbox"  name="abc" value="0"/></td>
								<td class="_consumeId"></td>
								<td class="_consumeType"></td>
								<td class="_buildingNum"></td>
								<td class="_roomNum"></td>
								<td class="_consumeDate"></td>
								<td class="_unitPrice"></td>
								<td class="_count"></td>
								<td class="_consumeState"></td>
								<td class="_price">0</td>
								
							</tr>
						</tbody>
						<tbody id="datagrid">
							
						</tbody>
						
						
					</table>							   

				</div>
			</div>  <!-- pannel面板结束 -->
					
                 <!--  上面表格 下面分页 -->
                <nav>			   
		         <ul class="pagination" id="pager">
		        <li><a href="#" data-page="1">首页</a></li>
		        <li class="active"><a href="#" data-page="1">1</a></li>
		        <li><a href="#" data-page="2">2</a></li>
		        <li><a href="#" data-page="3">3</a></li>
		        <li><a href="#" data-page="10">末页</a></li>
		        </ul>
		        </nav>
							<br/>
						
			</div>   <!-- md-8层下的row下的带边框的div结束 -->
				    <!--缴费总额提示  -->
					<div  style="padding:20px;border:1px solid #696969;text-align:left; margin-top:50px;width:920px;"  id="alert-1">
						<h1>
						     已选缴费金额：&nbsp;<span id="total">0</span>元
						</h1>
						
						
						<a id="modal-478749"  href="#modal-container-478749" role="button" class="btn" style="background-color:#E8E8E8;" data-toggle="modal"><h1 style="color:red;">立即支付</h1></a>
				        		<div class="modal fade" sytle="position:absolute;margin-top:200px;" id="modal-container-478749" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header" style="padding-left:100px;margin-top:50px;width:500px;">
									
										<div class="input-group input-group-lg">
													<span class="input-group-addon">输入支付账号</span>
													<input type="text" class="form-control" placeholder="支付账号" value="13100240369">
												</div><br>
										<div class="input-group input-group-lg">
													<span class="input-group-addon">输入支付密码</span>
													<input type="password" class="form-control" placeholder="支付密码" value="54512653136151">
												</div>
								<div class="modal-footer">
									 <button type="button" class="btn btn-default" id="close" data-dismiss="modal">取消</button> <button type="button"  id="pay_button" class="btn btn-primary">支付</button>
								</div>
							</div>
							
						</div>
						
					</div>
					
				</div>
						
					</div>	
				    <br/>
				    
				 
			</div>  <!-- md-8层下的row结束 -->
		</div>   <!-- md-8层结束 -->
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
        "q+": Math.floor((this.getMonth() + 3) / 3),  
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
	var d=  new Date();
	
	searchForm.submit(function(){
		
		$.post(
			"list_consume",
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
						if (name == "userId") {							
						} 
						else if (name == "createDate") {							
						} 
						else if (name == "consumeDate") {
							d.setTime(value);  
							var timeStr = d.Format("yyyy-MM-dd");  						     
							tr.find("._" + name).text(timeStr);
						
						} 
						else if(name=="consumeState"){
							if(value=="0")
								tr.find("._" + name).text("未缴费");
							if(value=="1")
								tr.find("._" + name).text("已缴费");
						}
						
						
						else if(name=="consumeType"){
							if(value=="0")
								{tr.find("._" + name).text("水费");}
							if(value=="1")
								{tr.find("._" + name).text("电费");}
							if(value=="2")
								{tr.find("._" + name).text("物业费");}
						}
						else {
							tr.find("._" + name).text(value);
						}
					});
				});
				/* var tt=0;
				 $("td[class='_price']").each(function() {  
		              
		               tt=tt+parseFloat(($(this).html()));
		               $("#total").text(tt.toString());
		        }); */
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
	
	$("#button-search").click(function(){
		
		$("#consumeType").val("0");
		searchForm.trigger("submit");
		alert("缴费历史查询成功");
		
	});
	$("#button-pay").click(function(){
		$("#consumeType").val("1");
		searchForm.trigger("submit");
		alert("成功返回缴费");
	
	});

	datagrid.on("change","input[type='checkbox']",function(){
		var st = $(this).parent().next().next().next().next().next().next().next().next().next().html();
		var to=0;
	/* 	 alert($(this).is(':checked'));  */
		if($(this).is(':checked')){to=parseFloat($("#total").html())+parseFloat(st);}
		else {   to=parseFloat($("#total").html())-parseFloat(st);}
	   
		$("#total").text(to.toString());  
	});
	
	$("#pay_button").click(function pay(){
    	var list = [];
    	var i=-1;
    	$("input[class='_check']").each(function(){
    		if($(this).is(':checked')&&!$(this).parent().next().html()==""){
    			i=i+1;
    			list[i]=$(this).parent().next().html();   			
    		}
    		 $.ajax({
    	            url:'payconsume',
    	            data:{"list":list}, 
    	            traditional :true,  //这个参数是必须的
    	            type: "POST",  
    	            success:function(result){
    	            	if(result == "GOOD"){
    	            		
    	                }else if(result == "ERROR"){
    	                    alert("支付失败");
    	                }
    	                 
    	            }
    	        });
    	
    	});
    	$("#close").click();
    	
    	searchForm.trigger("submit");
    	alert("支付成功")
    	/* swapCheck(); */

    	
    });
}); 


var isCheckAll = false;  
function swapCheck() {  
    if (isCheckAll) {  
        $("input[type='checkbox']").each(function() {  
        	
            this.checked = false;  
        }
        );  
        $("#total").text("0");
/*         var t=0;
        $("td[class='_price']").each(function() {  
        	
            t=t+parseInt(this.html());  
        }); 
        alert(t); */
        isCheckAll = false;  
    } else {  
    	/* var tt=parseInt($("#total").html()); */
    	var tt=0;
        $("input[type='checkbox']").each(function() {  
            this.checked = true;  
        });  
        $("td[class='_price']").each(function() {  
              
               tt=tt+parseFloat(($(this).html()));
               $("#total").text(tt.toString());
        });
        
        isCheckAll = true;  
    }  
    
 

    
    
}  



</script>		

<script type="text/javascript">

</script>		
		
	
	</body>
</html>
		
