<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
			<!--<a class="navbar-brand" href="admin/index.jsp">首页</a>-->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
					<!-- 缴费管理 -->
				<li >
					<a href="consumeMg" >缴费管理 </a>
					
				</li>
				<!-- 用户管理 -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">信息管理 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li>
							<a href="#"></a>
						</li>
						<li>
							<a href="userMg">用户管理</a>
						</li>
						<li>
							<a href="houseMg">住房管理</a>
						</li>
						<li>
							<a href="carMg">车辆管理</a>
						</li>
						<li>
							<a href="houseTypeMg">户型管理</a>
						</li>
					</ul>
				</li>
				
			
				
				<!-- 通知管理 -->
				<li>
					<a href="noticeMg">通知管理 </a>
				</li>

				<!-- 报修管理 -->
				<li >
					<a href="repairMg" >报修管理 </a>
				</li>

				<!-- 投诉管理 -->
				<li>
					<a href="adviceMg" >投诉管理 </a>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li>
					<a >管理员[${sessionScope.user.userName}]</a>
					<label></label>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li>
							<a href="change">修改密码</a>
						</li>
						<li role="separator" class="divider"></li>
						<li>
							<a href="signout">退出</a>
						</li>
					</ul>
				</li>
			</ul>
			
		</div>
	</div>
</nav>