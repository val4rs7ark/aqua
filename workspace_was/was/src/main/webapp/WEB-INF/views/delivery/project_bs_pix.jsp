<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
	List<Map<String,Object>> deliveryList = (List<Map<String,Object>>)request.getAttribute("deliveryList");
	Map<String,Object> pl_Map = (Map<String,Object>)request.getAttribute("pl_Map");
	int tot = (int)request.getAttribute("tot");
	if(deliveryList!=null){
		size = deliveryList.size();
	}	
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 8; //한 페이지당 뿌려질 로우갯수
	int nowPage = 0;  	//현재 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
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
	function bs_save(id_save,no_deli){
		var deli_no = $("#deli_no_"+no_deli).val();
		var team_name = $("#team_name_"+no_deli).val();
		var deli_man = $("#deli_man_"+no_deli).val();
		$.ajax({
    		url:"/erp/delivery_save.was?id_save="+id_save+"&deli_no="+deli_no+"&team_name="+team_name+"&deli_man="+deli_man
    		,method:"get"
    		,success:function(data){//해석하기
    			$("#bs_table_update_"+id_save).html(data);//해석하기
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_trance(){
		alert("삭제버튼 호출");
	}
	function bs_update(id_update,deli_no){
		$.ajax({
    		url:"/erp/delivery_update.was?id_update="+id_update+"&deli_no="+deli_no
    		,method:"get"
    		,success:function(data){//해석하기
    			$("#bs_table_update_"+id_update).html(data);//해석하기
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_commit(id_commit,msg,deli_no){
		$.ajax({
    		url:"/erp/delivery_commit.was?id_commit="+id_commit+"&msg="+msg+"&deli_no="+deli_no
    		,method:"get"
    		,success:function(data){
    			$("#bs_table_update_"+id_commit).html(data);
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_cancle(id_cancle,msg,deli_no){
		$.ajax({
    		url:"/erp/delivery_cancle.was?id_cancle="+id_cancle+"&msg="+msg+"&deli_no="+deli_no
    		,method:"get"
    		,success:function(data){//해석하기
    			$("#bs_table_update_"+id_cancle).html(data);//해석하기
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_search(){
		//var keyword = $("#keyword").val(); //텍스트
		//var bs_Condition = $("#bs_Condition").val();
		//var cb_search = $("#cb_search").val();
		//var before_date = $("#before_date").val();
		//var after_date = $("#after_date").val();
		//var cb_situation = $("#cb_situation").val();
		//location.href="/erp/delivery_List?keyword="+keyword+"&cb_situation="+cb_situation+"&cb_search="+cb_search+"&before_date="+before_date+"&after_date="+after_date
		$("#f_condition").attr("method","post");
		$("#f_condition").attr("action","/erp/delivery_List");
		$("#f_condition").submit();
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
	});
</script>
<div class="container-fluid" >
<div class="row" >
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp" %>
     <!-- ======================================================================================================================================================================= -->
	 <!-- =														여기부터 내영역																					                    = -->
     <!-- ======================================================================================================================================================================= -->
  </div>


<div style="width:80%" >
<div class="container" style="margin-left: 0px;">
<div class="base_table_div" style="width: 1350px;">
<!--================================상단바===========================================-->
	<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
    	<div class="card-body">배송처 조회</div>
  	</div>
  	<div class="row">
	</div>  
<!--================================상단바===========================================-->
	<form id="f_condition">
	  <table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
	    <thead>
	      <tr>
	<!--<th style="width:10%">-->
	        <th style="width: 250px;border-top-width: 10px;border-top-color: white;">
	        		<button type="button" class="btn btn-dark" onclick="javascript:bs_trance()" style="width:54.5px">삭제</button>
			</th>
	        <th style="border-top-width: 10px;border-top-color: white; padding-right:2px;">
		        <div class="dropdown" style="width: 125px;">
					<select id="cb_situation" name="cb_situation" class="btn btn-dark dropdown_bs" style="color:white; width:120px; height:35.75px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
						<option value="">진행선택</option>
						<option value="1">결제전</option>
						<option value="2">배송중</option>
						<option value="3">배송완료</option>
						<option value="44">취소내역</option>
					</select>
				</div>
	        </th>
	        <th style="border-top-width: 10px;border-top-color: white; padding-left:2px; padding-right:2px;">
		        <div class="dropdown" style="width: 125px;">
					<select id="cb_search" name="cb_search" class="btn btn-dark dropdown_bs" style="color:white; width:120px; height:35.75px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
						<option value="">선택</option>
						<option value="comp_name">업체명</option>
						<option value="comp_addr">업체주소</option>
						<option value="comp_man">담당자</option>
						<option value="fish_code">품목</option>
					</select>
				</div>
	        </th>
	        <th style="border-top-width: 10px;border-top-color: white;">
				<input id="keyword" name="keyword" type="text" class="form-control" placeholder=" 내용을 입력하세요."  size="27" style="height: 35.75px;width:100%;min-width:140px; font-size: 13px;">
	        </th>
	        <th style="border-top-width: 10px;border-top-color: white;">
				<input id="before_date" name="before_date" type="date" class="form-control">
			</th>
			<th style="border-top-width: 10px;border-top-color: white;">
				<i class='fas fa-minus-square' style='font-size:36px'/>
			</th>
			<th style="border-top-width: 10px;border-top-color: white;">
				<input id="after_date" name="after_date" type="date" class="form-control">
			</th>
			<th style="border-top-width: 10px;border-top-color: white;">
		   <!-- <button class="btn btn-dark" onclick="javascript:bs_search()" style="float: right; width:54.5px">조회</button> -->
				<button class="btn btn-dark" type="button" onclick="javascript:bs_search()" style="float: right; width:54.5px">조회</button>
			</th>
	      </tr>
	    </thead>
	  </table>
	  </form>
  <!-- ====================================여기서부터 테이블시작======================================= -->
	  <table class="table" style="border-bottom:inset;  margin-bottom: 0px;">
	    <thead>
	      <tr style="background-color: #cccccc96;">
	        <th style="width:5%; text-align:center; vertical-align: middle;">
	        	<div><input type="checkbox" class="bs_checkbox" id="checkall"></div> 
	        </th>
	        <th class="bs_table_header" style="width:25%;min-width:120px;">
	        	품목 및 무게
	        </th>
	        <th class="bs_table_header" style="width:50%;" colspan="4">
	        	업체명
	        </th>
	        <th class="bs_table_header" style="width:15%;">
	        	날짜
	        </th>
	      </tr>
	    </thead>
	    <tbody id=bs_tbody_search>
	<%
		Map<String,Object> pMap = new HashMap<>();
		for(int i=0;i<size;i++){
			if(i==size) break;
			pMap = deliveryList.get(i);
			pMap.put("msg",pMap.get("DELIVERY_INFO").toString());
			if("생산".equals(pMap.get("ORDER_GUBUN").toString())){
				if("1".equals(pMap.get("DELIVERY_STATE").toString())){
		/*
			여기서 널이 터지는 이유 주문테이블을 같이써서 널값이 있는게 있으므로 구분자로 분류해서 select해야함. xml에서
		*/
	%>
	  <!-- ====================================여기서 for문======================================= -->
	      <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("IVGROUP_NAME")%>&nbsp;/&nbsp;<%=pMap.get("ORDER_COUNT")%> t
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("CUS_ADDR")%>&nbsp;/&nbsp;<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELIVERY_DATE") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
	        <td style="width:125px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
				<div class="dropdown">
					<select id="team_name_<%=pMap.get("ORDER_NO")%>" name="team_name" class="dropdown_tableRow" style="border: groove; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
				  		<option value="">배송팀 선택</option>
				  		<option value="배송1팀">배송1팀</option>
				  		<option value="배송2팀">배송2팀</option>
				  		<option value="배송3팀">배송3팀</option>
					</select>
				</div> 
			</td>
	        <td style="width:220px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
				<input id="deli_man_<%=pMap.get("ORDER_NO")%>" name="deli_man" type="text" class="form-control" placeholder="담당자를 입력하세요."  size="27" style="height: 27px;width:100%;min-width:140px; font-size: 13px;">
				<input id="deli_no_<%=pMap.get("ORDER_NO")%>" name="deli_no" type="hidden" value="<%=pMap.get("ORDER_NO")%>">
	        </td>
	        <td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;" >
						<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_save(<%=i%>,<%=pMap.get("ORDER_NO")%>)" style="height:26px; width:64px;">저장하기</button>
	        </td>
	        <td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
	        </td>
	        <td class="bs_table_when" style="width:30%; text-align: right;"></td>
	      </tr>
	  <!-- ====================================여기서 for문 닫힘======================================= -->
	<%
				}else if("2".equals(pMap.get("DELIVERY_STATE").toString())){
	%>	   
		  <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("IVGROUP_NAME")%>&nbsp;/&nbsp;<%=pMap.get("ORDER_COUNT")%> t
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("CUS_ADDR")%>&nbsp;/&nbsp;<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELIVERY_DATE") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
			<td id="save_msg" style="width:345px; padding-top: 6px; padding-bottom: 10px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
	        	<%=pMap.get("msg") %>
			</td>
	        <td style=" padding-top: 6px; padding-bottom: 10px; padding-left: 6px; padding-right: 3px;width:91px;">
					<button type="button" class="btn btn-light btn_firstrow btn_tableRow" onclick="javascript:bs_update(<%=i%>,<%=pMap.get("ORDER_NO")%>)" style="height:26px; width:40px;">수정</button>
	        </td>
	        <td style="padding-top: 6px; padding-bottom: 10px; padding-left: 3px; padding-right: 6px;width:115px;">
					<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_commit(<%=i%>,'<%=pMap.get("msg") %>',<%=pMap.get("ORDER_NO")%>)" style="height:26px; width:80px;">배송완료</button>
			</td>
			<td class="bs_table_when" style="width:30%; text-align: right;">
				배정완료&nbsp;:&nbsp;<%=pMap.get("ORDER_STARTDATE") %>
			</td>
		  </tr>
	
	<% 
				}else if("3".equals(pMap.get("DELIVERY_STATE").toString())){
	%>
		  <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;  " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("IVGROUP_NAME")%>&nbsp;/&nbsp;<%=pMap.get("ORDER_COUNT")%> t
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("CUS_ADDR")%>&nbsp;/&nbsp;<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELIVERY_DATE") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
			<td style="width:345px; padding-top: 6px; padding-bottom: 9px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
			     	<%=pMap.get("msg") %>
			</td>
			<td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
				<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_cancle(<%=i %>,'<%=pMap.get("msg") %>',<%=pMap.get("ORDER_NO")%>)" style="height:26px; width:64px; ">완료취소</button>
			</td>
			<td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
			</td>
			<td class="bs_table_when" style="width:30%; text-align: right;">
				배송완료&nbsp;:&nbsp;<%=pMap.get("ORDER_ENDDATE")%>
			</td>
		  </tr>
	<% 
				}else if("44".equals(pMap.get("DELIVERY_STATE").toString())){
	%>
		  <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle; background-color: mistyrose;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="height: 77px; padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black; background-color: mistyrose;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("IVGROUP_NAME")%>&nbsp;/&nbsp;<%=pMap.get("ORDER_COUNT")%> t 
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; background-color: mistyrose; " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("CUS_ADDR")%>&nbsp;/&nbsp;<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px; background-color: mistyrose;" data-toggle="modal" data-target="#bs_info_<%=i%> " data-backdrop="static" >
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELIVERY_DATE") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
			<td style="width:345px; padding-top: 6px; padding-bottom: 6px; padding-left: 12px; padding-right: 6px; font-size: 13px; background-color: mistyrose;" colspan="2"  data-toggle="modal" data-target="#bs_info_<%=i%>"  data-backdrop="static" >
			     	※ 배송내역이 취소되었습니다. 
			</td>
			<td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px; background-color: mistyrose; "data-target="#bs_info_<%=i%> "  data-backdrop="static" colspan="2">
			</td>
			<td class="bs_table_when" style="width:30%; background-color: mistyrose;" data-toggle="modal" data-target="#bs_info_<%=i%> " data-backdrop="static" >
	        	 취소일자&nbsp;:&nbsp;<%=pMap.get("ORDER_INDATE")%>
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
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
<div class="container" style="margin-left: 0px;">
  <ul class="pagination" style="justify-content: center;">
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
			String pagePath = "/erp/delivery_List?keyword="+keyword+"&before_date="+before_date+"&after_date="+after_date+"&cb_situation="+cb_situation+"&cb_search="+cb_search;
			PageBar pb = new PageBar(numPerPage,tot,nowPage,pagePath);
			String pagination = null;
			pagination = pb.getPageBar();
			out.print(pagination);
	%>
  </ul>
</div>
</div>
</div>
<!-- ============================================================================================================================================= -->
<!-- ===============================================================업체명 조회창==================================================================== -->
<!-- ============================================================================================================================================= -->

<!-- ===============================================================for문========================================================================== -->

<%
	Map<String,Object> rMap = new HashMap<>();
	for(int i=0;i<size;i++){
		if(i==size) break;
		rMap = deliveryList.get(i);
		if("44".equals(rMap.get("DELIVERY_STATE").toString())){//취소된 업체명 조회창
%>
<div class="container">
	<div class="modal fade" id="bs_info_<%=i%>">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 5px;"> 
			  			<tbody style="text-align: left;">
			  				<tr>
			  					<td class="bi_table_insert" style="border:none; width:150px;padding-top: 7px; padding-bottom: 7px;">작성자</td>
			  					<td class="bs_table_body" style="border:none; width:300px; padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("TEAM_NAME")%> : <%=rMap.get("EMP_NAME")%> (<%=rMap.get("EMP_HP")%>)</td>
			  				</tr>
		  				</tbody>
		  			</table>
					<table class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
			  			<tbody style="text-align: left;">
			  				<tr>
			  					<td class="bi_table_insert" style="width:150px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
			  					<td class="bs_table_body" style="width:300px; padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_NAME")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("BUSINESS_NO")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_CEONAME")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_HP")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_BUSIKIND")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_ADDR")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_MAN")%>&nbsp;/&nbsp;(<%=rMap.get("CUS_MANHP")%>)</td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("IVGROUP_NAME") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_COUNT") %> t</td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">취소날짜</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_INDATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송날짜</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("DELIVERY_DATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">취소사유</td>
			  					<td class="bs_table_body" style="height: 120px; padding-top: 7px; padding-bottom: 7px;">
			  						<div style="border: 2px; border-style: ridge; padding-left: 7px; padding-right: 7px; padding-top: 5px; padding-bottom: 5px; height: 104px;">
			  							<%=rMap.get("ORDER_MEMO")%>
			  						</div>
			  					</td>
			  				</tr>
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
<%
	}else{ //업체명 조회창
%>
<div class="container">
	<div class="modal fade" id="bs_info_<%=i%>">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
			
			<!-- 모달 헤드 -->
				<div class="modal-header">
				</div>
				
			<!-- 모달 바디 -->
				<div class="modal-body" style="padding-top: 5px;">
					<table class="table" style="margin-bottom: 5px;"> 
			  			<tbody style="text-align: left;">
			  				<tr>
			  					<td class="bi_table_insert" style="border:none; width:150px;padding-top: 7px; padding-bottom: 7px;">작성자</td>
			  					<td class="bs_table_body" style="border:none; width:300px; padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("TEAM_NAME")%> : <%=rMap.get("EMP_NAME")%> (<%=rMap.get("EMP_HP")%>)</td>
			  				</tr>
		  				</tbody>
		  			</table>
					<table class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
			  			<tbody style="text-align: left;">
			  				<tr>
			  					<td class="bi_table_insert" style="width:150px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
			  					<td class="bs_table_body" style="width:300px; padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_NAME")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("BUSINESS_NO")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_CEONAME")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_HP")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_BUSIKIND")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_ADDR")%></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자</td>
			  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_MAN")%>&nbsp;/&nbsp;(<%=rMap.get("CUS_MANHP")%>)</td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("IVGROUP_NAME") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_COUNT") %> t</td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">접수날짜</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_INDATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송날짜</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("DELIVERY_DATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배정완료</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_STARTDATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송완료</td>
			  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("ORDER_ENDDATE") %></td>
			  				</tr>
			  				<tr>
			  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
			  					<td class="bs_table_body" style="height: 120px; padding-top: 7px; padding-bottom: 7px;">
			  						<div style="border: 2px; border-style: ridge; padding-left: 7px; padding-right: 7px; padding-top: 5px; padding-bottom: 5px; height: 104px;">
			  							<%=rMap.get("ORDER_MEMO")%>
			  						</div>
			  					</td>
			  				</tr>
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
<%
		}
	}
%>
<!-- ===============================================================for문========================================================================== -->


<!-- ============================================================================================================================================= -->
<!-- ===============================================================업체명 조회창================================================================= -->
<!-- ============================================================================================================================================= -->

</div>
</body>
</html>
