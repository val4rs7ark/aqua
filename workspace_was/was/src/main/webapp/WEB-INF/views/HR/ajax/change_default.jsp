<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
	Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("pMap");
	String gubun = (String)rMap.get("r_gubun");
%>
<%
	if("jungkyu".equals(gubun)){
%>
<input id="sal_default" name="sal_default" type="text" class="form-control" value="<%=rMap.get("emp_sal")%>" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;"  onchange="getNumber(this)" onkeyup="getNumber(this)" readonly>&nbsp;원
<%
	}else{
%>			
<input id="sal_default_one" name="sal_default_one" type="text" class="form-control" value="<%=rMap.get("emp_sal")%>" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;"  onchange="getNumber(this)" onkeyup="getNumber(this)" readonly>&nbsp;원
<%
	}
%>											