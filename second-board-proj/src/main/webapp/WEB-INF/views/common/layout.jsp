<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
	  #wrap{
	  	width: 90%;
	  	margin: 0 auto;
	  }
      #container {
        width: 100%;
        margin: 0px auto;
          text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 5px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        background-color: #cccc00;
        border-radius: 15px;
	  	font-family: 'Nanum Brush Script', cursive;
      }
      #sidebar-left {
        width: 15%;
        height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;
        float: left;
        background-color: darkgreen; 
        border: 0px solid #bcbcbc;
        font-size:10px;
        border-radius: 15px;
	  	font-family: 'Nanum Brush Script', cursive;
      }
      #content {
        width: 75%;
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
        text-align:center;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #cccc00;
        border-radius: 15px;
	  	font-family: 'Nanum Brush Script', cursive;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="wrap">
		<div id="container">
		  <div id="header">
			 <tiles:insertAttribute name="header"/>
		  </div>
		  <div id="sidebar-left">
			  <tiles:insertAttribute name="side"/> 
		  </div>
		  <div id="content">
			  <tiles:insertAttribute name="body"/>
		  </div>
		  <div id="footer">
			  <tiles:insertAttribute name="footer"/>
		  </div>
		 </div>
     </div>
  </body>
</html>