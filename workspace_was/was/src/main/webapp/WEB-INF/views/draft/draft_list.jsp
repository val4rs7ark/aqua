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
	var popupX = (window.screen.width/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function popup(){
	window.open('./draft_basic.jsp','팝업창2','width=880px,height=880px,left='+popupX+',top='+ popupY);
	chrome.windows.create ({url : './draft_basic.jsp', type : 'popup'})
	}
</script>
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
			out.print("s_emp_name:"+s_emp_name);    
			%>
		</div>
<!--
==================================================================================
									<메인 우측 80% -시작
==================================================================================									
 -->	
		<div id="main" style="width:80%" >
		<div class="container" style="margin-left: 0px;">
		<div class="base_table_div" style="height: 865px;width:1350px">
<!--=====================================상단바 시작=================================-->
			<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
				<div class="card-body" style="font-size:20px;display:table">
					<div style="display:table-cell;valign:middle;">문서 보관함</div>
				</div>
			</div>
<!--=====================================상단바 끝==================================-->

			<div style="height:20px"></div>
<!--=====================================메인 테이블 시작==================================-->
			<div class="col-sm-12" style="padding-left:0px;padding-right:0px;text-align:center">
			  <table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width:12%;">NO</th>
                    <th style="width:12%;">문서번호</th>
                    <th style="width:12%;">기안일자</th>
                    <th style="width:12%;">문서종류</th>
                    <th style="width:37%;">제목</th>
                    <th style="width:15%;">상태</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">	
                 <tr style="width:10%">
                    <td>5</th>
                    <td>1521-0001</th>
                    <td>2019-10-17</th>
                    <td>휴가신청서</th>
                    <td>김연습사원 휴가신청건</th>
                    <td>진행중</th>
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