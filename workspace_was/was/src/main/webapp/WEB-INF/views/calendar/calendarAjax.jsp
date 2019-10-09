<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List, java.util.Map" %>
<%
	List<Map<String,Object>> empStatusAList = (List<Map<String,Object>>)request.getAttribute("wasEmpStatusA");
if(empStatusAList!=null && empStatusAList.size()>0){

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리[calendarUI.jsp]</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
  	<style type="text/css">
  	#a_tag_YNext,#a_tag_YPrev,#a_tag_MNext,#a_tag_MPrev{
  		color:#000000
  	}
  	</style>
</head>
<body>
<%
	String calendar_empno = empStatusAList.get(empStatusAList.size()-1).get("empno").toString();
	Calendar cal = Calendar.getInstance();
	int day[][][] = new int[12][6][7];
	String week[] = {"일","월","화","수","목","금","토"};
	//cyyyy에는 년도가 담겨있다. - 2019
	String cyyyy = empStatusAList.get(empStatusAList.size()-1).get("empStatus_year").toString();
	//달 정보는 0부터 11사이의 값이다.1~12
	String cmonth = empStatusAList.get(empStatusAList.size()-1).get("empStatus_month").toString();
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
						for(int z =0;z<(empStatusAList.size()-1);z++){
							Map<String,Object> rMap = empStatusAList.get(z);
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
										out.print("<td><a href='javascript:noteDetail("+cyyyy+","+(month+1)+","+day[month][i][j]+")'><span class='badge badge-secondary'>메모</span></a></td>");
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
						out.print("<tr><td align='right'><a href='javascript:memoForm("+cyyyy+","+(month+1)+","+day[month][i][j]+")'>+</a></td></tr>");					
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
</body>
</html>