<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.util.PageBar" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <%@ include file="/common/bootStrap4.jsp" %>
    <title>Bootstrap 4</title>
  <%@ include file="/common/bs_css.jsp"%>
  <script type="text/javascript">
	  //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
	  //[0-9] => \d , [^0-9] => \D
	  var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
	  var rgx2 = /(\d+)(\d{3})/; 
	  
	  function getNumber(obj){
	     
	       var num01;
	       var num02;
	       num01 = obj.value;
	       num02 = num01.replace(rgx1,"");
	       num01 = setComma(num02);
	       obj.value =  num01;
	  
	  }
	  function numberWithCommas(x) {

		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		}
	  
	  function setComma(inNum){
	       
	       var outNum;
	       outNum = inNum; 
	       while (rgx2.test(outNum)) {
	            outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
	        }
	       return outNum;
	  
	  }
  	function seach_emp_name(){
  		alert("사원명 검색버튼 양호");
  	}
  	function removeComma(str){ //콤마 제거 함수
		n = parseInt(str.replace(/,/g,""));
		return n;
	}
  	
  	function sal_equals_one(){//========================================일용직 산출 버튼
  		var sal_default_one = $("#sal_default_one").val().toString();
  		var r_sal_default_one = 0;
  		if(""!=sal_default_one){
  			r_sal_default_one =	parseInt(removeComma(sal_default_one));
  		}
  		
  		var sal_rice_one = $("#sal_rice_one").val().toString();
  		var r_sal_rice_one = 0;
  		if(""!=sal_rice_one){
  			r_sal_rice_one = parseInt(removeComma(sal_rice_one));
  		}

  		var sal_drive_one = $("#sal_drive_one").val().toString();
  		var r_sal_drive_one = 0;
  		if(""!=sal_drive_one){
  			r_sal_drive_one = parseInt(removeComma(sal_drive_one));
  		}
  		
  		var sal_life_one = $("#sal_life_one").val().toString();
  		var r_sal_life_one = 0;
  		if(""!=sal_life_one){
  			r_sal_life_one = parseInt(removeComma(sal_life_one));
  		}
  		
  		var sal_over_one = $("#sal_over_one").val().toString();
  		var r_sal_over_one = 0;
  		if(""!=sal_over_one){
  			r_sal_over_one = parseInt(removeComma(sal_over_one));
  		}
  		//임시 토탈값
  		var imsi_sal_total = r_sal_default_one+r_sal_rice_one+r_sal_drive_one+r_sal_life_one+r_sal_over_one;
  	
  		var sal_soduc_one = imsi_sal_total*5/100;
  		$("#sal_soduc_one").val(numberWithCommas(sal_soduc_one));
  		
  		var sal_kukmin_one = imsi_sal_total*5/100;
  		$("#sal_kukmin_one").val(numberWithCommas(sal_kukmin_one));
  		
  		var sal_health_one = imsi_sal_total*5/100;
  		$("#sal_health_one").val(numberWithCommas(sal_health_one));
  		
  		var sal_pain_one = imsi_sal_total*5/100;
  		$("#sal_pain_one").val(numberWithCommas(sal_pain_one));
  		
  		var sal_work_one = imsi_sal_total*5/100;
  		$("#sal_work_one").val(numberWithCommas(sal_work_one));
  		
  		var sal_long_one = imsi_sal_total*5/100;
  		$("#sal_long_one").val(numberWithCommas(sal_long_one));
  		
  		var sal_etc_sudang_one = $("#sal_etc_sudang_one").val().toString();
  		var r_sal_etc_sudang_one = 0;
  		if(""!=sal_etc_sudang_one){
  			r_sal_etc_sudang_one = parseInt(removeComma(sal_etc_sudang_one));
  		}
  		var imsi_minus_total = sal_soduc_one+sal_kukmin_one+sal_health_one+sal_pain_one+sal_work_one+sal_long_one+r_sal_etc_sudang_one;
  		
  		var sal_total_one = imsi_sal_total-imsi_minus_total;
  		//$("#sal_total").val(sal_total); //토탈 자리에 값을 입력
  		$("#sal_total_one").val(numberWithCommas(sal_total_one)+"원"); //토탈 자리에 값을 입력
  		
  	}
  	function sal_equals(){//========================================정규직 산출 버튼
  		// 급여항목
  		var sal_default = $("#sal_default").val().toString();
  		var r_sal_default = 0;
  		if(""!=sal_default){
  			r_sal_default =	parseInt(removeComma(sal_default));
  		}
  		
  		var sal_plas = $("#sal_plas").val().toString();
  		var r_sal_plas = 0;
  		if(""!=sal_plas){
  			r_sal_plas = parseInt(removeComma(sal_plas));
  		}
  		
  		var sal_over = $("#sal_over").val().toString();
  		var r_sal_over = 0;
  		if(""!=sal_over){
  			r_sal_over = parseInt(removeComma(sal_over));
  		}
  		
  		var sal_rest = $("#sal_rest").val().toString();
  		var r_sal_rest = 0;
  		if(""!=sal_rest){
  			r_sal_rest = parseInt(removeComma(sal_rest));
  		}
  		
  		var sal_etc = $("#sal_etc").val().toString();
  		var r_sal_etc = 0;
  		if(""!=sal_etc){
  			r_sal_etc = parseInt(removeComma(sal_etc));
  		}
  		
  		var sal_rice = $("#sal_rice").val().toString();
  		var r_sal_rice = 0;
  		if(""!=sal_rice){
  			r_sal_rice = parseInt(removeComma(sal_rice));
  		}
  		
  		var sal_drive = $("#sal_drive").val().toString();
  		var r_sal_drive = 0;
  		if(""!=sal_drive){
  			r_sal_drive = parseInt(removeComma(sal_drive));
  		}
  		
  		var sal_life = $("#sal_life").val().toString();
  		var r_sal_life = 0;
  		if(""!=sal_life){
  			r_sal_life = parseInt(removeComma(sal_life));
  		}
  		
  		var sal_tel = $("#sal_tel").val().toString();
  		var r_sal_tel = 0;
  		if(""!=sal_tel){
  			r_sal_tel = parseInt(removeComma(sal_tel));
  		}
  		
  		var sal_level = $("#sal_level").val().toString();
  		var r_sal_level = 0;
  		if(""!=sal_level){
  			r_sal_level = parseInt(removeComma(sal_level));
  		}
  		
  		var sal_baby = $("#sal_baby").val().toString();
  		var r_sal_baby = 0;
  		if(""!=sal_baby){
  			r_sal_baby = parseInt(removeComma(sal_baby));
  		}
  		
 		var sal_etc_detail = $("#sal_etc_detail").val(); //기타항목 상세 내용
 		
 		//임시 토탈값
  		var imsi_sal_total = r_sal_default+r_sal_plas+r_sal_over+r_sal_rest+r_sal_etc+r_sal_rice+r_sal_drive+r_sal_life+r_sal_tel+r_sal_level+r_sal_baby;
  		

  		//공제항목
  		//==========================여기부터 계산하기
  		var sal_soduc = imsi_sal_total*5/100;
  		$("#sal_soduc").val(numberWithCommas(sal_soduc));
  		
  		var sal_jungsan = imsi_sal_total*5/100;
  		$("#sal_jungsan").val(numberWithCommas(sal_jungsan));
  		
  		var sal_chon = imsi_sal_total*5/100;
  		$("#sal_chon").val(numberWithCommas(sal_chon));
  		
  		var sal_nocheck = imsi_sal_total*5/100;
  		$("#sal_nocheck").val(numberWithCommas(sal_nocheck));
  		
  		var sal_kukmin = imsi_sal_total*5/100;
  		$("#sal_kukmin").val(numberWithCommas(sal_kukmin));
  		
  		var sal_health = imsi_sal_total*5/100;
  		$("#sal_health").val(numberWithCommas(sal_health));
  		
  		var sal_pain = imsi_sal_total*5/100;
  		$("#sal_pain").val(numberWithCommas(sal_pain));
  		
  		var sal_work = imsi_sal_total*5/100;
  		$("#sal_work").val(numberWithCommas(sal_work));
  		
  		var sal_long = imsi_sal_total*5/100;
  		$("#sal_long").val(numberWithCommas(sal_long));
  		
  		var sal_etc_sudang = $("#sal_etc_sudang").val().toString();
  		var r_sal_etc_sudang = 0;
  		if(""!=sal_etc_sudang){
  			r_sal_etc_sudang = parseInt(removeComma(sal_etc_sudang));
  		}
  		
  		var imsi_sal_etc_sudang_dt = parseInt($("#sal_etc_sudang_dt").val()); // 받아온 값을 숫자형으로 변환 
  		
  		//공제 토탈값
  		var imsi_minus_total = sal_soduc+sal_jungsan+sal_chon+sal_nocheck+sal_kukmin+sal_health+sal_pain+sal_work+sal_long+r_sal_etc_sudang;
  		
  		//총토탈값
  		
  		var sal_total = imsi_sal_total-imsi_minus_total;
  		//$("#sal_total").val(sal_total); //토탈 자리에 값을 입력
  		$("#sal_total").val(numberWithCommas(sal_total)+"원"); //토탈 자리에 값을 입력
  		 

  	}
  	function select_empno(r_empno){
  		<%
  			for(int i=0;i<r_list.size();i++){
  				Map<String,Object> oneSMap = r_list.get(i);	
	  	%>
	  		if(r_empno=="<%=oneSMap.get("EMPNO").toString()%>"){
	  			var r_emp_name = "<%=oneSMap.get("EMP_NAME").toString()%>";
	  			var r_resident_no = "<%=oneSMap.get("RESIDENT_NO").toString()%>";
	  			var r_emp_hp = "<%=oneSMap.get("EMP_HP").toString()%>";
	  			var r_emp_indate = "<%=oneSMap.get("EMP_INDATE").toString()%>";
	  			var r_emp_sosoc = "<%=oneSMap.get("EMP_SOSOC").toString()%>";
	  			var r_emp_back = "<%=oneSMap.get("EMP_BACK").toString()%>";
	  			var r_sal_account = "<%=oneSMap.get("SAL_ACCOUNT").toString()%>"; 
			  	$.ajax({
			    	url:"/erp/HRsalary_select_empno.was?empno="+r_empno+"&emp_name="+r_emp_name+"&resident_no="+r_resident_no+"&emp_hp="+r_emp_hp+"&emp_indate="+r_emp_indate+"&emp_sosoc="+r_emp_sosoc+"&emp_back="+r_emp_back+"&sal_account="+r_sal_account
			    	,method:"get"
			    	,success:function(data){//해석하기
			    		$("#select_empno_change_jungkyu").html(data);//해석하기
			    	}
			    	,error:function(e){
			    		alert(e.responseText);
			    	}
			    });
			  }
	  	<%
	  		}
  		%>
  		$("#emp_imfo .close").click();//선택후 자동 모달창 끄기
  	}
  	function select_empno_one(r_empno){
  		<%
  			for(int i=0;i<r_list.size();i++){
  				Map<String,Object> oneSMap = r_list.get(i);	
	  	%>
	  		if(r_empno=="<%=oneSMap.get("EMPNO").toString()%>"){
	  			var r_emp_name = "<%=oneSMap.get("EMP_NAME").toString()%>";
	  			var r_resident_no = "<%=oneSMap.get("RESIDENT_NO").toString()%>";
	  			var r_emp_hp = "<%=oneSMap.get("EMP_HP").toString()%>";
	  			var r_emp_indate = "<%=oneSMap.get("EMP_INDATE").toString()%>";
	  			var r_emp_sosoc = "<%=oneSMap.get("EMP_SOSOC").toString()%>";
	  			var r_emp_back = "<%=oneSMap.get("EMP_BACK").toString()%>";
	  			var r_sal_account = "<%=oneSMap.get("SAL_ACCOUNT").toString()%>"; 
			  	$.ajax({
			    	url:"/erp/HRsalary_select_empno.was?empno="+r_empno+"&emp_name="+r_emp_name+"&resident_no="+r_resident_no+"&emp_hp="+r_emp_hp+"&emp_indate="+r_emp_indate+"&emp_sosoc="+r_emp_sosoc+"&emp_back="+r_emp_back+"&sal_account="+r_sal_account
			    	,method:"get"
			    	,success:function(data){//해석하기
			    		$("#select_empno_change_one").html(data);//해석하기
			    	}
			    	,error:function(e){
			    		alert(e.responseText);
			    	}
			    });
			  }
	  	<%
	  		}
  		%>
  		$("#emp_imfo_one .close").click();//선택후 자동 모달창 끄기
  	   //구매/사용 신청 총액 자동 구하기
  	}
  </script>
  </head>
  <body>
	<div class="row">
	   <div style="width:20%">
	      <%@ include file="/common/MenuCommon.jsp"%>
		 <!-- ======================================================================================================================================================================= -->
		 <!-- 															여기부터 내영역																					 -->
		 <!-- ======================================================================================================================================================================= -->
	  </div>
	<div style="width:80%" >
	<div class="container" style="margin-left: 0px;">
	<div class="base_table_div" style="width: 1350px; border:none;">
	
	<!--================================상단바===========================================-->
		<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
	    	<div class="card-body">급여 등록</div>
	  	</div>
	  	<div class="row"></div>
	<!--================================상단바===========================================-->
	
	
	<!-- ======================================================================================================================================== -->
	<form id="f_bs_search">
		<table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
		    <thead>
		      <tr>
		        <th style="width: 100%; height:50px; border-top-width: 10px;border-top-color: white;">
				</th>
		      </tr>
	    	</thead>
	  	</table>
	</form>
	<!-- ===================================================================================================================================================== -->
	  
	  
	  <div class="container" style="margin-left: 0px; margin-right: 0px;">
		  	<div class="row" style="margin-top:15px; width:1340px;">
			  	<div class="container" style="margin-left: 0px; margin-right: 0px;">
			      <div class="row" style="width:1330px;">
			        <div class="col"> 
			        
			            <ul class="nav nav-tabs">
			              <li class="nav-item">
			                <a class="nav-link active" data-toggle="tab" href="#qwe">정직원 급여</a>
			              </li>
			              <li class="nav-item">
			                <a class="nav-link" data-toggle="tab" href="#asd">일용직 급여</a>
			              </li>
			            </ul>
			            <div class="tab-content" style="margin-top: 10px;">
<!-- ====================================================================================================================================================================================================================================== -->
			              <div class="tab-pane fade show active" id="qwe">
<!-- *********************************************************************************************************************************************************************************************************** -->
						  <form id="f_deli_insert">
	                	  	<div class="row"  style="width:1340px;">
	                	  		<div style="width:35%">
							  		<table id="select_empno_change_jungkyu" class="table" style=" width: 100%; margin-bottom: 0px;"> 
							  			<thead>
							  				<tr>
								  				<th style="border:none; height: 40px; padding-left: 20px; padding-bottom: 20px;">사원정보</th>
							  				</tr>
							  			</thead>
							  			<tbody style="text-align: left;">
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">사원번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">소속</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">입사일</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  			</tbody>
							  		</table>
						 		</div> 
<!-- *********************************************************************************************************************************************************************************************************** -->						  	      
		                	  	<div style="width:65%;">
			                	   <ul class="nav nav-tabs">
						              <li class="nav-item">
						                <a class="nav-link active" data-toggle="tab" href="#imsi_1">급여항목</a>
						              </li>
						              <li class="nav-item">
						                <a class="nav-link" data-toggle="tab" href="#imsi_2">공제항목</a>
						              </li>
						           </ul>
					            	<div class="tab-content">
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================급여 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
						              	<div class="tab-pane fade show active" style="height:500px; border-bottom:solid; border-left: solid; border-right: solid; border-width: 1px; border-color: lightgray; " id="imsi_1">
								      		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 35px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style=" width: 160px; height: 35px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						*는 필수 입력사항입니다.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">기본급*</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_default" name="sal_default" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;"  onchange="getNumber(this,'sal_default')" onkeyup="getNumber(this,'sal_default')">&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">성과급</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_plas" name="sal_plas" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this)" onkeyup="getNumber(this)">&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">식대</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_rice" name="sal_rice" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>	
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">교통비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_drive" name="sal_drive" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">생명수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_life" name="sal_life" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>		
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">통신비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
									  						<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_tel" name="sal_tel" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">초과수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray; ">
															<input id="sal_over" name="sal_over" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">직책수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_level" name="sal_level" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="0">선택</option>
																	<option value="15000">부서장</option>
																	<option value="10000">팀장</option>
																</select>
															</div>	
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">주휴수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray; ">
															<input id="sal_rest" name="sal_rest" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">육아수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_baby" name="sal_baby" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>
														</td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">기타수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-right: 5px; ">
									  						<input id="sal_etc_detail" name="sal_etc_detail" type="text" class="form-control" placeholder="항목을 입력하세요."  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-left: 5px; padding-right: 5px; color: darkgray;">
															<input id="sal_etc" name="sal_etc" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  				<tr>
									  					<td colspan="4" style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※식대  = ((근무일자)x(3,124)원)... 어쩌구 비용에 대한 설명 작성 <br>
									  						※주휴수당  = (기본급/365+근무일자)x52% ...
									  					</td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								      		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:20px; border-top: dashed; border-width: 2px; border-color: lightgray;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 130px; height: 25px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style=" width: 160px; height: 25px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">지급일자</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 200.25px;">
															<input type="date" class="form-control" id="sal_when" name="sal_when" size="27" style="height: 28px; width:160px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="width: 185px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 10px;">지급금액 (급여-공제금액)</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; padding-right: 0px; width: 160.25px;">
															<input id="sal_total" name="sal_total" type="text" class="form-control"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;" readonly>
														</td>
									  					<td style=" width: 90px; padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 0px; ">
															<button type="button" class="btn btn-secondary btn pull-left" onclick="javascript:sal_equals()" style="padding-left: 7px; padding-right: 7px; font-size: 14px; padding-top: 2px; padding-bottom: 2px;" >산출</button>
														</td>

									  				</tr>
									  			</tbody>
									  		</table>
				                	  	</div>  
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================급여 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 


<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================공제 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
						              	<div class="tab-pane fade" style="height:500px; border-bottom:solid; border-left: solid; border-right: solid; border-width: 1px; border-color: lightgray;" id="imsi_2">
				                	  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 45px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
														<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; font-size: 14px; text-align: end;" >
									  						*급여항목을 입력후 산출버튼을 눌러주시기 바랍니다.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_soduc" name="sal_soduc" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >연말정산소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_jungsan" name="sal_jungsan" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">지방소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_chon" name="sal_chon" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">결근공제액</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_nocheck" name="sal_nocheck" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">국민연금</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_kukmin" name="sal_kukmin" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">장기요양보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
									  						<input id="sal_long" name="sal_long" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">건강보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_health" name="sal_health" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">산재보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_pain" name="sal_pain" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">고용보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_work" name="sal_work" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; "></td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 156px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">기타공제</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-right: 5px; ">
									  						<input id="sal_etc_sudang_dt" name="sal_etc_sudang_dt" type="text" class="form-control" placeholder="항목을 입력하세요."  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-left: 5px; padding-right: 5px; color: darkgray;">
															<input id="sal_etc_sudang" name="sal_etc_sudang" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:30px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※결근공제액 = .. 어쩌구 저쩌구 ..  공제항목에 대한 설명 작성 <br>
									  						※연말정산 소득세 = ...어쩌구 저쩌구
									  					</td>
									  				</tr>
									  			</tbody>
									  		</table>
				                	  	</div>    
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================공제 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
									</div>   
							  	</div>   
						  	</div>   
						  	</form> 
<!-- *********************************************************************************************************************************************************************************************************** -->
					    	<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px; ">취소</button>
							<button type="button" onclick="javascript:bs_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px;">등록</button>
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#emp_imfo" data-backdrop="static" >검색</button>
			              </div>
			              
<!-- ====================================================================================================================================================================================================================================== -->
<!-- ====================================================================================================================================================================================================================================== -->
			              <div class="tab-pane fade" id="asd">
<!-- *********************************************************************************************************************************************************************************************************** -->
						  <form id="f_deli_insert">
	                	  	<div class="row"  style="width:1340px;">
	                	  		<div style="width:35%">
							  		<table id="select_empno_change_one" class="table" style=" width: 100%; margin-bottom: 0px;"> 
							  			<thead>
							  				<tr>
								  				<th style="border:none; height: 40px; padding-left: 20px; padding-bottom: 20px;">사원정보</th>
							  				</tr>
							  			</thead>
							  			<tbody style="text-align: left;">
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">임시사번</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">임시소속</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">초기등록일</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  			</tbody>
							  		</table>
						 		</div> 
<!-- *********************************************************************************************************************************************************************************************************** -->						  	      
		                	  	<div style="width:65%;">
			                	   <ul class="nav nav-tabs">
						              <li class="nav-item">
						                <a class="nav-link active" data-toggle="tab" href="#imsi_3">급여항목</a>
						              </li>
						              <li class="nav-item">
						                <a class="nav-link" data-toggle="tab" href="#imsi_4">공제항목</a>
						              </li>
						           </ul>
					            	<div class="tab-content">
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================급여 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
						              	<div class="tab-pane fade show active" style="height:500px; border-bottom:solid; border-left: solid; border-right: solid; border-width: 1px; border-color: lightgray; " id="imsi_3">
								      		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 35px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style=" width: 160px; height: 35px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						*는 필수 입력사항입니다.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">일급*</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_default_one" name="sal_default_one" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this,'sal_default')" onkeyup="getNumber(this,'sal_default')">&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">일수*</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_one_date_one" name="sal_one_date_one" type="number" class="form-control" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;일
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">식대</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_rice_one" name="sal_rice_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>	
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">교통비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_drive_one" name="sal_drive_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">생명수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_life_one" name="sal_life_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>		
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">초과수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_over_one" name="sal_over_one" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  				<tr>
									  					<td colspan="4" style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※식대  = ((근무일자)x(3,124)원)... 어쩌구 비용에 대한 설명 작성 <br>
									  						※주휴수당  = (기본급/365+근무일자)x52% ...
									  					</td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
								      		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:20px; border-top: dashed; border-width: 2px; border-color: lightgray;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 130px; height: 25px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style=" width: 160px; height: 25px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">지급일자</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 200.25px;">
															<input type="date" class="form-control" size="27" style="height: 28px; width:160px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="width: 185px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 10px;">지급금액 (급여-공제금액)</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; padding-right: 0px; width: 160.25px;">
															<input id="sal_total_one" name="sal_total_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;" readonly>
														</td>
									  					<td style=" width: 90px; padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 0px; ">
															<button type="button" class="btn btn-secondary btn pull-left" onclick="javascript:sal_equals_one()" style="padding-left: 7px; padding-right: 7px; font-size: 14px; padding-top: 2px; padding-bottom: 2px;" >산출</button>
														</td>

									  				</tr>
									  			</tbody>
									  		</table>
				                	  	</div>  
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================급여 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 


<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================공제 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
						              	<div class="tab-pane fade" style="height:500px; border-bottom:solid; border-left: solid; border-right: solid; border-width: 1px; border-color: lightgray;" id="imsi_4">
				                	  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 160px; height: 45px; padding-left: 20px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;"/>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;"/>
									  					<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; font-size: 14px; text-align: end;" >
									  						*급여항목을 입력후 산출버튼을 눌러주시기 바랍니다.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_soduc_one" name="sal_soduc_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >고용보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_work_one" name="sal_work_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">국민연금</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_kukmin_one" name="sal_kukmin_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">장기요양보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_long_one" name="sal_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">건강보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_health_one" name="sal_health_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">산재보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="sal_pain_one" name="sal_pain_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;"></td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;"></td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
														</td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style="width: 156px; height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">기타공제</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-right: 5px; ">
									  						<input id="sal_etc_sudang_dt_one" name="sal_etc_sudang_dt_one" type="text" class="form-control" placeholder="항목을 입력하세요."  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-left: 5px; padding-right: 5px; color: darkgray;">
															<input id="sal_etc_sudang_one" name="sal_etc_sudang_one" type="text" class="form-control" name="companyname" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:30px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※소득세... 어쩌구   공제항목에 대한 설명 작성 <br>
									  						※건강보험 = ...어쩌구 저쩌구
									  					</td>
									  				</tr>
									  			</tbody>
									  		</table>
				                	  	</div>    
<!-- ============================================================================================================================================================================================================================================================================================= --> 
<!-- ==============================================================================================공제 화면=============================================================================================================================================================================== --> 
<!-- ============================================================================================================================================================================================================================================================================================= --> 
									</div>   
							  	</div>   
						  	</div>   
						  	</form> 
<!-- *********************************************************************************************************************************************************************************************************** -->
					    	<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px; ">취소</button>
							<button type="button" onclick="javascript:bs_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px;">등록</button>
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#emp_imfo_one" data-backdrop="static" >검색</button>
			              </div>
<!-- ====================================================================================================================================================================================================================================== -->
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
<!-- ===============================================================사원 검색창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="container">

	<div class="modal" id="emp_imfo">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" ">
			<div class="modal-content" style="height: 500px;">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title">
					<!--var companyname = $("#밑에놈 아이디").text(); search.do?compay  -->
						<input type="text" class="form-control" name="companyname" placeholder="사원이름을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" type="button" onclick="javascript:seach_emp_name()">검색</zealot>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;">
						<thead>
							<tr>
								<th style="width:150px;">사번</th>
								<th style="width:150px;">이름</th>
								<th style="width:150px;">부서</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(r_list!=null){
								for(int i=0;i<r_list.size();i++){
									Map<String,Object> rMap = r_list.get(i);
						%>
							<tr>
								<td>
									<a href="javascript:select_empno('<%=rMap.get("EMPNO").toString()%>')" style="color:black;" >
										<%=rMap.get("EMPNO")%>
									</a>
								</td>
								<td>
									<%=rMap.get("EMP_NAME") %>
								</td>
								<td>
									<%=rMap.get("EMP_SOSOC") %>
								</td>
							</tr>
						<%
								}
							}
						%>
						</tbody>
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
<!-- ============================================================================================================================================= -->
<!-- ===============================================================사원 검색창================================================================= -->
<!-- ============================================================================================================================================= -->
		  	
<!-- ============================================================================================================================================= -->
<!-- ===============================================================일용직 검색창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="container">

	<div class="modal" id="emp_imfo_one">
		<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" ">
			<div class="modal-content" style="height: 500px;">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title">
					<!--var companyname = $("#밑에놈 아이디").text(); search.do?compay  -->
						<input type="text" class="form-control" name="companyname" placeholder="사원이름을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" type="button" onclick="javascript:seach_emp_name()">검색</zealot>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;">
						<thead>
							<tr>
								<th style="width:150px;">사번</th>
								<th style="width:150px;">이름</th>
								<th style="width:150px;">부서</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(r_list!=null){
								for(int i=0;i<r_list.size();i++){
									Map<String,Object> rMap = r_list.get(i);
						%>
							<tr>
								<td>
									<a href="javascript:select_empno_one('<%=rMap.get("EMPNO").toString()%>')" style="color:black;" >
										<%=rMap.get("EMPNO")%>
									</a>
								</td>
								<td>
									<%=rMap.get("EMP_NAME") %>
								</td>
								<td>
									<%=rMap.get("EMP_SOSOC") %>
								</td>
							</tr>
						<%
								}
							}
						%>
						</tbody>
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
<!-- ============================================================================================================================================= -->
<!-- ===============================================================일용직 검색창================================================================= -->
<!-- ============================================================================================================================================= -->
		  	
  </body>
</html>

