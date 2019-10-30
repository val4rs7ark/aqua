<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	List<Map<String,Object>> team_name = (List<Map<String,Object>>)request.getAttribute("team_name");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>기안서</title>
<meta http-equiv="Content-Type" content="text/html;">
<title>Insert title here</title>
<script type="text/javascript">
	function select_empno(){
		alert("선택됨");
	}
</script>
</head>
<body>
<div style="margin-left: 13px;">
<%  
	if(team_name.size()!=0){
		for(int i=0;i<team_name.size();i++){
			Map<String,Object> rMap = team_name.get(i);
%>
	<div style="margin-bottom: 7px;font: 14px sans-serif; font-weight: 600;">
		<input type="checkbox" name="chk" value="<%=rMap.get("EMPNO")%>">
		<input type="hidden" id="before_empno_<%=i%>" name="before_empno_<%=i%>" value="<%=rMap.get("EMPNO")%>">
			 <%="&nbsp;"+rMap.get("EMP_NAME").toString()+"&nbsp;"+rMap.get("EMP_LEVEL").toString()%>
	</div>
<%
		}
	}else{
		out.print("선택된 사원이 없습니다.");
	}	
%>
</div>
</body>
</html>