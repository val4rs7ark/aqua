<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
		int size = 0;
		List<Map<String,Object>> rList = 
		      (List<Map<String,Object>>)request.getAttribute("rList");
		if(rList !=null && rList.size()>0){
		   size = rList.size();
		}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<title>!생산품 등록/조회 테스트용</title>
<script type="text/javascript">
	
	function productInsert() {
		alert("등록");
		$("#productAdd").submit();
	}
	$(document).ready(
			function() {
				//최상단 체크박스 클릭
				$("#checkall").click(function() {
					//클릭되었으면
					if ($("#checkall").prop("checked")) {
						//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
						$("input[name=checkbox]").prop("checked", true);
						//클릭이 안되있으면
					} else {
						//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
						$("input[name=checkbox]").prop("checked", false);
					}
				});
				function addRowHandlers() {
					var table = document.getElementById("proList");
					var rows = table.getElementsByTagName("tr");
					for (i = 0; i < rows.length; i++) {
						var currentRow = table.rows[i];
						var createClickHandler = function(row) {
							return function() {
								var cell = row.getElementsByTagName("td")[0];
								var id = cell.innerHTML;
								alert("id:" + id);
							};
						};
						currentRow.onclick = createClickHandler(currentRow);
					}
				}
				;
				window.onload = addRowHandlers();

				// 테이블의 Row 클릭시 값 가져오기
				$("#proList tr").click(
						function() {
							var str = ""
							var tdArr = new Array(); // td를 담을 배열 선언
							// 현재 클릭된 Row(<tr>)
							var tr = $(this);//7개
							var td = tr.children();
							// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
							//console.log("클릭한 Row의 모든 데이터 : "+tr.text());
							// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
							td.each(function(i) {//td=n개이므로 n개동안 반복.
								tdArr.push(td.eq(i).text());//배열에 0인덱스부터 순차적으로 푸쉬 
							});
							/* console.log("배열에 담긴 값 : "+tdArr); */
							// td.eq(index)를 통해 값을 가져올 수도 있다.
							var pd_no = td.eq(0).text();
							var pd_regdate = td.eq(2).text();
							var ship_code = td.eq(3).text();
							var pd_indate = td.eq(4).text();
							var fish_name = td.eq(5).text();
							var pd_outdate = td.eq(6).text();
							var pd_weight = td.eq(7).text();

							/* str +=	"No. : "+ pd_no +", 생산품 생산일자 :"+pd_ +pd_regdate+", 어종명 :" + fish_code + +", 입고일: "+pd_indate+", 출고일 : " + pd_outdate;	 */
							/* $("#ex1_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());	*/
							/* $("#checkid").html(str); /* 1개의 row값 밖에 ... */
							//alert(pd_no + "," + pd_regdate + "," + ship_code + "," +pd_indate + "," + fish_name + "," + pd_outdate"," + pd_weight);
						});
			});
</script>
<style>
 tr:nth-child(even) {
   background-color: #f2f2f2;
 } 

 #box{margin:0; padding:10px 30px 5px}
</style>
</head>
<body>
<div class="container-fluid">
<div class="row">
	<div style="width:20%">
		<%@ include file="/common/MenuCommon.jsp" %>
    </div>
  <div style="width:78%">
  <!-- ========================================생산품 상세조회 영역================================= -->
  <div class="w3-container w3-light-gray" style=" margin-top: 25px; height: 60px;">
  <div class="box-container">
  <div id="box">
  <table id="productDetail">
  	<thead>
  		<th>
  			<td>
  				<select class="form-control" id="ship_code" name="ship_code" align="center" space="&nbsp;" style="background-color:#343A40; width:160px;color: white;">
					  <option value="boat1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생산품명</option>
					  <option value="boat2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명</option>
				 </select>
  			</td>
  			<td>
  				<input class="form-control" width="200px;" height="35px;" data-options="prompt:'생산품명을 선택하세요.'">
  			</td>
  		</th>
  		<th>
  			<td><button type="button" class="btn btn-dark">입고일자</button></td>
  			<td>
  				<input type="date" class="form-control">
  			</td>
  			<td><i class='fas fa-minus-square' style='font-size:36px'></i></td>
  			<td>
  				<input type="date" class="form-control">
  			</td>
  			<td><button onclick="location.href='javascript:boardList()'" class="btn btn-dark" style="float: right;">조회</button></td>
  		</th>
  	</thead>
  </div>
  </div>
  </table>
  <hr>
  </div>
  <!-- =======================================생산품 상세조회 영역 끝================================= -->
  <!-- =======================================생산품 목록 영역 ================================= -->
  <div class="row">
  	<div class="col-sm-6" style="margin-top: 35px;">
  		<!-- 429*328 -->
  		<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#proListDel" style="margin-left: 10px;margin-top: inherit;">삭제</button>

	      <div class="modal fade" id="proListDel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">정말로 삭제하시겠습니까?</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" id="checkid" style="height:500px;">
		       
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-dark" data-dismiss="modal" style="width:60px;">Ok</button>
		          <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		
		<table id="proList" style="margin: 11px;width: 700px; text-align:center;">	
			<thead>
			<tr style="background-color: black;color: aliceblue; text-align:center; width:300px; height:48px;">
				<td>No.</td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkall" type="checkbox" check>
				</div>
				</td>
				<td>생산품 등록일자</td>
				<td>어종명</td>
				<td>생산품 출고일자</td>
				<td>생산량</td>
				<td style="display:none;">어선코드</td>
			</tr>
			</thead>
			<tbody>
<%
   if(size==0){
%>    
       <tr>
          <td colspan="6">조회결과가 없습니다.</td>
       </tr>
<%
   }
   else if(size>0){
	   for(int i=0;i<size;i++){
		   if(size == i) break;
		   Map<String,Object> rMap = rList.get(i);
%>
		<tr style="text-align:center; width:300px; height:48px;">
			<td><%=rMap.get("PD_NO") %></td>
			<td>
			<div class="checkbox checkbox-primary">
				<input id="checkbox" name="checkbox" type="checkbox">
			</div>
			</td>
			<td style="display:none;"><%=rMap.get("PD_REGDATE") %></td>
			<td style="display:none;"><%=rMap.get("SHIP_CODE") %></td>
			<td><%=rMap.get("PD_INDATE") %></td>
			<td><%=rMap.get("FISH_NAME") %></td>
			<td><%=rMap.get("PD_OUTDATE") %></td>
			<td><%=rMap.get("PD_WEIGHT") %></td>
		</tr>
<% 
	   }
   }
%> 
	   
			</tbody>
		</table>
  	</div>
  <!-- =======================================생산품 목록 영역 끝================================= -->
  <!-- =======================================생산품 상세보기 영역================================= -->
  	<div class="col-sm-6" style="margin-top: 35px;">
  		<form id="productAdd" action="/erp/productInsert" method="get">
  		<input type="hidden" name="gap" value="0"><!-- spring일 때는 없어도 됨. pojo에서:get방식인지 post방식인지 구분하기 위해서 -->
  		<table class="table" style="width:700px;height:180px;margin-top: 81.5px;" data-options="multiSelect:'true',toolbar:'#productDetail,#add'">
			  <tr>
				<h2><th colspan="2" style="background-color: black;color: aliceblue; text-align:center;">생산품 등록</th></h2>  	
			  </tr>
			  <tr>
			    <td style="width:30%;"><button class="btn btn-dark" style="width:100%; height: 35px;">어선선택</button></td>
			    <td style="width:70%;">
				  <select class="form-control" id="ship_code" name="ship_code" align="center" space="&nbsp;" style="background-color:#FFFFFF;width:160px;color: black;">
					  <option value="boat1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명1</option>
					  <option value="s001">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참수리</option>
					  <option value="boat3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명3</option>
					  <option value="boat4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명4</option>
				 </select>
			    </td>
			  </tr>
			  <tr>
			    <td style="width:20%;"><button class="btn btn-dark" style="width:100%; height: 35px;">어종선택</button></td>
			    <td style="width:80%;">
				   <select class="form-control" id=fish_name name="fish_name" align="center" space="" style="background-color:#FFFFFF;width:160px;color: black;">
					  <option value=" ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어종선택</option>
					  <option value="1234">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;광어</option>
					  <option value="1235">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참다랑어</option>
					  <option value="1236">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;돔</option>
					  <option value="1237">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참치</option>
					  <option value="1238">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오징어</option>
					  <option value="1239">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기타</option>
					</select>
			    </td>
			  </tr>
			  <tr>
			    <td style="width:30%;"><button class="btn btn-dark" style="width:100%; height:35px;">무게선택</button></td>
			    <td style="width:70%;">
				<input class="form-control" id="pd_weight" name="pd_weight" type="text" style="width:170px;float:left;">
			    <select class="form-control"  id="pd_weight" name="pd_weight" align="center" space="&nbsp;" style="background-color:#FFFFFF;width:70px;color: black;float:right;margin-right: 225px;">
					  <option value="choose1">&nbsp;kg</option>
					  <option value="choose2">&nbsp;&nbsp;t</option>
				</select>
			    </td>
			  </tr>
			  <tr>
			    <td style="width:30%;"><button class="btn btn-dark" style="width:100%; height:35px;">생산일자</button></td>
			    <td style="width:70%;">						  
	              <!--  <input type="date" id="enrollment" name="enrollment" style="width:150px; height: 35px;"> -->
	               <input class="form-control" id="pd_regdate" name="pd_regdate" placeholder="YYYY/MM/DD" type="date" style="width:170px; display:inline-block;"/>
	               <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
			    </td>
			  </tr>
			  <tr>
			    <td style="width:30%;"><button class="btn btn-dark" style="width:100%; text-align:center;">생산품 입고일</button></td>
			    <td style="width:70%;">
			       <input class="form-control" id="pd_indate" name="pd_indate" placeholder="YYYY/MM/DD" type="date" style="width:170px; display:inline-block;"/>
	               <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
			   	</td>
			  </tr>				
			  <tr>
			    <td style="width:30%;"><button class="btn btn-dark" style="width:100%; text-align:center;">생산품 출고일</button></td>
			    <td style="width:70%;">
			       <input class="form-control" id="pd_outdate" name="pd_outdate" placeholder="YYYY/MM/DD" type="date" style="width:170px; display:inline-block;"/>
	               <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
			   	</td>
			  </tr>		
			</table>
			   <hr>
			    <button onclick="location.href='javascript:productInsert()'" class="btn btn-dark" id="add" style="float: right;">등록</button>
		</form>
  	</div>
  <!-- =======================================생산품 상세보기/등록 영역 끝================================= -->
   </div>
   </div>
</div>
</div>
</div>
</div>
</body>
</html>