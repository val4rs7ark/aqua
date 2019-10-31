<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.util.PageBar" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
	String msg = (String)request.getAttribute("msg");
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
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
    <title>급여등록</title>
  <%@ include file="/common/bs_css.jsp"%>
  <script type="text/javascript">
	  //[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
	  //[0-9] => \d , [^0-9] => \D
	  var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
	  var rgx2 = /(\d+)(\d{3})/; 
	  
	//급여정보창 
	function info_sal(gubun) {
		if("jung"==gubun){
			window.open("/erp/HRsalery_info?gubun="+gubun,"open the window","toolbar=no, width=568, height=846, top=70, left=730");
		}else if("one"==gubun){
			window.open("/erp/HRsalery_info?gubun="+gubun,"open the window","toolbar=no, width=568, height=531, top=200, left=730");
		}
	}
	  //근로소득간이세액표 열기
	  function open_sal_pdf() {
		  window.open(
					"/erp/text/show_sal_pdf.jsp","open the window","toolbar=no,l width=800, height=900, top=50, left=550");
		  //window.open('http://www.daum.net ', '_blank');  같은코드 더 간단함
		  //var sal_pdf = window.open("about:blank");
		  //sal_pdf.location.href = "text/show_sal_pdf.jsp";
		  
	  }
	  
	  //급여명세서 보낼때 확인여부 새로운 창으로 만들기
	  function openWindow() {
			  var p_sal_total = "";
			  var myForm = document.f_deli_insert;
			  if($("#sal_total").val()!=""){
				  p_sal_total = $("#sal_total").val();
			  }
			 if(empno!=null & p_sal_total!=""){ //사원이 선택되고 산출까지 한경우
					window.open(
						"","f_deli_insert", 
						"toolbar=no, width=500, height=250, top=150, left=150"
					);
				myForm.action="/erp/HRSal_send";
				myForm.method="POST";
				myForm.target="f_deli_insert";
				myForm.submit();
			}else if(empno==null & p_sal_total!=""){//사원이 선택 되지 않았을경우
				alert("사원을 선택한후 실행해 주시기 바랍니다.");
			}else if(empno==null & p_sal_total==""){//사원과 산출모두 선택하지 않을경우
				alert("사원을 선택한후 실행해 주시기 바랍니다.");
			}else if(empno!=null & p_sal_total==""){//사원만 선택 되고 산출은 눌르지 않았을경우
				alert("산출버튼을 눌른후 실행해 주시기 바랍니다.");
			}else { //그외
				alert("알수없는 오류가 발견되었습니다. 관리자에게 문의해 주세요");
			}
	  }
	  function getNumber(obj){
	     
	       var num01;
	       var num02;
	       num01 = obj.value;
	       num02 = num01.replace(rgx1,"");
	       num01 = setComma(num02);
	       obj.value =  num01;
	  
	  }
	  function numberWithCommas(x) { //콤마 박아주는 함수
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
  	function seach_emp_name(){ //정규직일경우 사원검색 버튼
  		var search_emp_name = $("#search_emp_name").val();
  		$.ajax({
	    	url:"/erp/HRseach_emp_name.was?search_emp_name="+search_emp_name+"&imsi_gubun=search"
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#search_name_after").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  	}
  	function seach_emp_name_one(){//일용직일경우 사원검색 버튼
  		var search_emp_name_one = $("#search_emp_name_one").val();
  		$.ajax({
	    	url:"/erp/HRseach_emp_name.was?search_emp_name_one="+search_emp_name_one+"&imsi_gubun=search_one"
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#search_name_after_one").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  	}
  	function removeComma(str){ //콤마 제거 함수
		n = parseInt(str.replace(/,/g,""));
		return n;
	}
  	//email보내는 버튼
  	function sal_send(){
		location.href="/erp/HRSal_send?email=zzanglkw7@gmail.com";
	}
  	function sal_cancle(){
		location.href="/erp/HRSalery_insert";
	}
  	//계좌번호 변경 완료 버튼
  	function sal_update_complate(empno){
  		var sal_account = $("#after_sal_account").val();
  		if(""==sal_account){
  			sal_account = $("#before_sal_account").val();
  		}
  		var b_emp_sal = $("#after_emp_sal").val();
  		if(""==b_emp_sal){
  			b_emp_sal = $("#before_emp_sal").val();
  		}
  		var emp_sal = numberWithCommas(b_emp_sal);
  		
  		var emp_bank = $("#r_emp_bank").val();
  		
  		var sal_writer = $("#sal_writer").val();
  		
  		location.href="/erp/HRsalary_change_account_href.was?sal_account="+sal_account+"&emp_sal="+emp_sal+"&p_empno="+empno+"&emp_bank="+emp_bank+"&emp_writer="+sal_writer;
	}
  	//모달창 닫는 함수
  	function close_modal(){
  		$("#notOrderWriter").hide();
	}
  	function hide_modal(modal_name){
  		$("#"+modal_name+"").hide();
	}
  	
  	function insert_commit(modal_name){
  		$("#f_deli_insert").attr("method","post");
  		$("#f_deli_insert").attr("action","/erp/HRSalery_insert_commit");
  		$("#f_deli_insert").submit();
	}
  	
  	//정규직 등록버튼
  	function sal_insert(){
  		var imsi_empno = "";
  		if($("#empno").val()!=""){
  			imsi_empno = $("#empno").val();
  		}
  		var imsi_saltotal = "";
  		if($("#sal_total").val()!=""){
  			imsi_saltotal = $("#sal_total").val();
  		}
  		var imsi_salwhen = "";
  		if($("#sal_when").val()!=""){
  			imsi_salwhen = $("#sal_when").val();
  		}
  		if(imsi_empno!="" & imsi_saltotal!="" & imsi_salwhen!=""){
  			$("#f_deli_insert").attr("method","post");
  	  		$("#f_deli_insert").attr("action","/erp/HRSalery_insert_commit");
  	  		$("#f_deli_insert").submit();
  		}else{
  			$("#Access_insert").show();
  		}
	}
  	
  	//일용직 등록버튼
  	function sal_insert_one(){
  		var imsi_empno = "";
  		if($("#empno_one").val()!=""){
  			imsi_empno = $("#empno_one").val();
  		}
  		var imsi_saltotal = "";
  		if($("#sal_total_one").val()!=""){
  			imsi_saltotal = $("#sal_total_one").val();
  		}
  		var imsi_salwhen = "";
  		if($("#sal_when_one").val()!=""){
  			imsi_salwhen = $("#sal_when_one").val();
  		}
  		if(imsi_empno!="" & imsi_saltotal!="" & imsi_salwhen!=""){
  		$("#f_deli_insert_one").attr("method","post");
  		$("#f_deli_insert_one").attr("action","/erp/HRSalery_insert_commit");
  		$("#f_deli_insert_one").submit();
  		}else{
  			$("#Access_insert").show();
  		}
	}
  	
  	function sal_equals_one(){//========================================일용직 산출 버튼
  		var sal_default_one = $("#sal_default_one").val().toString();
  		var r_sal_default_one = 0;
  		if(""!=sal_default_one){
  			r_sal_default_one =	parseInt(removeComma(sal_default_one));
  		}
  		var sal_one_date  = parseInt($("#sal_one_date_one").val());
  		
  		var sal_rice_one = $("#sal_rice_one").val().toString();
  		var r_sal_rice_one = 0;
  		if(""!=sal_rice_one){
  			r_sal_rice_one = parseInt(removeComma(sal_rice_one))*sal_one_date;
  		}

  		var sal_drive_one = $("#sal_drive_one").val().toString();
  		var r_sal_drive_one = 0;
  		if(""!=sal_drive_one){
  			r_sal_drive_one = parseInt(removeComma(sal_drive_one))*sal_one_date;
  		}
  		
  		var sal_life_one = $("#sal_life_one").val().toString();
  		var r_sal_life_one = 0;
  		if(""!=sal_life_one){
  			r_sal_life_one = parseInt(removeComma(sal_life_one))*sal_one_date;
  		}
  		
  		var sal_over_one = $("#sal_over_one").val().toString();
  		var r_sal_over_one = 0;
  		if(""!=sal_over_one){
  			r_sal_over_one = parseInt(removeComma(sal_over_one))*sal_one_date;
  		}
  		//임시 토탈값
  		var imsi_sal_total = (r_sal_default_one*sal_one_date)+r_sal_rice_one+r_sal_drive_one+r_sal_life_one+r_sal_over_one;

  		$("#sal_total_one").val(imsi_sal_total+"원"); //토탈 자리에 값을 입력
  		
  		var tax_soduc_one = Math.round(imsi_sal_total*5/100);
  		$("#tax_soduc_one").val(numberWithCommas(tax_soduc_one));
  		
  		var tax_kukmin_one = Math.round(imsi_sal_total*5/100);
  		$("#tax_kukmin_one").val(numberWithCommas(tax_kukmin_one));
  		
  		var tax_health_one = Math.round(imsi_sal_total*5/100);
  		$("#tax_health_one").val(numberWithCommas(tax_health_one));
  		
  		var tax_pain_one = 0;
  		
  		var tax_work_one = Math.round(imsi_sal_total*5/100);
  		$("#tax_work_one").val(numberWithCommas(tax_work_one));
  		
  		var tax_long_one = Math.round(imsi_sal_total*5/100);
  		$("#tax_long_one").val(numberWithCommas(tax_long_one));
  		
  		var tax_etc_sudang_one = $("#tax_etc_sudang_one").val().toString();
  		var r_tax_etc_sudang_one = 0;
  		if(""!=tax_etc_sudang_one){
  			r_tax_etc_sudang_one = parseInt(removeComma(tax_etc_sudang_one));
  		}
  		var imsi_minus_total = tax_soduc_one+tax_kukmin_one+tax_health_one+tax_pain_one+tax_work_one+tax_long_one+r_tax_etc_sudang_one;
  		
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
  		
  		var sal_plus = $("#sal_plus").val().toString();
  		var r_sal_plus = 0;
  		if(""!=sal_plus){
  			r_sal_plus = parseInt(removeComma(sal_plus));
  		}
  		
  		var sal_over = $("#sal_over").val().toString();
  		var r_sal_over = 0;
  		if(""!=sal_over){
  			r_sal_over = parseInt(removeComma(sal_over));
  		}
  		
  		var sal_rest = Math.round(parseInt(removeComma(sal_default))/30*4);
  		var r_sal_rest = 0;
  		if(0!=sal_rest){
  			r_sal_rest = sal_rest;
  		}
  		$("#sal_rest").val(numberWithCommas(r_sal_rest));
  		
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
  		$("#sal_rice").val(numberWithCommas(r_sal_rice));
  		
  		
  		var sal_drive = $("#sal_drive").val().toString();
  		var r_sal_drive = 0;
  		if(""!=sal_drive){
  			r_sal_drive = parseInt(removeComma(sal_drive));
  		}
  		$("#sal_drive").val(numberWithCommas(r_sal_drive));
  		
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
  		$("#sal_tel").val(numberWithCommas(r_sal_tel));
  		
  		var sal_level = $("#sal_level").val().toString();
  		var r_sal_level = 0;
  		if(""!=sal_level){
  			r_sal_level = parseInt(removeComma(sal_level));
  		}
  		$("#sal_level").val(numberWithCommas(r_sal_level));
  		
  		var sal_baby = $("#sal_baby").val().toString();
  		var r_sal_baby = 0;
  		if(""!=sal_baby){
  			r_sal_baby = parseInt(removeComma(sal_baby));
  		}
  		$("#sal_baby").val(numberWithCommas(r_sal_baby));
  		
 		var sal_etc_detail = $("#sal_etc_detail").val(); //기타항목 상세 내용
 		
 		//임시 토탈값
  		var imsi_sal_total = r_sal_default+r_sal_plus+r_sal_over+r_sal_rest+r_sal_etc+r_sal_rice+r_sal_drive+r_sal_life+r_sal_tel+r_sal_level+r_sal_baby;
		$("#imsi_sal_total").val(numberWithCommas(imsi_sal_total)+"원");

		
		//공제항목
  		var tax_soduc = Math.round(imsi_sal_total*5/100);
  		$("#tax_soduc").val(numberWithCommas(tax_soduc));
  		
  		var tax_jungsan = 0;
  		if($("#tax_jungsan").val()!=null){
	  		$("#tax_jungsan").val(numberWithCommas(tax_jungsan));
  		}
  		
  		var tax_chon = Math.round(tax_soduc*1/10);
  		$("#tax_chon").val(numberWithCommas(tax_chon));
  		
  		//결근일수 *50,000원
 		var tax_nocheck = 0;
  		
 		var tax_kukmin = Math.round(tax_chon*45/1000);
  		$("#tax_kukmin").val(numberWithCommas(tax_kukmin));
  		
  		var tax_health = Math.round(imsi_sal_total*312/10000);
  		$("#tax_health").val(numberWithCommas(tax_health));
  		
  		var tax_pain = 15000;
  		$("#tax_pain").val(numberWithCommas(tax_pain));
  		
  		var tax_work = Math.round(imsi_sal_total*65/10000);
  		$("#tax_work").val(numberWithCommas(tax_work));
  		
  		var tax_long = Math.round(tax_health*369/10000);
  		$("#tax_long").val(numberWithCommas(tax_long));
  		
 		var tax_etc_sudang = $("#tax_etc_sudang").val();
  		var r_tax_etc_sudang = 0;
  		if(""!=tax_etc_sudang){
  			r_tax_etc_sudang = parseInt(removeComma(tax_etc_sudang));
  		}
  		
  		var imsi_tax_etc_sudang_dt = $("#tax_etc_sudang_dt").val(); // 받아온 값을 숫자형으로 변환 
  		
  		//공제 토탈값
  		var imsi_minus_total = tax_soduc+tax_jungsan+tax_chon+tax_nocheck+tax_kukmin+tax_health+tax_pain+tax_work+tax_long+r_tax_etc_sudang;
  		$("#imsi_minus_total").val(numberWithCommas(imsi_minus_total)+"원");
		
  		//총토탈값
  		
  		var sal_total = imsi_sal_total-imsi_minus_total;
  		//$("#sal_total").val(sal_total); //토탈 자리에 값을 입력
  		$("#sal_total").val(numberWithCommas(sal_total)+"원"); //토탈 자리에 값을 입력
  	}
  	function select_empno(r_empno,r_gubun){//정규직검색버튼 에서 사원 선택했을때 적용되는 함수
  		<%
  			for(int i=0;i<r_list.size();i++){
  				Map<String,Object> oneSMap = r_list.get(i);	
	  	%>
	  		//검색한 사원번호와 해당하는사원번호가 같을경우 정보를 꺼냄 
	  		if(r_empno=="<%=oneSMap.get("EMPNO").toString()%>"){
	  			var r_emp_name = "<%=oneSMap.get("EMP_NAME").toString()%>";
	  			var r_resident_no = "<%=oneSMap.get("RESIDENT_NO").toString()%>";
	  			var r_emp_hp = "<%=oneSMap.get("EMP_HP").toString()%>";
	  			var r_emp_indate = "<%=oneSMap.get("EMP_INDATE").toString()%>";
	  			var r_emp_sosoc = "<%=oneSMap.get("EMP_SOSOC").toString()%>";
	  			var r_emp_bank = "<%=oneSMap.get("EMP_BANK").toString()%>";
	  			var r_sal_account = "<%=oneSMap.get("SAL_ACCOUNT").toString()%>"; 
	  			var r_emp_email = "<%=oneSMap.get("EMP_EMAIL").toString()%>"; 
	  			var r_emp_position = "<%=oneSMap.get("EMP_POSITION").toString()%>"; 
	  			var s_emp_sal = "<%=oneSMap.get("EMP_SAL").toString()%>"; 
	  			var l_emp_sal = removeComma(s_emp_sal);
	  			r_emp_sal = numberWithCommas(Math.round(parseInt(l_emp_sal)/12));
			  	//사원 정보부분 아작스로 변경
	  			$.ajax({
			    	url:"/erp/HRsalary_select_empno.was?empno="+r_empno+"&emp_name="+r_emp_name+"&resident_no="+r_resident_no+"&emp_hp="+r_emp_hp+"&emp_indate="+r_emp_indate+"&emp_sosoc="+r_emp_sosoc+"&emp_bank="+r_emp_bank+"&sal_account="+r_sal_account+"&emp_email="+r_emp_email+"&emp_position="+r_emp_position+"&table_gubun=jungkyu"
			    	,method:"get"
			    	,success:function(data){//해석하기
			    		$("#select_empno_change_jungkyu").html(data);//해석하기
			    	}
			    	,error:function(e){
			    		alert(e.responseText);
			    	}
			    });
		  			$.ajax({
				    	url:"/erp/HRsalary_change_default.was?emp_sal="+r_emp_sal+"&r_gubun="+r_gubun
				    	,method:"get"
				    	,success:function(data){//해석하기
				    		$("#change_default").html(data);//해석하기
				    	}
				    	,error:function(e){
				    		alert(e.responseText);
				    	}
				    });
			  }
	  	<%
	  		}
  		%>
  		/* 검색버튼 눌르면 급여변경정보 모달창이 최신화됨 */
  		$.ajax({
	    	url:"/erp/HRemp_sal_update.was?empno="+r_empno+"&emp_name="+r_emp_name+"&emp_bank="+r_emp_bank+"&sal_account="+r_sal_account+"&emp_sal="+s_emp_sal
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#sal_update").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  		/* 검색버튼 누른후에 최종적으로 사원이름을 누르면 사원검색 화면을 기존화면으로 아작스 처리  */
  		$.ajax({//imsi_gubun 컬럼은 DB를 타고 돌아왔을때 search_name_after.jsp에서 정규직인지 일용직인지 구별하기 위한 식별자
	    	url:"/erp/HRseach_emp_name.was?imsi_gubun=jung"
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#search_name_after").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  		$("#search_emp_name").val("");
  		$("#emp_imfo .close").click();//선택후 자동 모달창 끄기
  	}
  	function select_empno_one(r_empno,r_gubun){//일용직 검색버튼 에서 사원 선택했을때 적용되는 함수
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
	  			var r_emp_bank = "<%=oneSMap.get("EMP_BANK").toString()%>";
	  			var r_sal_account = "<%=oneSMap.get("SAL_ACCOUNT").toString()%>"; 
	  			var r_emp_position = "<%=oneSMap.get("EMP_POSITION").toString()%>"; 
	  			var r_emp_sal = "<%=oneSMap.get("EMP_SAL").toString()%>"; 
	  			var r_emp_email = "<%=oneSMap.get("EMP_EMAIL").toString()%>"; 
	  			//사원 정보부분 아작스로 변경
	  			$.ajax({
			    	url:"/erp/HRsalary_select_empno.was?empno="+r_empno+"&emp_name="+r_emp_name+"&resident_no="+r_resident_no+"&emp_hp="+r_emp_hp+"&emp_indate="+r_emp_indate+"&emp_sosoc="+r_emp_sosoc+"&emp_bank="+r_emp_bank+"&sal_account="+r_sal_account+"&emp_email="+r_emp_email+"&emp_position="+r_emp_position+"&table_gubun=one"
			    	,method:"get"
			    	,success:function(data){//해석하기
			    		$("#select_empno_change_one").html(data);//해석하기
			    	}
			    	,error:function(e){
			    		alert(e.responseText);
			    	}
			    });
			  	$.ajax({
			    	url:"/erp/HRsalary_change_default.was?emp_sal="+r_emp_sal+"&r_gubun="+r_gubun
			    	,method:"get"
			    	,success:function(data){//해석하기
			    		$("#change_default_one").html(data);//해석하기
			    	}
			    	,error:function(e){
			    		alert(e.responseText);
			    	}
			    });
			  }
	  	<%
	  		}
  		%>
  		/* 검색버튼 눌르면 급여변경정보 모달창이 최신화됨 */
  		$.ajax({
	    	url:"/erp/HRemp_sal_update.was?empno="+r_empno+"&emp_name="+r_emp_name+"&emp_bank="+r_emp_bank+"&sal_account="+r_sal_account+"&emp_sal="+r_emp_sal
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#sal_update").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  		/* 검색버튼 누른후에 최종적으로 사원이름을 누르면 사원검색 화면을 기존화면으로 아작스 처리  */
  		$.ajax({
	    	url:"/erp/HRseach_emp_name.was?imsi_gubun=one"
	    	,method:"get"
	    	,success:function(data){//해석하기
	    		$("#search_name_after_one").html(data);//해석하기
	    	}
	    	,error:function(e){
	    		alert(e.responseText);
	    	}
	    });
  		$("#search_emp_name_one").val("");
  		$("#emp_imfo_one .close").click();//선택후 자동 모달창 끄기
  	   //구매/사용 신청 총액 자동 구하기
  		
  	}
  </script>
  </head>
  <body>
  <script type="text/javascript">
  $(document).ready(function(){
	  if('<%=msg%>'=='null'){
		  $("#notOrderWriter").hide();	
	  }else{
		  $("#notOrderWriter").show();	
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
	<div class="container" style=" margin-left: 20px;">
	<div class="base_table_div" style="width: 1350px; border:none;height: 969px;">
	<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<div style="margin-top: 45px; padding-left: 26px">
  	</div>
<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<!--================================상단바===========================================-->
		<div class="card bg-dark text-white" style="height:50px; margin-top:7px">
	    	<div class="card-body" style="font-size: 17px; font-weight: 900;">영업/매출관리 > 급여 등록</div>
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
						  <form id="f_deli_insert" name="f_deli_insert" method="post">
	                	  <input type="hidden" name="sal_gubun" value="jung">
	                	  <input type="hidden" name="sal_writer" value="ghost">
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
													<input type="text" class="form-control" id="empno" name="empno" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_name" name="emp_name" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="resident_no" name="resident_no" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">소속</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_sosoc" name="emp_sosoc" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_hp" name="emp_hp" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">입사일</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_indate" name="emp_indate" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_bank" name="emp_bank" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="sal_account" name="sal_account" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
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
									  					<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px; text-align:right;" >
									  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*검색버튼에서 사원을 선택해 주세요.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">기본급*</td>
									  					<td id="change_default" style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_default" name="sal_default" type="text" class="form-control" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;"  onchange="getNumber(this)" onkeyup="getNumber(this)" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">성과급</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_plus" name="sal_plus" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this)" onkeyup="getNumber(this)">&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">식대</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_rice" name="sal_rice" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15,000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>	
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">교통비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_drive" name="sal_drive" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15,000">적용</option>
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
																	<option value="15,000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>		
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">통신비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
									  						<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_tel" name="sal_tel" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15,000">적용</option>
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
																	<option value="25,000">부서장</option>
																	<option value="13,000">팀장</option>
																</select>
															</div>	
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">주휴수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray; ">
															<input id="sal_rest" name="sal_rest" type="text" class="form-control" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">육아수당</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_baby" name="sal_baby" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="15,000">적용</option>
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
									  					<td colspan="4" style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 120px; font-size: 14px;" >
									  						급여정보를 보려면 "<a href="javascript:info_sal('jung')" style="color:black;">여기</a>"를 눌러주세요
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
															<input type="hidden" id="imsi_sal_total" name="imsi_sal_total" >
															<input type="hidden" id="imsi_minus_total" name="imsi_minus_total" >
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
															<input id="tax_soduc" name="tax_soduc" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >연말정산소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
									  						<input id="tax_jungsan" name="tax_jungsan" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">지방소득세</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_chon" name="tax_chon" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">결근공제액</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_nocheck" name="tax_nocheck" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">국민연금</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_kukmin" name="tax_kukmin" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">장기요양보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
									  						<input id="tax_long" name="tax_long" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">건강보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_health" name="tax_health" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">노동조합비용</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_pain" name="tax_pain" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">고용보험</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="tax_work" name="tax_work" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;" readonly>&nbsp;원
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
									  						<input id="tax_etc_sudang_dt" name="tax_etc_sudang_dt" type="text" class="form-control" placeholder="항목을 입력하세요."  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-left: 5px; padding-right: 5px; color: darkgray;">
															<input id="tax_etc_sudang" name="tax_etc_sudang" type="text" class="form-control" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
									  					<td style=" width: 90px; padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; ">
															<button type="button" class="btn btn-secondary btn pull-left" onclick="javascript:sal_equals()" style="padding-left: 7px; padding-right: 7px; font-size: 14px; padding-top: 2px; padding-bottom: 2px;" >추가</button>
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:10px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※소득세 = 근로소득간이세액표에 의거산출<br>
									  						※결근공제액 = 결석일수 x50,000원<br>
									  						※국민연금 = (월급여)x9% x50% 원<br>
									  						※장기요양보험료 = 건강보험료 x 7.38% x50%<br>
									  						※노동조합비용 = 15,000원
									  					</td>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※지방소득세 = 소득세x10%<br>
									  						※연말정산 소득세 = 정산기록에 의거기입<br>
									  						※건강보험료 = (월급여)x6.24% x50% 원<br>
									  						※고용보험료 = (월급여)x0.65% 원<br>
									  						&nbsp;
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
					    	<button type="button" onclick="javascript:sal_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px; ">취소</button>
							<button type="button" onclick="javascript:sal_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px;">등록</button>
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#emp_imfo" data-backdrop="static" >사원검색</button>
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#sal_update" data-backdrop="static" >급여정보 수정</button>
							<button type="button" onclick="javascript:openWindow()" class="btn btn-secondary btn pull-left" style="width: 138px; margin-left: 20px; font-size: 14px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px;">급여명세서 보내기</button>
							<button type="button" onclick="javascript:open_sal_pdf()" class="btn btn-secondary btn pull-left" style=" margin-left: 20px; font-size: 14px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px;">근로소득간이세액표</button>
			              </div>
			              
<!-- ====================================================================================================================================================================================================================================== -->
<!-- ====================================================================================================================================================================================================================================== -->
			              <div class="tab-pane fade" id="asd">
<!-- *********************************************************************************************************************************************************************************************************** -->
						  <form id="f_deli_insert_one" name="f_deli_insert_one" method="post">
						  <input type="hidden" name="sal_gubun" value="one">
						  <input type="hidden" name="sal_writer_one" value="ghost">
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
													<input type="text" class="form-control" id="empno_one" name="empno" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_name" name="emp_name" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="resident_no" name="resident_no" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">임시소속</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_sosoc" name="emp_sosoc" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_hp" name="emp_hp" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">초기등록일</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_indate" name="emp_indate" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="emp_bank" name="emp_bank" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
												</td>
							  				</tr>
							  				<tr>
							  					<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
							  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
													<input type="text" class="form-control" id="sal_account" name="sal_account" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
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
									  					<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px; text-align:right;" >
									  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*검색버튼에서 사원을 선택해 주세요.
									  					</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">일급*</td>
									  					<td id ="change_default_one" style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_default_one" name="sal_default_one" type="text" class="form-control" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this,'sal_default')" onkeyup="getNumber(this,'sal_default')" readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">일수*</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px; color: darkgray;">
															<input id="sal_one_date_one" name="sal_one_date" type="number" value="0" class="form-control" size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;일
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">식대</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_rice_one" name="sal_rice_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="3000">적용</option>
																	<option value="0">미적용</option>
																</select>
															</div>	
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">교통비</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<div class="dropdown" style="width: 140px;" >
																<select class="btn btn-white dropdown_bs" id="sal_drive_one" name="sal_drive_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="3000">적용</option>
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
																	<option value="3000">적용</option>
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
									  					<td colspan="4" style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 120px; font-size: 14px;" >
									  						급여정보를 보려면 "<a href="javascript:info_sal('one')" style="color:black;">여기</a>"를 눌러주세요
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
															<input id="sal_when_one" name="sal_when_one" type="date" class="form-control" size="27" style="height: 28px; width:160px; font-size: 13px; background-color: transparent;">
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
															<input id="tax_soduc_one" name="tax_soduc_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;" >고용보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="tax_work_one" name="tax_work_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">국민연금</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="tax_kukmin_one" name="tax_kukmin_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">장기요양보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="tax_long_one" name="tax_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
														</td>
									  				</tr>
									  				<tr>
									  					<td style=" height: 50px; padding-left: 30px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 50px;">건강보험</td>
														<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 271.25px;">
															<input id="tax_health_one" name="tax_health_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>&nbsp;원
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
									  						<input id="tax_etc_sudang_dt_one" name="tax_etc_sudang_dt_one" type="text" class="form-control" placeholder="항목을 입력하세요."  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;">
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; width: 100px; padding-left: 5px; padding-right: 5px; color: darkgray;">
															<input id="tax_etc_sudang_one" name="tax_etc_sudang_one" type="text" class="form-control" name="companyname" placeholder="금액을 입력하세요." size="27" style="text-align:right; height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline;" onchange="getNumber(this);" onkeyup="getNumber(this);">&nbsp;원
														</td>
														<td style=" width: 90px; padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 20px; ">
															<button type="button" class="btn btn-secondary btn pull-left" onclick="javascript:sal_equals_one()" style="padding-left: 7px; padding-right: 7px; font-size: 14px; padding-top: 2px; padding-bottom: 2px;" >추가</button>
														</td>
									  					<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; padding-left: 5px;"></td>
									  				</tr>
									  			</tbody>
									  		</table>
									  		<table class="table" style=" width: 100%; margin-bottom: 0px; margin-top:30px;"> 
									  			<tbody style="text-align: left;">
									  				<tr>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※소득세 = 근로소득간이세액표에 의거산출<br>
									  						※국민연금 = (월급여)x9% x50% 원<br>
									  						※장기요양보험료 = 건강보험료 x 7.38% x50%<br>
									  					</td>
									  					<td style=" height: 50px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none; padding-left: 80px; font-size: 14px;" >
									  						※건강보험료 = (월급여)x6.24% x50% 원<br>
									  						※고용보험료 = (월급여)x0.65% 원<br>
									  						&nbsp;
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
					    	<button type="button" onclick="javascript:sal_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px; ">취소</button>
							<button type="button" onclick="javascript:sal_insert_one()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px;">등록</button>
							<!-- 
								일용직은 급여명세서 안줌 
								<button type="button" onclick="javascript:openWindow('one')" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px;">보내기</button> 
							-->
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#emp_imfo_one" data-backdrop="static" >사원검색</button>
							<button type="button" class="btn btn-secondary btn pull-left" style="padding-left: 7px; margin-top: 20px; padding-right: 7px; font-size: 14px; margin-left:20px; padding-top: 2px; padding-bottom: 2px;"  data-toggle="modal" data-target="#sal_update" data-backdrop="static" >급여정보 수정</button>
			              	<button type="button" onclick="javascript:open_sal_pdf()" class="btn btn-secondary btn pull-left" style=" margin-left: 20px; font-size: 14px; margin-top: 20px; padding-top: 2px; padding-bottom: 2px; padding-left: 5px; padding-right: 5px;">근로소득간이세액표</button>
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
						<input id="search_emp_name" name="search_emp_name" type="text" class="form-control" placeholder="사원이름을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" type="button" onclick="javascript:seach_emp_name()">검색</zealot>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;" id="search_name_after" name="search_name_after">
						<thead>
							<tr>
								<th style="width:150px;">사번</th>
								<th style="width:150px;">이름</th>
								<th style="width:150px;">소속</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(r_list!=null){
								for(int i=0;i<r_list.size();i++){
									Map<String,Object> rMap = r_list.get(i);
										if(!"임시".equals(rMap.get("EMP_LEVEL").toString())){
						%>
										<tr>
											<td>
												<a href="javascript:select_empno('<%=rMap.get("EMPNO").toString()%>','jungkyu')" style="color:black;" >
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
						<input id="search_emp_name_one" name="search_emp_name_one" type="text" class="form-control" placeholder="사원이름을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" type="button" onclick="javascript:seach_emp_name_one()">검색</zealot>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;" id="search_name_after_one">
						<thead>
							<tr>
								<th style="width:150px;">사번</th>
								<th style="width:150px;">이름</th>
								<th style="width:150px;">소속</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(r_list!=null){
								for(int i=0;i<r_list.size();i++){
									Map<String,Object> rMap = r_list.get(i);
									if("임시".equals(rMap.get("EMP_LEVEL").toString())){
						%>
									<tr>
										<td>
											<a href="javascript:select_empno_one('<%=rMap.get("EMPNO").toString()%>','one')" style="color:black;" >
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
		  	
		  	
<!-- ============================================================================================================================================= -->
<!-- ===============================================================기본급 변경창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="container">

	<div class="modal" id="sal_update">
		<div class="modal-dialog modal-dialog-centered" ">
			<div class="modal-content" style="height: 500px;">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title">급여정보 변경</div>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;">
						<tbody>
							<tr>
								<td colspan="3" style="border:none;height:62.5px; color: darkgray; vertical-align: middle; text-align: center;">
									선택된 사원이 없습니다. 사원을 먼저 선택해 주세요
								</td>
								
							</tr>
							<tr>
								<td style="border:none; width:42%;font-weight: 800;">
									연봉 변동 내용	
								</td>
								<td style="border:none; width:16%;"></td>
								<td style="border:none; width:42%;"></td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none; ">
									<input id="sal_long_one" name="sal_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;"readonly>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none; width:42%;font-weight: 800;">
									입금계좌정보 변경
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; width: 271.25px;">
									<div class="dropdown" style="width: 140px;" >
										<select class="btn btn-white dropdown_bs" id="sal_life_one" name="sal_life_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
											<option value="#">선택</option>
										</select>
									</div>		
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none;height:40px;">
									<input id="sal_long_one" name="sal_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;"readonly>
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none;text-align: right;color: darkgray; ">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 클로즈 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" style="width:40px;" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================기본급 변경창================================================================= -->
<!-- ============================================================================================================================================= -->
	

<!-- ============================================================================================================================================= -->
<!-- ===============================================================입력창================================================================= -->
<!-- ============================================================================================================================================= -->

<div class="container" >

	<div class="modal" id="insert_commit">
		<div class="modal-dialog modal-dialog-scrollable" >
			<div class="modal-content">
			
				<!-- 헤더 -->
				<div class="modal-header">
					<h3>품목등록</h3>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
					
				<!-- 입력란 -->
				<div class="modal-body" style="margin:auto; margin-top:40px; margin-bottom:40px;">
					<div>
						<input type="text" class="form-control" name="pd_name_insert" placeholder="생산품명을 입력하세요."  size="27" style="height:27px; width:170px; font-size: 13px; display:inline;">
						<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px; width:90px; margin-left: 5px; margin-bottom: 4px;">중복확인</button>
					</div>
				</div>
				
				<!-- 클로즈 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" data-dismiss="modal">insert</button>
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================품목등록창================================================================= -->
<!-- ============================================================================================================================================= -->

	
<!-- ============================================================================================================================================= -->
<!-- ===============================================================입력 완료 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="notOrderWriter" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <h6 style="display:inline;font-weight:bold;font-size:large">정상적으로 등록 되었습니다.</h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:close_modal()" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================입력 완료 모달창================================================================= -->
<!-- ============================================================================================================================================= -->

<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="Access_insert" data-backdrop="static"data-keyboard="true" >
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
           <h6 style="display:inline;font-weight:bold;font-size:large; color:red;">사원정보</h6>
           <h6 style="display:inline;font-weight:bold;font-size:large">, </h6>
           <h6 style="display:inline;font-weight:bold;font-size:large; color:red;">총지급액</h6>
           <h6 style="display:inline;font-weight:bold;font-size:large">, </h6>
           <h6 style="display:inline;font-weight:bold;font-size:large; color:red;">지급일자</h6>
           <h6 style="display:inline;font-weight:bold;font-size:large">는 <br>필수 입력사항입니다</h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:hide_modal('Access_insert')" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
	
	
  </body>
</html>

