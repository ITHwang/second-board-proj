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
<title>마이페이지</title>
<style>
   .text_center{
     text-align:center;
   }
   #tr_btn_modify{
   	display:none;
   }
</style>
 <script type="text/javascript" >
     function backTo(obj){
	    obj.action="${contextPath}/member/mypage.do";
	    obj.submit();
     }
 
     function backToHome(obj){
	    obj.action="${contextPath}/home.do";
	    obj.submit();
     }

	 function fn_enable(obj){
		 document.getElementById("password").disabled=false;
		 document.getElementById("name").disabled=false;
		 document.getElementById("email").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_mypage(obj){
		 obj.action="${contextPath}/member/updateMypage.do";
		 obj.submit();
	 }
	 
	 function fn_remove_member(url){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);

	     var idInput = document.createElement("input");
	     idInput.setAttribute("type","hidden");
	     idInput.setAttribute("name","id");
	     idInput.setAttribute("value","${member.id}");
		 
	     form.appendChild(idInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }

 </script>
	<c:choose>
		<c:when test="${result=='updated' }">
		  <script>
			window.onload=function(){
			  alert("수정 완료");
			}
		  </script>
		</c:when>
	</c:choose>  
</head>
<body>
	<div class="wrapper fadeInDown">
	  <div id="formContent">
		  <h3 class="fw-bold">마이페이지</h3>
	  
		<!-- Login Form -->
		<form name="frmLogin" method="post"  action="#">
		  <input type="text" id="id" class="fadeIn second" name="id" value="${member.id }" readonly>
		  <input type="text" id="password" class="fadeIn third" name="pwd" value="${member.pwd }" disabled>
		  <input type="text" id="name" class="fadeIn fourth" name="name" value="${member.name }" disabled>
		  <input type="text" id="email" class="fadeIn fifth" name="email" value="${member.email }" disabled>
		  
		  <div id="tr_btn_modify">
		   <input type=button value="수정반영하기"   onClick="fn_modify_mypage(frmLogin)"  >
           <input type=button value="취소"  onClick="backTo(frmLogin)">
          </div> 
		  <div id="tr_btn">
			  <input type=button value="수정하기" onClick="fn_enable(this.form)">
			  <input type=button value="홈으로"  onClick="backToHome(this.form)">
			  <input type=button value="회원 탈퇴" onClick="fn_remove_member('${contextPath}/member/removeMember.do')">
          </div> 
		 </form>
	  </div>
	</div>
</body>
</html>