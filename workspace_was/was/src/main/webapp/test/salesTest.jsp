<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>  
<%

		int size = 0;
		List<Map<String,Object>> gList = 
		      (List<Map<String,Object>>)request.getAttribute("gList");
		Map<String,Object> gMap = (Map<String,Object>)request.getAttribute("gMap");
		if(gList !=null && gList.size()>0){
		   size = gList.size();
		}
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAS,AQUA - 매출현황</title>
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script type="text/javascript">
//현재 년도 가져와서 담는 변수
var thisDate = new Date();
var thisYear = thisDate.getFullYear();
var thisMonth = thisDate.getMonth()+1;
//기간 선택 후 담을 변수
var selectDate_1;
var selectDate_2;
//날짜 이동
var pre_year;
var next_year
var pre_month;
var next_month;

	///////////////////////// 년도  //////////////////////////
	// (금년) < 버튼 클릭시 
	function preYear(){
		pre_year = thisYear-1;
		alert(pre_year);
	}
	// (금년) > 버튼 클릭시 
	function nextYear(){
		next_year = thisYear+1;
		alert(next_year);
	}
	// 금년 버튼 클릭시 
	function todayYear() {
		alert(thisYear);
	}
	///////////////////////// 월별  //////////////////////////
	// 금월 버튼 클릭시 
	function todayMonth() {
		alert(thisMonth);
	}
	// (금월) < 버튼 클릭시 
	function preMonth(){
		pre_month = thisMonth-1;
		alert(pre_month);
	}
	// (금월) > 버튼 클릭시 
	function nextMonth(){
		next_month = thisMonth+1;
		alert(next_month);
	}
	///////////////////////// 기간선택  //////////////////////////
	function selectDate(){
		selectDate_1 = $("#sales_date_1").val();
		selectDate_2 = $("#sales_date_2").val();
		alert(selectDate_1+" - "+selectDate_2);
		
	}

</script>
<style type="text/css">
	input[id=btn_search] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}

</style>
</head>
<body>
<div class="container-fluid">
<div class="row">
<div style="width:20%">
	 <%@ include file="/common/MenuCommon.jsp" %>
</div>
<!-- ==================================================  본 화면 78% ================================================== -->
<div style="width:78%">
  <div class="card bg-dark text-white" style="height:50px;margin-top:70px;">
  <div class="card-body" style="height:30px;">매출현황</div>
  </div>
	    <!-- ========================================검색창 ================================ -->
  <div id="box">
  <table>
     <thead>
      <th>
        	<td>
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
           <td>
             <td style="width:15%"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preYear()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayYear()">금년</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextYear()">></button>
				</div>
 			</td>
           </td>
           <td>
              <td style="width:15%;margin-right:4px;"> 
				<div class="btn-group">
				    <button type="button" class="btn btn-dark" onClick="javascript:preMonth()"><</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:todayMonth()">금월</button>
				    <button type="button" class="btn btn-dark" onClick="javascript:nextMonth()">></button>
				</div>
 			</td>
           </td>
        </th>
        <th style="padding-right: 5px;">
        	<td>
        		<i class='fas fa-calendar-check' style='font-size:30px'></i>
        	</td>
        </th>
        <th>
           <td>
              <input type="date" id="sales_date_1" class="form-control">
           </td>
           <td style="padding-left:5px;padding-right:5px;"><i class="fas fa-minus-square" style="font-size:36px" valign="center"></i></td>
           <td>
              <input type="date" id="sales_date_2" class="form-control">
           </td>
           <td style="padding-left:5px;"><input id="btn_search" type="submit" value="조회" onClick="javascript:selectDate()"></td>
        </th>
     </thead>
  </table>
  </div>
  </div>
  </div>
    <!-- ========================================검색창 메인모양================================ -->
	 <table id="t_gList" class="table table-striped">
    <thead>
      <tr>
      	<th><input id="checkall" type="checkbox" ></th>
        <th>사원번호</th>
        <th>사원명</th>
        <th>부서명</th>
        <th>핸드폰번호</th>
      </tr>
    </thead>
    <tbody>
<%
   if(size==0){
%>    
       <tr>
          <td colspan="6">조회 결과가 없습니다.</td>
       </tr>
<%
   }
   else if(size>0){
	   for(int i=0;i>size;i++){
		   if(size == i) break;
		   Map<String,Object> rMap = gList.get(i);
%>
		<tr>
			<td>
				<input id="checkbox" name="checkbox" type="checkbox" onClick="targetDel('<%=rMap.get("EMPNO")%>')">
			</td>
			
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empno<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMPNO") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_deptname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("DEPT_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_emphp<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_HP") %></td>
			
		</tr>
<% 
	   }
   }
%>      
    </tbody>
  </table>
	
	
</div>	
</body>
</html>