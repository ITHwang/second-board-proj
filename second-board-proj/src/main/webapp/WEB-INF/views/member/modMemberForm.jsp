<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--   CDN - jquery, bootstrap -->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
  	  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/member/memberForm.css">
<title>회원 정보 수정창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
</head>
<body>
	<div class="wrapper fadeInDown">
	  <div id="formContent">
		  <h3 class="fw-bold">회원 정보 수정 창</h3>
	  
		<!-- Login Form -->
		<form name="frmLogin" method="post"  action="${contextPath}/member/updateMember.do">
		  <input type="text" id="login" class="fadeIn second" name="id" value="${id }" readonly placeholder="아이디">
		  <input type="text" id="password" class="fadeIn third" name="pwd" placeholder="비밀번호">
		  <input type="text" id="name" class="fadeIn fourth" name="name" placeholder="이름">
		  <input type="text" id="email" class="fadeIn fifth" name="email" placeholder="이메일">
		  <input type="submit" class="fadeIn sixth" value="수정하기"> 
		</form>
	  </div>
	</div>
</body>
</html>