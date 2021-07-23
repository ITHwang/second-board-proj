<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="article" value="${articleMap.article}" />
<c:set var="imageFileList" value="${articleMap.imageFileList}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<head>

    <meta charset="UTF-8">
    <title>글보기</title>

    <!--   CDN - jquery, bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!--    글꼴 설정 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">

	<script src="${contextPath}/resources/js/board/viewArticle.js"></script>
	
    <style>
        #tr_btn_modify {
            display: none;
        }

        .cls1 {
            font-family: 'Nanum Brush Script', cursive;
            text-align: center;
            font-size: 25px;
            width: 100px;
            height: 50px;
        }
        table img{
        	width: 300px;
        	height: 300px;
        }

    </style>


</head>

<body>
    <form name="frmArticle" method="post" action="${contextPath}" enctype="multipart/form-data">
        <table class="table" border=0 align="center">
            <tr>
                <td class="table-success" width="150" align="center">
                    글번호</td>
                <td><span>${article.articleNO }</span> <input type="hidden" name="articleNO" value="${article.articleNO}" /></td>
            </tr>
            
            <tr>
                <td class="table-success" width="150" align="center">작성자 아이디</td>
                <td><span>${article.id }</span></td>
            </tr>
            
            <tr>
                <td class="table-success" width="150" align="center" >제목</td>
                <td><span id="title">${article.title }</span> <input type="hidden" id="i_title" value="${article.title }" /></td>
            </tr>
            
            <tr>
                <td class="table-success" width="150" align="center" >내용</td>
                <td><textarea rows="20" cols="60" name="content" id="i_content" readonly />${article.content }</textarea></td>
            </tr>
            
            <c:if test="${not empty imageFileList && imageFileList != 'null' }">
                <c:forEach var="item" items="${imageFileList}" varStatus="status">
                    <tr>
                        <td class="table-success" width="150" align="center"  rowspan="2">이미지${status.count }</td>
                        <td><input type="hidden" name="originalFileName" value="${item.imageFileName }" /> <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview" /><br></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="imageFileName " id="i_imageFileName" disabled onchange="readURL(this);" /></td>
                    </tr>
                </c:forEach>
            </c:if>

            <tr>
                <td class="table-success" width="150" align="center" >등록일자</td>
                <td><span>${article.writeDate }</span></td>
            </tr>
            
            <tr id="tr_btn_modify" align="center">
                <td colspan="2" align="center">
                	<input class="btn btn-success cls1" type=button value="수정 반영하기" onClick="fn_modify_article(frmArticle)"> 
                	<input class="btn btn-success cls1" type=button value="취소" onClick="fn_disable()">
                </td>
            </tr>

            <tr id="tr_btn" align="center">
                <td colspan="2" align="center">
                    <c:choose>
                        <c:when test="${member.id == article.id }">
                            <input type=button class="btn btn-success cls1" value="수정하기" onClick="fn_enable()">
                            <input type=button class="btn btn-success cls1" value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
                        </c:when>
                        <c:when test="${member.id == 'admin' }">
                            <input type=button class="btn btn-success cls1" value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
                        </c:when>
                    </c:choose> 
                    <input type=button class="btn btn-success cls1" value="리스트로 돌아가기" onClick="backToList(this.form)">
                </td>
            </tr>
        </table>
    </form>
</body>

</html>
