<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
	List<Map<String,Object>> testList = (List<Map<String,Object>>)request.getAttribute("deliveryList");
	if(testList!=null){
		size = testList.size();
	}	
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 8;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<%@ include file="/common/bootStrap4.jsp" %>
<title>배송조회</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
<%@ include file="/common/bs_css.jsp" %>
<script type="text/javascript">
	function bs_save(id){
		$.ajax({
    		url:"/samlple/board/test_save.mvc?id="+id
    		,method:"get"
    		,success:function(data){
    			$("#bs_table_update_"+id).html(data);
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_delete(){
		alert("삭제하기");
	}
	function bs_update(id_update){
		$.ajax({
    		url:"/samlple/board/test_update.mvc?id="+id_update
    		,method:"get"
    		,success:function(data){//해석하기
    			$("#bs_table_update_"+id_update).html(data);//해석하기
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_commit(id_commit){
		$.ajax({
    		url:"/samlple/board/test_commit.mvc?id="+id_commit
    		,method:"get"
    		,success:function(data){
    			$("#bs_table_update_"+id_commit).html(data);
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
	}
	function bs_cancle(id_cancle){
		$.ajax({
    		url:"/samlple/board/test_save.mvc?id="+id_cancle
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
		alert("조회하기");
		
		$.ajax({
    		url:"/samlple/board/test_save.mvc?id="+id_cancle
    		,method:"get"
    		,success:function(data){//해석하기
    			$("#bs_table_update_"+id_cancle).html(data);//해석하기
    		}
    		,error:function(e){
    			alert(e.responseText);
    		}
    	});
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
<div class="row" >
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp" %>
     <!-- ======================================================================================================================================================================= -->
	 <!-- =														여기부터 내영역																					                    = -->
     <!-- ======================================================================================================================================================================= -->
  </div>


<div style="width:80%" >
<div class="container" style="margin-left: 0px;">
<div class="base_table_div">
<!--================================상단바===========================================-->
	<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
    	<div class="card-body">사원목록</div>
  	</div>
  	<div class="row">
	</div>  
<!--================================상단바===========================================-->
  <table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
    <thead>
      <tr>
<!--<th style="width:10%">-->
        <th style="width: 250px;border-top-width: 10px;border-top-color: white;">
        		<button type="button" class="btn btn-dark" onclick="javascript:bs_delete()" style="width:54.5px">삭제</button>
		</th>
		<form id="f_search">
	        <th style="border-top-width: 10px;border-top-color: white;">
		        <div class="dropdown" style="width: 130px;">
					<select name="cb_search" class="btn btn-dark dropdown_bs" style="color:white; width:120px; height:35.75px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
						<option value="">선택</option>
						<option value="comp_name">업체명</option>
						<option value="comp_addr">업체주소</option>
						<option value="comp_man">담당자</option>
					</select>
				</div>
	        </th>
	        <th style="border-top-width: 10px;border-top-color: white;">
				<input name="keyword" type="text" class="form-control" placeholder=" 내용을 입력하세요."  size="27" style="height: 35.75px;width:100%;min-width:140px; font-size: 13px;">
	        </th>
	        <th style="border-top-width: 10px;border-top-color: white;">
				<input name="before_date" type="date" class="form-control">
			</th>
			<th style="border-top-width: 10px;border-top-color: white;">
				<i class='fas fa-minus-square' style='font-size:36px'/>
			</th>
			<th style="border-top-width: 10px;border-top-color: white;">
				<input name="after_date" type="date" class="form-control">
			</th>
		</form>
		<th style="border-top-width: 10px;border-top-color: white;">
			<button class="btn btn-dark" onclick="javascript:bs_search()" style="float: right; width:54.5px">조회</button>
		</th>
      </tr>
    </thead>
  </table>
  <!-- ====================================여기서부터 테이블시작======================================= -->
  <table class="table" style="border-bottom:inset;  margin-bottom: 0px;">
    <thead>
      <tr style="background-color: #cccccc96;">
        <th style="width:5%; text-align:center; vertical-align: middle;">
        	<div><input type="checkbox" class="bs_checkbox" id="checkall"></div> 
        </th>
        <th class="bs_table_header" style="width:25%;min-width:120px;">
        	품목 및 수량
        </th>
        <th class="bs_table_header" style="width:50%;" colspan="4">
        	업체명
        </th>
        <th class="bs_table_header" style="width:30%;">
        	날짜
        </th>
      </tr>
    </thead>
    <tbody>
<%
	Map<String,Object> pMap = new HashMap<>();
	for(int i=numPerPage*nowPage+0;i<numPerPage*nowPage+8;i++){
		if(i==size) break;
		pMap = testList.get(i);
%>
  <!-- ====================================여기서 for문======================================= -->
      <tr>
        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
        	<div><input type="checkbox" class="bs_checkbox" name="chk"></div>
        </td>
        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("FISH_NAME")%>/<%=pMap.get("DELI_WEIGHT")%>
        </td>
        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("CUS_ADDR")%>/<%=pMap.get("CUS_NAME")%>
        </td>
        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("DELI_DATE") %>
        </td>
      </tr>
      <tr id="bs_table_update_<%=i%>"> 
        <td style="width:125px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
			<div class="dropdown">
				<select class="dropdown_tableRow" style="border: groove; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
			  		<option value="">배송팀 선택</option>
			  		<option value="week">배송1팀</option>
			  		<option value="week">배송2팀</option>
			  		<option value="week">배송3팀</option>
				</select>
			</div> 
		</td>
        <td style="width:220px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
			<input type="text" class="form-control" id="companyname" name="companyname" placeholder="담당자를 입력하세요."  size="27" style="height: 27px;width:100%;min-width:140px; font-size: 13px;">
        </td>
        <td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;" >
					<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_save(<%=i%>)" style="height:26px; width:64px; ">저장하기</button>
        </td>
        <td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
        </td>
        <td class="bs_table_when" style="width:30%; text-align: right;"></td>
      </tr>
  <!-- ====================================여기서 for문 닫힘======================================= -->
<%
	}
%>
    </tbody>
  </table>
  </div>
  <!-- ====================================여기서 테이블 끝======================================= -->
</div>
<div class="container" style="margin-left: 0px;">
  <ul class="pagination" id="bs_pagenation" style="justify-content: center;">
	<%
			String pagePath = "/samlple/board/test_bs.mvc";
			PageBar pb = new PageBar(numPerPage,size,nowPage,pagePath);
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
	for(int i=numPerPage*nowPage+0;i<numPerPage*nowPage+8;i++){
		if(i==size) break;
		rMap = testList.get(i);
%>
<div class="container">
	<div class="modal" id="bs_info_<%=i%>">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
				</div>
				
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
	  			<tbody style="text-align: left;">
	  				<tr>
	  					<td class="bi_table_insert" style="width:150px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
	  					<td class="bs_table_body" style="width:300px; padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("CUS_NAME")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("BUSINESS_NO")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("CUS_CEONAME")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("CUS_HP")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("CUS_BUSIKIND")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_ADDR")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=rMap.get("CUS_MAN")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 번호</td>
	  					<td class="bs_table_body" style="padding-top: 5px; padding-bottom: 5px;"><%=pMap.get("CUS_MANHP")%></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
	  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("FISH_NAME") %></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
	  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("DELI_WEIGHT") %></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송날짜</td>
	  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=rMap.get("DELI_DATE") %></td>
	  				</tr>
	  				<tr>
	  					<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
	  					<td class="bs_table_body" style="padding-top: 7px; padding-bottom: 7px;"><%=pMap.get("DELI_MEMO")%></td>
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
%>
<!-- ===============================================================for문========================================================================== -->


<!-- ============================================================================================================================================= -->
<!-- ===============================================================업체명 조회창================================================================= -->
<!-- ============================================================================================================================================= -->


</body>
</html>
