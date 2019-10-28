<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
	int size_s = 0;
 	Map<String,Object> r_Map = (Map<String,Object>)request.getAttribute("r_Map");
 	List<Map<String,Object>> deliveryInsert_ListS = (List<Map<String,Object>>)r_Map.get("deliveryInsert_ListS");
 	if(deliveryInsert_ListS!=null){
 		size_s = deliveryInsert_ListS.size();
 	}
 	List<Map<String,Object>> deliveryInsert_ListF = (List<Map<String,Object>>)r_Map.get("deliveryInsert_ListF");
 	List<Map<String,Object>> f_list = (List<Map<String,Object>>)r_Map.get("f_list");
	Map<String,Object> pl_Map = (Map<String,Object>)request.getAttribute("pl_Map");
 	int tot = (int)request.getAttribute("tot");
 	String fail_msg = null;
 	String success_msg = null;
 	if(request.getAttribute("fail_msg")!=null){
		fail_msg = request.getAttribute("fail_msg").toString();
	}
 	if(request.getAttribute("success_msg")!=null){
 		success_msg = request.getAttribute("success_msg").toString();
	}
 	String insert_msg = null;
 	if(request.getAttribute("insert_msg")!=null){
		insert_msg = request.getAttribute("insert_msg").toString();
	}
 	if(deliveryInsert_ListS!=null){
		size=deliveryInsert_ListS.size();
	}
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 15;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	//////////////////작성자 ////////////
	String s_order_writer = null;
	if(session.getAttribute("s_emp_no")!=null){
		s_order_writer = session.getAttribute("s_emp_no").toString();
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
	<%@ include file="/common/bootStrap4.jsp" %>
	<%@ include file="/common/styles.jsp" %>
	
<title>배송조회</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
	<%@ include file="/common/bs_css.jsp" %>
<script type="text/javascript">
	function hide_modal(modal_name){
			$("#"+modal_name+"").hide();
	}
	function bs_ins_search(){
		$("#f_bs_search").attr("method","post");
		$("#f_bs_search").attr("action","deliveryInsert_ListF");
		$("#f_bs_search").submit();
	}
	function bs_insert(){
		$("#f_deli_insert").attr("method","post");
		$("#f_deli_insert").attr("action","/erp/deliveryInsert_List");
		$("#f_deli_insert").submit();
	}
	function bs_update_insert(){
			$("#f_deli_update").attr("method","post");
			$("#f_deli_update").attr("action","/erp/delivery_Update_Insert");
			$("#f_deli_update").submit();
	}
	function back(deli_no){
		$.ajax({
			url:"/erp/delivery_selectInfo?deli_no="+deli_no
			,method:"get"
			,success:function(data){
				$("#trance_table").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});
	}
	function bs_update(r_delivery_state){
		var deli_no = $("#deli_no").val();
		if("1"==r_delivery_state){
			$.ajax({
				url:"/erp/delivery_selectInfo?deli_no="+deli_no+"&insert_gubun=3"
				,method:"get"
				,success:function(data){
					$("#trance_table").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
		}else{
			alert("배송이 시작되었으므로 수정이 불가합니다. 배송부에 문의 하세요");
		}
	}
	function bs_cancle(){ //뒤로 가기
		location.href="/erp/deliveryInsert_ListF";
	}
	function cancle_pix(){ //취소 완료
			$("#f_cancle_pix").attr("method","post");
			$("#f_cancle_pix").attr("action","/erp/delivery_cancle_pix");
			$("#f_cancle_pix").submit();
	}
	function insert_cancle(r_delivery_state){
		var deli_no = $("#deli_no").val();
		if("1"==r_delivery_state){
			$.ajax({
				url:"/erp/delivery_selectInfo?deli_no="+deli_no+"&insert_gubun=2"
				,method:"get"
				,success:function(data){
					$("#trance_table").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
		}else{
			alert("배송이 시작되었으므로 취소가 불가합니다. 배송부에 문의 하세요");
		}
	}
	function select_comp(imsi_num){
		var cus_code = $("#cus_code_"+imsi_num).val();
		var gubun = $("#table_gubun").val();
		if("1"==gubun){
			$.ajax({
				url:"/erp/delivery_selectcomp?cus_code="+cus_code
				,method:"get"
				,success:function(data){
					$("#trance_table_search_comp").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
		}else if("2"==gubun){
			$.ajax({
				url:"/erp/delivery_selectcomp?cus_code="+cus_code
				,method:"get"
				,success:function(data){
					$("#trance_table_search_comp_2").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
		}
		$("#comp_name .close").click();//선택후 자동 모달창 끄기
	}

	function bs_delete(){
		var chk = document.getElementsByName("chk"); 
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;                 

		for(var i=0; i<len; i++){
			if(chk[i].checked == true){
				checkCnt++;        //체크된 체크박스의 개수
				checkLast = i;     //체크된 체크박스의 인덱스
			}
		} 
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){  //체크가 되어있는 값 구분
				checkRow = chk[i].value;
				if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
					rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
					if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
						rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{
						rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
					}
				}
				cnt++;
				checkRow = '';    //checkRow초기화.
			}
		}
		location.href="/erp/delivery_delete_insert.was?rowid="+rowid;
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#checkall").click(function(){
			if($("#checkall").prop("checked")){
				$("input[name=chk]").prop("checked",true);
			}else{
				$("input[name=chk]").prop("checked",false);
			}
		});
		$("#bs_list tr").on("click",function(){
   		  var deli_no = $(this).attr('id'); 
			$.ajax({
				url:"/erp/delivery_selectInfo?deli_no="+deli_no
				,method:"get"
				,success:function(data){
					$("#trance_table").html(data);
				}
				,error:function(e){
					alert(e.responseText);
				}
			});
		});
		if('<%=fail_msg%>'!='null'){ 
			  $("#stop_update").show();	
		}else{
			  $("#stop_update").hide();	
		}
		if('<%=success_msg%>'!='null'){ 
			  $("#play_delete").show();	
		}else{
			  $("#play_delete").hide();	
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
<div class="base_table_div" style="width: 1350px; height: 872px; ">
<!--================================공통코드로 추가할 추가 상단바===========================================-->
	<div style="margin-top:45px;font-size: 17px; font-weight: 900; padding-left: 26px">
  	</div>
<!--================================공통코드로 추가할 추가 상단바===========================================-->
<!--================================상단바===========================================-->
	<div class="card bg-dark text-white" style="height:50px;margin-top: 7px;">
    	<div class="card-body" style="font-size: 17px; font-weight: 900;">생산/품질관리 > 배송처 등록</div>
  	</div>
  	<div class="row">
	</div>
<!--================================상단바===========================================-->

<form id="f_bs_search"><!-- ============================================================================form================================ -->
  
  
  <table class="table table-hover" style="margin-bottom: 5px;margin-top: 5px; background-color:#F1F1F1">
	    <thead>
	     <tr style="background:white;border-top:2px solid #dee2e6;">
      
	<!--<th style="width:10%">-->
	        <th style="width: 250px;">
	        		<button type="button" class="btn btn-dark" onclick="javascript:bs_delete()" style=" width:60px;padding:6px 5px 6px 5px;background: #efefef;padding: 3px 3px 3px 3px;color:black; border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;">삭제</button>
			</th>
	        <th style="padding-left:2px; padding-right:2px;">
		        <div class="dropdown" style="width: 125px;">
					<select id="cb_search" name="cb_search" class="btn btn-dark dropdown_bs" style="background: #efefef;padding: 3px 3px 3px 7px;color:black;border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;">
						<option value="">선택</option>
						<option value="comp_name">업체</option>
						<option value="bs_writer">작성자</option>
					</select>
				</div>
	        </th>
	        <th>
				<input id="keyword" name="keyword" type="text" class="form-control" placeholder=" 내용을 입력하세요."  size="27" style="height: 35.75px;width:100%;min-width:140px; font-size: 13px;">
	        </th>
	        <th>
				<input id="before_date" name="before_date" type="date" class="form-control">
			</th>
			<th>
				<i class='fas fa-minus-square' style='font-size:36px'/>
			</th>
			<th>
				<input id="after_date" name="after_date" type="date" class="form-control">
			</th>
			<th>
		   <!-- <button class="btn btn-dark" onclick="javascript:bs_search()" style="float: right; width:54.5px">조회</button> -->
				<button class="btn btn-dark" type="button" onclick="javascript:bs_ins_search()" style="float:right; width:60px;padding:6px 5px 6px 5px;background: #efefef;padding: 3px 3px 3px 3px;color:black; border-color: #6c757d;font-size:15px;font-weight:900;margin-right: 10px;height: 33px;">조회</button>
			</th>
	      </tr>
	    </thead>
	  </table>
  
</form><!-- ============================================================================form============================================= -->
  <div class="container" style="margin-left: 0px; margin-right: 0px;">
	  <div class="row" style="margin-top:15px; width:1340px;">
	  	<div style="width:40%;">
			<h5 style="display:inline;">배송목록</h5>
			<!-- 오와열 코드 -->
			<div style="display:inline;">
				<input type="text" style="border:none; width:2px; height:32px;" readonly>
			</div>
	  		<table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px; margin-bottom: 0px;" > 
	  			<thead style="text-align: center;">
	  				<tr >
	  					<td style="border-bottom: 2px solid #dee2e6;">
	  						<div style="float:left"><input type="checkbox" id="checkall"></div>
	  					</td>
	  					<th style="color: #555555;font-family: Dotum, 돋움;">업체</th>
	  					<th style="color: #555555;font-family: Dotum, 돋움;">작성자</th>
	  					<th style="color: #555555;font-family: Dotum, 돋움;">등록일</th>
	  					<th style="color: #555555;font-family: Dotum, 돋움;">상태</th>
	  				</tr>
	  			</thead>
	  			<tbody id="bs_list">
	  			
<%	
	if(deliveryInsert_ListS!=null){
		Map<String,Object> sMap = new HashMap<>();
		String deli_date = null;
		for(int i=0;i<size_s;i++){
			if(i==size_s) break;
			sMap = deliveryInsert_ListS.get(i);
			String cus_name[] = sMap.get("CUS_NAME").toString().split("\\(");
%>
			  			<tr id="<%=sMap.get("ORDER_NO")%>">
		  					<td style="padding-top: 5px; padding-bottom: 5px;vertical-align: middle;"><div><input type="checkbox" name="chk" value="<%=sMap.get("ORDER_NO")%>"><input type="hidden" name="r_delivery_state" value="<%=sMap.get("DELIVERY_STATE")%>"></div></td>
						<%--<td><input type="hidden" id="deli_no_<%=sMap.get("DELI_NO")%>" name="deli_no_<%=sMap.get("DELI_NO")%>" value="<%=sMap.get("DELI_NO")%>"></td>--%>		  					
							<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center;padding-top: 5px; padding-bottom: 5px; font-size: 14px;font-family: -webkit-pictograph;color: #666666;"><%=cus_name[0]%></td>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center;padding-top: 5px; padding-bottom: 5px; font-size: 14px;font-family: -webkit-pictograph;color: #666666;"><%=sMap.get("EMP_NAME")%></td>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center;padding-top: 5px; padding-bottom: 5px; font-size: 14px;font-family: -webkit-pictograph;color: #666666;"><%=deli_date = sMap.get("ORDER_INDATE").toString()%></td>
		  						<%
									if("1".equals(sMap.get("DELIVERY_STATE").toString())){
								%>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center; padding-top: 5px; padding-bottom: 5px;font-family: -webkit-pictograph;color: #666666;">준비중</td>
								<%
									}
								%>
								<%
									if("2".equals(sMap.get("DELIVERY_STATE").toString())){
								%>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center; padding-top: 5px; padding-bottom: 5px;font-family: -webkit-pictograph;color: #666666;">배송중</td>
								<%
									}
								%>
								<%
									if("3".equals(sMap.get("DELIVERY_STATE").toString())){
								%>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center; padding-top: 5px; padding-bottom: 5px;font-family: -webkit-pictograph;color: #666666;">완료</td>
								<%
									}
								%>
								<%
									if("44".equals(sMap.get("DELIVERY_STATE").toString())){
								%>
		  					<td class="bs_table_when_ins" style="vertical-align: middle; height:40px; text-align: center; padding-top: 5px; padding-bottom: 5px; color: red;font-family: -webkit-pictograph;">취소</td>
								<%
									}
								%>
		  				</tr> 
<%
		}
	}
%>
<!--=========================================================================================================================================== -->
<!--======================================================== 확인후 삭제====================================================================== -->
<!--============================================================================================================================================ -->
	  			</tbody>
	  		</table>
	  	</div>
	  	
	  	<div style="width:3%;">
			
	  	</div>
	  	
	  	<div id="trance_table" style="width:57%">
	  		<h5 style="display:inline;">배송등록</h5>
	  		<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">취소</button>
	  		<button type="button" onclick="javascript:bs_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; padding-top: 2px; padding-bottom: 2px;">등록</button>
	  		<input id="table_gubun" type="hidden" value="1">
	  		<%
				if(insert_msg!=null){ 
			%>
				<div style="display:inline;">
					<input type="text" value="&nbsp;&nbsp;&nbsp;&nbsp;<%=insert_msg %>" style="border:none; font-size: smaller; width: 170px; color:red;" readonly>
				</div>
			<%
				}
			%>
	  		<!-- 오와열 코드 -->
	  		<div style="display:inline;">
				<input type="text" style="border:none; width:1px; height:32px;" readonly>
			</div>
	  		<form id="f_deli_insert">
	  			<input type="hidden" name="order_writer_no" value="<%=s_order_writer%>">
		  		<table id="trance_table_search_comp" class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
		  			<tbody style="text-align: left;">
		  				<tr>
		  					<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
		  					<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="companyname" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  					<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
		  						<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" data-toggle="modal" data-target="#comp_name" >검색</zealot>
		  					</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
								<input type="text" class="form-control" name="business_no"  size="27" style="height: 28px;width:200px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_ceoname"  size="27" style="height: 28px;width:100px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" size="27" style="height: 28px;width:150px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_busikind"  size="27" style="height: 28px;width:100px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
		  					<td colspan="4" style="padding-top: 5px; padding-bottom: 5px;">
		  						<input type="text" class="form-control" name="cus_zipcode"  size="27" style="height: 28px;width:150px; font-size: 13px; background-color: transparent;" readonly>
		  					</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_addr"  size="27" style="height: 28px;width:340px; font-size: 13px; background-color: transparent;" readonly>
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
		  					<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_man"  size="27" style="height: 28px;width:100px; font-size: 13px;">
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 번호</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width:80px">
		  						<input type="text" class="form-control" name="cus_manhp_a"  size="27" style="height: 28px;width:60px; font-size: 13px;">
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 99.5px;">
		  						<input type="text" class="form-control" name="cus_manhp_b"  size="27" style="height: 28px;width:80px; font-size: 13px;">
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px;">
		  						<input type="text" class="form-control" name="cus_manhp_c"  size="27" style="height: 28px;width:80px; font-size: 13px;">
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
		  					<td style="padding-top: 7px; padding-bottom: 7px;" colspan="3">
					  			<div class="dropdown" style="width:180px">
									<select name="fish_code" class="dropdown_tableRow" style="width:150px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
										<option value="">품목 선택</option>
										<%
											for(int i=0;i<f_list.size();i++){
												Map<String,Object> f_Map = f_list.get(i);
										%>
												<option value="<%=f_Map.get("IVGROUP_CODE")%>"><%=f_Map.get("IVGROUP_NAME")%></option>
										<%
											}
										%>
									</select>
								</div>
							</td>
		  					<td style="padding-top: 7px; padding-bottom: 7px;"  colspan="2">
		  					</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
		  					<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="deli_weight"  size="27" style="height: 28px;width:80px; font-size: 13px;">
							</td>
		  					<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;">t</td>
		  					<td colspan="2"></td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">단가</td>
		  					<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="order_unitprice"  size="27" style="height: 28px;width:80px; font-size: 13px;">
							</td>
		  					<td colspan="1" class="bi_table_insert" style="font-size:13px; padding-top: 11px; padding-bottom: 3px; padding-left: 5px;">(만원)</td>
		  					<td colspan="2"></td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송일</td>
		  					<td colspan="3" style="padding-top: 7px; padding-bottom: 7px; padding-right: 0px;">
								<input name="deli_when_date" type="date" class="form-control" style="height:30px;width:160px;">
							</td>
		  					<td colspan="2" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px;">
								<input name="deli_when_time" type="time" class="form-control" style="height:30px;width:140px;">
							</td>
		  				</tr>
		  				<tr>
		  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; ">비고</td>
		  					<td colspan="5" style="height:123px;pxpadding-top: 7px; padding-bottom: 7px;" >
		  						<textarea name="deli_memo" style="height:95%; width:95%;" placeholder="&nbsp;&nbsp;내용을 입력하세요." ></textarea>
		  					</td>
		  				</tr>
		  			</tbody>
		  		</table>
	  		</form>
	  	</div>
	  </div>
</div>
  </div>
	<div class="container">
		<ul class="pagination" id="bs_pagenation" style="justify-content: center; width: 1350px;margin-bottom: 44px; margin-top: 20px;">
			<%		
				String keyword = null; 
				String before_date = null; 
				String after_date = null; 
				String cb_situation = null; 
				String cb_search = null; 
				if(pl_Map.get("keyword")!=null){
					keyword = pl_Map.get("keyword").toString();
				}
				if(pl_Map.get("before_date_ud")!=null){
					before_date = pl_Map.get("before_date_ud").toString();
				}
				if(pl_Map.get("after_date_ud")!=null){
					after_date = pl_Map.get("after_date_ud").toString();
				}
				if(pl_Map.get("cb_situation")!=null){
					cb_situation = pl_Map.get("cb_situation").toString();
				}
				if(pl_Map.get("cb_search")!=null){
					cb_search = pl_Map.get("cb_search").toString();
				}
				String pagePath = "/erp/deliveryInsert_ListF?keyword="+keyword+"&before_date="+before_date+"&after_date="+after_date+"&cb_situation="+cb_situation+"&cb_search="+cb_search;
				PageBar pb = new PageBar(numPerPage,tot,nowPage,pagePath);
				String pagination = null;
				pagination = pb.getPageBar();
				out.print(pagination);
			%>
		</ul>
	</div>
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
</div>
</div>




<!-- ============================================================================================================================================= -->
<!-- ===============================================================업체명 조회창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="container">

	<div class="modal" id="comp_name">
		<div class="modal-dialog modal-dialog-scrollable modal-lg ">
			<div class="modal-content">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title" style="font-size: x-large; font-weight: 800;">
					<!--var companyname = $("#밑에놈 아이디").text(); search.do?compay  -->
					업체정보
					</div>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;">
						<thead>
							<tr>
								<th style="width:150px;">업체명</th>
								<th style="width:150px;">주소</th>
								<th style="width:150px;">전화번호</th>
							</tr>
						</thead>
						<tbody>
						<%
						if(deliveryInsert_ListF!=null){
							for(int i=0;i<deliveryInsert_ListF.size();i++){
								Map<String,Object> fMap = deliveryInsert_ListF.get(i);
						%>
							<tr>
								<td>
									<input id="cus_code_<%=i%>" type="hidden" value="<%=fMap.get("CUS_CODE") %>">
									<a href="javascript:select_comp(<%=i%>)" style="color:black;" >
										<%=fMap.get("CUS_NAME")%>
									</a>
								</td>
								<td>
									<%=fMap.get("CUS_ADDR") %>
								</td>
								<td>
									<%=fMap.get("CUS_HP") %>
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
<!-- ===============================================================업체명 조회창================================================================= -->
<!-- ============================================================================================================================================= -->

<!-- ============================================================================================================================================= -->
<!-- ===============================================================품목등록창================================================================= -->
<!-- ============================================================================================================================================= -->

<div class="container" >

	<div class="modal" id="iven_insert">
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
<!-- ===============================================================삭제완료 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="play_delete" data-backdrop="static"data-keyboard="true" >
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
           <h6 style="display:inline;font-weight:bold;font-size:large;"><%=success_msg%></h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:hide_modal('play_delete')" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================삭제완료 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
	
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
<div class="modal" id="stop_update" data-backdrop="static"data-keyboard="true" >
  <div class="modal-dialog modal-dialog-centered" style="text-align:center">
    <div class="modal-content" style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
      </div>
      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
         <div style="display:table-cell;vertical-align:middle;text-align:center;">
           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
           <h6 style="display:inline;font-weight:bold;font-size:large; color:red;"><%=fail_msg%></h6>
         </div>   
      </div>
      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
         <button style="width: 42px;height: 25px;border-top-width: 0px;border-bottom-width: 0px;padding-bottom: 0px;
                   margin-right: 3px;padding-top: 0px;border-left-width: 0px;padding-right: 0px;padding-left: 0px;
    			border-right-width: 0px;display:table-cell;font-size:14px" type="button" class="btn btn-dark" onclick="javascript:hide_modal('stop_update')" >닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================경고 모달창================================================================= -->
<!-- ============================================================================================================================================= -->
	
</body>
</html>
