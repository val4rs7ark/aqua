<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %> 
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
	List<Map<String,Object>> deliveryList = (List<Map<String,Object>>)request.getAttribute("deliveryList");
	if(deliveryList!=null){
		size = deliveryList.size();
	}	
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 8;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	String pagePath = "/erp/delivery_List";
	PageBar pb = new PageBar(numPerPage,size,nowPage,pagePath);
	String pagination = null;
	pagination = pb.getPageBar();
	out.print(pagination);
%>