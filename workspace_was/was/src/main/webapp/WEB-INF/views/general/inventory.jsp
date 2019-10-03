<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap,java.util.Map,java.util.List"%>
<!--========================메인페이지 관련 로직 시작===========================-->
<%  
	double numberperpage = 10;
	List<Map<String,Object>> invenList = (List<Map<String,Object>>)request.getAttribute("invenList");
	String getInvenTotal = request.getAttribute("getInvenTotal").toString();
	out.print("getInvenTotal="+getInvenTotal+"&nbsp");
	int getTotal = Integer.parseInt(getInvenTotal);
	out.print("getTotal="+getTotal+"&nbsp");
	int pageSize = (int)Math.ceil(getTotal/numberperpage);
	out.print("invenList.size():"+invenList.size());
%>           
<!--========================메인페이지 관련 로직 끝===========================-->
<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 시작===========================-->
<%
	
%>		
<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 끝===========================-->

<%="pageSize="+pageSize%>
<%double t = 10;
  int r = 1;
  int k = (int)Math.ceil(r/t);
  out.print("k="+k);%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>자산 구매 신청/사용 내역</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">  
/* 	function openWin(w,h){
	 x = (screen.availWidth - w) / 2;
	 y = (screen.availHeight - h) / 2;
	 window.open('./inventory_register.jsp','pop','width='+w+', height='+h+', left='+x+', top='+y+','toolbar=no, 
			 location=0, directories=0, status=no, menubar=no, scrollbars=no, resizable=yes, copyhistory=no')}; */
/* 	$("#myModal").draggable({
		handle: ".modal-header"}); */
	
	//메인-구매/사용신청-품목검색 아작스
 	function pummoksearch(){
		$.ajax({
			url:"/erp/general_pummoksearch"
			,method:"get"
			,success:function(data){
				$("#pummoksearch").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});	
	} 

	//메인페이지 체크박스 선택값 승인	
	function confirm(){
		alert("승인");	
		var checked = $("#checkRow").val();
		if(checked!==null){
			alert("담김");
		}
	}
	//구매/사용신청 저장	
	function addAction(){
		alert("addAction 호출성공")
		$("#invenAdd").attr("method","post");
		$("#invenAdd").attr("action","/erp/general_invenAdd2");
		$("#invenAdd").submit();
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
	//구매/사용 신청 총액 구하기
/* 	var order_unitprice = order_unitpirce.val();
	var order_count = order_count.val();
	function getTotalprice(order_unitprice,order_count){
		return order_unitprice * order_count;
	} */
	//구매/사용 신청 총액 자동 구하기
	$(function(){
	$('input.num_only').on('keyup',function(){
     var order_unitprice = parseInt($("#order_unitprice").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
     var order_count = parseInt($("#order_count").val() || 0);
     var totalPrice = order_unitprice * order_count
     $("#order_totalprice").val(totalPrice);
        });
	});

</script> 
</head>
<body>

<div class="row" >
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp" %>
     <!-- ======================================================================================================================================================================= -->
    <!--                                              여기부터 내영역                                                                -->
     <!-- ======================================================================================================================================================================= -->
  </div>
<div style="width:80%" >
<div class="container" style="margin-left: 0px;">
<div class="base_table_div" style="height: 865px; ">
<!--================================상단바===========================================-->
   <div class="card bg-dark text-white" style="height:50px; margin-top:70px">
       <div class="card-body" style="font-size:20px;display:table">
          <div style="display:table-cell;valign:middle;">자산 구매 신청/사용 내역</div>
       </div>
     </div>
     <div class="row">
   </div>  
<!--================================상단바===========================================-->
  <table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
    <thead>
      <tr>
<!--<th style="width:10%">-->
<!--         <th style="border-top-width: 10px;border-top-color: white;">
              <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px">삭제</button>
      </th> -->
        <!-- =========================== -->
        <th style="border-top-width: 10px;border-top-color: white;">
   			<select class="btn btn-dark" style="height:38px;border-radius:5%;padding-right:3px">
    			<option>구분
    			<option>구매
    			<option>사용
   			</select>
   			<select class="btn btn-dark" style="height:38px;border-radius:5%;padding-right:3px">
    			<option>분류
    			<option>사무
    			<option>생산
   			</select>
   			<select class="btn btn-dark" style="height:38px;border-radius:5%;">
    			<option>품목명
    			<option>품목코드
   			</select>
        </th>        
        <th style="border-top-width:10px;border-top-color: white;">
          <input type="text" class="form-control" name="companyname" placeholder="&nbsp;&nbsp;품목명 또는 재고코드를 입력하세요."  size="33" style="height:38px;width:100%;min-width:100px; font-size: 13px;padding-left:0px">
        </th>
        <th style="border-top-width:10px;border-top-color: white;padding-left:0px;padding-right:1px">
         <input type="date" class="form-control" style="padding-right:0px">
	    </th>
	    <th style="border-top-width:10px;border-top-color: white;padding-left:0px;padding-right:0px">
	       <i class='fas fa-minus-square' style="font-size:36px;"></i>
	    </th>
	    <th style="border-top-width:10px;border-top-color: white;padding-left:1px;padding-right:0px">
	       <input type="date" class="form-control">
	    </th>
	    <th style="border-top-width:10px;border-top-color: white;">
	       <button onclick="location.href='#'" class="btn btn-dark" style="float: right; width:60px;padding:6px 5px 6px 5px">조회</button>
	    </th>
      </tr>
    </thead>
  </table>
  <div class="container">
  <div style="margin:12px 0px -4px 0px">
	  <button type="button" class="btn btn-dark" style="padding:6px 5px 6px 5px" 
	  data-toggle="modal" data-target="#register">구매/사용신청</button>
	  <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px"
	  data-toggle="modal" data-target="#update">수정</button>
	  <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px">삭제</button>
	  <button type="button" class="btn btn-dark" style="padding:6px 5px 6px 5px"
	  data-toggle="modal" data-target="#nowsearch">현재재고조회</button>
	  <button type="button" class="btn btn-dark" style="float:right;padding:6px 5px 6px 5px" onClick="javascript:confirm()">선택승인</button>
  </div>
     <div class="row" style="margin-top:15px">
        <div class="col-sm-12">
           <table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width:4%;padding-bottom: 17px;">
                       <div><input name="th_checkAll" id="th_checkAll" type="checkbox" onclick="checkAll()"></div> 
                    </th>
                    <th style="width:7%;">구분</th>
                    <th style="width:16%;">품목명</th>
                    <th style="width:8%;">규격</th>
                    <th style="width:7%;">수량</th>
                    <th style="width:7%;">단가</th>
                    <th style="width:8%;">총액</th>
                    <th style="width:9%;">구매일</th>
                    <th style="width:9%;">사용일</th>
                    <th style="width:9%;">신청일</th>
                    <th style="width:7%;">담당자</th>
                    <th style="width:9%;">상태</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              
<% 	
	if(getTotal>0){
	for(int i=0;i<invenList.size();i++){
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
              	 <tr>
              		<td style="padding-top:18px;"><input id="checkRow" name="checkRow" type="checkbox"></td>     		
              		<td><%=kMap.get("ORDER_GUBUN")%></td>
              		<td><%=kMap.get("IVGROUP_NAME")%></td>
              		<td><%=kMap.get("IVGROUP_SIZE")%></td>
              		<td><%=kMap.get("ORDER_COUNT")%></td>
              		<td><%=kMap.get("ORDER_UNITPRICE")%></td>
              		<td><%=kMap.get("TOTALPRICE")%></td>
              		<td><%=order_startdate%></td>
              		<td><%=order_enddate%></td>
              		<td><%=kMap.get("ORDER_INDATE")%></td>
              		<td><%=kMap.get("EMP_NAME")%></td>
<%
	if(kMap.get("DELIVERY_STATE")!=null && kMap.get("DELIVERY_STATE").toString().equals("11")){
%>		
              		<td><div style="background-color:Green;color:#fff;padding-top:5px;padding-bottom:5px;">승인대기</div></td>
<%
	}else{
%>              		
              		<td><div style="background-color:#343a40;color:#fff;padding-top:5px;padding-bottom:5px;"><%=kMap.get("INVEN_STATUS")%></div></td>
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
     <div class="container" style="margin-left: 0px;">
  <ul class="pagination" id="bs_pagenation" style="justify-content: center;">
    <li class="page-item" style="width:130px; text-align: center;"><a class="page-link" style="color:#6C757D; border: thick;" href="#">Previous</a></li>
<% for(int i=1;i<(pageSize+1);i++){ %>  
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="/sample/was/invenList"><%=i%></a></li>
<% } %>    
    <li class="page-item" style="width:120px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">Next</a></li>
  </ul>

  </div>
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
</div>
</div>

<!-- ===================================모달뷰 (메인 - 신규 등록) 시작===================================== -->
<div class="modal fade" id="register" data-backdrop="static">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">자산 구매/사용 신청</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<form id = "invenAdd">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:25%; padding-top:7px; padding-bottom: 7px;">구분</td>
		             <td style="width:30%;padding-top: 5px; padding-bottom: 5px;">
		              <select id="order_gubun" name="order_gubun">
		              	<option value="구매">구매
		              	<option value="사용">사용
		              </select>
		           	 </td>
		        	 <td style="width:25%;padding-top:7px; padding-bottom: 7px;">
		           	 </td>
		           	 <td style="width:10%"></td>
		           	 <td style="width:10%"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top:9px; padding-bottom: 0px;">품목코드</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_code" name="ivgroup_code" type="text" class="form-control" style="height:auto;font-size: 13px;text-align:right">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;width:auto" colspan="3">
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" onClick="javascript:pummoksearch()" data-toggle="modal" data-target="#pummoksearch"value="검색" >
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd" value="품목추가">
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right" readonly>
		           	 </td>
		           	 <td colspan="3" style="font-size:12px">※  품목 검색창에서 선택하세요.</td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_size" name="ivgroup_size" type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" readonly>
		           	 </td>
		             <td colspan="3" style="font-size:12px"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input class="num_only num_sum form-control" id="order_count" name="order_count" type="number" style="height:28px;font-size:13px; text-align:right;" maxlength="5" oninput="maxLengthCheck(this)">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >단가</td>
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
		                <textarea id="order_memo" name="order_memo"style="height:95%; width:95%;"></textarea>
		             </td>
		          </tr>
       		</tbody>
    	</table>
    	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal" onClick='javascript:addAction()'>저장</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 신규 등록) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 수정) 시작===================================== -->
<div class="modal fade" id="update">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">수정</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:30%; padding-top:7px; padding-bottom: 7px;">구분</td>
		             <td style="width:30%;padding-top: 5px; padding-bottom: 5px;">
		              <select>
		              	<option>구매
		              	<option>소모
		              </select>
		           	 </td>
		        	 <td style="width:20%;padding-top:7px; padding-bottom: 7px;">
		           	 </td>
		           	 <td style="width:10%"></td>
		           	 <td style="width:10%"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom:7px;">분류</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <select>
		              	<option>사무
		              	<option>생산
		              </select>
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;">
		           	 </td>
		           	 <td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;">품목코드</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right" >
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;" colspan="3">
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;margin-right:0px" data-toggle="modal" data-target="#search">검색</button>
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd">품목추가</button>
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right" >
		           	 </td>
		           	 <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" >
		           	 </td>
		             <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="number" class="form-control" style="height:28px;font-size:13px;text-align:right" >
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >단가</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" >
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >총액</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" >
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >구매/소모일</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="date" class="form-control"  style="height: 28px;font-size: 13px;text-align:right" >
		           	 </td>
		           	 <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		             <td colspan="4">
		                <textarea style="height:95%; width:95% ;" ></textarea>
		             </td>
		          </tr>
       		</tbody>
    	</table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal" onClick='save()'>저장</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 수정) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 현재재고조회) 시작===================================== -->
<div class="modal" id="nowsearch">
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
                    <th style="width:">분류</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                    <th style="width:">수량</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>17"</td>
              		<td>100</td>
              	 </tr>
              	 <tr>
              		<td>구매</td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>30*30*30</td>
              		<td>5</td>
              	 </tr>
              	 <tr>
              		<td>소모</td>
              		<td>사무</td>
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
<div class="modal" id="pummoksearch" style="border:1px solid black">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">품목검색</h5>
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
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
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
<!-- ===================================모달뷰 (메인 - 신규 등록 -품목검색) 끝===================================== -->
<!-- ===================================모달뷰 (메인 - 신규 등록 -품목추가) 시작===================================== -->
<div class="modal fade" id="itemadd">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">품목 추가</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom:7px;">분류</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <select>
		              	<option>사무
		              	<option>생산
		              </select>
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;">
		           	 </td>
		           	 <td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;">품목코드</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;" colspan="3">
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="width:auto;height:26px;margin-right:0px" data-toggle="modal" data-target="#search">중복확인</button>
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		           	 <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		             <td></td><td></td><td></td>
		          </tr>
       		</tbody>
    	</table>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal" onClick='save()'>저장</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<!-- ===================================모달뷰 (메인 - 품목 추가) 끝===================================== -->

</body>
</html>