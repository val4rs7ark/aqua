<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result =  (String)request.getAttribute("getResult");
	if(result!=null){
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function result(){
		//alert("result");
		setTimeout(function() {
			self.close();
		}, 2000);	
	}	
</script>
</head>
<body onload="result()">
<%
	out.print(result);
%>
<%
	}
%>
</body>
</html>