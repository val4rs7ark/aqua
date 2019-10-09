<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.util.PageBar" %>
<%
		int size = 0;
		List<Map<String,Object>> rList = 
		      (List<Map<String,Object>>)request.getAttribute("rList");
		Map<String,Object> pl_Map = (Map<String,Object>)request.getAttribute("pl_Map");
		int tot = (int)request.getAttribute("tot");
		if(rList !=null && rList.size()>0){
		   size = rList.size();
		}
		//////////페이지 네비게이션 추가분////////////
		int numPerPage = 5; //한 페이지당 뿌려질 로우갯수
		int nowPage = 0;  	//현재 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		//out.print(rList);
		//out.print(pl_Map);
		
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
<title>생산품 등록/조회</title>
<script type="text/javascript">
	function getSelectValue(result){
		result.ship_code.value    = result.shipcode.options[result.shipcode.selectedIndex].value;
		result.ivgroup_code.value = result.ivgroup_name.options[result.ivgroup_name.selectedIndex].value;

	}
	function productSearch(){
		alert("조회검색");
		$("#tb_Search").attr("method","post");
		$("#tb_Search").attr("action","/erp/productList");
		$("#tb_Search").submit();
	}
	function prod_Insert() {
		//alert("등록");
		$("#productAdd").submit();
	}
	function prod_delete(){
		alert("삭제");
		var chk = document.getElementsByName("chk");
		var len = chk.length;//체크박스의 전체 개수
		var checkRow = '';//체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;//체크된 체크박스의 개수
		var checkLast = '';//체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';//체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;        
		for(var i=0; i<len; i++){//12
			if(chk[i].checked == true){//체크가 되어있는 값 구분
				checkCnt++;//체크된 체크박스의 개수
				checkLast = i;//체크된 체크박스의 인덱스
			}
		} 
		for(var i=0; i<len; i++){//12
			if(chk[i].checked == true){//체크가 되어있는 값 구분
				checkRow = chk[i].value;//체크 되어있는 값을 checkRow에 담기 =================================================>//왜 이게 on이야? 어떻게 on이 담긴거야?? 
				if(checkCnt == 1){//체크된 체크박스의 개수가 한 개 일때,
					rowid += checkRow;//'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{//체크된 체크박스의 개수가 여러 개 일때,
					if(i == checkLast){//체크된 체크박스 중 마지막 체크박스일 때,
						rowid += checkRow;//'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{
						rowid += checkRow+",";//'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
					}
				}
				cnt++;
				checkRow = '';//checkRow초기화.
			}
		}
		location.href="/erp/productDelete?rowid="+rowid;
	}
	
	$(document).ready(function() {
		//최상단 체크박스 클릭
		$("#checkall").click(function() {
			//alert("click");
			//클릭되었으면
			if ($("#checkall").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=chk]").prop("checked", false);
			}
		});
		/* =======================================================================test========================================================= */

				// 테이블의 Row 클릭시 값 가져오기
				$("#prod_List tr").click(function(){ 	
					alert("누름");
					var str = ""
					var tdArr = new Array();	// 배열 선언
					// 현재 클릭된 Row(<tr>)
					var tr = $(this);
					var td = tr.children();
					// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
					console.log("클릭한 Row의 모든 데이터 : "+tr.text());
					// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
					td.each(function(i){
						tdArr.push(td.eq(i).text());
					});
					// td.eq(index)를 통해 값을 가져올 수도 있다.
					var supso_no = td.eq(1).text();//번호
					var ivgroup_code = td.eq(2).text();//재고코드
					var ivgroup_name = td.eq(3).text();//상품명
					var empno = td.eq(4).text();//사원번호
					var emp_name = td.eq(5).text();//사원명
					var supso_startdate = td.eq(6).text();//출항일
					var supso_enddate = td.eq(7).text();//입항일
					var supso_count = td.eq(8).text();//생산수량
					var supso_date = td.eq(9).text();//등록일
					var ship_code = td.eq(10).text();//어선코드 
					/* $.ajax({
						    method:"get"
						   ,url:"productDetail?supso_no="+supso_no
						   ,success:function(data){
							   $("#prod_Detail").html(data);
						   }
					}); */
					/* 
				    str   +="  supso_no :" + supso_no 
				    	  + "  ivgroup_code :" + ivgroup_code
					      + ", ivgroup_name :" + ivgroup_name
					      + ", empno :" + empno  
					      + ", supso_startdate :" + supso_startdate 
					      + ", supso_enddate :" + supso_enddate 
					      + ", supso_startdate :" + supso_startdate 
					      + ", supso_count :" + supso_count 	
					      + ", supso_date :" + supso_date 
					      + ", ship_code :" + ship_code	
					alert(str); */
				});
		/* =======================================================================test========================================================= */
		
	});
</script>
</head>
<body>
<div class="container-fluid">
<div class="row">
	<div style="width:20%">
		<%@ include file="/common/MenuCommon.jsp" %>
    </div>
  <div style="width:78%">
  
  <!-- ======================================================================================================================================
 																 생산품 상세검색 영역 시작
  	   ======================================================================================================================================= -->
  <div class="w3-container w3-light-gray" style=" margin-top: 25px; height: 60px;">
  <div class="box-container">
  <div id="box">
  <table class="table table-hover" id="tb_Search" style="background-color:#F1F1F1; height:30px;">
	<td style="padding-right:0px; padding-left:0px;">
		<select class="form-control" id="ivgroup_search" name="ivgroup_search" align="center" 
		        style="background-color:#FFFFFF; width:150px; padding-right:0px; padding-left:0px;">
		  <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생산품 선택</option>
		  <option value="Z00011">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;광어</option>
		  <option value="Z00012">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오징어</option>
		  <option value="Z00013">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;돔</option>
		  <option value="Z00014">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참치</option>
		</select>
	</td>
	<td style="padding-right:0px; padding-left:0px;">
	  <select class="form-control" id="ship_search" name="ship_search" align="center" 
	          style="background-color:#FFFFFF; width:150px; padding-right:0px; padding-left:0px;">
		  <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선 선택</option>
		  <option value="S0001">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태양호</option>
		  <option value="S0002">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참수리</option>
		  <option value="S0003">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태극호</option>
		  <option value="S0004">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오양호</option>
		  <option value="S0005">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동해호</option>
	  </select>
	</td>
	<td style="padding-right:0px;"><button type="button" class="form-control" style="padding-right:10px;">출항일</button></td>
	<td style="padding-right:0px; padding-left:3px;">
		<input type="date" id="before_date" name="before_date" class="form-control" style="width:180px;">
	</td>
	<td style="padding-right:0px;"><button type="button" class="form-control" style="padding-right:10px;">입항일</button></td>
	<td style="padding-right:0px; padding-left:3px;">
		<input type="date" id="after_date" name="after_date" class="form-control" style="width:180px;">
	</td>
	<td style="padding-right:0px;"><button onclick="location.href='javascript:productSearch()'" class="form-control" style="float: right; magin-right:10px;">조회</button></td>
  </table>
  </div>
  </div>
  <hr>
  </div>
  <!-- ======================================================================================================================================
 																 생산품 상세검색 영역 끝
  	   ======================================================================================================================================= -->
  <!-- ========================================================================================================================================
  															생산품 등록 및 상세보기 영역
  	   ======================================================================================================================================== -->
 	<div class="row">
  	<!-- <div class="50%" style="margin-top: 35px;"> -->
  		<form id="productAdd" action="/erp/productInsert" method="get">
  		<!-- spring일 때는 없어도 됨. pojo에서:get방식인지 post방식인지 구분하기 위해서 -->
  		<!-- <input type="hidden" name="gap" value="0"> -->
  		<input id="table_gubun" type="hidden" value="1">
  		<div id="prod_Detail">
  		  <table class="table table-hover" style="margin-top: 30px; margin-left: 15px;"><!-- class="table table-striped" -->
		    <thead">
		      <tr>
		        <h5><td colspan="4" style="width:1000px; background-color: black; color: aliceblue; text-align:center;">생산품 등록</td></h5>  	
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td style="text-align:center;"><strong>사원번호</strong></td>
		        <td><input class="form-control" id="empno" name="empno" type="text" style="width:150px;"/></td>
		        <td style="text-align:center;"><strong>사원명</strong></td>
		        <td><input class="form-control" id="emp_name" name="emp_name" type="text" placeholder="사원명을 적어주세요." style="width:180px;"/></td>
		      </tr>
		      <tr>
		        <td style="width:20%; text-align:center;"><strong>어선</strong></td>
		        <td style="width:25%;">
			        <select class="form-control" id="shipcode" name="shipcode" onChange="getSelectValue(this.form);" 
			                style="background-color:#FFFFFF; width:100px;">
					  <option value="S0001">&nbsp;태양호</option>
					  <option value="S0002">&nbsp;참수리</option>
					  <option value="S0003">&nbsp;태극호</option>
					  <option value="S0004">&nbsp;오양호</option>
					  <option value="S0005">&nbsp;동해호</option>
				    </select>
			  </td>
			  	<td style="width:30%; text-align:center;"><strong>어선코드</strong></td>
		        <td style="width:25%;"><input class="form-control" id="ship_code" name="ship_code" type="text" style="width:100px;"/></td>
		      </tr>
		      <tr>
		        <td style="width:20%; text-align:center;"><strong>생산품</strong></td>
		        <td style="width:25%;">
					<select class="form-control" id=ivgroup_name" name="ivgroup_name" onChange="getSelectValue(this.form);" 
					        style="background-color:#FFFFFF;width:100px;">
					  <option value="Z00011">&nbsp;광어</option>
					  <option value="Z00012">&nbsp;오징어</option>
					  <option value="Z00013">&nbsp;돔</option>
					  <option value="Z00014">&nbsp;참치</option>
					</select>
				</td>
				<td style="width:30%; text-align:center;"><strong>생산코드</strong></td>
		        <td style="width:25%;"><input class="form-control" id="ivgroup_code" name="ivgroup_code" type="text" style="width:100px;"/></td>
		      </tr>
		      <tr>
		        <td style="text-align:center;"><strong>수량/무게</strong></td>
		        <td><input class="form-control" id="supso_count" name="supso_count" type="text" 
		                   style="width:100px; display:inline-block;"/>&nbsp;<font size="5" face="맑은고딕">t</font></td>
		      	<td style="width:30%; text-align:center;"></td>
		      	<td style="width:30%; text-align:center;"></td>
		      </tr>
		      <tr>
		        <td style="width:20%; text-align:center;"><strong>출항일</strong></td>
		        <td style="width:25%;">
					<input class="form-control" id="supso_startdate" name="supso_startdate" placeholder="YYYY/MM/DD" type="date" style="width:180px; display:inline-block;"/>
				</td>
		        <td style="width:20%; text-align:center;"><strong>입항일</strong></td>
		        <td style="width:25%;">
					<input class="form-control" id="supso_enddate" name="supso_enddate" placeholder="YYYY/MM/DD" type="date" style="width:180px;"/>
				</td>
		      </tr>
		    </tbody>
		  </table>
  		</div>
			   <hr>
		</form>
  	</div>

  <!-- ===================================================================================================================================
  																생산품 상세보기 영역 끝
  	   ==================================================================================================================================== -->

  <!-- ====================================================================================================================================
  																  생산품 목록 영역 시작
 	   ==================================================================================================================================== -->
   	  <button type="button" class="btn btn-dark" data-toggle="modal" data-target="productDelete" 
  	  		  style="margin-left: 10px; margin-top: inherit;" onclick="location.href='javascript:prod_delete()'">삭제</button>
   	  <button type="button" class="btn btn-dark" style="margin-top: inherit;" onclick="location.href='javascript:prod_Insert()'">등록</button>
  <div class="row">

		<table class="table table-hover" id="prod_List" style="margin: 11px;width: 1000px; text-align:center; margin-left: 15px;">	
			<thead>
			<tr style="background-color: black;color: aliceblue; text-align:center; width:300px; height:48px;">
				<td>
				<div class="checkbox checkbox-primary">
				 <input id="checkall" name="chk" type="checkbox" check>
				</div>
				</td> 
				<!-- <td>No.</td> -->
				<td>No.</td>
				<td>생산코드</td>
				<td>생산품명</td>
				<td>사원번호</td>
				<td>출항일</td>
				<td>입항일</td>
				<td>생산수량</td>
				<td style="display:none;">등록일</td>
				<td>어선코드</td>
			</tr>
			</thead>
			<tbody>
<%
   if(size==0){
%>    
       <tr>
          <td colspan="7">조회결과가 없습니다.</td>
       </tr>
<%
   }
   else if(size>0){
	   for(int i=0;i<size;i++){
		   if(size == i) break;
		   Map<String,Object> rMap = rList.get(i);
%>
		<tr style="text-align:center; width:300px; height:48px;">
			<td>
			<div class="checkbox checkbox-primary">
				<input id="chk" name="chk" type="checkbox" value="<%=rMap.get("SUPSO_NO")%>">
			</div>
			</td>
			<%-- <td><%=rMap.get("SNO") %></td> --%>
			<td><%=rMap.get("SUPSO_NO") %></td>
			<td><%=rMap.get("IVGROUP_CODE") %></td>
			<td><%=rMap.get("IVGROUP_NAME") %></td>
			<td><%=rMap.get("EMPNO") %></td>
			<td><%=rMap.get("SUPSO_STARTDATE") %></td>
			<td><%=rMap.get("SUPSO_ENDDATE") %></td>
			<td><%=rMap.get("SUPSO_COUNT") %></td>
			<td style="display:none;"><%=rMap.get("SUPSO_DATE") %></td>
			<td><%=rMap.get("SHIP_CODE") %></td>
		</tr>
<% 
	   }
   }
%> 
			</tbody>
		</table>
  	<hr>
  	</div>
  	<hr>
  <!-- ========================================================================================================================================
  																생산품 목록 영역 끝
 	   ======================================================================================================================================== -->

  <!-- ========================================================================================================================================
  																페이지네이션 영역 시작 
 	   ======================================================================================================================================== -->
  	   <div class="container" style="margin-left: 0px; text-align: -webkit-center;">
 	   <table>
		  <ul class="pagination" style="justify-content: center;">
			<%		
					String pro_keyward = null; 
					String ship_keyworid = null;
					String befor_date_ud = null; 
					String after_date_ud = null; 
					String ivgroup_search = null; 
					String ship_search = null; 
					if(pl_Map.get("pro_keyword")!=null){
						pro_keyward = pl_Map.get("keyword").toString();
					}
					if(pl_Map.get("ship_keyword")!=null){
						ship_keyworid = pl_Map.get("keyword").toString();
					}
					if(pl_Map.get("befor_date_ud")!=null){
						befor_date_ud = pl_Map.get("befor_date_ud").toString();
					}
					if(pl_Map.get("after_date_ud")!=null){
						after_date_ud = pl_Map.get("after_date_ud").toString();
					}
					if(pl_Map.get("ivgroup_search")!=null){
						ivgroup_search = pl_Map.get("ivgroup_search").toString();
					} 
					if(pl_Map.get("ship_search")!=null){
						ship_search = pl_Map.get("ship_search").toString();
					} 
//					String pagePath = "/erp/productList?pro_keyward="+pro_keyward+"&ship_keyworid="+ship_keyworid+"&befor_date="+befor_date_ud+"&after_date="+after_date_ud+"&ivgroup_search="+ivgroup_search+"&ship_search="+ship_search;
					String pagePath = "/erp/productList?";
					PageBar pb = new PageBar(numPerPage,tot,nowPage,pagePath);
					String pagination = null;
					pagination = pb.getPageBar();
					out.print(pagination);
			%>
		  </ul>
	 </div> 
	 	<tr>
	</tr>
 	   </table>
 	   </div>
  <!-- ========================================================================================================================================
  																페이지네이션 영역 시작 
 	   ======================================================================================================================================== -->
</div>
</div>
</div>
</body>
</html>