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

  <title>헤더</title>
  <style>
	a{
	  text-decoration:none;
	  color: white;
	}
	button{
		width: 80px;
		height: 50px;
		line-height: 50px;
	}
 </style>

</head>

<body>
<table border=0  width="100%">
  <tr>
     <td>
		<a href="${contextPath}/home.do">
			<img src="${contextPath}/resources/image/spring.png" width="150px" height="150px" />
		</a>
     </td>
     <td>
       <h1><font size=20>Second Board Project</font></h1>
     </td>
     <td>
       <c:choose>
          <c:when test="${isLogOn == true  && member != null}">
          	<c:choose>
          		<c:when test="${member.id == 'admin' }">
					<h3>관리자 모드</h3>
          		</c:when>
          		<c:otherwise>
            		<h3>환영합니다. ${member.name }님!</h3>
          		</c:otherwise>
          	</c:choose>
            <button type="button" style="font-size:20px" class="btn btn-success" onclick="location.href='${contextPath }/member/logout.do'">로그아웃</button>
          </c:when>
          <c:otherwise>
	        <button type="button" style="font-size:20px" class="btn btn-success" onclick="location.href='${contextPath}/member/memberForm.do'">회원가입</button>
	        <button type="button" style="font-size:20px" class="btn btn-success" onclick="location.href='${contextPath }/member/loginForm.do'">로그인</button>
	      </c:otherwise>
	   </c:choose>     
     </td>
  </tr>
</table>


</body>
</html>