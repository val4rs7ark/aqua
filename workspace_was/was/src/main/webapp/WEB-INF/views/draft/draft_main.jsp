<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>기안서 작성</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	var popupX = ((window.screen.width)/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function pop_basic(){
	window.open('draft_basic','팝업창2','width=948px,height=880px,left='+popupX+',top='+ popupY);
	}
</script>
<style type="text/css">
	.draft_table tr td{
		border: 1px solid #dee2e6;
		height: 65px;
	}
	.draft_table tr th{
		border: 1px solid #dee2e6;
		background-color: #f2f5f787;
		height: 31px;
		font-size: 15px;
	}
</style>
</head>
<body>
<div class="container-fluid">
	<div class="row" >
		<div style="width:20%">
			<%@ include file="/common/MenuCommon.jsp" %>
			<!-- 삭제 시 작성자만 삭제 할수 있도록 현재 로그인한 세션에 담긴 작성자 이름을 input태그에 저장.  -->  
			<input id="s_emp_name" type="hidden" value=<%=s_emp_name%>>
			      
			<%
			//////////////////세션에 담긴 아이디 담기.//////////// 
			%>
		</div>
<!--
==================================================================================
									<메인 우측 80% -시작
==================================================================================									
 -->	
		<div id="main" style="width:80%" >
		<div class="container" style="margin-left: 0px;">
		<div class="base_table_div" style="height: 969px;width:1350px">
<!--=====================================상단바 시작=================================-->
			<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
				<div class="card-body" style="font-size:20px;display:table">
					<div style="display:table-cell;valign:middle;">기안서 작성</div>
				</div>
			</div>
<!--=====================================상단바 끝==================================-->
			<div style="height:20px"></div>
<!--=====================================메인 테이블 시작==================================-->
			<div  style="padding-left:0px;padding-right:0px;text-align:center">
				<table class="draft_table" style="width:100%;margin-right:4%; border: 1px solid #dee2e6;" > 
					<thead style="text-align:center;background:#dee2e6">
						<tr>
							<th style="width:15%;">문서번호</th>
							<th style="width:40%;">양식명</th>
							<th style="width:20%;">구분</th>
							<th style="width:25%;">비고</th>
						</tr>
					</thead>
					<tbody style="text-align:center;font-size:15px;">     
						<tr>
							<td >01</td>
							<td><a href="javascript:pop_basic()"  ">기본서식</a></td>
							<td>공통</td>
							<td>기본서식</td>
						</tr>   	 
						<tr>
							<td >02</td>
							<td><a href="#"  ">휴가신청서</a></td>
							<td>공통</td>
							<td>연차,휴가 신청</td>
						</tr>   	 	 
						<tr>
							<td >03</td>
							<td><a href="#"  ">지출결의서</a></td>
							<td>공통</td>
							<td>자산구매 신청은 작성제외</td>
						</tr>   	 	 
						<tr>
							<td >04</td>
							<td><a href="#"  ">주간보고</a></td>
							<td>공통</td>
							<td></td>
						</tr>   	 	 
						<tr>
							<td >05</td>
							<td><a href="#"  ">차량운행일지</a></td>
							<td>공통</td>
							<td>배송부 차량외 모든 차량 작성</td>
						</tr>   	 	 
						<tr>
							<td >06</td>
							<td><a href="#"  ">출장계획서</a></td>
							<td>영업부</td>
							<td>출발 D-1까지 작성</td>
						</tr>   	 	 
						<tr>
							<td >07</td>
							<td><a href="#"  ">출장완료보고서</a></td>
							<td>영업부</td>
							<td>D+7일 내 작성</td>
						</tr>   	 	 
						<tr>
							<td >08</td>
							<td><a href="#"  ">경조금 지급 신청서</a></td>
							<td>공통</td>
							<td>D+60일 내 작성</td>
						</tr>   	 	 
						<tr>
							<td >09</td>
							<td><a href="#"  ">개인 경비 지출 내역서</a></td>
							<td>공통</td>
							<td>D+30일 내 작성</td>
						</tr>   	 	 
						<tr>
							<td >10</td>
							<td><a href="#"  ">시말서</a></td>
							<td>공통</td>
							<td></td>
						</tr>   	 	 
						<tr>
							<td >11</td>
							<td><a href="#"  ">사직서</a></td>
							<td>공통</td>
							<td>서면 제출</td>
						</tr>   	 	 
					</tbody>
				</table>                 
			</div>
<!--=====================================메인 테이블 끝==================================-->

		</div>
		</div>
		</div>
<!--
==================================================================================
									메인 우측 80% -끝>
==================================================================================									
 -->		
	</div>
</div>
  
     
</body>
</html>