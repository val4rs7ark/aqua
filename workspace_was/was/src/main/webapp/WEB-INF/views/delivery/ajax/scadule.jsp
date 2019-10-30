<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	List<Map<String,Object>> schedule_List = (List<Map<String,Object>>)request.getAttribute("schedule_List");
	
	if(schedule_List.size()!=0){
		for(int i=0;i<schedule_List.size();i++){
			Map<String,Object> pMap = schedule_List.get(i);
			out.print("<div style='height: 45px;'>"+(i+1)+"."+"&nbsp;"+pMap.get("NOTE_CONTENT").toString()+"<br></div>");	
		}
	}else{
		out.print("등록된 일정이 없습니다.");
	}
%>
