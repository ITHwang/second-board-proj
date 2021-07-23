<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<!--   CDN - jquery, bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!--    글꼴 설정 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">

<script src="${contextPath}/resources/js/board/articleForm.js"></script>

<title>글쓰기창</title>
<style>
.cls1 {
	font-family: 'Nanum Brush Script', cursive;
	text-align: center;
	font-size: 25px;
	width: 100px;
	height: 50px;
}
</style>
</head>
<body>

    <form name="articleForm" method="post"   action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
        <table class="table" border=0 align="center">
            <tr>
                <td class="table table-success" width="150px" align="center">
                    작성자</td>
				<td colspan=2 align="left"><input type="text" size="20" maxlength="100" value="${member.name }" readonly /></td>
            </tr>
            
            <tr>
                <td class="table table-success" width="150px" align="center">글 제목</td>
				<td colspan="2"><input type="text" size="67" maxlength="500" name="title" /></td>
            </tr>
            
            <tr>
                <td class="table table-success" width="150px" align="center" >글 내용</td>
				<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
            </tr>
            
            <tr>
                <td class="table table-success" width="150px" align="center" >파일 첨부</td>
				<td><div id="d_file"><input type="file" name="imageFileName"
					onchange="readURL(this);" /></div></td>

				<td align="left"><input type="button" class="btn btn-success cls1" value="파일 추가"
					onClick="fn_addFile()" /></td>

            </tr>

			<tr>
				<td align="right"></td>
				<td colspan="2">
					<input type="submit" class="btn btn-success cls1" value="글쓰기" /> 
					<input type=button value="목록보기" class="btn btn-success cls1" onClick="backToList(this.form)" />
				</td>
			</tr>
            
            
            
            
            
        </table>
    </form>
</body>
</html>
