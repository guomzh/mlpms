<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
			<link rel="stylesheet" href="bootstrap/mine.css">
			<script src="bootstrap/jquery.min.js"></script>
	        <script src="bootstrap/bootstrap.min.js"></script>
		<title>小区新闻</title>
	</head>
<body style="width: 100%;height: 100%;over-flow:hidden;background:url(images/bg.jpg) repeat;">

    <div class="container">  
     
      <h1 align="center">${requestScope.notice.noticeTitle}</h1>  
      <h4></h4>  
  
      <div class="news-list">  
        <div class="news-list-left">  
         
  
         
  
          <div class="news-list-item">  
            <c:if test="${requestScope.notice.pictureAddress!=null}">
               <img src="${requestScope.notice.pictureAddress}" class="img-responsive" alt="First slide">
            </c:if>
          	
      <br />
            <div class="author-time2">  
             <!--  <span class="_">我女神</span> --> 发表于&nbsp;&nbsp; <span class="noticeDate">
              <fmt:formatDate value="${requestScope.notice.noticeDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
      
             </span>  
            </div>  
            <div class="news-des2">  
              <br/>  
              <div class="content-single-article">
             
        ${requestScope.notice.noticeContent}
              </div>  
            </div>  
          </div>  
        </div>  

  
        <footer class="copyright">  
          Copyright &nbsp; 2017 CSU rights reserved.  
        </footer>  
      </div>  
    </div>  
</div>
	</body>
</html>
