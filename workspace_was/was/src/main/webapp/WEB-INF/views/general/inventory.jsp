<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap,java.util.Map,java.util.List"%>
<%@ page import="com.util.PageBar" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%  
/* <!--========================메인페이지 관련 로직 시작===========================--> */
	List<Map<String,Object>> invenList = (List<Map<String,Object>>)request.getAttribute("invenList");
	String getInvenTotal = request.getAttribute("getInvenTotal").toString();
	int getTotal = Integer.parseInt(getInvenTotal);
/* <!--========================메인페이지 관련 로직 끝===========================--> */
///////////////////////페이지 네이션 로직 /////////////////////////////
	//총 레코드 갯수
	int tot = 0;
	if(session.getAttribute("s_tot")!=null){
		tot = Integer.parseInt(session.getAttribute("s_tot").toString());
	}
	int size = 0;
	if(invenList !=null && invenList.size()>0){
		size = invenList.size();//전체 레코드 수(*맵은 컬럼의 수이지 로우의 수가 아님.)
	}
	/////////////페이지 네비게이션 추가분////////////////
	int numPerPage = 10; //몇개로우를 뿌려줄것인지
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>           

<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 시작===========================-->
<%
	
%>		
<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 끝===========================-->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	  crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"/></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"/></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"/></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"/></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<title>자산 구매 신청/사용 내역</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">

	Number.prototype.format = function(){
	    if(this==0) return 0;
	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');
	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	    return n;
	};
	
	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";
	    return num.format();
	};
	
	jQuery('.format-comma').text(function() {
	    jQuery(this).text(
	        jQuery(this).text().format()
	    );
	});
	//돔구성이 완료되면 실행- #뒤에 버튼 아이디등을 입력해주면 해당 아이디 클릭시 실행됨.
	$(document).ready(function(){
		  $("#").click(function(){
		  });
		  //체크 박스 선택 삭제시 선택 안한 체크박스 확인 후 체크박스 선택한 경우 진짜 삭제 모달창 띄우기.
		  $("#delete").click(function(){
			    //선택된 체크박스가 없는 상태에서 삭제 버튼 클릭시 deleteempty 모달 실행 후 함수 빠져나오기.
				var order_no = "";
				  $("input[name='checkRow']:checked").each (function(){
					  order_no = order_no + $(this).val()+"," ;
					  });
				  if(order_no == ''){
					    $("#deleteempty").modal();
					    return false;
					  }
				var order_writers = "";
				var s_emp_name = $("#s_emp_name").val();
				var checkedbox = $("input[name='checkRow']:checked");
				checkedbox.each(function(i){
					var tr = checkedbox.parent().parent().eq(i);
					var td = tr.children();	
					order_writers = order_writers+td.eq(8).text()+",";
				});
	     			 /* alert("order_writers="+order_writers); */
	     			order_writers = order_writers.substring(0,order_writers.lastIndexOf(","));
	     			 /* alert("order_writers="+order_writers); */
	     			var order_writer = new Array();
	     			order_writer = order_writers.split(",");
	     			 /* alert("order_writer="+order_writer[0]);
	     			 alert("order_writer.length="+order_writer.length); */
	     			for(var i=0;i<order_writer.length;i++){
	     				/* alert("s_emp_name="+s_emp_name); */
	     				if(order_writer[i] !== s_emp_name){
	     				$("#notOrderWriter").modal();
	     				return false;
	     				}
	     			}
					$("#deletealert").modal();
		  });//end of 체크박스 삭제
		  
		  //진짜 삭제 진행 
		  $("#realdel").click(function(){
			var order_no = "";
			  $("input[name='checkRow']:checked").each (function(){
				  order_no = order_no + $(this).val()+",";
				  });
			  var lastindex = order_no.lastIndexOf(",");
			  order_no = order_no.substring(0,lastindex);
			  location.href="/erp/general_invenDel?order_no="+order_no;
		  });
		  
		});//end of document ready 함수

	//메인-구매/사용신청-품목검색 아작스
 	function pummoksearch(){
			//alert("신규등록 품목검색 메소드 호출 성공");
		$.ajax({
			url:"/erp/general_pummokSearch"
			,method:"get"
			,success:function(data){
				$("#pummoksearch_register").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});	
	} 
 	function pummoksearch2(){
			//alert("수정- 품목검색 메소드 호출 성공");
		$.ajax({
			url:"/erp/general_pummokSearch2"
			,method:"get"
			,success:function(data){
				$("#pummoksearch_register").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});	
	} 
	//메인페이지 체크박스 선택값 승인	
	function confirm(i){
		//alert("confirm 호출");
		var order_no = $("#d_order_no"+i).val();
		//$("#f_order_no").val(order_no);
		alert(order_no);
		//document.getElementById('r_order_no').innerHTML="order_no";//원시
		//$("#r_order_no").val(order_no);//jquery
		//var order_writer = document.getElementById('order_writer'+i).value;
		//alert("order_writer:"+order_writer);
		//document.getElementById(id).value;
		var s_emp_name = $("#s_emp_name").val();//jquery
		//var s_emp_name = document.getElementById('s_emp_name').value;//원시적
		if(s_emp_name=="유종남"){
			//alert(s_emp_name);
			//alert("if탐");
		$("#f_invenDetail").attr("method","post");
		$("#f_invenDetail").attr("action","general_confirm?order_no="+order_no);
		$("#f_invenDetail").submit();
		}else{
			alert("승인 권한이 없습니다. 구매부에 문의하세요.");
		}
	}
	//구매/사용신청 저장 그룹코드,수량,단가중 미선택 사항이 있으면 모달창을 띄워줌. 정상일 경우만 invendAdd2 실행,저장됨.	
	function addAction(){
		var ivgroup_code = document.getElementById('ivgroup_code');
		var order_count = document.getElementById('order_count');
		var order_unitprice = document.getElementById('order_unitprice');
		if( ivgroup_code.value == '' || ivgroup_code.value == null ||
			order_count.value == '' || order_count.value == null ||
			order_unitprice.value == '' || order_unitprice.value ==null){
		    /* alert("품목코드,수량,단가는 필수 입력사항 입니다."); */
		    $("#alert").modal();
		}else{
			$("#invenAdd").attr("method","post");
			$("#invenAdd").attr("action","/erp/general_invenAdd2");
			$("#invenAdd").submit();
			$("#register").modal('close');
		}
	}
	//전체선택 /해제
	function checkAll(){
	      if( $("#th_checkAll").is(':checked') ){
	        $("input[name=checkRow]").prop("checked", true);
	      }else{
	        $("input[name=checkRow]").prop("checked", false);
	      }
	}
	//input 태그 숫자값 최대자리수 체크maxlength
	 function maxLengthCheck(object){
	  	  if (object.value.length > object.maxLength){
	    object.value = object.value.slice(0, object.maxLength);}   
	 }

	//재고 사용/등록 모달 공백 체크	
 	function check(){
		//alert("체크");
		var ivgroup_code = document.getElementById('ivgroup_code');
		var order_count = document.getElementById('order_count');
		var order_unitprice = document.getElementById('order_unitprice');
		if( ivgroup_code.value == '' || ivgroup_code.value == null ||
			order_count.value == '' || order_count.value == null ||
			order_count.value == '' || order_count.value){
		    return false;
		}
	} 
	//모달창 리셋 - 동작안함..;;
	$('#main_resister').on('hidden.bs.modal', function () {
		$(this).removeData();
	});
	function selectBtn(gubun){
		//alert("gubun="+gubun);
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=user_CheckBox]:checked");
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var gubun = td.eq(1).text();
			var code = td.eq(2).text();
			var name = td.eq(3).text();
			var size = td.eq(4).text();
			// 가져온 값을 배열에 담는다.
			tdArr.push(gubun);
			tdArr.push(code);
			tdArr.push(name);
			tdArr.push(size);
		});
/* 		$("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);	
		$("#ex3_Result2").html(tdArr); */
 		if(tdArr==null||tdArr==""){
			//alert("품목이 선택되지 않았습니다.");
			$("#pummoksearch_alert").modal();			
		}else{
			//alert("모달이 꺼집니다.");
			$("#pummoksearch_register").modal('hide');
		if(gubun=='update'){
			/* alert("성공"); */
			$.ajax({
				url:"/erp/general_newresister?tdArr="+tdArr+"&gubun2="+gubun
				,method:"get"
				,success:function(data){
					$("#resister_update").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
			}else{
				/* alert("else"); */
				$.ajax({
					url:"/erp/general_newresister?tdArr="+tdArr+"&gubun2="+gubun
					,method:"get"
					,success:function(data){
						$("#register").html(data);
					}
					,error:function(e){
						alert(e.responseText);
					}
				});
			} 	
		}
	};
	//신규등록화면 취소시, 모달창 초기화(새 모달창 불러오기)-아작스가 안됨.. 그냥 페이지 이동 처리.
	function cancel(){
/* 		$.ajax({
			url:"/erp/general_resistercancel"
			,method:"get"
			,suceess:function(data){
				$("#main_resister").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		}); */
		location.href="/erp/general_invenList";
	}
	//품목검색 중복선택 방지(출처: https://canworld42.tistory.com/25 [깨어 있는 세상])
	function onlyOneCheck(chk){
    var obj = document.getElementsByName("user_CheckBox");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}	
	//품목추가_이벤트
	function pummokadd(){
		var p_code= document.getElementById('pid_code');
		var p_size = document.getElementById('pid_size');
		var p_name = document.getElementById('pid_name');
		if( p_code.value == '' || p_code.value == null ||
				p_size.value == '' || p_size.value == null ||
				p_name.value == '' || p_name.value ==null){
		    /* alert("품목코드,수량,단가는 필수 입력사항 입니다."); */
		    $("#alert").modal();
		}else{
			$("#alert").modal('hide');
		$("#f_pummokadd").attr('method','post');
		$("#f_pummokadd").attr('action','/erp/general_pommokAdd');
		$("#f_pummokadd").submit();
		}
		
	}
	//로우 마우스 오버,아웃시 배경색 바꾸기 (참고소스 원본) - 기존 부트스트립 퐁당퐁당 배경식이 지워져서 일단 미적용
/* 	function changeTrColor(trObj, oldColor, newColor) {
		trObj.style.backgroundColor = newColor;
		trObj.onmouseout = function(){
			trObj.style.backgroundColor = oldColor;
		}
	} */
	//상세조회 - 로우 클릭시 실행
	function clickTrEvent(imsi) {
		$("#inven_detail_"+imsi).modal();
	}
		/* location.href = "general_invendetail?checkRow="+checkRow; */

	//수정버튼 클릭 이벤트
	function btn_update(imsi){
		$("#inven_update_"+imsi).modal();	
	}
	//수정화면에서 적용시 update 이벤트
	function update(){
		//alert("update호출");
		$("#f_invenUpdate").attr('action','/erp/general_invenUpdate');
		$("#f_invenUpdate").attr('method','post');
		$("#f_invenUpdate").submit();
	}
	function invenSearch(){
		//alert("invenSearch 호출");
		$("#f_searchBar").attr('action','/erp/general_invenList');
		$("#f_searchBar").attr('method','get');
		$("#f_searchBar").submit();
	}
	function nowSearch(){
		//alert("nowSearch 호출 성공");
		$("#nowSearch").modal();	
		$.ajax({
			url:"/erp/general_nowSearch"
			,method:"post"
			,success:function(data){
				$("#nowSearch").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});			
	}
	//품목 추가 품목코드 중복 확인
	function jungbokCheck(){
		alert("중복확인");
		var pid_code = $("#pid_code").val();
		if(pid_code==null||pid_code==""){
	 		alert("품목코드 입력후 확인해주세요.");
		}else{
			alert("입력은ok");
			$("#jungbokAlert").modal();
			$.ajax({
			url:"/erp/general_jungbokAlert?pid_code="+pid_code
			,method:"get"
			,success:function(data){
				$("#jungbokAlert").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}			
		});
		}
	}
	
	function numberCommas(x) { //콤마 박아주는 함수
		$("#unitp_1").val(numberWithCommas(x));
    }
	function numberWithCommas(x) { //콤마 박아주는 함수
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
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
	   function setComma(inNum){
	        var outNum;
	        outNum = inNum; 
	        while (rgx2.test(outNum)) {
	             outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
	         }
	        return outNum;
	   }	
</script> 
</head>
<body>
<script type="text/javascript">  
	//구매/사용 신청 총액 자동 구하기
	$(function(){
	$('input.num_only').on('keyup',function(){
     var order_unitprice = parseInt($("#order_unitprice").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
     var order_count = parseInt($("#order_count").val() || 0);
     var totalPrice = order_unitprice * order_count
     $("#order_totalprice").val(totalPrice);
        });
	});
	$(function(){
	$('input.num_only').on('mouseup',function(){
     var order_unitprice = parseInt($("#order_unitprice").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
     var order_count = parseInt($("#order_count").val() || 0);
     var totalPrice = order_unitprice * order_count
     $("#order_totalprice").val(totalPrice);
        });
	});
	//구매/사용 신청 총액 자동 구하기(수정화면)
	$(function(){
	$('input.num_only2').on('keyup',function(){
     var order_unitprice = parseInt($("#order_unitprice2").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
     var order_count = parseInt($("#order_count2").val() || 0);
     var totalPrice = order_unitprice * order_count
     $("#order_totalprice2").val(totalPrice);
        });
	});
	$(function(){
	$('input.num_only2').on('mouseup',function(){
     var order_unitprice = parseInt($("#order_unitprice2").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
     var order_count = parseInt($("#order_count2").val() || 0);
     var totalPrice = order_unitprice * order_count
     $("#order_totalprice2").val(totalPrice);
        });
	});
       
</script>	
<div class="container-fluid">
<div class="row"  >
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp" %>
    <!-- 삭제 시 작성자만 삭제 할수 있도록 현재 로그인한 세션에 담긴 작성자 이름을 input태그에 저장.  -->  
   	<input id="s_emp_name" type="hidden" value=<%=s_emp_name%>>
      
<%
//////////////////세션에 담긴 아이디 담기.////////////
%>
  </div>
<div style="width:80%" >
<div class="container" style="margin-left: 0px;">
<div class="base_table_div" style="height: 865px;width:1350px">
<!--=====================================상단바===========================================-->
   <div class="card bg-dark text-white" style="height:50px; margin-top:70px">
       <div class="card-body" style="font-size:20px;display:table">
          <div style="display:table-cell;valign:middle;">자산 구매 신청/사용 내역</div>
       </div>
   </div>
<!--=====================================상단바===========================================-->
<!--=====================================검색바 시작========================================-->
  <div class="row" style="margin-bottom: -25;margin-top:10px;width:1345px">
  <form id ="f_searchBar">
  <table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1;width:1340px">
    <thead>
      <tr style="background:white;border-top:2px solid black">
        <th style="border-top-width:2px;border-top-color: #dee2e6;">
   			<select name="s_gubun" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
     border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;"">
    			<option value="">구분
    			<option value="s__gubun_buy">구매
    			<option value="s__gubun_use">사용
   			</select>
   			<select name="s_pummok" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
     border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;">
    			<option value="">선택
    			<option value="s_pummok_name">품목명
    			<option value="s_pummok_code">품목코드
    			<option value="s_order_writer">작성자
   			</select>
        </th>        
        <th style="border-top-width:2px;border-top-color: #dee2e6;">
          <input type="text" class="form-control" name="s_keyword" placeholder="&nbsp;&nbsp;품목명 또는 재고코드를 입력하세요."
            size="33" style="height:38px;width:100%;min-width:100px; font-size: 13px;padding-left:0px">
        </th>
        <th style="border-top-width:2px;border-top-color: #dee2e6;padding-left:0px;padding-right:1px">
         <input name="s_start_date" type="date" class="form-control" style="padding-right:0px">
	    </th>
	    <th style="border-top-width:2px;border-top-color: #dee2e6;padding-left:0px;padding-right:0px">
	       <i class='fas fa-minus-square' style="font-size:36px;margin-left: 20px;"></i>
	    </th>
	    <th style="border-top-width:2px;border-top-color: #dee2e6;padding-left:1px;padding-right:0px">
	       <input name="s_end_date" type="date" class="form-control">
	    </th>
	    <th style="border-top-width:2px;border-top-color: #dee2e6;">
	       <button onclick="javascript:invenSearch()" class="btn btn-dark" style="float: right; width:60px;padding:6px 5px 6px 5px;background: #efefef;padding: 3px 3px 3px 3px;color:black;
     border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;"">조회</button>
	    </th>
      </tr>
    </thead>
  </table>
  </form> 
  </div> 
<!--=====================================검색바 끝========================================-->
  <div style="margin-left:0px;">
  <div style="margin:12px 0px -4px 0px">
	  <button type="button" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
	  border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;width: 90px;" 
	  data-toggle="modal" data-target="#main_resister">신규등록</button>
	  <!-- <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px"
	  data-toggle="modal" data-target="#inven_update">수정</button> -->
	  <input id="delete" type="button" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
	  border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;width: 90px;" value="삭제">
	  <button type="button" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
	  border-color: #6c757d;font-size:15px;font-weight:900;margin-right:10px;height: 33px;width: 150px;"
	  onclick="javascript:nowSearch()">현재재고조회</button>
	  <!-- <button type="button" class="btn btn-dark" style="float:right;padding:6px 5px 6px 5px;margin-right:7px" onClick="javascript:confirm()">선택승인</button> -->
  </div>
     <div class="row" style="margin-top:15px;width:1350px">
        <div class="col-sm-12" style="padding-left: 0px;padding-right: 0px;">
           <table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%;">
                    <th style="width:4%;padding-top:15px;">
                       <div><input name="th_checkAll" id="th_checkAll" type="checkbox" onclick="checkAll()"></div> 
                    </th>
                    <th style="width:5%;">구분</th>
                    <th style="width:14%;">품목명</th>
                    <th style="width:9%;">규격</th>
                    <th style="width:7%;">수량</th>
                    <th style="width:8%;">단가</th>
                    <th style="width:9%;">총액</th>
                    <!-- <th style="width:9%;">소모일</th> -->
                    <th style="width:9%;">신청일</th>
                    <!-- <th style="width:9%;">승인일</th> -->
                    <th style="width:9%;">작성자</th>
                    <th style="width:9%;">상태</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              
<% 	
	if(getTotal>0){
//	for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
	for(int i=0;i<size;i++){
		if(size == i) break;
		Map<String,Object> kMap = new HashMap<>();
		kMap = invenList.get(i);
		String order_enddate = "";
		String order_startdate = "";
		if(kMap.get("ORDER_ENDDATE")!=null){
			order_enddate = kMap.get("ORDER_ENDDATE").toString();
		}
		if(kMap.get("ORDER_STARTDATE")!=null){
			order_startdate = kMap.get("ORDER_STARTDATE").toString();
		}
%>       
<!--               	 <tr id="mainRow" onclick="javascript:clickTrEvent(this)"
					 onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#F4FFFD')"
					 style="cursor:pointer"> -->
              	 <tr style="background-color:white">
              		<td style="padding-top:18px;">
              		<input id="checkRow" name="checkRow" type="checkbox" value="<%=kMap.get("ORDER_NO")%>">
              		</td>     		
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
					    style="cursor:pointer;font-size:15px"><%=kMap.get("ORDER_GUBUN")%>
					</td>
              		<td onclick="javascript:clickTrEvent(<%=i%>)"
					 	style="cursor:pointer;font-size:15px"><%=kMap.get("IVGROUP_NAME")%>
              		</td>
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px"><%=kMap.get("IVGROUP_SIZE")%>
           			</td>
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px" onload="javascript:numberWithCommas(<%=kMap.get("ORDER_COUNT")%>)"><%=kMap.get("ORDER_COUNT")%>
           			</td>
              		<td class="format-comma" onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px" <%-- onload="javascript:numberCommas(<%=kMap.get("ORDER_UNITPRICE")%>)" --%>><%=kMap.get("ORDER_UNITPRICE")%>
              			<%-- <input id="unitp_<%=i %>" type="text" value=""> --%>
           			</td>
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px"><%=kMap.get("TOTALPRICE")%>
              		</td>
<%--               		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer"><%=order_enddate%>
              		</td> --%>
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px"><%=kMap.get("ORDER_INDATE")%>
              		</td>
<%--               		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px"><%=order_startdate%> --%>
              		</td>
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer;font-size:15px"><%=kMap.get("ORDER_WRITER")%></td>
<%
	if(kMap.get("DELIVERY_STATE")!=null && kMap.get("DELIVERY_STATE").toString().equals("11")){
%>		
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer">
              			<div style="width:118px;display:inline-block;background-color:Green;color:#fff;padding-top:5px;padding-bottom:5px;">
              			승인대기
              			</div>
           			</td>
<%
	}else{
%>              		
              		<td onclick="javascript:clickTrEvent(<%=i%>)" 
              			style="cursor:pointer">
              			<div style="width:118px;display:inline-block;background-color:#343a40;color:#fff;padding-top:5px;padding-bottom:5px;">승인완료<%-- <%=kMap.get("DELIVERY_STATE")%> --%>
              			</div>
              		</td>
              		
<%
	}
%>              		
              	 </tr>
<%
		}
	}
%>              	 
              </tbody>
              </table>                 
        </div>
     </div>
</div>
  </div>
</div>
 <!-- =========================[[페이지 네이션 추가]]===================== -->
  <table style="width:1350px;height:20px;text-algin:center;">
 	<tr>
 	<td align="center" >
 	<ul class="pagination" style="justify-content: center;"> 
<%
	Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
	String s_keyword = null; 
	String s_start_date = null; 
	String s_end_date = null; 
	String s_gubun = null; 
	String s_pummok = null; 
	if(rMap.get("s_keyword")!=null){
		s_keyword = rMap.get("s_keyword").toString();
	}
	if(rMap.get("s_start_date")!=null){
		s_start_date = rMap.get("s_start_date").toString();
	}
	if(rMap.get("s_end_date")!=null){
		s_end_date = rMap.get("s_end_date").toString();
	}
	if(rMap.get("s_gubun")!=null){
		s_gubun = rMap.get("s_gubun").toString();
	}
	if(rMap.get("s_pummok")!=null){
		s_pummok = rMap.get("s_pummok").toString();
	}
	String pagePath = "general_invenList?s_keyword="
	+s_keyword+"&s_start_date="+s_start_date+"&s_end_date="+s_end_date+"&s_gubun="+s_gubun+"&s_pummok="+s_pummok;
	PageBar pb = new PageBar(numPerPage,getTotal,nowPage,pagePath);
	String pagination = null;//1 2 3 4 5 6 7 8 9 10 ->
	pagination = pb.getPageBar();
	out.print(pagination);
	    //out.print("<a href=test.mo?crud=boardList&nowPage=0>1</a> <b>2</b>");
%>   
 	</ul>
 	</td>
 	</tr>
 </table> 
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
</div>

<!-- ===================================모달뷰 (메인 - 신규 등록) 시작===================================== -->
<div class="modal fade" id="main_resister" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="width:452px">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">자산 구매/사용 신청</h4>
        <button type="button" class="close" data-dismiss="modal" onclick="cancel()">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<form id = "invenAdd">
        <table class="table" style="border-top-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 0px;margin-bottom: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%; padding-top:7px; padding-bottom: 7px;">구분</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <select id="order_gubun" name="order_gubun">
		              	<option value="구매">구매
		              	<option value="사용">사용
		              </select>
		           	 </td>
		        	 <td style="width:5%;padding-top:7px; padding-bottom: 7px;">
		           	 </td>
		           	 <td style="width:10%"></td>
		           	 <td style="width:10%"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="register" class="table" style="margin-bottom: 0px;border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top:9px; padding-bottom: 0px;">품목코드</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_code" name="ivgroup_code" type="text" class="form-control" style="height:28px;;font-size: 13px;text-align:right" readonly>
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;width:auto" colspan="3">
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" 
		           			   onclick="javascript:pummoksearch()" data-toggle="modal" 
		           			   data-target="#pummoksearch_register" value="검색" >
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd" value="품목추가">
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right" readonly>
		           	 </td>
		           	 <td colspan="3" style="font-size:12px"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_size" name="ivgroup_size" type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" readonly>
		           	 </td>
		             <td colspan="3" style="font-size:12px"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="register2" class="table" style="border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">          
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only num_sum form-control" id="order_count" name="order_count" type="number" style="height:28px;font-size:13px; text-align:right;" maxlength="5" oninput="maxLengthCheck(this)">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">단가</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only num_sum form-control" id="order_unitprice" name="order_unitprice" type="text" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >총액</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="order_totalprice" name="order_totalprice"  class="form-control" type="text" 
		               style="height:28px;font-size:13px;text-align:right" readonly>
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td>
		           	 <td colspan="2"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		             <td colspan="4">
		                <textarea id="order_memo" name="order_memo" style="height:95%; width:95%;"></textarea>
		                <input id="s_emp_no" type="hidden" name="s_emp_no" value="<%=s_emp_no%>">
		             </td>
		          </tr>
       		</tbody>
    	</table>
    	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <input id="newresister_save" class="btn btn-dark" type="button" value="저장" onClick='javascript:addAction()'>
        <button type="button" class="btn btn-dark" data-dismiss="modal" onclick="cancel()">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 신규 등록) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 상세조회) 시작===================================== -->
<%
	String order_memo2 = "";
	for(int i=0;i<invenList.size();i++){
		Map<String,Object> pMap = new HashMap<>();
		pMap = invenList.get(i);
		if(pMap.get("ORDER_MEMO")!=null){
			order_memo2 = pMap.get("ORDER_MEMO").toString();
		}
%>

<div class="modal fade" id="inven_detail_<%=i%>" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">자산 구매/사용 상세조회</h4>
        <button type="button" class="close" data-dismiss="modal" onclick="cancel()">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="padding-bottom: 0px;">
      	<form id = "f_invenDetail">
        <table class="table" style="border-top-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 0px;margin-bottom: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%; padding-top:7px; padding-bottom: 7px;">구분</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
      		<input id="d_order_no<%=i%>" name="order_no" type="hidden" value="<%=pMap.get("ORDER_NO")%>">
      		<input id="r_order_no" name="r_order_no" type="hidden" value="">
      		<input id="order_writer<%=i%>" name="order_writer" type="hidden" value="<%=pMap.get("ORDER_WRITER")%>">
	   		              <input id="order_gubun" name="order_gubun" type="text" class="form-control" 
	   		              		 style="height: 28px;font-size: 13px;text-align:right" readonly
	   		              		 value="<%=pMap.get("ORDER_GUBUN")%>">
<!-- 		              <select id="order_gubun" name="order_gubun">
		              	<option value="구매">구매
		              	<option value="사용">사용
		              </select> -->
		           	 </td>
		        	 <td style="width:15%;padding-top:7px; padding-bottom: 7px;">
		           	 </td>
		           	 <td style="width:10%"></td>
		           	 <td style="width:10%"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="register3" class="table" style="margin-bottom: 0px;border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top:9px; padding-bottom: 0px;">품목코드</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_code" name="ivgroup_code" type="text" class="form-control" 
		              	     style="height: 28px;;font-size: 13px;text-align:right" readonly
		              	     value="<%=pMap.get("IVGROUP_CODE")%>">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;width:auto" colspan="3">
		           		<!-- <input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" onClick="javascript:pummoksearch()" data-toggle="modal" data-target="#pummoksearch" value="검색" >
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd" value="품목추가"> -->
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" 
		                     style="height: 28px;font-size: 13px;text-align:right" readonly
		                     value="<%=pMap.get("IVGROUP_NAME")%>">
		           	 </td>
		           	 <td colspan="3" style="font-size:12px"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_size" name="ivgroup_size" type="text" 
	              			 class="form-control" style="height:28px;font-size:13px;
	              			 text-align:right" readonly
	              			  value="<%=pMap.get("IVGROUP_SIZE")%>">
		           	 </td>
		             <td colspan="3" style="font-size:12px"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="register4" class="table" style="border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">          
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only num_sum form-control" id="order_count" 
		                 	 name="order_count" type="number" style="height:28px;font-size:13px; 
		                 	 text-align:right;" maxlength="5" oninput="maxLengthCheck(this)" readonly
		                 	 value="<%=pMap.get("ORDER_COUNT")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top: 7px; padding-bottom: 7px;" >단가</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only num_sum form-control" id="order_unitprice" 
		                 	 name="order_unitprice" type="text" style="height:28px;
		                 	 font-size:13px;text-align:right" readonly
		                 	 value="<%=pMap.get("ORDER_UNITPRICE")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >총액</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="order_totalprice" name="order_totalprice"  class="form-control" 
	              			 type="text" style="height:28px;font-size:13px;text-align:right" readonly
		               		 value="<%=pMap.get("TOTALPRICE")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td>
		           	 <td colspan="2"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		             <td colspan="4">
		                <input id="order_memo" name="order_memo" class="form-control" 
	              			   type="text"style="height:95%; width:95%;" readonly
		                 value="<%=order_memo2%>">
		                <input type="hidden" name="order_writer" value="<%=s_emp_no%>">
		             </td>
		          </tr>
       		</tbody>
    	</table>
    	</form>
      </div>

      <!-- Modal footer -->
      <div style="display:table;text-align:center;margin:15px">
	      <div style="display:table-cell;float:left;vertical-align:middle">
		       <input id="b_confirm" class="btn btn-dark" type="button" value="승인" onClick='javascript:confirm(<%=i %>)'>
	      </div>
	      <div style="display:table-cell;float:right;vertical-align:middle">
	       	   <input id="b_update" class="btn btn-dark" type="button" value="수정" onClick='javascript:btn_update(<%=i %>)'>
	           <button type="button" class="btn btn-dark" data-dismiss="modal" onclick="cancel()">닫기</button>
	      </div>	
      </div>
    </div>
  </div>
</div>
<%
	}
%>
<!-- ===================================모달뷰 (메인 - 상세조회) 끝===================================== -->
<!-- ===================================모달뷰 수정 (메인 - 상세조회 - 수정) 시작===================================== -->
<%
	order_memo2 = "";
	for(int i=0;i<invenList.size();i++){
		Map<String,Object> pMap = new HashMap<>();
		pMap = invenList.get(i);
		if(pMap.get("ORDER_MEMO")!=null){
			order_memo2 = pMap.get("ORDER_MEMO").toString();
		}
%>

<div class="modal" id="inven_update_<%=i%>" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">수정</h4>
        <button type="button" class="close" data-dismiss="modal" onclick="cancel()">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body" style="padding-bottom: 0px;">
      	<form id = "f_invenUpdate">
      	<input id="order_no" name="order_no" type="hidden" value="<%=pMap.get("ORDER_NO")%>">
        <table class="table" style="border-top-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 0px;margin-bottom: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%; padding-top:7px; padding-bottom: 7px;">구분</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
<%-- 	   		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" 
	   		              		 style="height: 28px;font-size: 13px;text-align:right" readonly
	   		              		 value="<%=pMap.get("ORDER_GUBUN")%>"> --%>
	          	<select id="order_gubun" name="order_gubun">
		              	<option value="구매">구매
		              	<option value="사용">사용
		              </select> 
		              <%-- <input value="(기존값:<%=pMap.get("ORDER_GUBUN")%>)" readonly style="border:none"> --%>
		           	 </td>
		        	 <td style="width:10%;padding-top:7px; padding-bottom: 7px;">
		           	 </td>
		           	 <td style="width:5%"></td>
		           	 <td style="width:5%"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="resister_update" class="table" style="margin-bottom: 0px;border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 0px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top:9px; padding-bottom: 0px;">품목코드</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_code" name="ivgroup_code" type="text" class="form-control" 
		              	     style="height: 28px;;font-size: 13px;text-align:right" readonly
		              	     value="<%=pMap.get("IVGROUP_CODE")%>">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;width:auto" colspan="3">
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" onClick="javascript:pummoksearch2()" data-toggle="modal" data-target="#pummoksearch_register" value="검색" >
		           		<!-- <input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd" value="품목추가"> -->
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" 
		                     style="height: 28px;font-size: 13px;text-align:right" readonly
		                     value="<%=pMap.get("IVGROUP_NAME")%>">
		           	 </td>
		           	 <td colspan="3" style="font-size:12px"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_size" name="ivgroup_size" type="text" 
	              			 class="form-control" style="height:28px;font-size:13px;
	              			 text-align:right" readonly
	              			  value="<%=pMap.get("IVGROUP_SIZE")%>">
		           	 </td>
		             <td colspan="3" style="font-size:12px"></td>
		          </tr>
	          </tbody>
          </table>
          <table id="register5" class="table" style="border-bottom-style: solid; width: 100%; border-top-width: 0px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">          
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only2 num_sum form-control" id="order_count2" 
		                 	 name="order_count2" type="number" style="height:28px;font-size:13px; 
		                 	 text-align:right;" maxlength="5" oninput="maxLengthCheck(this)" 
		                 	 value="<%=pMap.get("ORDER_COUNT")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >단가</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only2 num_sum form-control" id="order_unitprice2" 
		                 	 name="order_unitprice2" type="text" style="height:28px;
		                 	 font-size:13px;text-align:right" 
		                 	 value="<%=pMap.get("ORDER_UNITPRICE")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >총액</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="order_totalprice2" name="order_totalprice2"  class="form-control" 
	              			 type="text" style="height:28px;font-size:13px;text-align:right" readonly
		               		 value="<%=pMap.get("TOTALPRICE")%>">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td>
		           	 <td colspan="2"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		             <td colspan="4">
		                <input id="order_memo" name="order_memo" class="form-control" 
	              			   type="text"style="height:95%; width:95%;" 
		                 value="<%=order_memo2%>">
		                <input type="hidden" name="order_writer" value="<%=s_emp_no%>">
		             </td>
		          </tr>
       		</tbody>
    	</table>
    	</form>
      </div>

      <!-- Modal footer -->
      <div style="display:table;text-align:center;margin:15px">
	      <div style="display:table-cell;float:right;vertical-align:middle">
	       	   <input id="b_update" class="btn btn-dark" type="button" value="저장" onClick='javascript:update()'>
	           <button type="button" class="btn btn-dark" data-dismiss="modal" onclick="cancel()">닫기</button>
	      </div>	
      </div>
    </div>
  </div>
</div>
<%
	}
%>
<!-- ===================================모달뷰 수정(메인 - 상세조회- 수정) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 현재재고조회) 시작===================================== -->
<div class="modal" id="nowSearch" style="">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">현재재고조회</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;width:25%">
           	   			<select class="btn btn-dark" style="height:38px;">
			    			<option>품목명
			    			<option>품목코드
			   			</select>
		             </td>
		             <td style="padding-top: 5px; padding-bottom: 5px;width:45%">
		             	<input type="text" class="form-control">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom: 7px;width:25%">
		        	 	<button class="btn btn-dark" style="height:38px;">조회</button>
		           	 </td>
		          </tr>
       		</tbody>
    	</table>
    	<table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width:">구분</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                    <th style="width:">수량</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td>자산</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>17"</td>
              		<td>100</td>
              	 </tr>
              	 <tr>
              		<td>자산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>30*30*30</td>
              		<td>5</td>
              	 </tr>
              	 <tr>
              		<td>자산</td>
              		<td>a0023</td>
              		<td>사무용 의자</td>
              		<td>30*20*15</td>
              		<td>1025</td>
              	 </tr>              	             	             	             	 
              </tbody>
         </table> 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark">적용</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 현재재고조회) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 신규 등록 -품목검색) 시작===================================== -->
<div class="modal" id="pummoksearch_register" style="border:1px solid black">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

<!--       Modal Header
      <div class="modal-header">
        <h5 class="modal-title">품목검색</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      Modal body
      <div class="modal-body">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;width:25%">
           	   			<select class="btn btn-dark" style="height:38px;">
			    			<option>품목명
			    			<option>품목코드
			   			</select>
		             </td>
		             <td style="padding-top: 5px; padding-bottom: 5px;width:45%">
		             	<input type="text" class="form-control">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom: 7px;width:25%">
		        	 	<button class="btn btn-dark" style="height:38px;">조회</button>
		           	 </td>
		          </tr>
       		</tbody>
    	</table>
    	<table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width">
                       
                    </th>
                    <th style="width:">구분</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>사무</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>32"</td>
              	 </tr>
             	             	             	             	 
              </tbody>
         </table> 
      </div> -->

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark">적용</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 신규 등록 -품목검색) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 신규 등록 -품목추가_뷰) 시작===================================== -->
<div class="modal fade" id="itemadd">
  <div class="modal-dialog modal-dialog-centered" style="margin-left: 1180px;">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">품목 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <form id="f_pummokadd">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;">품목코드</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="pid_code" name="p_code" type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;" colspan="3">
		           		<input type="button" class="btn btn-secondary btn_firstrow" 
		           			   style="width:auto;height:26px;margin-right:0px" value="중복확인"
		           			   onclick="javascript:jungbokCheck()">
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="pid_name" name="p_name" type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		           	 <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="pid_size" name="p_size" type="text" class="form-control" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		             <td></td><td></td><td></td>
		          </tr>
       		</tbody>
    	</table>
      </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" onclick='pummokadd()'>저장</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 신규 등록 - 품목 추가) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 신규등록- alert) 시작=========================================== -->
<div class="modal" id="alert" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;text-align:center;display:table;">
        <h6 style="display:table-cell;vertical-align:middle;font-weight: bold;
    	           font-size: large;">품목코드,수량,단가는 <br>필수  입력 사항입니다.</h6>
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰(메인 - 신규등록- alert) 끝=========================================== -->
<!-- ===================================모달뷰 (메인 - 삭제- alert-정말삭제?) 시작=========================================== -->
<div class="modal" id="deletealert" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
      	<div style="display:table-cell;vertical-align:middle;text-align:center;">
      		<img style="heigth:20px;width:20px;margin-bottom: 8x"src="/erp/images/warning-black.png" alt="주의:">
        	<h6 style="display:inline;font-weight:bold;font-size:large">삭제 하시겠습니까?</h6>
      	</div>	
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<input id="realdel" style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal" value="삭제">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰(메인 - 삭제- alert-정말삭제?) 끝=========================================== -->
<!-- ===================================모달뷰 (메인 - 삭제- alert-정말삭제?) 시작=========================================== -->
<div class="modal" id="deleteempty" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
      	<div style="display:table-cell;vertical-align:middle;text-align:center;">
      		<img style="heigth:20px;width:20px;margin-bottom: 8x"src="/erp/images/warning-black.png" alt="주의:">
        	<h6 style="display:inline;font-weight:bold;font-size:large">삭제할 대상을 선택하세요.</h6>
      	</div>	
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰(메인 - 삭제- alert-정말삭제?) 끝=========================================== -->
<!-- ===================================모달뷰 (메인 - 삭제- alert-작성자만 삭제) 시작=========================================== -->
<div class="modal" id="notOrderWriter" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
      	<div style="display:table-cell;vertical-align:middle;text-align:center;">
      		<img style="heigth:20px;width:20px;margin-bottom: 8x"src="/erp/images/warning-black.png" alt="주의:">
        	<h6 style="display:inline;font-weight:bold;font-size:large">작성자만 삭제할 수 있습니다.</h6>
      	</div>	
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰(메인 - 삭제- alert-작성자만 삭제) 끝=========================================== -->
<!-- ===================================모달뷰 (품목미선택- alert) 시작=========================================== -->
<div class="modal" id="pummoksearch_alert" data-backdrop="static" data-keyboard="true">
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
      	<div style="display:table-cell;vertical-align:middle;text-align:center;">
      		<img style="heigth:20px;width:20px;margin-bottom: 8x"src="/erp/images/warning-black.png" alt="주의:">
        	<h6 style="display:inline;font-weight:bold;font-size:large">품목이 선택되지 않았습니다.</h6>
      	</div>	
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
      	<button style="width: 13%;height: 100%;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
    					margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ===================================모달뷰(품목미선택- alert) 끝=========================================== -->
<!-- ===================================모달뷰 (품목코드 중복체크- alert) 시작=========================================== -->
<div class="modal" id="jungbokAlert" data-backdrop="static" data-keyboard="true">
공백
</div>
<!-- ===================================모달뷰(품목코드 중복체크- alert) 끝=========================================== -->
</div>
</body>
</html>