<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<!--   CDN - jquery, bootstrap -->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
  	  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <title>사이드 메뉴</title>
	 <style>
	   .no-underline{
		  text-decoration:none;
	   	  color: white;
	   }
	   h2 a:hover{
	   	color: #45e521;
		text-decoration:none;
	   }
	   #menu-title{
	   	  color: #fff;
	   }
	 </style>
</head>
<body>
	<h1 id="menu-title">사이드 메뉴</h1><br>
	<h2>
	    <a href="${contextPath }/board/listArticles.do"  class="no-underline">게시판</a><br><br>
		<a href="${contextPath }/member/listMembers.do" class="no-underline">마이페이지</a><br><br>
        <c:if test="${isLogOn == true  && member != null && member.id == 'admin'}">
			<a href="${contextPath }/member/listMembers.do" class="no-underline">회원 관리</a><br><br>
        </c:if>
    </h2>
</body>
</html>