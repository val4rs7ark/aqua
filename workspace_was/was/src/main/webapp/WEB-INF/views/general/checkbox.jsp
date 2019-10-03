<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>자산 구매 신청/사용 내역</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	//상단 선택버튼 클릭시 체크된 Row의 값을 가져온다.
	    function selectBtn(){ 
		alert("호출");
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $("input[name=user_CheckBox]:checked");
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var no = td.eq(1).text()+", "
			var userid = td.eq(2).text()+", ";
			var name = td.eq(3).text()+", ";
			var email = td.eq(4).text()+", ";
			// 가져온 값을 배열에 담는다.
			tdArr.push(no);
			tdArr.push(userid);
			tdArr.push(name);
			tdArr.push(email);
			//console.log("no : " + no);
			//console.log("userid : " + userid);
			//console.log("name : " + name);
			//console.log("email : " + email);
		});
		$("#ex3_Result1").html(" * 체크된 Row의 모든 데이터 = "+rowData);	
		$("#ex3_Result2").html(tdArr);	
	};
</script>
</head>
<body>
<br><br>
	<div class="row">
	
		<button type="button" class="btn btn-outline btn-primary pull-right" onClick="selectBtn()">선택</button>
		<table id="example-table-3" class="table table-bordered table-hover text-center">
			<thead>
				<tr>
					<th>선택</th>
					<th>No. </th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>				
				<tr>
					<td><input type="checkbox" name="user_CheckBox" ></td>
					<td>1</td>
					<td>user07</td>
					<td>NC소프트</td>
					<td>nc@gmail.com</td>
				
				</tr>
				<tr>
					<td><input type="checkbox" name="user_CheckBox" ></td>
					<td>2</td>
					<td>user08</td>
					<td>넥슨</td>
					<td>donson@naver.com</td>
					
				</tr>
				<tr>
					<td><input type="checkbox" name="user_CheckBox" ></td>
					<td>3</td>
					<td>user09</td>
					<td>넷마블</td>
					<td>net@gmail.com</td>
				</tr>
			</tbody>
		</table>
		<div class="col-lg-12" id="ex3_Result1"></div> 
		<div class="col-lg-12" id="ex3_Result2"></div> 
	</div>
	
	<br><br>
</body>
</html>