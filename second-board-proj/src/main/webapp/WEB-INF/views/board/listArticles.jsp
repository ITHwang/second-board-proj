<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!--    글꼴 설정 -->
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
  	  <style>
  	  	.container{
  	  		border-radius: 10px;
  	  		border: 3px solid darkgreen;
  	  	}
	   .cls1 {text-decoration:none; color:black;}
	   .cls1:hover{
	   		font-weight: 900;
	   		color: black;
	   		text-decoration: none;
	   }
	   .cls2{
	  		font-family: 'Nanum Brush Script', cursive;
	   		 text-align:center;
	   		 font-size:20px;
	   		 width: 80px;
	   		 height: 50px;
	    }
  	  </style>
  <title>글목록창</title>
</head>
<script>


</script>
<body>

<div class="container">
	<h3 class="fw-bold">글 목록</h3>
	<table class="table table-hover" align="center"  width="90%">
		<thead>
			<tr>
				<th class="table-success">글번호</th>
				<th class="table-success">작성자</th>
				<th class="table-success">제목</th>
				<th class="table-success">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
			  <c:when test="${articlesList ==null }" >
				<tr  height="10">
				  <td colspan="4">
					 <p align="center">
						<b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
					</p>
				  </td>  
				</tr>
			  </c:when>
			  <c:otherwise>
					 <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
						 <tr align="center">
						<td width="5%">${article.articleNO}</td>
						<td width="10%">${article.id }</td>
						<td align='left'  width="35%">
						  <span style="padding-right:30px"></span>
						  <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
						  </td>
						  <td  width="10%">${article.writeDate}</td> 
						</tr>
					  </c:forEach>
				</c:otherwise>
			  </c:choose>
		</tbody>
	</table>
</div>
<br>
<c:if test="${member.id != 'admin' }">
	<button type="button" style="font-size:20px" class="btn btn-success cls2" onclick="location.href='${contextPath}/board/articleForm.do'">글쓰기</button>
</c:if>

</body>
</html>