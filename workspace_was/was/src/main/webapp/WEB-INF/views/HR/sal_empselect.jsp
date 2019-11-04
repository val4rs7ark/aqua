<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.util.PageBar" %>
<%
	/* 월별 급여 조회시 정보 */
	List<Map<String,Object>> r_list = null;
	/* 처음 조회화면에 들어올때 정보 */
	List<Map<String,Object>> first_info = null;
	
	Map<String,Object> r_Map = null;
	Map<String,Object> fi_Map = null;
	
	
	String sal_default       = "0";
	String sal_plus          = "0";
	String sal_over          = "0";
	String sal_rest          = "0";
    String sal_etc           = "0";
    String sal_rice          = "0";
    String sal_drive         = "0";
    String sal_life          = "0";
    String sal_tel           = "0";
    String sal_level         = "0";
    String sal_baby          = "0";
    String sal_imsihap       = "0";
    String sal_imsihap_up[]  = null;
    String sal_imsihap_r     = "0";
    String tax_soduc         = "0";
    String tax_jungsan       = "0";
    String tax_chon          = "0";
    String tax_nocheck       = "0";
    String tax_kukmin        = "0";
    String tax_long          = "0";
    String tax_health        = "0";
    String tax_pain          = "0";
    String tax_work          = "0";
    String tax_etc_sudang    = "0";
    String tax_imsihap       = "0";
    String tax_imsihap_up[]  = null;
    String tax_imsihap_r     = "0";
    String sal_when          = "0";
    String sal_etc_detail    = "";
    String tax_etc_sudang_dt = "";
    String sal_total         = "0";
    String emp_sosoc         = "-";
    String emp_position      = "-";
    String emp_indate        = "-";
    String f_emp_indate      = "-";
    String empno             = "-";
    String emp_name          = "-";
    String emp_bank          = "-";
	String msg ="";
	if((List<Map<String,Object>>)request.getAttribute("first_info")!=null){
		first_info = (List<Map<String,Object>>)request.getAttribute("first_info");
		fi_Map = first_info.get(0);
		f_emp_indate = fi_Map.get("EMP_INDATE").toString();
	}// f_emp_indate는 입사날짜가 검색버튼을 눌러야 DB에서 가져오므로 검색버튼을 누르기 전에
	// 퇴직급여조회를 누르면 입사날짜에 대한 정보가 없으므로 처음 화면에 들어올때 입사날짜 정보를 갖고 있기 위해서.
	
	if((List<Map<String,Object>>)request.getAttribute("r_list")!=null){
		r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
		if(r_list.isEmpty()){
			msg="no data";	
		}
		else{
			
			r_Map = r_list.get(0);
			if(r_Map.get("SAL_DEFAULT")!=null) sal_default = r_Map.get("SAL_DEFAULT").toString();
			if(r_Map.get("SAL_PLUS")!=null) sal_plus = r_Map.get("SAL_PLUS").toString();
			if(r_Map.get("SAL_OVER")!=null) sal_over = r_Map.get("SAL_OVER").toString();
			if(r_Map.get("SAL_REST")!=null) sal_rest = r_Map.get("SAL_REST").toString();
			if(r_Map.get("SAL_ETC")!=null) sal_etc = r_Map.get("SAL_ETC").toString();
			if(r_Map.get("SAL_RICE")!=null) sal_rice = r_Map.get("SAL_RICE").toString();
			if(r_Map.get("SAL_DRIVE")!=null) sal_drive = r_Map.get("SAL_DRIVE").toString();
			if(r_Map.get("SAL_LIFE")!=null) sal_life  = r_Map.get("SAL_LIFE").toString();
			if(r_Map.get("SAL_TEL")!=null) sal_tel = r_Map.get("SAL_TEL").toString();
			if(r_Map.get("SAL_LEVEL")!=null) sal_level  = r_Map.get("SAL_LEVEL").toString();
			if(r_Map.get("SAL_BABY")!=null) sal_baby = r_Map.get("SAL_BABY").toString();
			if(r_Map.get("SAL_IMSIHAP")!=null){
				sal_imsihap = r_Map.get("SAL_IMSIHAP").toString();
				sal_imsihap_up = sal_imsihap.split("원");
				sal_imsihap_r = sal_imsihap_up[0];
			}
			if(r_Map.get("TAX_SODUC")!=null) tax_soduc = r_Map.get("TAX_SODUC").toString();
			if(r_Map.get("TAX_JUNGSAN")!=null) tax_jungsan = r_Map.get("TAX_JUNGSAN").toString();
			if(r_Map.get("TAX_CHON")!=null) tax_chon = r_Map.get("TAX_CHON").toString();
			if(r_Map.get("TAX_NOCHECK")!=null) tax_nocheck = r_Map.get("TAX_NOCHECK").toString();
			if(r_Map.get("TAX_KUKMIN")!=null) tax_kukmin = r_Map.get("TAX_KUKMIN").toString();
			if(r_Map.get("TAX_LONG")!=null) tax_long = r_Map.get("TAX_LONG").toString();
			if(r_Map.get("TAX_HEALTH")!=null) tax_health = r_Map.get("TAX_HEALTH").toString();
			if(r_Map.get("TAX_PAIN")!=null) tax_pain = r_Map.get("TAX_PAIN").toString();
			if(r_Map.get("TAX_WORK")!=null) tax_work = r_Map.get("TAX_WORK").toString();
			if(r_Map.get("TAX_ETC_SUDANG")!=null) tax_etc_sudang = r_Map.get("TAX_ETC_SUDANG").toString();
			if(r_Map.get("TAX_IMSIHAP")!=null){
				tax_imsihap = r_Map.get("TAX_IMSIHAP").toString();
				tax_imsihap_up = tax_imsihap.split("원");
				tax_imsihap_r = tax_imsihap_up[0];
			}
			if(r_Map.get("SAL_WHEN")!=null) sal_when = r_Map.get("SAL_WHEN").toString();
			if(r_Map.get("SAL_ETC_DETAIL")!=null) sal_etc_detail = r_Map.get("SAL_ETC_DETAIL").toString();
			if(r_Map.get("TAX_ETC_SUDANG_DT")!=null) tax_etc_sudang_dt = r_Map.get("TAX_ETC_SUDANG_DT").toString();
			if(r_Map.get("SAL_TOTAL")!=null) sal_total  = r_Map.get("SAL_TOTAL").toString();
			if(r_Map.get("EMP_SOSOC")!=null) emp_sosoc = r_Map.get("EMP_SOSOC").toString();
			if(r_Map.get("EMP_POSITION")!=null) emp_position = r_Map.get("EMP_POSITION").toString();
			if(r_Map.get("EMP_INDATE")!=null) {
				f_emp_indate = r_Map.get("EMP_INDATE").toString();
				emp_indate  = r_Map.get("EMP_INDATE").toString();
			}
			if(r_Map.get("EMPNO")!=null) empno = r_Map.get("EMPNO").toString();
			if(r_Map.get("EMP_NAME")!=null) emp_name = r_Map.get("EMP_NAME").toString();
			if(r_Map.get("EMP_BANK_UP")!=null) emp_bank  = r_Map.get("EMP_BANK_UP").toString();
		}
	}
	String s_empno = null;
	if(session.getAttribute("s_emp_no")!=null){
			s_empno = session.getAttribute("s_emp_no").toString();
	}
	
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
  	function sal_select(){
		$("#f_sal_select").attr("method","post");
		$("#f_sal_select").attr("action","/erp/HRsal_select");
		$("#f_sal_select").submit();
	}
	function hide_modal(modal_name){
		$("#"+modal_name+"").hide();
	}
	//급여조회한거 워드로 다운
	//급여조회한거 워드로 다운
	function down_word(){
		var sal_total = "<%=sal_total%>"; //조회했는지 확인하는 변수
		if(sal_total!="0"){
			$("#f_sal_select").attr("method","post");
			$("#f_sal_select").attr("action","/erp/HRdown_word");
			$("#f_sal_select").submit();
		}else if (sal_total=="0"){
			alert("급여 조회후 실행이 가능합니다.");
		}
	} 
	
	//재직일자 및 예상 퇴직금 구하는 함수 => 레스트 컨트롤사용
	function date_guhaki(){
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
		var empno = "<%=s_empno%>";
		
		$.ajax({ //재직일자 
	    	url:"/erp/wasCountWork?start_date="+start_date+"&end_date="+end_date
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#result_date").val(numberWithCommas(data));//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    }); 
		$.ajax({ //직근 3개월 평균급여 => 레스트 컨트롤 사용
	    	url:"/erp/wasAvgofSal?empno="+empno
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#sal_avg").val(numberWithCommas(data));//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    }); 
		
	}
	// 예상 퇴직금
	function leave_comp_sal(){
		var f_sal_avg = $("#sal_avg").val();
		var f_work_year = $("#result_date").val();
		var end_date = $("#end_date").val();
		if(end_date==""){
			alert("예상 퇴직 날짜를 눌러주세요");
		}
		if(f_sal_avg!="" && f_work_year!=""){
			var sal_avg = parseInt(removeComma($("#sal_avg").val())); //직근 3개월 평균급여
		    var work_year = Math.round(parseInt(removeComma($("#result_date").val()))/365); //재직년
		    $("#sal_leaveComp").val(numberWithCommas(sal_avg*work_year));//예상 퇴직금 : 직근 3개월 평균급여 x 재직년
		}
	}
	//콤마 박아주는 함수
	function numberWithCommas(x) { 
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	//콤마 제거 함수
	function removeComma(str){ 
		n = parseInt(str.replace(/,/g,""));
		return n;
	}
	//급여정보창
	function info_sal(){
		window.open( "/erp/HRsalery_info?gubun=jung", "open the window", "toolbar=no, width=568, height=846, top=70, left=730");
	}	
		
	//연간 급여조회
	function sal_year() {
		var myForm = document.f_sal_year;
		var popup = window.open(
				"","f_sal_year", 
				"toolbar=no, width=1465, height=880, top=50, left=150"
			);
		myForm.action="/erp/HRsal_year";
		myForm.method="POST";
		myForm.target="f_sal_year";
		myForm.submit();
	}
	
  </script>
  <style type="text/css">
  	.tabler th, .tabler td{
  		border-top: 1px solid #E4E4E4;
  		border-left: 1px solid #E4E4E4;
  		border-bottom: 1px solid #E4E4E4;
		border-right: 1px solid #E4E4E4;
		padding-top: 5px;
		padding-bottom: 5px;
  	}
  	/* style="border-bottom: 1px solid darkgray;" */
  </style>
  </head>
  <body>
  <script type="text/javascript">
  	$(document).ready(function(){
	  if('<%=msg%>'==""){
		  $("#no_insert").hide();	
	  }else{
		  $("#no_insert").show();	
	  }
  	});
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
	<div class="container" style="margin-left: 20px;">
	<div class="base_table_div" style="width: 1355px; border:none;height:969px;">
	<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<div style="margin-top: 45px; padding-left: 26px">
  	</div>
<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<!--================================상단바===========================================-->
		<div class="card bg-dark text-white" style="height:50px; margin-top:7px ">
	    	<div class="card-body" style="font-size: 17px; font-weight: 900;">영업/매출관리 > 급여 조회</div>
	  	</div>
	  	<div class="row"></div>
	<!--================================상단바===========================================-->
	
	
	<!-- =======================================================상단 조회 검색 바========================================================================== -->
	<form id="f_sal_select">
		<input type="hidden" id="p_empno" name="p_empno" value="<%=s_empno%>">
		<table class="table table-hover" style=" margin-top: 25px;">
		    <thead>
		      <tr>
		     	<th style="width: 959px; height: 50px; border-bottom-width: 1px;padding-left: 40px; padding-right: 0px; vertical-align: middle;text-align: -webkit-right;">
			    	선택 년월 :&nbsp;
				</th>
		        <th style="border-bottom-width: 1px; vertical-align: middle;text-align: -webkit-right;">
			        <div class="dropdown" style="width:90px;" >
						<select class="btn btn-white dropdown_bs" id="sal_when_year" name="sal_when_year" style=" margin-left: 0px; color:black; width:90px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: #efefef; border-width: 1px;">
							<%
								if(sal_when!="0"){
							%>
									<option value="<%=sal_when.substring(0,4)%>"><%=sal_when.substring(0,4)%></option>
							<%	
								}
								for(int i=2019;i>2008;i--){
							%>
								<option value="<%=i %>"><%=i%></option>
							<%	
								}
							%>
						</select>
					</div>	
				</th>
		        <th style="border-bottom-width: 1px;  vertical-align: middle;text-align: -webkit-right;">
			        <div class="dropdown" style="width: 90px; vertical-align: middle;" >
						<select class="btn btn-white dropdown_bs" id="sal_when_mon" name="sal_when_mon" style=" margin-left: 0px; color:black; width:90px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: #efefef; border-width: 1px;">
							<%
								if(sal_when!="0"){
							%>
									<option value="<%=sal_when.substring(5,7)%>"><%=sal_when.substring(5,7)%></option>
							<%	
								}
								for(int i=1;i<13;i++){
									if(i<10){
							%>
								<option value="0<%=i %>">0<%=i%></option>
							<%	
									}else{
							%>
								<option value="<%=i %>"><%=i%></option>
							<%	
									}
								}
							%>
						</select>
					</div>	
				</th>
		        <th style="border-bottom-width: 1px; vertical-align: middle; text-align: right; padding-right: 50px; padding-left: 15px;">
		        	<button type="button" onclick="javascript:sal_select()" class="btn btn-dark" style="width: 65px; height: 27px; font-size: 14px; padding-top: 3px; padding-bottom: 4px; padding-left: 4px; padding-right: 4px;"><img src="/erp/images/search_sal_white.png" style="width: 22px;" alt="검색">검색</button>
				</th>
		      </tr>
	    	</thead>
	  	</table>
	</form>
	<!-- ===================================================================================================================================================== -->
	  
	  
		<div class="container" style="margin-left: 0px; margin-right: 0px;">
			<div class="row" style="margin-top:15px; width:1350px;">
				<div class="container" style="margin-left: 0px; margin-right: 0px;">
					<div class="row" style="width:1340px;">
						<div class="col" style="padding-right: 0px; padding-left: 0px;"> 
			        		<div style="font-size: 15px; font-weight: bold;margin-top:26px; margin-bottom: 5px; margin-left: 20px;">
								⊙급여내역
						  	</div>
			        		<table class="table tabler" style=" border-collapse: collapse; margin-bottom: 25px; width:100%">
							    <tbody>
							      <tr>
							     	<td style="width: 168.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">구분</td>
							        <td style="width: 94.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">소속</td>
							        <td style="width: 180.5px; vertical-align: middle; text-align: center;"><%=emp_sosoc%></td>
							        <td style="width: 95.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">직책</td>
							        <td style="width: 142.5px; vertical-align: middle; text-align: center;"><%=emp_position%></td>
							        <td style="width: 95.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">입사일</td>
							        <td style="width: 163.5px; vertical-align: middle; text-align: center;"><%=emp_indate%></td>
							        <td style="width: 117.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">사번</td>
							        <td style="width: 114.5px; vertical-align: middle; text-align: center;"><%=empno%></td>
							        <td style="width: 76.5px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">성명</td>
							        <td style="width: 99.5px; vertical-align: middle; text-align: center;"><%=emp_name%></td>
							      </tr>
							      <tr>
							      <%
								      if(sal_when!="0"){
								  %>
							     	<td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">정기급여(<%=sal_when.substring(8,10) %>)</td>
								  <%
								      }else{
						    	  %>
							     	<td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">정기급여()</td>
								  <%  	  
								      }
							      %>
							        <td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">급여계</td>
							        <td style="vertical-align: middle; text-align: center;"><%=sal_total%></td>
							        <td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">공제계</td>
							        <td style="vertical-align: middle; text-align: center;"><%=tax_imsihap%></td>
							        <td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">지급계</td>
							        <td style="vertical-align: middle; text-align: center;"><%=sal_imsihap%></td>
							        <td style="vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">급여계좌</td>
							        <td style="vertical-align: middle; text-align: center;" colspan="3"><%=emp_bank%></td>
							      </tr>
							      <tr>
							     	<td style="height: 20px;border-bottom: none;border-right: none;border-left: none;" colspan="11"></td>
							      </tr>
						    	</tbody>
						  	</table>
						  	<div class="row" style="width:1340px;margin-left: 0px; margin-right: 0px;">
							  	<div style="width:85%;margin-top: 30px;">
								  	<div style="font-size: 15px; font-weight: bold; margin-bottom: 5px; margin-left: 20px;margin-top: 30px">
										⊙급여상세 내역
								  	</div>
								  	<table class="table tabler">
								  	
								  	 	<tbody>
									  	 	<tr>
										     	<td style="width: 16%; height: 20px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">지급항목</td>
										        <td style="width: 17%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">정기</td>
										        <!-- <td style="width: 17%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">비고</td> 추가란 필요하면 이거 복사-->
										        <td style="width: 17%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">공제항목</td>
										        <td style="width: 17%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">정기</td>
										    </tr>
											<!-- =========================================================아래 세부항목========================================================================================= -->
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;">기본급</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_default%></td>
										        <!-- <td style="vertical-align: middle; text-align: center;"></td> 추가란 필요하면 이거 복사 -->
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">소득세</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_soduc%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">성과급</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_plus%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">연말정산소득세</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_jungsan%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">식대</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_rice%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">지방소득세</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_chon%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">통신비</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_tel%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">결근공제액</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_nocheck%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">교통비</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_drive%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">국민연금</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_kukmin%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">생명수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_life%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">장기요양보험</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_long%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">초과수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_over%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">건강보험</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_health%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">직책수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_level%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">노동조합비용</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_pain%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">주휴수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_rest%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">고용보험</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_work%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">육아수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_baby%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;"></td>
										        <td style="vertical-align: middle; text-align: center;"></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">기타수당</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_etc%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">기타공제</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_etc_sudang%></td>
											</tr>
										    <tr>
										     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb;  text-align: center;font-weight: 800;">지급계</td>
										        <td style="vertical-align: middle; text-align: center;"><%=sal_imsihap_r%></td>
										     	<td style="height: 30px; vertical-align: middle; background-color: antiquewhite; text-align: center;font-weight: 800;">공제계</td>
										        <td style="vertical-align: middle; text-align: center;"><%=tax_imsihap_r%></td>
											</tr>
								  	 	</tbody>
								  	</table>
								</div>
							  	<div>
							  		<!-- 오와열 코드 -->
								  	<div style="display:inline;">
										<input type="text" style="border:none; width:1px; height:59px;" readonly>
									</div>
								  	<div style="margin-top: 28px;">
									  	<button type="button" class="btn btn-secondary" style="width: 138px; margin-left: 50px; font-size: 14px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px; background-color: #efefef; color: black; font-weight: 900;"  data-toggle="modal" data-target="#comp_leave" data-backdrop="static">퇴직금 계산하기</button>
								  	</div>
								  	<div>
						  			<form id="f_sal_year" name="f_sal_year" method="post">
						  				<input type="hidden" name="sal_year" value="2019">
						  				<input type="hidden" name="sal_empno" value="<%=s_empno%>">
						  			</form>
									  	<button type="button" onclick="javascript:sal_year()" class="btn btn-secondary" style="width: 138px; margin-left: 50px; font-size: 14px; margin-top: 40px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px; background-color: #efefef; color: black; font-weight: 900;">연간급여조회</button>
								  	</div>
								  	<div>
									  	<button type="button" onclick="javascript:down_word()" class="btn btn-secondary" style="width: 138px; margin-left: 50px; font-size: 14px; margin-top: 40px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px; background-color: #efefef; color: black; font-weight: 900;">급여명세서 출력</button>
								  	</div>
								  	<div>
									  	<button type="button" onclick="javascript:info_sal()" class="btn btn-secondary" style="width: 138px; margin-left: 50px; font-size: 14px; margin-top: 40px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px; background-color: #efefef; color: black; font-weight: 900;">급여정보</button>
								  	</div>
								</div>
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
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="no_insert" data-backdrop="static"data-keyboard="true" >
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
           <h6 style="display:inline;font-weight:bold;font-size:large;color:red">등록된 정보가 없습니다.</h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:hide_modal('no_insert')" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
	


<!-- ============================================================================================================================================= -->
<!-- ===============================================================퇴직금 조회창================================================================= -->
<!-- ============================================================================================================================================= -->

<div class="container" >

	<div class="modal" id="comp_leave" style="margin-top: 245px;">
		<div class="modal-dialog modal-dialog-scrollable" >
			<div class="modal-content">
			
				<!-- 헤더 -->
				<div class="modal-header">
					<h2>퇴직금 계산기</h2>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
					
				<!-- 입력란 -->
				<div class="modal-body" style="margin:auto; margin-top: 10px; margin-bottom: 10px;">
					<table style="width: 410px;">
						<tr>
							<td style="height: 52px;color: darkgray;">
								입사날짜
							</td>
							<td style="height: 52px;">
								<input type="text" class="form-control" id="start_date" name="start_date" value="<%=f_emp_indate%>" size="27" style="height:27px; width:170px; font-size: 13px; display:inline; background-color: transparent;" readonly>
							</td>
						</tr>
						<tr>
							<td style="height: 52px;color: darkgray;">
								예상 퇴직날짜
							</td>
							<td style="height: 52px;">
			 					<input type="date" class="form-control" id="end_date" name="end_date" size="27" style="height:27px; width:170px; font-size: 13px; display:inline;" onchange="javascrpt:date_guhaki()">
							</td>
						</tr>
						<tr>
							<td style="height: 52px;color: darkgray;">
								재직일 
							</td>
							<td style="height: 52px; color: darkgray;">
								<input type="text" class="form-control" id="result_date" name="result_date" size="27" style="height:27px; width:170px; font-size: 13px; display:inline; background-color: transparent;" readonly> 일
							</td>
						</tr>
						<tr>
							<td style="height: 52px;color: darkgray;">
								직근3개월 평균급여
							</td>
							<td style="height: 52px; color: darkgray;">
								<input type="text" class="form-control" id="sal_avg" name="sal_avg" size="27" style="height:27px; width:170px; font-size: 13px; display:inline; background-color: transparent;" readonly> 원
							</td>
						</tr>
						<tr>
							<td style="height: 52px;padding-left: 30px" colspan="2">
								<a href="javascript:leave_comp_sal()" style="font-weight: 900">예상 퇴직날짜를 입력후 여기를 눌러주세요</a>
							</td>
						</tr>
						<tr>
							<td style="height: 52px;color: darkgray;">
								예상 퇴직금
							</td>
							<td style="height: 52px; color: darkgray;">
								<input type="text" class="form-control" id="sal_leaveComp" name="sal_leaveComp" size="27" style="height:27px; width:170px; font-size: 13px; display:inline; background-color: transparent;" readonly> 원
							</td>
						</tr>
						<tr>
							<td style="height: 52px; color: darkgray; font-size: 14px; padding-top: 40px;" colspan="2">
								※ 예상퇴직금 = 직근 3개월 급여 평균 x 재직일수/365 <br>
								※ 퇴직급여 지급기간 = 퇴직일 다음달 10일 일괄 지급
							</td>
						</tr>
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
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================퇴직금 조회창================================================================= -->
<!-- ============================================================================================================================================= -->

		
    
    </div>
	</div>  	
  </body>
</html>

