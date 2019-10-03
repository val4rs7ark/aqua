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
	<div class="col-sm-3">
		<%@ include file="/common/MenuCommon.jsp" %>
    </div>
  <div class="col-sm-9">
  <!-- ========================================생산품 상세조회 영역================================= -->
  <div class="w3-container w3-light-gray" style=" margin-top: 25px; height: 60px;">
  <div class="box-container">
  <div id="box">
  <table>
  	<thead>
  		<th>
  			<td>
  				<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">생산품명</button>
						    <div class="dropdown-menu">
						      <a class="dropdown-item" href="#">어선명</a>
						    </div>
  			</td>
  			<td>
  				<input type="text" width="200px;" height="35px;" data-options="prompt:'생산품명을 선택하세요.'">
  			</td>
  		</th>
  		<th>
  			<td><button type="button" class="btn btn-dark">입고등록일</button></td>
  			<td>
  				<input type="date" class="form-control">
  			</td>
  			<td><i class='fas fa-minus-square' style='font-size:36px'></i></td>
  			<td>
  				<input type="date" class="form-control">
  			</td>
  			<td><button onclick="location.href='#'" class="btn btn-dark" style="float: right;">조회</button></td>
  		</th>
  	</thead>
  </div>
  </div>
  </table>
  </div>
  <!-- =======================================생산품 상세조회 영역 끝================================= -->
  <!-- =======================================생산품 목록 영역 ================================= -->
  <div class="row">
  	<div class="col-sm-6" style="margin-top: 35px;">
  		<!-- 429*328 -->
  		<button type="button" class="btn btn-dark" style="margin-left: 10px;margin-top: inherit;">선택</button>
		<table style="margin: 11px;width: 650px;">	
			<thead>
			<tr style="background-color: black;color: aliceblue; text-align:center; width:300px; height:45px;">
				<td></td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>입고등록일</td>
				<td>입고수량</td>
				<td>품목명</td>
			</tr>
			</thead>
			<tbody>
			<tr style="text-align:center; width:100px; height:58px;">
				<td>1</td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-04</td>
				<td>QRS20190904</td>
				<td>1002</td>
				
			</tr>
			<tr style="text-align:center; width:100px; height:58px;">
				<td>2</td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-05</td>
				<td>QRS20190905</td>
				<td>1003</td>
				
			</tr>
			<tr style="text-align:center; width:100px; height:58px;">
				<td>3</td>
				<td>
				<div class="checkbox checkbox-primary">
				<input id="checkbox" type="checkbox" check>
				</div>
				</td>
				<td>2019-09-06</td>
				<td>QRS20190906</td>
				<td>1004</td>
			</tr>
			</tbody>
		</table>
  	</div>
  <!-- =======================================생산품 목록 영역 끝================================= -->
  <!-- =======================================생산품 상세보기 영역================================= -->
  	<div class="col-sm-6" style="margin-top: 35px;">
  		<table class="table" style="width:100%;height:180px;margin-top: 80px;">
			  <tr>
				<h2><th colspan="2" style="background-color: black;color: aliceblue; text-align:center;">생산품 등록</th></h2>  	
			  </tr>
			  <tr>
			    <td>
				  <select id="fish_boat" class="form-control" align="center" space="&nbsp;" style="background-color:#343A40;width:150px;color: white;">
					  <option value="x">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선선택</option>
					  <option value="boat1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명1</option>
					  <option value="boat2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명2</option>
					  <option value="boat3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명3</option>
					  <option value="boat4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선명4</option>
				 </select>
			    </td>
			    <td><input type="text" id="boat" name="boat" data-options="prompt:'선택한 어선종류 값'" style="height: 35px;"></td>
			  </tr>
			  <tr>
			    <td>
				   <select class="form-control" align="center" space="&nbsp;" style="background-color:#343A40;width:150px;color: white;">
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어종선택</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참치</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오징어</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;돔</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제주은갈치</option>
					</select>
			    </td>
			    <td><input type="text" id="fish" name="fish" data-options="prompt:'선택한 어종 값'" style="height: 35px;"></td>
			  </tr>
			  <tr>
			    <td>
			    <select class="form-control" align="center" space="&nbsp;" style="background-color:#343A40;width:150px;color: white;">
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무게선택</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kg</option>
					  <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t</option>
					</select>
			    </td>
			    <td><input type="text" id="choose" name="choose" style="width:120px; height:35px;"></td>
			  </tr>
			  <tr>
			    <td><button onclick="location.href='#'" class="btn btn-dark" style="width: 150px;">입고등록일</button></td>
			    <td>						  
	               <input type="date" id="enrollment" name="enrollment" style="height: 35px;">
	               <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
			    </td>
			  </tr>
			  <tr>
			    <td><button onclick="location.href='#'" class="btn btn-dark" style="width: 150px; text-align:center;">미정</button></td>
			    <td>
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
</div>
</body>
</html>