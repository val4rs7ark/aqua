<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>      
<%
	List<Map<String,Object>> jsonList = (List<Map<String,Object>>)request.getAttribute("attendanceJson");
	if(jsonList!=null){
		out.print(jsonList.get(0).get("gSon"));
	}
%>