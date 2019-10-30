<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%
	List<Map<String,Object>> empStatusList = (List<Map<String,Object>>)request.getAttribute("wasEmpStatus");
if(empStatusList!=null && empStatusList.size()>0){
String calendar_empno = empStatusList.get(empStatusList.size()-1).get("empno").toString();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  	<script type="text/javascript">
  		var v_note_no;
  		var v_yyyy;
  		var v_mm;
  		var v_dd;
  		function noteDelete(){
  			$.ajax({
  				type : "get"
  			   ,url : "/erp/wasEmpStatusNoteDelete.was"
  			   ,data : "note_no="+v_note_no
  			   ,success:function(data){
	  					   //alert를 대신하여 썼다.
	  					   $("#d_insertResultModal").text(data);
	  					   $("#insertResultModal").modal();
	  				//이 메소드를 타면 2.5초 뒤 location.reload();를 실행한다.
				 	setTimeout(function() {
				 		location.reload();
					}, 2500);
  			   }
  			});
  		}
  		function deleteSelect(note_no){
  			v_note_no = note_no;
  			$("#deleteSelect").modal();
  		}
  		function memoForm(yyyy,mm,dd){
  				v_yyyy = yyyy;
  				v_mm = mm;
  				v_dd = dd;
  				$("#d_curday").text(yyyy+"년"+mm+"월"+dd+"일");
  			    $("#myModal").modal();
  		}
  		function moAdd(){
  			var encoding = $("#noteContent").val();
  			var note_content = encodeURIComponent(encoding);
  			var note_write_date = v_yyyy+"-"+v_mm+"-"+v_dd;
  			$.ajax({
  				type : "get"
  			   ,url : "/erp/wasEmpStatusNoteInsert.was"
  			   ,data : "note_write_date="+note_write_date+"&note_content="+note_content+"&empno=<%= calendar_empno%>"
  			   ,success:function(data){
	  				   var jsonDoc = JSON.parse(data);
	  				   if(jsonDoc.length>0){
	  					   //alert를 대신하여 썼다.
	  					   $("#d_insertResultModal").text(jsonDoc[0].noteInsertResult);
	  					   $("#insertResultModal").modal();
	  				   }
	  				//이 메소드를 타면 2.5초 뒤 location.reload();를 실행한다.
				 	setTimeout(function() {
				 		location.reload();
					}, 2500);
  			   }
  			});
  		}
  		function noteDetail(yyyy,mm,dd){
  			$.ajax({
  				type : "POST"
  			   ,url : "/erp/wasEmpStatusNoteDetail.was"
  			   ,data : "gap=1&empStatus_year="+yyyy+"&empStatus_month="+mm+"&empStatus_day="+dd+"&empno=<%=calendar_empno%>"
  			   ,success:function(data){
  				   $("#d_noteDetail").html(data);
  				   $("#myNote").modal();
  			   }
  			});
  		}
  		function calendarMPrev(y,m,empno){
  			$.ajax({
  				type : "POST"
  			   ,url : "/erp/wasEmpStatus.was"
  			   ,data : "gap=1&empStatus_year="+y+"&empStatus_month="+m+"&empno="+empno+"&bungi_month=prev"
  			   ,success:function(data){
  				   $("#calendarRow").html(data);
  			   }
  			});
  		}
  		function calendarMNext(y,m,empno){
  			$.ajax({
  				type : "POST"
  			   ,url : "/erp/wasEmpStatus.was"
  			   ,data : "gap=1&empStatus_year="+y+"&empStatus_month="+m+"&empno="+empno+"&bungi_month=next"
  			   ,success:function(data){
  				   $("#calendarRow").html(data);
  			   }
  			});
  		}
  		function calendarYPrev(y,m,empno){
  			$.ajax({
  				type : "POST"
  			   ,url : "/erp/wasEmpStatus.was"
  			   ,data : "gap=1&empStatus_year="+y+"&empStatus_month="+m+"&empno="+empno+"&bungi_year=prev"
  			   ,success:function(data){
  				   $("#calendarRow").html(data);
  			   }
  			});
  		}
  		function calendarYNext(y,m,empno){
  			$.ajax({
  				type : "POST"
  			   ,url : "/erp/wasEmpStatus.was"
  			   ,data : "gap=1&empStatus_year="+y+"&empStatus_month="+m+"&empno="+empno+"&bungi_year=next"
  			   ,success:function(data){
  				   $("#calendarRow").html(data);
  			   }
  			});
  		}
  	</script>
  	<style type="text/css">
  	#a_tag_YNext,#a_tag_YPrev,#a_tag_MNext,#a_tag_MPrev{
  		color:#000000;
  	}
  	</style>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
	int day[][][] = new int[12][6][7];
	String week[] = {"일","월","화","수","목","금","토"};
	//cyyyy에는 년도가 담겨있다. - 2019
	String cyyyy = empStatusList.get(empStatusList.size()-1).get("empStatus_year").toString();
	//달 정보는 0부터 11사이의 값이다.1~12
	String cmonth = empStatusList.get(empStatusList.size()-1).get("empStatus_month").toString();
	//배열은 0부터 시작하기 때문에 다시 -1을 주어서 index로 활용하기 위한 icmonth
	int icmonth = Integer.parseInt(cmonth)-1;
	for(int month=0;month<12;month++){
			cal.set(Calendar.YEAR, Integer.parseInt(cyyyy));
			//이번달 마지막 날짜 저장하기  ::Calendar 클래스에 저장하기 위한 for문
			cal.set(Calendar.MONTH,month);
			int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
			for(int i=1;i<=maxDay;i++){
				cal.set(Calendar.DATE,i);
				day[cal.get(Calendar.MONTH)]
						[cal.get(Calendar.WEEK_OF_MONTH)-1]
								[cal.get(Calendar.DAY_OF_WEEK)-1]=i;
			}
	}

%>
<div class="container-fluid " style="padding-left: 0; margin-left: 5px; margin-bottom: 5px;">
  <div id="calendarRow" style="width:100%">
<%	
		//계산한 카렌더 정보를 화면에 출력하기
	for(int month=0;month<12;month++){
	//12달 중에 오늘인 달 9월달	
	if(month==icmonth){
%>
<div style="font-size:30px;text-align:center;">
	<span style="padding:10px; font-size: 17px; color: gray; font-weight: 600;"><%=cyyyy %>년 <%=month+1 %> 월 </span>
</div>
<table class="border border-dark" align="center" border="1" width="100%"><tr class="text-light bg-dark">
<% 		
		for(int i=0;i<week.length;i++){
			//일 월 화 수 목 금 토
			out.print("<td align='center' width='170' height='30'>"+week[i]+"</td>");
		}
		out.print("</tr>");
		//날짜 출력하기
		for(int i=0;i<cal.get(Calendar.WEEK_OF_MONTH);i++){
			out.print("<tr>");
				//일주일 씩 출력하기
				int note_count = 0;
				int status_count = 0;
				for(int j=0;j<7;j++){
					//날짜정보를 가지고 있니??? 네! 트류
					if(day[month][i][j]!=0){
						out.print("<td align='right' width='30' height='50' valign='top'>");
						out.print("<table border='0' width='30' height='50'>");
						out.print("<tr><td align='right' height='23' style='vertical-align: top;'>"+day[month][i][j]+"</td></tr>");
						///////////////////상태 이모티콘 td에 추가하기///////////////
						///////////////////////출근 , 휴가 , 외출 등 그날 상태 정보 표시하기///////////////////
						int i_status_day = 0;
						int i_note_day = 0;
						for(int z =0;z<(empStatusList.size()-1);z++){
							Map<String,Object> rMap = empStatusList.get(z);
							if(rMap.get("STATUS_DAY")!=null){
								i_status_day = Integer.parseInt(rMap.get("STATUS_DAY").toString());
								if(day[month][i][j]==i_status_day){
									out.print("<tr><td><span class='badge badge-secondary'>출근</span></td>");
								}
							}
							if(rMap.get("STATUS_DAY")!=null){
								i_status_day = Integer.parseInt(rMap.get("STATUS_DAY").toString());
								if(day[month][i][j]==i_status_day){
									out.print("</tr>");
								}
							}
						}
						if(note_count==0){
							out.print("<tr><td height='5'></td></tr>");
						}
						if(status_count==0){
							out.print("<tr><td height='5'></td></tr>");
						}
						////////////////////////////////////////////////////
			/* +버튼을 추가하여 메모등록 구현해보기  */
						out.print("</table></td>");
					}else{
						out.print("<td>&nbsp;</td>");					
					}//end of if[공백처리]
					note_count = 0;
					status_count = 0;
				}/////end of inner ofr[주간일자]
				out.print("</tr>");
			}/////end of outter for[월별일자]
%>
</table>
<% 
		}///////////////////end of if[이번달 정보만 출력하기]
	}
}
%>
  </div>
</div>
</body>
</html> 