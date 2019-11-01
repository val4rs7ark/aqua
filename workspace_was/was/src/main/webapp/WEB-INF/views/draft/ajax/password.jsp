<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
		Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
		String pw = rMap.get("pw").toString();
		String empno = rMap.get("empno").toString();
		String draft_no = rMap.get("draft_no").toString();
%>     
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Jasko Sample Script </TITLE>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	  crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"/></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"/></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
body,td {font-size:12px}
</style>

<!----- 1. 아래의 스크립트를 HEAD 부분에 붙여 넣으세요 -------->

<SCRIPT LANGUAGE="JavaScript">

function pass(){
	//비밀번호 비교후 맞으면 db로 가서 값 바꾸고 창꺼지기
	var password = f_pw.password.value;
	if(password==<%=pw%>){		
		$.ajax({
			 url:"/erp/wasDraft_buttonLoot?loot=permission&draft_no=<%=draft_no%>&empno=<%=empno%>"
			,method:"get"
			,success:function(data){
				opener.parent.location.reload();
				window.close()
			}
		});
	}
	else{
		alert("비밀번호가 틀렸습니다.");
	}
}
function cancle(){
	window.close()
}

</script>
</HEAD>

<BODY>
<p align=center>
<B>비밀번호를 입력해 주세요</B>
<center>
	<form id="f_pw">
		<table border=0>
			<tr style="height: 40px;">
				<td >비밀번호:</td>
				<td>
					<input type="password" id="password" name="password" size=10 style="width: 88px;">
				</td>
			</tr>
			<tr style="height: 40px;">
				<td colspan="2" align=center>
					<input type="button" onclick="javascript:pass()" value="확인 ">
					<input type="button" onclick="javascript:cancle()" value="취소 ">
				</td>
			</tr>
		</table>
	</form>
</BODY>
</HTML>