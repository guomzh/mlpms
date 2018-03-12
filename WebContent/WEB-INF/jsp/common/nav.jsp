<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<script src="bootstrap/jquery.min.js"></script>
<style type="text/css">
 ul, li { list-style:none;}
#show li:hover div {display:block;}
</style>
     
<script>
$(document).ready
(
     function ()
     {
         $("#show").mouseover
         (
             function ()
             {
                 $(".user_message").show();
             }
         );
         $("#show").mouseout
         (
             function()
             {
                 $(".user_message").hide();
             }
         );
       
     }
);

//模拟悬浮框里面的按钮点击操作 
function test() { 
  alert('成功退出'); 
}



</script>


<nav class=" thumbnail" style="width:100% ;margin-right:200px;" >
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		            <span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
				</div>
		
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li >
							<a class="navbar-brand" href="index">首页 </a>
							
						</li>
							<!-- 缴费管理 -->
						<li >
							<a href="pay">缴费 </a>					
						</li>
		
						<!-- 报修管理 -->
						<li >
							<a href="repair" >报修 </a>
						</li>
		
						<!-- 投诉管理 -->
						<li>
							<a href="advice" >投诉 </a>
						</li>
						<!-- 关于我们 -->
						<li>
							<a href="info" >关于我们 </a>
						</li>
		
					
					</ul>

					<ul id="show"  class="nav navbar-nav navbar-right" style="margin-right:150px;">
        
          <c:if test="${sessionScope.user==null}">
               <font color="red">${errorMessage}</font>
               <button type="button"  class="btn btn-primary btn-sm" style="margin:15px" data-toggle="modal" data-target="#roleAddModal">
		    	点我登录
		    	</button>
		    	
            </c:if>
               

		       <c:if test="${sessionScope.user!=null}">
              <img class="commentAvatarImage img-circle" src="images/head.jpg" width="40px" height="40px"style="margin:5px"/>							       	     
	        <a  href="#">${sessionScope.user.userName}</a>
	<div class="user_message" style=" text-align:left;background-color: rgba(255, 255, 255, 1);z-index:999;border:1px solid black;display:none;position:absolute;float:left;padding:50px;">
	  <span aria-hidden='true' class='icon_globe'></span><font>用户名:</font>${sessionScope.user.userName } 
	  <br/>
	   <br/>   
	    <br/>        
       <span aria-hidden='true' class='icon_search_alt'></span> <font>性别:</font>${sessionScope.user.sex }
       <br/> <br/>   
        <br/>   
         <span aria-hidden='true' class='icon_pens_alt'></span> <font>联系电话:</font>${sessionScope.user.phone }
         <br/>
          <br/>   
           <br/>   
        <button  type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#roleAddModal2">修改个人信息</button>
        <br/>
        <br/>  
        <a href="signout" class="btn btn-danger btn-sm" style="list-style:none">登出</a>
          
	</div>
	     
		  
          
         

  
    
   </c:if>	

					</ul>
		
				</div>
			</div>	
			
	<div class="modal fade" id="roleAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">请输入登录信息</h4>
      </div>
      <div class="modal-body">
        <form action="login" method="post" >
          <div class="form-group">
            <label for="recipient-name" class="control-label">身份证号码:</label>
            <input type="text" class="form-control" name="userId" id="recipient-name" value="440882199602270616">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">密码:</label>
            <input type="password" class="form-control" name="password" id="recipient-name" value="123456">
          </div>          
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">登录</button>
      </div>
        </form>
    </div>
  </div>
</div>


	<div class="modal fade" id="roleAddModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
        <h4 class="modal-title" id="exampleModalLabel">修改个人信息</h4>
      </div>
      <div class="modal-body">
        <form action="change" method="post" >
          <div class="form-group">
            <label for="recipient-name" class="control-label">请输入新密码</label>
            <input type="password" class="form-control" name="password" id="recipient-name" value="">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">请输入新手机号</label>
            <input type="text" class="form-control" name="phone" id="recipient-name" value="">
          </div>          
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="submit" class="btn btn-primary">修改</button>
      </div>
        </form>
    </div>
  </div>
</div>




		</nav>
		
