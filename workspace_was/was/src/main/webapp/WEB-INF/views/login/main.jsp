<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>

<title>WAS·AQUA</title>
<script type="text/javascript">
      $(document).ready(function() {
         
         function boardList(){
            alert('boardList 호출 성공');
            
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
      /* ============================================================================뉴스============================================================================ */
      function autoReload() {
          $.ajax({//$를 사용하려면jquery.min.js 임폴트 해주어야 한다. 
             method : "get",
             url : "/erp/common/news.jsp",
             success : function(result) {//result는 응답페이지의 출력문자열담김. 
             
             //innerHTML -> jtml()  jquery가 지원하는 api , innerText ->text(); jquery가 지원하는 api 
                $("#d_news").html(result);
             }
             ,fail:function(xhrObject, textStatus){
                alert( "Request failed: " + textStatus );
                alert(xhrObject.responseText);
             }
       });
     }
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
		//일정 추가 하는 함수
	  	function moAdd(){
  			var note_content = $("#noteContent").val();
  			var empno = $("#cal_empno").val();
  			location.href="/erp/wasMain_schedule_Memo?note_content="+note_content+"&empno="+empno;
  		}
</script>
</head>
<body>
<div class="container-fluid">
<div class="row">
   <div style="width:20%">
       <%@ include file="/common/MenuCommon.jsp" %>
  </div>
   <div style="width:80%">
   <div class="row" style="height: 100px;"></div>
         <%@ include file="/common/chartjs_bar.jsp" %>
      <div class="row">
         <!-- 공지사항 -->  
      <div id="notice" style="width: 700px;height: 500px;margin-top: 50px;">
          <h2>사내 공지사항</h2>
           <p>The .table-striped class adds zebra-stripes to a table:</p>            
           <table class="table table-striped">
             <thead>
                  <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>
                 <th>조회수</th>
                  </tr>
             </thead>
             <tbody>
                  <tr>
                    <td>3</td>
                    <td>2019년도 직원 건강검진 안내</td>
                    <td>김시성</td>
                    <td>2019-08-30</td>
                    <td>3</td>
                  </tr>
                     <tr>
                    <td>2</td>
                    <td>9월 사내행사 일정 안내</td>
                    <td>김희원</td>
                    <td>2019-08-29</td>
                    <td>7</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>임직원 영어교육비 지원안내</td>
                    <td>유종남</td>
                    <td>2019-08-23</td>
                    <td>12</td>
                  </tr>
             </tbody>
         </table>
      </div>
      </div>
   </div>
   </div>
   </div>
</body>
</html>