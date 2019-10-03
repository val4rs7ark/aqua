<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<title>생산품 등록/조회</title>
<script type="text/javascript">
function change() {
	var frm = document.frm;	
	var combo = frm.combo;
	var txt = frm.combo_nm;	
	var comboVal = combo.value;	
	for(var i=0; i<combo.options.length; i++ ) {
		if(combo.options[i].value == comboVal ) {
			combo.options[i].checked = true;
			txt.value= combo.options[i].name;
		}
	}

}
</script>
<style>
 td {
	padding: 8px;
	width: 310px;
	height: 35px
}  

 tr:nth-child(even) {
	background-color: #f2f2f2;
} 

 th {
	background-color: #343a40;
	color: white;
} 
 body {
  font-family: Arial;
} 

* {
  box-sizing: border-box;
} 
 input[type="submit"]{
	font-family: FontAwesome;
	
} 

 form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 20%;
  background: #f1f1f1;
  
} 

 form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #383E49;
  color: white;
  font-size: 17px;
  border: solid;
  border: 1px solid grey; 
  border-left: none;
  cursor: pointer;
}

 form.example button:hover {
  background: #0b7dda;
} 

 form.example::after {
  content: "";
  clear: both;
  display: table;
} 

</style>
</head>
<body>
<div class="row">
	<div class="col-sm-3">
		<div class="row">
			 <div>
       		 <a href="index.jsp" width="300px"><img src="/erp/images/logo.png" style="width: 300px; max-width: 760px; vertical-align: middle"></a>   
    		 </div>
		</div>
		 <div class="row">
    		<div style="background-color:#383E49; width:300px; height:90px; color:#FFFFFF; text-align: center;">
      	    <p>반갑습니다, 사원<strong> 박막례</strong>님</p>
            <h6>최근 접속 시간은...</h6>
         </div>
	</div>
	<div class="row">
    <div style="background-color:#383E49; width:300px; height:700px; color:#FFFFFF">
       <ul class="nav flex-column">
            <div class="list-group" style="width:300px; background-color: #383E49">
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major" style="width:300px;text-align: center;font-size: x-large;">생산/품질관리</button>
               <div id="major" class="collapse">         
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">품목조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">재고등록</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">재고조회</a>
                  <a href="productsAdd.jsp" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">생산품등록/조회</a>
                  <a href="registerCustomer.jsp" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">거래처등록/조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">배송처조회</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">배송처등록</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">근태조회</a>
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major2" style="width:300px;text-align: center;font-size: x-large;">영업/매출관리</button>
               <div id="major2" class="collapse">
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">매출</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">급여</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">휴가</a>
               </div>
            <button type="button" class="btn btn-dark" data-toggle="collapse" data-target="#major3" style="width:300px;text-align: center;font-size: x-large;">0000관리</button>
               <div id="major3" class="collapse">
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">ㅁㅁ</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">ㅂㅂ</a>
                  <a href="#" class="list-group-item list-group-item-action" style="background-color:#434a57; color:#FFFFFF">ㄱㄱ</a>
               </div>
            </div>
         </ul> 
    </div>
  	</div>
  </div>
  <div class="col-sm-9">
  <!-- ========================================생산품 상세조회 영역================================= -->
  <div class="row">
  	<h2>생산품 검색</h2>
		<select>
		  <option value="receipt">입고일자</option>
		  <option value="product">생산품명</option>
		  <option value="fishboat">어선명</option>
		</select>  	
  </div>
  <!-- =======================================생산품 상세조회 영역 끝================================= -->
  <!-- =======================================생산품 조회 영역 ================================= -->
  <div class="row">
  	<div class="col-sm-6">
  		<!-- 429*328 -->
		<table style="width:100%; height:180px;">
			<tr>
				<th></th>
				<th>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</th>
				<th>지시일자</th>
				<th>지시번호</th>
				<th>품목코드</th>
				<th>품명</th>
			</tr>
			<tr>
				<td></td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-03</td>
				<td>QRS20190903</td>
				<td>1001</td>
				<td>품명은 뭘로?</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-04</td>
				<td>QRS20190904</td>
				<td>1002</td>
				<td>품명은 뭘로?</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-05</td>
				<td>QRS20190905</td>
				<td>1003</td>
				<td>품명은 뭘로?</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-06</td>
				<td>QRS20190906</td>
				<td>1004</td>
				<td>품명은 뭘로?</td>
			</tr>
		</table>
  	</div>
  <!-- =======================================생산품 조회 영역 끝================================= -->
  <!-- =======================================생산품 상세보기 영역================================= -->
  	<div class="col-sm-6">
  		<table class="table" style="width:100%; height:180px;">
					  <tr>
						<h2><th colspan="2" style="background-color: black;color: aliceblue; text-align:center;">생산품 등록</th></h2>  	
					  </tr>
					  <tr>
					    <td>
					    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">어선코드</button>
						    <div class="dropdown-menu">
						      <a class="dropdown-item" href="#">어선1</a>
						      <a class="dropdown-item" href="#">어선2</a>
						      <a class="dropdown-item" href="#">어선3</a>
						    </div>
					    </td>
					    <td><input type="text" width="200px;" height="35px;" prompt="'콤보박스에서 선택한 값'"></td>
					  </tr>
					  <tr>
					    <td>
					    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">어종코드</button>
						    <div class="dropdown-menu">
						      <a class="dropdown-item" href="#">참치</a>
						      <a class="dropdown-item" href="#">명태</a>
						      <a class="dropdown-item" href="#">오징어</a>
						    </div>
					    </td>
					    <td><input type="text" width="200px;" height="35px;" prompt='드랍다운에서 선택한 값'></td>
					  </tr>
					  <tr>
					    <td>
					    <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">선택</button>
						    <div class="dropdown-menu">
						      <a class="dropdown-item" href="#">kg</a>
						      <a class="dropdown-item" href="#">t</a>
						      <a class="dropdown-item" href="#">오징어</a>
						    </div>
					    </td>
					    <td><input type="ceo_name" class="form-control" id="ceo_name" name="ceo_name" style="width:120px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">입고등록일</td>
					    <td><input type="uptae" class="form-control" id="uptae" name="uptae" style="width:100px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">어선코드</td>
					    <td>
					    <input type="zipcode" class="form-control" id="zipcode" name="zipcode" style="width:100px; height:35px;">
					   	<td><button type="button" id="search"/></td>
					    </td>
					  </tr>				
					  <tr>
					    <td></td>
					    <td><button onclick="location.href='#'" class="btn btn-dark" style="float: right;">등록</button></td>
					  </tr>	  
					</table>
  	</div>
  <!-- =======================================생산품 상세보기/등록 영역 끝================================= -->
   </div>
   </div>
</body>
</html>