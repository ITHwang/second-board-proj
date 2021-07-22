<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result }" />
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
<title>로그인창</title>
<c:choose>
	<c:when test="${result=='loginFailed' }">
	  <script>
	    window.onload=function(){
	      alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>

<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
  	<h3 class="fw-bold">로그인 창</h3>
  
    <!-- Login Form -->
    <form name="frmLogin" method="post"  action="${contextPath}/member/login.do">
      <input type="text" id="login" class="fadeIn second" name="id" placeholder="아이디">
      <input type="password" id="password" class="fadeIn third" name="pwd" placeholder="비밀번호">
	  <input type="submit" class="fadeIn fourth" value="로그인"> 
    </form>
  </div>
</div>
</body>
</html>