<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	  <form id="f_empStatus" action="/erp/wasEmpStatus.was" method="post">
	  <%
	  	if(s_emp_no!=null){
	  %>
					<input type="hidden" value=<%= s_emp_no %> name="empno">
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
          <div>
              <a href="javascript:f_EmpLoginSend()" width="300px"><img src="/erp/images/logo.png" style="width: 300px; max-width: 760px; vertical-align: middle"></a>   
           </div>
      </div>
       <div class="row">
          <div style="background-color:#383E49; width:300px; height:90px; color:#FFFFFF; text-align: center;">
             <p>반갑습니다, <strong> 
             <%
             if(s_emp_name!=null){
            	out.print(s_emp_name);             	 
             }
             %>
             </strong>님</p>
            <h6>최근 접속 시간은&nbsp;<%if(s_outtime!=null)out.print(s_outtime); %></h6>
         </div>
   </div>
   <div class="row">
    <div style="background-color:#383E49; width:300px; height:900px; color:#FFFFFF">
       <ul class="nav flex-column">
            <div class="list-group" style="width:300px; background-color: #383E49">
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major" style="width:300px;text-align: center;font-size: large;">생산/품질관리</button>
               <div id="major" class="collapse">         
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">품목조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">재고등록</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">재고조회</a>
                  <a href="javascript:f_ProductListSend()" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">생산품등록/조회</a>
                  <a href="registerCustomer.jsp" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">거래처등록/조회</a>
                  <a href="delivery_List" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처조회</a>
                  <a href="deliveryInsert_ListF" class="list-group-item list-group-item-action" style="background-color: #434a57; color:#FFFFFF;text-align: center">배송처등록</a>
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
</body>
</html>