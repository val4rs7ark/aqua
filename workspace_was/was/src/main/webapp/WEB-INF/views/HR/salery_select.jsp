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
    <title>Bootstrap 4</title>
  <%@ include file="/common/bs_css.jsp"%>
  <script type="text/javascript">
  </script>
  </head>
  <body>
  <script type="text/javascript">
  </script>
  <div class="container-fluid" >
	<div class="row">
	   <div style="width:20%">
	      <%@ include file="/common/MenuCommon.jsp"%>
		 <!-- ======================================================================================================================================================================= -->
		 <!-- 															여기부터 내영역																					 -->
		 <!-- ======================================================================================================================================================================= -->
	  </div>
	<div style="width:80%" >
	<div class="container" style="margin-left: 0px;">
	<div class="base_table_div" style="width: 1350px; border:none;height: 979px;">
	<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<div style="margin-top:20px;font-size: 17px; font-weight: 900; padding-left: 26px">
    	영업/매출관리 > 급여 조회
  	</div>
<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<!--================================상단바===========================================-->
		<div class="card bg-dark text-white" style="height:50px; margin-top:7px">
	    	<div class="card-body">급여 등록</div>
	  	</div>
	  	<div class="row"></div>
	<!--================================상단바===========================================-->
	
	
	<!-- ======================================================================================================================================== -->
	<form id="f_bs_search">
		<table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
		    <thead>
		      <tr>
		        <th style="width: 100%; height:50px; border-top-width: 10px;border-top-color: white;">
				</th>
		      </tr>
	    	</thead>
	  	</table>
	</form>
	<!-- ===================================================================================================================================================== -->

	  
		<div class="container" style="margin-left: 0px; margin-right: 0px;">
			<div class="row" style="margin-top:15px; width:1340px;">
				<div class="container" style="margin-left: 0px; margin-right: 0px;">
					<div class="row" style="width:1330px;">
				       
					</div>  
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
  </div>
</div>

<!-- ============================================================================================================================================= -->
<!-- ===============================================================사원 검색창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="container">

	<div class="modal" id="emp_imfo">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" ">
			<div class="modal-content" style="height: 500px;">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title">
					<!--var companyname = $("#밑에놈 아이디").text(); search.do?compay  -->
						<input id="search_emp_name" name="search_emp_name" type="text" class="form-control" placeholder="사원이름을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" type="button" onclick="javascript:seach_emp_name()">검색</zealot>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;" id="search_name_after" name="search_name_after">
						<thead>
							<tr>
								<th style="width:150px;">사번</th>
								<th style="width:150px;">이름</th>
								<th style="width:150px;">소속</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(r_list!=null){
								for(int i=0;i<r_list.size();i++){
									Map<String,Object> rMap = r_list.get(i);
										if(!"임시".equals(rMap.get("EMP_LEVEL").toString())){
						%>
										<tr>
											<td>
												<a href="javascript:select_empno('<%=rMap.get("EMPNO").toString()%>','jungkyu')" style="color:black;" >
													<%=rMap.get("EMPNO")%>
												</a>
											</td>
											<td>
												<%=rMap.get("EMP_NAME") %>
											</td>
											<td>
												<%=rMap.get("EMP_SOSOC") %>
											</td>
										</tr>
						<%
										}
								}
							}
						%>
						</tbody>
					</table>
				</div>
				
				<!-- 클로즈 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================사원 검색창================================================================= -->
<!-- ============================================================================================================================================= -->

	
	</div>  	
  </body>
</html>

