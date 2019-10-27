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
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일정관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
<div class="container-fluid ">
<div class="row">
   <div style="width:20%;height:1050px;">
      <%@ include file="/common/MenuCommon.jsp" %>
  </div>
  <div id="calendarRow" style="width:72%">
  <div style="font-size:25px;text-align:center;"><%=cyyyy %></div>
<%	
		//계산한 카렌더 정보를 화면에 출력하기
	for(int month=0;month<12;month++){
	//12달 중에 오늘인 달 9월달	
	if(month==icmonth){
%>
<div style="font-size:70px;text-align:center;">
	<a id="a_tag_YPrev" style='font-size:35px;' href="javascript:calendarYPrev('<%=cyyyy%>','<%=cmonth%>','<%=calendar_empno%>')"><i class='fas fa-angle-double-left'></i></a>
	<span style="padding:20px;"></span>
	<a id="a_tag_MPrev" style='font-size:35px;' href="javascript:calendarMPrev('<%=cyyyy%>','<%=cmonth%>','<%=calendar_empno%>')"><i class='fas fa-angle-left'></i></a>
	<span style="padding:20px;"><%=month+1 %></span>
	<a id="a_tag_MNext" style='font-size:35px;' href="javascript:calendarMNext('<%=cyyyy%>','<%=cmonth%>','<%=calendar_empno%>')"><i class='fas fa-angle-right'></i></a>
	<span style="padding:20px;"></span>
	<a id="a_tag_YNext" style='font-size:35px;' href="javascript:calendarYNext('<%=cyyyy%>','<%=cmonth%>','<%=calendar_empno%>')"><i class='fas fa-angle-double-right'></i></a>
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
						out.print("<td align='right' width='150' height='70' valign='top'>");
						out.print("<table border='0' width='100%' height='100%'>");
						out.print("<tr><td align='right' height='23'>"+day[month][i][j]+"</td></tr>");
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
							if(rMap.get("NOTE_NO")!=null){
								i_note_day = Integer.parseInt(rMap.get("NOTE_DAY").toString());
								if(day[month][i][j]==i_note_day){
									if(note_count ==0){
										out.print("<td height='26'><a href='javascript:noteDetail("+cyyyy+","+(month+1)+","+day[month][i][j]+")'><span class='badge badge-secondary'>메모</span></a></td>");
										note_count ++;
									}
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
							out.print("<tr><td height='40'></td></tr>");
						}
						if(status_count==0){
							out.print("<tr><td height='40'></td></tr>");
						}
						////////////////////////////////////////////////////
			/* +버튼을 추가하여 메모등록 구현해보기  */
						out.print("<tr><td align='right' height='26'><a href='javascript:memoForm("+cyyyy+","+(month+1)+","+day[month][i][j]+")'>+</a></td></tr>");					
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
</div>
<!-- 메모를 등록하는 The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">메모 등록</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <form class="was-validated">	        	
          <div class="form-group">
          	<label><div id="d_curday">2019년9월20일</div></label>
          	<input type="text" class="form-control" id="noteContent" name="content" placeholder="내용 적기" required>
          	<div class="valid-feedback">Valid.</div>
          	<div class="invalid-feedback">메모를 작성하세요.</div>
          </div>
          <button type="button" class="btn btn-primary" onClick="moAdd()">등록</button>
        </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>  
 <!-- 메모를 등록하는 The Modal End  -->
 <!-- 메모 상세 페이지 The Modal --> 
 <div id="d_noteDetail">
<div class="modal fade" id="myNote">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">메모 상세 페이지</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div> 	
</div>
 <!-- 메모 상세 페이지 The Modal End-->
 <!-- 메모 등록 결과 페이지 The Modal -->
 <div class="modal fade" id="insertResultModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">등록결과</h4>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          	<div id="d_insertResultModal">결과</div>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <!-- 메모 등록 결과 페이지 The Modal --> 
  <!-- 메모 삭제 확인 페이지 The Modal -->
 <div class="modal fade" id=deleteSelect>
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">메모 삭제 페이지</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	메모를 삭제하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        <button type="button" onClick="noteDelete()"class="btn btn-danger" data-dismiss="modal">확인</button>
      </div>

    </div>
  </div>
</div> 	 
  <!-- 메모 삭제 확인 페이지 The Modal --> 
</body>
</html>