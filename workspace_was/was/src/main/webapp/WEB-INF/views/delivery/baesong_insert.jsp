<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
 	Map<String,Object> r_Map = (Map<String,Object>)request.getAttribute("r_Map");
 	List<Map<String,Object>> deliveryInsert_ListS = (List<Map<String,Object>>)r_Map.get("deliveryInsert_ListS");
 	List<Map<String,Object>> deliveryInsert_ListF = (List<Map<String,Object>>)r_Map.get("deliveryInsert_ListF");
 	List<Map<String,Object>> f_list = (List<Map<String,Object>>)r_Map.get("f_list");
	if(deliveryInsert_ListS!=null){
		size=deliveryInsert_ListS.size();
	}
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 18;
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
	function bs_search(){
		alert("조회버튼 양호");
		$("#f_bs_search").attr("method","post");
		$("#f_bs_search").attr("action","");
		$("#f_bs_search").submit();
	}
	function bs_delete(){
		alert("삭제버튼 양호");
	}
	function bs_insert(){
		alert("입력버튼 양호");
		$("#f_deli_insert").attr("method","post");
		$("#f_deli_insert").attr("action","/erp/deliveryInsert_List");
		$("#f_deli_insert").submit();
	}
	function bs_update_insert(){
		alert("수정입력버튼 양호");
		$("#f_deli_insert").attr("method","post");
		$("#f_deli_insert").attr("action","/erp/delivery_Update_Insert");
		$("#f_deli_insert").submit();
	}
	function bs_update(){
		var deli_no = $("#deli_no").val();
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
	}
	function bs_cancle(){
		location.href="/erp/deliveryInsert_ListF";
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
	});
</script>

<div class="row">
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp"%>
	 <!-- ======================================================================================================================================================================= -->
	 <!-- 															여기부터 내영역																					 -->
	 <!-- ======================================================================================================================================================================= -->
  </div>
<div style="width:80%" >
<div class="container" style="margin-left: 0px;">
<div class="base_table_div" style="height: 900px; ">

<!--================================상단바===========================================-->
	<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
    	<div class="card-body">배송처 등록</div>
  	</div>
  	<div class="row">
	</div>
<!--================================상단바===========================================-->

<form id="f_bs_search"><!-- ============================================================================form================================ -->
  <table class="table table-hover" style="margin-bottom: 5px; background-color:#F1F1F1">
    <thead>
      <tr>
<!--<th style="width:10%">-->
        <th style="width: 250px;border-top-width: 10px;border-top-color: white;">
        	<button type="button" onclick="javascript:bs_delete()" class="btn btn-dark" style="width:54.5px">삭제</button>
		</th>
        <th style="border-top-width: 10px; border-top-color: white;">
	        <div class="dropdown" style="width: 130px;">
				<select class="btn btn-dark dropdown_bs" style="color:white; width:120px; height:35.75px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
					<option value="">선택</option>
					<option value="week">업체</option>
					<option value="week">담당자</option>
				</select>
			</div>
        </th>  
        <th style="border-top-width: 10px;border-top-color: white;">
			 <input type="text" class="form-control" name="bs_comp_name" placeholder=" 내용을 입력하세요."  size="27" style="height: 35.75px;width:100%;min-width:140px; font-size: 13px;">
        </th>
        <th style="border-top-width: 10px;border-top-color: white;">
			<input type="date" class="form-control" name="before_date">
		</th>
		<th style="border-top-width: 10px;border-top-color: white;">
			<i class='fas fa-minus-square' style='font-size:36px'/>
		</th>
		<th style="border-top-width: 10px;border-top-color: white;">
			<input type="date" class="form-control" name="after_date">
		</th>
		<th style="border-top-width: 10px;border-top-color: white;">
			<button onclick="javascript:bs_search()" class="btn btn-dark" style="float: right; width:54.5px"">조회</button>
		</th>
      </tr>
    </thead>
  </table>
</form><!-- ============================================================================form============================================= -->
  <div class="container">
	  <div class="row" style="margin-top:15px">
	  	<div class="col-sm-4">
			<h5>배송목록</h5>
	  		<table class="table table-striped" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;" > 
	  			<thead style="text-align: center;">
	  				<tr style="width:10%">
	  					<th style="width:10%;">
	  						<div><input type="checkbox" id="checkall"></div>
	  					</th>
	  					<th style="width:35%;">업체</th>
	  					<th style="width:25%;">담당자</th>
	  					<th style="width:30%;">등록일</th>
	  				</tr>
	  			</thead>
	  			<tbody id="bs_list">
	  			
<%	
	if(deliveryInsert_ListS!=null){
		Map<String,Object> sMap = new HashMap<>();
		String deli_date = null;
		for(int i=numPerPage*nowPage+0;i<numPerPage*nowPage+18;i++){
			if(i==deliveryInsert_ListS.size()) break;
			sMap = deliveryInsert_ListS.get(i);
			String cus_name[] = sMap.get("CUS_NAME").toString().split("\\(");
%>
			  			<tr id="<%=sMap.get("ORDER_NO")%>">
		  					<td style="padding-top: 5px; padding-bottom: 5px;"><div><input type="checkbox" name="chk"></div></td>
						<%--<td><input type="hidden" id="deli_no_<%=sMap.get("DELI_NO")%>" name="deli_no_<%=sMap.get("DELI_NO")%>" value="<%=sMap.get("DELI_NO")%>"></td>--%>		  					
							<td class="bs_table_when" style="padding-top: 5px; padding-bottom: 5px;"><%=cus_name[0]%></td>
		  					<td class="bs_table_when" style="padding-top: 5px; padding-bottom: 5px;"><%=sMap.get("CUS_MAN") %></td>
		  					<td class="bs_table_when" style="padding-top: 5px; padding-bottom: 5px;">
		  						<%
		  							deli_date = sMap.get("ORDER_INDATE").toString();
		  							deli_date = deli_date.substring(0, 10);
		  						%>
		  						<%=deli_date %>
		  					</td>
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
	  	<div id="trance_table" class="col-sm-8">
	  		<h5 style="display:inline;">배송등록</h5>
	  		<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">취소</button>
	  		<button type="button" onclick="javascript:bs_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; padding-top: 2px; padding-bottom: 2px;">등록</button>
	  		<input id="table_gubun" type="hidden" value="1">
	  		<form id="f_deli_insert">
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
		  						<zealot class="btn btn-secondary btn_firstrow btn_tableRow" data-toggle="modal" data-target="#iven_insert" style="cursor:pointer; height:26px; width:90px;" data-backdrop="static">품목등록</zealot>
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
		  					<td colspan="5" style="height:165px;pxpadding-top: 7px; padding-bottom: 7px;">
		  						<textarea name="deli_memo" style="height:95%; width:95%;"></textarea>
		  					</td>
		  				</tr>
		  			</tbody>
		  		</table>
	  		</form>
	  	</div>
	  </div>
</div>
  </div>
	<div class="container" style="margin-left: 0px;">
		<ul class="pagination" id="bs_pagenation" style="justify-content: center;">
			<%
				String pagePath = "/erp/deliveryInsert_ListF";
				PageBar pb = new PageBar(numPerPage,size,nowPage,pagePath);
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
					<div class="modal-title">
					<!--var companyname = $("#밑에놈 아이디").text(); search.do?compay  -->
						<input type="text" class="form-control" name="companyname" placeholder="업체명을 입력하세요."  size="27" style="height: 27px; width:200px; min-width:140px; font-size: 13px; margin-left:50px; margin-right: 10px;">
					</div>
					<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" data-toggle="modal" data-target="#comp_name" >검색</zealot>
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

<!-- ============================================================================================================================================= -->
<!-- ===============================================================품목등록창================================================================= -->
<!-- ============================================================================================================================================= -->


</body>
</html>
