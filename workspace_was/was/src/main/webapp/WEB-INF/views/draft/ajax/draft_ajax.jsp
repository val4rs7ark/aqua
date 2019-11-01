<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String choice = (String)request.getAttribute("choice");
%>
<input type="text" id="emp_name_1" name="emp_name_1" style="border: none;width:100%;text-align: center;" value="<%=choice %>">