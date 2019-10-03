<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>비품 재고 구매/사용 내역</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
   <%@ include file="/common/bs_css.jsp" %>
<script language="javascript">  
/* 	function openWin(w,h){
	 x = (screen.availWidth - w) / 2;
	 y = (screen.availHeight - h) / 2;
	 window.open('./inventory_register.jsp','pop','width='+w+', height='+h+', left='+x+', top='+y+','toolbar=no, 
			 location=0, directories=0, status=no, menubar=no, scrollbars=no, resizable=yes, copyhistory=no')}; */
	$("#myModal").draggable({
		handle: ".modal-header"});
	function save(){
		alert("저장완료");
	};
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
          <div style="display:table-cell;valign:middle;">비품 재고 구매/소모 내역 조회</div>
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
    			<option>소모
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
          <input type="text" class="form-control" name="companyname" placeholder="품목명 또는 재고코드를 입력하세요."  size="33" style="height:38px;width:100%;min-width:100px; font-size: 13px;padding-left:0px">
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
  <div style="margin:12px 0px -4px 12px">
	  <button type="button" class="btn btn-dark" style="padding:6px 5px 6px 5px" 
	  data-toggle="modal" data-target="#register">신규등록</button>
	  <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px"
	  data-toggle="modal" data-target="#update">수정</button>
	  <button type="button" class="btn btn-dark" style="width:60px;padding:6px 5px 6px 5px">삭제</button>
	  <button type="button" class="btn btn-dark" style="padding:6px 5px 6px 5px"
	  data-toggle="modal" data-target="#nowsearch">현재재고조회</button>
  </div>
  <div class="container">
     <div class="row" style="margin-top:15px">
        <div class="col-sm-12">
           <table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width:4%;">
                       <div><input type="checkbox"></div> 
                    </th>
                    <th style="width:7%;">구분</th>
                    <th style="width:7%;">분류</th>
                    <th style="width:6%;">코드</th>
                    <th style="width:15%;">품목명</th>
                    <th style="width:8%;">규격</th>
                    <th style="width:8%;">수량</th>
                    <th style="width:8%;">단가(원)</th>
                    <th style="width:10%;">총액(원)</th>
                    <th style="width:9%;">구매일</th>
                    <th style="width:9%;">소모일</th>
                    <th style="width:9%;">등록일</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>32"</td>
              		<td>1</td>
              		<td>430,000</td>
              		<td>430,000</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
              		<td>1,000,000</td>
              		<td>430,000</td>
              		<td>430,430,000,000</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>그물(大)</td>
              		<td>120*100*100"</td>
              		<td>1</td>
              		<td>-</td>
              		<td>-</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              		<td>2019-09-16</td>
              	 </tr>              	 
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
              		<td>1,000,000</td>
              		<td>430,000</td>
              		<td>430,000</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
              		<td>1</td>
              		<td>-</td>
              		<td>-</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              		<td>2019-09-16</td>
              	 </tr>              	 
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1,000,000</td>
              		<td>430,000</td>
              		<td>430,430</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1</td>
              		<td>-</td>
              		<td>-</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              		<td>2019-09-16</td>
              	 </tr>              	 
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1</td>
              		<td>430,000</td>
              		<td>430,000</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1</td>
              		<td>-</td>
              		<td>-</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              		<td>2019-09-16</td>
              	 </tr>              	 
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1,000,000</td>
              		<td>430,000</td>
              		<td>430,430,000,000</td>
              		<td>2019-09-16</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100</td>
              		<td>1</td>
              		<td>-</td>
              		<td>-</td>
              		<td>-</td>
              		<td>2019-09-16</td>
              		<td>2019-09-16</td>
              	 </tr>              	             	             	             	 
              </tbody>
              </table>                 
        </div>
     </div>
</div>
  </div>
     <div class="container" style="margin-left: 0px;">
  <ul class="pagination" id="bs_pagenation" style="justify-content: center;">
    <li class="page-item" style="width:130px; text-align: center;"><a class="page-link" style="color:#6C757D; border: thick;" href="#">Previous</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">1</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">2</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">3</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">4</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">5</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">6</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">7</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">8</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">9</a></li>
    <li class="page-item" style="width:42px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">10</a></li>
    <li class="page-item" style="width:120px; text-align: center;"><a class="page-link " style="color:#6C757D; border: thick;" href="#">Next</a></li>
  </ul>

  </div>
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
</div>
</div>

<!-- ===================================모달창 (메인 - 신규 등록) 시작===================================== -->
<div class="modal fade" id="register">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비품 재고 구매/소모 등록</h4>
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
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;" colspan="3">
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;margin-right:0px" data-toggle="modal" data-target="#search">검색</button>
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd">품목추가</button>
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
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >수량</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="number" class="form-control" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">EA</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >단가</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >총액</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="text" class="form-control" style="height:28px;font-size:13px;text-align:right">
		           	 </td>
		           	 <td style="padding-top:8px; padding-bottom:5px;padding-left:0px;text-align:left;font-size:14px">원</td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >구매/소모일</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input type="date" class="form-control"  style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		           	 <td></td><td></td><td></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		             <td colspan="4">
		                <textarea style="height:95%; width:95%;"></textarea>
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
<!-- ===================================모달창 (메인 - 신규 등록) 끝===================================== -->
<!-- ===================================모달창 (메인 - 수정) 시작===================================== -->
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
<!-- ===================================모달창 (메인 - 수정) 끝===================================== -->
<!-- ===================================모달창 (메인 - 현재재고조회) 시작===================================== -->
<div class="modal" id="nowsearch">
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
                    <th style="width:">구분</th>
                    <th style="width:">분류</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">수량</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>100</td>
              	 </tr>
              	 <tr>
              		<td>구매</td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>5</td>
              	 </tr>
              	 <tr>
              		<td>소모</td>
              		<td>사무</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
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
<!-- ===================================모달창 (메인 - 현재재고조회) 끝===================================== -->
<!-- ===================================모달창 (메인 - 신규 등록 -품목검색) 시작===================================== -->
<div class="modal" id="search">
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
                       <div><input type="checkbox"></div> 
                    </th>
                    <th style="width:">구분</th>
                    <th style="width:">분류</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>사무</td>
              		<td>a001</td>
              		<td>사무용 모니터</td>
              		<td>32"</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>구매</td>
              		<td>생산</td>
              		<td>a0022</td>
              		<td>사무용 책상</td>
              		<td>120*100*100"</td>
              	 </tr>
              	 <tr>
              		<td><input type="checkbox"></td>
              		<td>소모</td>
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
<!-- ===================================모달창 (메인 - 신규 등록 -품목검색) 끝===================================== -->
<!-- ===================================모달창 (메인 - 신규 등록 -품목추가) 시작===================================== -->
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
		              <input type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;" colspan="3">
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;margin-right:0px" data-toggle="modal" data-target="#search">검색</button>
		           		<button class="btn btn-secondary btn_firstrow btn_tableRow" type="submit" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd">품목추가</button>
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
<!-- ===================================모달창 (메인 - 품목 추가) 끝===================================== -->

</body>
</html>