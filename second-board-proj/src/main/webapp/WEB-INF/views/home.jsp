  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
<c:choose>
	<c:when test="${result=='logouted' }">
	  <script>
	    window.onload=function(){
	      alert("로그아웃 되었습니다.");
	    }
	  </script>
	</c:when>
	<c:when test="${result=='added' }">
	  <script>
	    window.onload=function(){
	      alert("회원이 되신 것을 축하드립니다!! 로그인 후 이용해주세요.");
	    }
	  </script>
	</c:when>
	<c:when test="${result=='deleted' }">
	  <script>
	    window.onload=function(){
	      alert("탈퇴 완료");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>
<body>
   <h1>메인 페이지입니다!!</h1>
</body>
</html>
<!-- 깃헙 브랜치 연습-->