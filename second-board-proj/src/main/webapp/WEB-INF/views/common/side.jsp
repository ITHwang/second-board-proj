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
	    <a id="listArticles" href="${contextPath }/board/listArticles.do"  class="no-underline">게시판</a><br><br>
		<c:choose>
			<c:when test="${isLogOn == true  && member != null && member.id == 'admin'}">
				<a href="${contextPath }/member/listMembers.do" class="no-underline">회원 관리</a><br><br>
			</c:when>
			<c:otherwise>
				<a id="mypage" href="${contextPath }/member/mypage.do" class="no-underline">마이페이지</a><br><br>
			</c:otherwise>
		</c:choose>
    </h2>
<script>
		//메인에서 게시판이나 마이페이지 클릭 시 로그인 여부 확인 후 리다이렉션
		function fn_check_login(isLogOn, target){
		  if(isLogOn != '' && isLogOn != 'false'){
			target.setAttribute("href", target.href);
		  }else{
			  alert("로그인 후 가능합니다.")
			  if (target.getAttribute("href") == "${contextPath}/board/listArticles.do"){
			      target.setAttribute("href", '${contextPath}/member/loginForm.do?action=/board/listArticles.do');
			  }
			  else if (target.getAttribute("href") == "${contextPath }/member/mypage.do"){
			      target.setAttribute("href", '${contextPath}/member/loginForm.do?action=/member/mypage.do');
			  }
		  }
		}
		
		var listArticles = document.getElementById("listArticles");
		listArticles.addEventListener('click', function(event){
			fn_check_login("${isLogOn}", event.target);
		});
		
		var mypage = document.getElementById("mypage");
		mypage.addEventListener('click', function(event){
			fn_check_login("${isLogOn}", event.target);
		});
</script>
</body>
</html>