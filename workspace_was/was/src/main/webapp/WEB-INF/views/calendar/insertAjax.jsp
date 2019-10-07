<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.Map" %>    
<%
	List<Map<String,Object>> gList = (List<Map<String,Object>>) request.getAttribute("noteInsertGson");
	Map<String,Object> gMap = gList.get(0);
	out.print(gMap.get("gson"));
%>