<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<title>거래처 등록/조회</title>
</head>
<body>
	<div class="row">
		<div class="col-sm-3">
			<div class="row">
				<div>
					<a href="index.jsp" width="300px"><img src="/erp/images/logo.png"
						style="width: 300px; max-width: 760px; vertical-align: middle"></a>
				</div>
			</div>
			<div class="row">
				<div
					style="background-color: #383E49; width: 300px; height: 90px; color: #FFFFFF; text-align: center;">
					<p>
						반갑습니다, 사원<strong> 박막례</strong>님
					</p>
					<h6>최근 접속 시간은...</h6>
				</div>
			</div>
			<div class="row">
				<div
					style="background-color: #383E49; width: 300px; height: 700px; color: #FFFFFF">
					<ul class="nav flex-column">
						<div class="list-group"
							style="width: 300px; background-color: #383E49">
							<button type="button" class="btn btn-dark" data-toggle="collapse"
								data-target="#major"
								style="width: 300px; text-align: center; font-size: x-large;">생산/품질관리</button>
							<div id="major" class="collapse">
								<a href="#" class="list-group-item list-group-item-action">품목조회</a>
								<a href="#" class="list-group-item list-group-item-action">재고등록</a>
								<a href="#" class="list-group-item list-group-item-action">재고조회</a>
								<a href="productsAdd.jsp"
									class="list-group-item list-group-item-action">생산품등록</a> <a
									href="registerCustomer.jsp"
									class="list-group-item list-group-item-action">거래처등록/조회</a> <a
									href="#" class="list-group-item list-group-item-action">배송처조회</a>
								<a href="#" class="list-group-item list-group-item-action">배송처등록</a>
								<a href="#" class="list-group-item list-group-item-action">근태조회</a>
							</div>
							<button type="button" class="btn btn-dark" data-toggle="collapse"
								data-target="#major2"
								style="width: 300px; text-align: center; font-size: x-large;">영업/매출관리</button>
							<div id="major2" class="collapse">
								<a href="#" class="list-group-item list-group-item-action">매출</a>
								<a href="#" class="list-group-item list-group-item-action">급여</a>
								<a href="#" class="list-group-item list-group-item-action">휴가</a>
							</div>
							<button type="button" class="btn btn-dark" data-toggle="collapse"
								data-target="#major3"
								style="width: 300px; text-align: center; font-size: x-large;">0000관리</button>
							<div id="major3" class="collapse">
								<a href="#" class="list-group-item list-group-item-action">ㅁㅁ</a>
								<a href="#" class="list-group-item list-group-item-action">ㅂㅂ</a>
								<a href="#" class="list-group-item list-group-item-action">ㄱㄱ</a>
							</div>
						</div>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-9">
			<div class="row">
				
			</div>
			<div class="row">
				<div class="col-sm-6">
					  <table class="table" style="width:100%; height:200px;">
			    <thead>
			     <tr style="background-color: black;color: aliceblue;">
			        <th></th>
			        <th>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
					</th>
			        <th>코드번호</th>
			        <th>거래처명</th>
			        <th>사업자등록번호</th>
			        <th>대표자명</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>1</td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td>00101</td>
			        <td>xx물산</td>
			        <td>102-36-10349</td>
			        <td>김기태</td>
			      </tr>
			      <tr>
			       <td>2</td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td>00102</td>
			        <td>xxx생산</td>
			        <td>321-12-11285</td>
			        <td>강하늘</td>
			      </tr>
			      <tr>
			       <td>3</td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td>00103</td>
			        <td>xxx유통</td>
			        <td>201-13-14525</td>
			        <td>오지석</td>
			      </tr>
			      <tr>
			       <td>4</td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td>00103</td>
			        <td>xxx유통</td>
			        <td>201-13-14525</td>
			        <td>오지석</td>
			      </tr>
			      <tr>
			       <td>5</td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td>00103</td>
			        <td>xxx유통</td>
			        <td>201-13-14525</td>
			        <td>오지석</td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			      <tr>
			       <td></td>
			        <td>
			        	<div class="checkbox checkbox-primary">
						<input id="checkbox" type="checkbox" check>
						</div>
			        </td>
			        <td></td>
			        <td></td>
			        <td></td>
			        <td></td>
			      </tr>
			    </tbody>
			  </table>
				</div>
				<div class="col-sm-6">
					<table class="table" style="width:100%; height:180px;">
					  <tr>
						<th colspan="2" style="background-color: black;color: aliceblue; text-align:center;">거래처 등록</th>  	
					  </tr>
					  <tr>
					    <td style="width:200px;">거래처명</td>
					    <td><input type="client" class="form-control" id="client" name="client" style="width:250px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">사업자 등록 번호</td>
					    <td> <input class="form-control" id="com_num" name="com_num" style="width:120px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">대표자 성명</td>
					    <td><input type="ceo_name" class="form-control" id="ceo_name" name="ceo_name" style="width:120px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">업태</td>
					    <td><input type="uptae" class="form-control" id="uptae" name="uptae" style="width:100px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">우편번호</td>
					    <td>
					    <input type="zipcode" class="form-control" id="zipcode" name="zipcode" style="width:100px; height:35px;">
					   	<td><button type="button" id="search"/></td>
					    </td>
					  </tr>
					  <tr>
					    <td style="width:200px;">사업장 주소</td>
					    <td>
					    <input type="com_address" class="form-control" id="com_address" name="com_address" style="width:300px; height:35px;">
					    <input type="com_address2" class="form-control" id="com_address2" name="com_address2" style="width:300px; height:35px;">
					    </td>
					    <td></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">전화번호</td>
					    <td><input type="call" class="form-control" id="call" name="call" style="width:200px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">담당자</td>
					    <td><input type="charge" class="form-control" id="charge" name="charge" style="width:120px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">담당자 메일주소</td>
					    <td><input type="charge_email" class="form-control" id="charge_email" name="charge_email" style="width:350px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">은행코드</td>
					    <td><input type="bank_code" class="form-control" id="bank_code" name="bank_code" style="width:100px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td style="width:200px;">입금계좌번호</td>
					    <td><input type="acc_num" class="form-control" id="acc_num" name="acc_num" style="width:200px; height:35px;"></td>
					  </tr>
					  <tr>
					    <td></td>
					    <td><button onclick="location.href='#'" class="btn btn-dark" style="float: right;">등록</button></td>
					  </tr>	  
					</table>
				</div>
			</div>
		</div>
</body>
</html>