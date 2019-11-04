<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	String gubun = (String)request.getAttribute("gubun");
%>
<input id="search_keyword" type="text" style="display:inline;vertical-align:middle;font-size: 11px; color: black; width: 153px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
<input onclick="javascript:draft_search('<%=gubun%>')" type="button" value="Search" style="display:inline;vertical-align:middle;font-size: 13px;border-color: #797878;background:#a4a4a4;color: white; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">