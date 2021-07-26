<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    

<html>
<head>
<meta charset=UTF-8">
	<!--   CDN - jquery, bootstrap -->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
  	  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  	  <style>
  	  	.container img{
  	  		width: 20px;
  	  		height: 20px;
  	  	}
  	  	.container{
  	  		border-radius: 10px;
  	  		border: 3px solid darkgreen;
  	  	}
  	  </style>
<title>회원 정보 출력 창</title>
<c:choose>
	<c:when test="${result=='updated' }">
	  <script>
	    window.onload=function(){
	      alert("수정 완료");
	    }
	  </script>
	</c:when>
	<c:when test="${result=='deleted' }">
	  <script>
	    window.onload=function(){
	      alert("삭제 완료");
	    }
	  </script>
	</c:when>
</c:choose>  
</head>
<body>
<div class="container">
	<h3 class="fw-bold">회원 관리</h3>
	<table class="table table-hover" align="center"  width="90%">
		<thead>
			<tr>
				<th class="table-success">아이디</th>
				<th class="table-success">비밀번호</th>
				<th class="table-success">이름</th>
				<th class="table-success">이메일</th>
				<th class="table-success">가입일</th>
				<th class="table-success"></th>
				<th class="table-success"></th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach var="member" items="${membersList}" >     
		   <tr align="center">
			  <td>${member.id}</td>
			  <td>${member.pwd}</td>
			  <td>${member.name}</td>
			  <td>${member.email}</td>
			  <td>${member.joinDate}</td>
			  <td><a href="${contextPath}/member/modMemberForm.do?id=${member.id }"> <img src="${contextPath}/resources/image/update.png"/></a></td>
			  <td><a href="${contextPath}/member/removeMember.do?id=${member.id }"> <img src="${contextPath}/resources/image/delete.png"/></a></td>
			</tr>
		  </c:forEach>   
		</tbody>
	</table>
</div>
</body>
</html>