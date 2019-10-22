<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = "";
	String pid_code = "";
	if(request.getAttribute("result").toString()!=null){
		result = request.getAttribute("result").toString();
	}
	pid_code = request.getAttribute("pid_code").toString();
	out.print(result);
	out.print(pid_code);
%>
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
      	<div style="display:table-cell;vertical-align:middle;text-align:center;">
      		<img style="heigth:20px;width:20px;margin-bottom:8px"src="/erp/images/warning-black.png" alt="주의:">
<%
	out.print(result);
	out.print(pid_code);
	if(result==pid_code){
%>      		
        	<h6 style="display:inline;font-weight:bold;font-size:large">이미 사용중인 품목코드입니다.</h6>
<%
	}else{
%>        	
			<h6 style="display:inline;font-weight:bold;font-size:large">사용가능한 품목코드입니다.</h6>
<%
	}
%>				
      	</div>	
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>