<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%
		List<Map<String,Object>> rList = 
		      (List<Map<String,Object>>)request.getAttribute("eList");
%>        
<!DOCTYPE html>
<html lang="ko">
<head>
<title>WAS,AQUA - 사원등록</title>
<meta charset="utf-8">
<%@ include file="/common/bootStrap4.jsp" %>
	<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">	
		$(document).ready(function() {
			setTimeout(function(){
				location.href="empListSignUp.was";
			}, 2000);
		});
	</script>
<style type="text/css">
#idiv{
 width:300px;
 margin-left:750px;
 margin-top:150px;
}
	
</style>	
</head>
<body>
<div class="container-fluid">
<div id="idiv">
<div class="spinner-grow text-muted"></div>
<div class="spinner-grow text-muted"></div>
<div class="spinner-grow text-muted"></div>
<div class="spinner-grow text-muted"></div>
<div class="spinner-grow text-muted"></div>
<div class="spinner-grow text-muted"></div>
<h5>&nbsp;<%=rList.get(0).get("msg").toString()%></h5>
</div>
</div>
</body>
</html>
