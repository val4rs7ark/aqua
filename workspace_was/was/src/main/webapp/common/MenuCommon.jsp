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
</script>
<style type="text/css">
 #d_button{
 	width : 300px;
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
          <div class="row">
              <a href="javascript:f_EmpLoginSend()" width="300px"><img src="/erp/images/logo.png" style="width: 300px; max-width: 760px; vertical-align: middle"></a>   
           </div>
       <div class="row">
       	<div id="d_button"><button type="button" class="btn btn-dark btn-sm" onClick="location.href='index.jsp'"style="width:70px;text-align: center;font-size: small;">로그아웃</button></div>	
          <div style="background-color:#383E49; width:300px; height:90px; color:#FFFFFF; text-align: center;">
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
   <div class="row">
    <div style="background-color:#383E49; width:300px; height:900px; color:#FFFFFF">
       <ul class="nav flex-column">
            <div class="list-group" style="width:300px; background-color: #383E49">
            <button type="button" class="btn btn-dark" onClick="Attendance()"style="width:300px;text-align: center;font-size: large;">출근입력</button>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major" style="width:300px;text-align: center;font-size: large;">생산/품질관리</button>
               <div id="major" class="collapse">         
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">품목조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">재고등록</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">재고조회</a>
                  <a href="javascript:f_ProductListSend()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">생산품등록/조회</a>
                  <a href="registerCustomer.jsp" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">거래처등록/조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처등록</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">근태조회</a>
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major2" style="width:300px;text-align: center;font-size: large;">영업/매출관리</button>
               <div id="major2" class="collapse">
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">매출</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">급여</a>
                  
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major3" style="width:300px;text-align: center;font-size: large;">인사관리</button>
               <div id="major3" class="collapse">
                  <a href="javascript:f_empAdd()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">사원등록/조회</a>
                  <a href="javascript:f_empStatus()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">출퇴근</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">휴가</a>
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