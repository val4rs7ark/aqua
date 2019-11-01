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
<style>
body,td {font-size:12px}
</style>

<!----- 1. 아래의 스크립트를 HEAD 부분에 붙여 넣으세요 -------->

<SCRIPT LANGUAGE="JavaScript">

function pass(){
	//비밀번호 비교후 맞으면 db로 가서 값 바꾸고 창꺼지기
	var password = $("#password").val();
	if(password=="<%=pw%>"){
		$.ajax({
			 url:"/erp/wasDraft_buttonLoot?loot=permission&draft_no="+<%=draft_no%>+"&empno="+<%=empno%>
			,method:"get"
			,success:function(data){
				alert("결재가 완료되었습니다.");
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
	<table border=0>
		<tr style="height: 40px;">
			<td >비밀번호:</td>
			<td>
				<input type="password" id="password" name="password" size=10 style="width: 88px;">
			</td>
		</tr>
		<tr style="height: 40px;">
			<td colspan="2" align=center>
				<input type=submit onclick="javascript:pass()" value="확인 ">
				<input type=submit onclick="javascript:cancle()" value="취소 ">
			</td>
		</tr>
	</table>
</BODY>
</HTML>