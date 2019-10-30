<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.util.PageBar" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
	String msg = (String)request.getAttribute("msg");
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <%@ include file="/common/bootStrap4.jsp" %>
    <%@ include file="/common/styles.jsp" %>
    <title>was</title>
  <%@ include file="/common/bs_css.jsp"%>
  <script type="text/javascript">
  	function close_modal(){
  		location.href="/erp/HRmain.was";
  	}
  </script>
  </head>
  <body>
  <script type="text/javascript">
  $(document).ready(function(){
	 $("#notOrderWriter").show();
  });
  </script>
  <div class="container-fluid" >
	<div class="row">
	   <div style="width:20%">
	      <%@ include file="/common/MenuCommon.jsp"%>
		 <!-- ======================================================================================================================================================================= -->
		 <!-- 															여기부터 내영역																					 -->
		 <!-- ======================================================================================================================================================================= -->
	  </div>
	<div style="width:80%; height :969px;" >
	</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="notOrderWriter" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
           <h6 style="display:inline;font-weight:bold;font-size:large">접근 권한이 없습니다.</h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:close_modal()" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
	
	
		</div>  	
	</div>
  </body>
</html>

