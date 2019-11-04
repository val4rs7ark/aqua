<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<<<<<<< Updated upstream
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	  crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"/></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"/></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src='//openweathermap.org/themes/openweathermap/assets/vendor/owm/js/d3.min.js'></script>
=======
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
>>>>>>> Stashed changes

<title>WAS·AQUA</title>
<script type="text/javascript">
      $(document).ready(function() {
         
         function boardList(){
            //alert('boardList 호출 성공');
            
         }
      /* ============================================================================날씨api============================================================================ */
         var apiURI = "https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=adc26b64b293df9d37b85f4970fd1fee";
         $.ajax({
            url : apiURI,
            dataType : "json",
            type : "GET",
            async : "false",
            success : function(resp) {
                  var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
                  var where_name = resp.name;
                  if ("Seoul" == where_name) {
                     where_name = "서울";
                  } else if ("Busan" == where_name) {
                     where_name = "부산";
                  }
                  var where_country = resp.sys.country
                  if ("KR" == where_country) {
                     where_country = "대한민국";
                  }
                  $("#weather").attr("src", imgURL);
                  $("#Temperature").val(
                     Math.round((resp.main.temp - 273.15) * 10)/ 10.0+ "ºC");
                  $("#where_c").val(
                     where_country + "/"+ where_name);
                  var wind_hyang = resp.wind.deg; //방향
                  $("#wind_hyang").val(
                        wind_hyang + "º");
                  var wind_power = resp.wind.speed; //속도
                  $("#wind_power").val(
                        wind_power + "m/s");
                  var cloud_info = resp.clouds.all; //구름
                  $("#cloud_info").val(cloud_info);
                  }
               });
      });
      //캘린더 호출 함수
      function load_calendar(){
			var empno = $("#cal_empno").val();
			var calendar_bungi = $("#cal_calendar_bungi").val();
			var empStatus_year = $("#cal_empStatus_year").val();
			var empStatus_month = $("#cal_empStatus_month").val();
			
    	  $.ajax({
    		 method: "get",
    		 url: "/erp/wasEmpStatus_main.was?empno="+empno+"&calendar_bungi="+calendar_bungi+"&empStatus_year="+empStatus_year+"&empStatus_month="+empStatus_month ,
    		 success:function(data){
    			 $("#small_calendar").html(data);
    		 }
    	  });
    	  $.ajax({
    		 method: "get",
    		 url: "/erp/wasEmp_birth",
    		 success:function(data){
    			 $("#emp_birth").html(data);
    		 }
    	  });
    	  $.ajax({
    		 method: "get",
    		 url: "/erp/wasTo_day",
    		 success:function(data){
    			 $("#wasTo_day").html(data);
    			 $("#d_curday").html(data);
    		 }
    	  });
    	  $.ajax({
    		 method: "get",
    		 url: "/erp/wasMain_schedule?empno="+empno,
    		 success:function(data){
    			 $("#main_schedule").html(data);
    		 }
    	  });
      }
	    //급여조회 입장 함수
	  	function HRsal_select_f(){
	      	$("#HRsal_select_f").submit();
	  	}	
	    //글작성 
		function board_writher(){
			/* var ret = window.open(url, name, specs, replace);*/
			var wri = window.open('boardAdd.jsp','공지사항 작성','width=800,height=500')
		}
</script>
</head>
<body onload="javascript:load_calendar()">

<div class="container-fluid">
<div class="row">
   <div style="width:20%">
       <%@ include file="/common/MenuCommon.jsp" %>
  </div>
  
   <div style="width:80%; height: 969px; ">
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
   <div class="container" style="margin-left: 20px; margin-right: 0px;">
<!-- =========================================================================공지사항========================================================= -->
      <form id="boardList" action="/erp/boardList" method="get">
           
         <table style="width: 90%;">
           <tr>
              <td style="width: 690px;">
                <table class="table table-hover" id="bo_List" style="width: 650px; margin-top: 57px; margin-bottom: 1px; 
                       border-bottom: 1px solid #dee2e6;">
	           		<div>
			            <h4 style="margin-top: 50px;">사내 공지사항</h4>      
		          	</div>
				    <p style="margin-bottom: 0px;">
						<MARQUEE>10월 생일자 : <b id="emp_birth" style="font-weight: 900;"></b> 생일 축하합니다.</MARQUEE>
				    </p>
				    <div>
					    <button type="button" class="writer" style="float: right;
					            margin-right: 40px; margin-top: 25px;" onClick="javascript:board_writher()">글쓰기</button>
				    </div>
                     <tr style="height:40px; background-color:#dee2e6; 
                          color:black; font-size:17px; margin-top: 50px; text-align:center;">
                       <th style="width:15%;padding-top: 5px;padding-bottom: 5px;">번호</th>
                       <th style="width:36%;padding-top: 5px;padding-bottom: 5px;">제목</th>
                       <th style="width:20%;padding-top: 5px;padding-bottom: 5px;">작성자</th>
                       <th style="width:30%;padding-top: 5px;padding-bottom: 5px;">작성일</th>
                     </tr>
                     <tbody>
<%
      List<Map<String,Object>> boardList = new ArrayList<>(); 
      boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
      int size = boardList.size();
      if(size==0){
%>    
                      <tr>
                         <td colspan="5">조회결과가 없습니다.</td>
                      </tr>
         <%
            }
            else if(size>0){
               for(int i=0;i<size;i++){
                  if(size == i) break;
                  
                  Map<String,Object> rMap = boardList.get(i);
         %>
                  <tr>
                    <td style="text-align:center;"><%=rMap.get("BO_NO") %></td>
                    <td style="text-align:center;"><%=rMap.get("BO_TITLE") %></td>
                    <td style="text-align:center;"><%=rMap.get("EMP_NAME") %></td>
                    <td style="text-align:center;"><%=rMap.get("BO_DATE") %></td>
                  </tr>
         <% 
               }
            }
         %> 
                </tbody>
     		</table>
           </td>
           <td>
            	<div>
            	<!-- ================================================================================== -->
	<div style="text-align: -webkit-center; width: 100%; height: 240px; border-radius: 20px 20px 20px 20px/20px 20px 20px 20px; 
		 	 background-size: cover;">
		<table style="margin-top: 40px;">
			<tr>
				<td style="display: inline;">
					<table>
						<tr>
							<td style="width: 100%"><input id="where_c" type="text"
								style="border: none; width: 100%; text-align: center; background-color: transparent; font-weight: 900;">
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="text-align: center;"><img id="weather" alt="날씨"
								src="" style="width: 90px;"></td>
							<td><input id="Temperature" type="text"
								style="border: none; width: 130px; text-align: center; font-size: 48px; font-family: fantasy; background-color: transparent;">
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="text-align: center;">
							<img id="img_wind_hyang"
								alt="방향" style="width: 30px;"
								src="/erp/images/navigation_black.png">
							</td>
							<td style="text-align: center;">
							<img id="img_wind_power"
								alt="바람" style="width: 30px;" src="/erp/images/toys_black.png">
							</td>
							<td style="text-align: center;">
							<img id="img_cloud_info"
								alt="구름" style="width: 30px;" src="/erp/images/cloud_black.png">
							</td>
						</tr>
						<tr>
							<td><input id="wind_hyang" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
							<td><input id="wind_power" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
							<td><input id="cloud_info" type="text"
								style="border: none; width: 80px; text-align: center; background-color: transparent;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>


            	<!-- ================================================================================== -->
               </div> 
            	<table style="border: 1px solid #E4E4E4; width: 100%;">
            		<tr>
            			<td colspan="2" style="border-bottom: 1px solid #E4E4E4; background-color: #dee2e6;font-size: 13px; font-weight: bold; padding-left: 20px; height: 20px;">
		      			 	※&nbsp;&nbsp;바로가기 
		      			</td>
            		</tr>
            		<tr>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="javascript:HRsal_select_f()" style="color:black;">급여조회</a></td>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="/erp/salesMainSelect.was?gap=1" style="color:black;">매출조회</a></td>
            		</tr>
            		<tr>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="/erp/productList.was" style="color:black;">생산품조회</a></td>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="general_invenList" style="color:black;">자산구매조회</a></td>
            		</tr>
            		<tr>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="delivery_List" style="color:black;">배송조회</a></td>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="deliveryInsert_ListF" style="color:black;">배송등록</a></td>
            		</tr>
            		<tr>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="/erp/empListSignUp.was" style="color:black;">사원등록</a></td>
            			<td style="font-size: 13px; padding-left: 15px; padding-top: 5px; font-family: 돋움;height: 33px;">⊙&nbsp;<a href="/erp/draftMain" style="color:black;">기안서 작성</a></td>
            		</tr>
            	</table>
            
           </td>
        </tr>
     </table>   
   </form>
<!-- ===========================================================공지사항==========================================================  --> 
<!-- ===========================================================table=========================================================== -->
    
      <table style="width: 91%; border: 1px solid #E4E4E4; margin-top: 40px;">
	      <tr>
		      <td colspan="2" style="border-bottom: 1px solid #E4E4E4; background-color: #dee2e6;font-size: 15px; font-weight: bold; padding-left: 20px; height: 30px;">
		      	<a href="javascript:f_empStatus()" style="color:black;">일정</a> 
		      </td>
	      </tr>
	      <tr id="sc">
		      <td style="width:350px;">
			      <div id="small_calendar" >
				  </div>
		      </td>
		      <td style="width: 360px;vertical-align: text-top; padding-top: 17px;font-weight: 700; padding-left: 20px;">
			      	◎ <b id="wasTo_day"></b> 일정  
			      	<!-- <button type="button"  class="btn btn-secondary" style="width: 73px; margin-left: 10px; height: 22px; font-size: 12px; padding-top: 1px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px; background-color: #efefef; color: black; font-weight: 900;" data-toggle="modal" data-target="#memo_Modal">일정추가</button> -->				 
			      	 <div id="main_schedule" style="margin-top: 30px;	margin-left: 20px;">
					  등록된 일정이 없습니다.
				  </div>
		      </td>
	      </tr>
      </table>
<!-- ===========================================================table=========================================================== -->
<!-- ==========================================일정표========================================= -->
 <div>
 
	  <%
	  	if(s_emp_no!=null){
	  		
	  %>
			<input type="hidden" value=<%= s_emp_no %> id="cal_empno" name="cal_empno">
			<input type="hidden" value="1" id="cal_calendar_bungi" name="cal_calendar_bungi">
			<input type="hidden" value=<%= empStatus_year %> id="cal_empStatus_year" name="cal_empStatus_year">
			<input type="hidden" value=<%= empStatus_month %> id="cal_empStatus_month" name="cal_empStatus_month">
	  <%
	  	}
	  %>
	  </div>	

<!-- =======================================일정표====================================================== -->
      </div><!-- end of right-area -->
      </div><!-- end of in_container -->
   </div><!-- end of outter row -->
</div><!-- end of container -->
</body>
</html>