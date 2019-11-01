<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.text.DecimalFormat" %>        
    <!-- 190919 -->
<%
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
	String s_emp_no = null;
	String s_emp_pw = null;
	String s_emp_name = null;
	String s_outtime = null;//아직 프로시저 수정 중
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
	if(session.getAttribute("s_emp_no")!=null && session.getAttribute("s_emp_pw")!=null
		&& session.getAttribute("s_emp_name")!=null && session.getAttribute("s_outtime")!=null){
		s_emp_no = session.getAttribute("s_emp_no").toString();
		s_emp_pw = session.getAttribute("s_emp_pw").toString();
		s_emp_name = session.getAttribute("s_emp_name").toString();
		s_outtime = session.getAttribute("s_outtime").toString();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function Attendance(){
		$.ajax({
			type : "get"
			,url : "/erp/wasEmpAttendance.was"
	  	    ,data : "empno=<%= s_emp_no%>"
	  	    ,success:function(data){
	  	    	var jsonDoc = data;
	  	    	if(jsonDoc.length>0){
	  	    		for(var i =0;i<jsonDoc.length;i++){
		  	    		$("#d_AttendanceDate").text(jsonDoc[i].rdate);
		  	    		$("#d_AttendanceContent").text(jsonDoc[i].result);
		  	    		$("#d_AttendanceModal").modal();	
	  	    		}
	  	    	}
	  	    }
		});
	}
	function f_EmpLoginSend(){
		$("#f_EmpLogin").submit();
	}
	function f_ProductListSend(){
    	$("#f_ProductList").submit();
	}	
	function f_empAdd(){
    	$("#f_empAdd").submit();
	}
	function f_empStatus(){
		$("#f_empStatus").submit();
	}
	function f_salesGraph(){
		$("#f_salesGrapg").submit();
	}
	//급여화면 접근가능 확인 함수
	function HRcatch_Access(){
    	$("#f_HRAccess").submit();
	}	
	//급여조회 입장 함수
	function HRsal_select_f(){
    	$("#HRsal_select_f").submit();
	}	
	//기안문서 조회 입장 함수
	function f_draft_sel(){
    	$("#f_draft_sel").submit();
	}	
</script>
<style type="text/css">
 #d_button{
 	width : 100%;
 	text-align-last: center;
 	background-color:#383E49;
 }
</style>
</head>
<body>
	  <form id="f_empStatus" action="/erp/wasEmpStatus.was" method="post">
	  <%DecimalFormat df = new DecimalFormat("00");
		Calendar currCal = Calendar.getInstance();
		String empStatus_year = df.format(currCal.get(Calendar.YEAR));
		String empStatus_month = df.format(currCal.get(Calendar.MONTH)+1); 
	   %>
	  <%
	  	if(s_emp_no!=null){
	  		
	  %>
			<input type="hidden" value=<%= s_emp_no %> name="empno">
			<input type="hidden" value="1" name="calendar_bungi">
			<input type="hidden" value=<%= empStatus_year %> name="empStatus_year">
			<input type="hidden" value=<%= empStatus_month %> name="empStatus_month">
	  <%
	  	}
	  %>
	  </form>	
	  <form id="f_ProductList" action="/erp/productList.was" method="get">
	  </form>
	  <form id="f_empAdd" action="/erp/empListSignUp.was" method="get">
	  </form>
	  <form id="f_salesGrapg" action="/erp/salesMainSelect.was" method="get">
	  		<input type="hidden" value="1" name="gap"> 
	  </form>
	  <!-- 급여 조회 접근할때 -->
	  <form id="HRsal_select_f" action="/erp/HRsal_select_f" method="post">
	  <%
	  	if(s_emp_no!=null && s_emp_pw!=null){
	  %>
					<input type="hidden" value=<%= s_emp_no %> name="empno">
	  <%
	  	}
	  %>
	  </form>
	  <!-- 기안문서 조회시 내문서만 가져와야하기 때문에 추가생성-->
	  <form id="f_draft_sel" action="/erp/draft_selectText" method="post">
	  <%
	  	if(s_emp_no!=null && s_emp_pw!=null){
	  %>
					<input type="hidden" value=<%= s_emp_no %> name="empno">
	  <%
	  	}
	  %>
	  </form>
	  </form>
	 
	  <form id="f_EmpLogin"action="/erp/wasLogin.was" method="post">
	 
	  <%
	  	if(s_emp_no!=null && s_emp_pw!=null){
	  %>
					<input type="hidden" value=<%= s_emp_no %> name="empno">
					<input type="hidden" value=<%= s_emp_pw %> name="emp_pw">
					<input type="hidden" value="1" name="gap">
	  <%
	  	}
	  %>
	  </form>
          <div style="height:13%;width:90%;">
              <a href="javascript:f_EmpLoginSend()" ><img src="/erp/images/logo.png" style="width: 100%; height: 100%;vertical-align:middle;"></a>   
           </div>
       <div  style="height:10%;width:90%;">
       	<div id="d_button"><button type="button" class="btn btn-dark btn-sm" onClick="location.href='index.jsp'"style="width:70px;text-align: center;font-size: small;">로그아웃</button></div>	
          <div style="height:100%;background-color:#383E49; color:#FFFFFF; text-align: center;">
                          반갑습니다, <strong> 
             <%
             if(s_emp_name!=null){
            	out.print(s_emp_name);             	 
             }
             %>
             </strong>님
            <h6>최근 접속 시간은&nbsp;<%if(s_outtime!=null)out.print(s_outtime); %></h6>
         </div>
   </div>
   <div style="height: 77%;width:90%;">
    <div style="background-color:#383E49; height:100%; color:#FFFFFF">
       <ul class="nav flex-column">
            <div class="list-group" style="background-color: #383E49">
            <button type="button" class="btn btn-dark" onClick="Attendance()"style="text-align: center;font-size: large;">출근입력</button>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major" style="width:100%;text-align: center;font-size: large;">생산/품질관리</button>
               <div id="major" class="collapse">         
                  <a href="general_invenList" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">자산구매신청/조회</a>
                  <a href="javascript:f_ProductListSend()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">생산품등록/조회</a>
                  <a href="delivery_List" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처조회</a>
                  <a href="deliveryInsert_ListF" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처등록</a>
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major2" style="width:100%;text-align: center;font-size: large;">영업/매출관리</button>
               <div id="major2" class="collapse">
                  <a href="javascript:f_salesGraph()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">매출현황</a>
                  <a href="/erp/HRSalery_insert" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">급여등록</a>
                  <a href="javascript:HRsal_select_f()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">급여조회</a>
                  
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major3" style="width:100%;text-align: center;font-size: large;">인사관리</button>
               <div id="major3" class="collapse">
                  <a href="javascript:f_empAdd()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">사원등록/조회</a>
                  <a href="javascript:f_empStatus()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">근태/일정관리</a>
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major4" style="width:100%;text-align: center;font-size: large;">전자결재</button>
               <div id="major4" class="collapse">
                  <a href="/erp/draftMain" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">기안서 작성</a>
                  <a href="javascript:f_draft_sel()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF; text-align: center">문서보관함</a>
               </div>     
            </div>
         </ul> 
    </div>
     </div>
<!-- 출근입력 모달창 구현  -->
<div class="modal fade" id="d_AttendanceModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">출근입력결과</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
	      <div id="d_AttendanceDate" style="font-weight: bold;">시간</div>
	      <div id="d_AttendanceContent">결과</div>
	  </div>    
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>