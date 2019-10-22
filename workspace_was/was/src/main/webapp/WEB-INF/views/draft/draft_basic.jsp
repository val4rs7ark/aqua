<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>기안서(기본)</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
   
<title>Insert title here</title>
<script type="text/javascript" src="/erp/se2/js/service/HuskyEZCreator.js" charset="utf-8">
</script>
<script type="text/javascript">
/* 	function save(){
		alert("save호출");
		var title = $("#db_title").val();
		alert(title);
		var sb = "<td><input name='db_title' style='width:90%' type='text'>";
		sb += title;
		sb += "</td>";
		alert(sb);
		$("#hd_title").val(sb);
 		$("#f_draft_basic").attr("method","post");
		$("#f_draft_basic").attr("action","/erp/general_draftAdd");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
		$("#f_draft_basic").submit();
	} */
	function save(){
		alert("save호출");
 		$("#f_draft_basic").attr("method","post");
		$("#f_draft_basic").attr("action","/erp/draftAdd");
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
		$("#f_draft_basic").submit();
		window.close();
	}
	var popupX = (window.screen.width/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	function manSelect(){
		alert("결재자 선택");
		window.open('./text.jsp','팝업창1','width=880px,height=880px,left='+popupX+',top='+ popupY);	
	}
	var d = new Date();
	var today = d.getFullYear()+'년'+(d.getMonth()+1)+'월'+d.getDate()+'일';
	var month = d.getMonth()+1;
	var date = d.getDate();
	if(d.getMonth()+1<10){month ='0'+(d.getMonth()+1)}
	if(d.getDate()<10){date ='0'+d.getDate()}
	today = d.getFullYear() + '년 '+month+'월 '+date+'일 ';
	//$("#save").click(function(){ oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); $("#frm").submit(); })
	function choice(){
		alert("선택");
		$.ajax({
			url:"/erp/general_dBChoice"
			,method:"post"
			,success:function(data){
				$("#choice").html(data);
			}
			,error:function(e){
				alert(e.responseText);
			}
		});	
	}
</script>
</head>
<body>
<%
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
	String s_emp_no = null;
	String s_emp_pw = null;
	String s_emp_name = null;
	String s_outtime = null;//아직 프로시저 수정 중
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
	if(session.getAttribute("s_emp_no")!=null && session.getAttribute("s_emp_pw")!=null
		&& session.getAttribute("s_emp_name")!=null && session.getAttribute("s_outtime")!=null){
		s_emp_no = session.getAttribute("s_emp_no").toString();
		s_emp_pw = session.getAttribute("s_emp_pw").toString();
		s_emp_name = session.getAttribute("s_emp_name").toString();
		s_outtime = session.getAttribute("s_outtime").toString();
	}
%>                            
<!--=====================================메인 테이블 시작==================================-->
			<form id="f_draft_basic">
<!-- 			<input type="hidden" id="hd_title" name="hd_title"> -->
			<input type="hidden" id="s_emp_no" name="s_emp_no" value="<%=s_emp_no%>">
			<div style="width:850px;height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
				<h1>기 안 서<span style="font-size:30px">(기본)</span></h1>
			<table style="width:850px;height:780px;" border="1px solid" > 
					<tbody style="text-align:center;font-size:15px;">        	 
						<tr>
							<td style="width:15%;height:40px;background:#dee2e6">문서종류</td>
							<td style="width:30%;"><input name="draft_kind" type="text" value="공통-기안서(기본)" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
							<td style="width:55%;" rowspan="4">
								<table style="width:100%;height:100%;" frame="void" border="1px solid red">
									<tr style="height:25%">
										<td rowspan="3" style="width:10%;background:#dee2e6">결<br><br>재</td>
										<td style="width:18%" name="">생산1팀</td>
										<td style="width:18%">생산1팀</td>
										<td style="width:18%">생산부</td>
										<td style="width:18%"></td>
										<td style="width:18%"></td>
									</tr>
									<tr style="height:50%">
										<td>배성우</td>
										<td>김연습</td>
										<td>김부장</td>
										<!-- 결재자 선택 -->
										<td id="choice"><input type="button" value="선택" onclick="javascript:choice()">
										</td>
								
										<td><input type="button" value="선택"></td>
									</tr>
									<tr style="height:25%">
										<td><img style="width:80% "alt="결재" src="/erp/images/confirm.png"></td>
										<td><img style="width:80% "alt="결재" src="/erp/images/confirm.png"></td>
										<td>대기중</td>
										<td></td>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">기안일</td>
							<td><script>document.write(today)</script></td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">작성자</td>
							<td style="text-align:center"><input type="text" value="<%=s_emp_name%>" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">공개여부</td>
							<td style="">
								<table style="width:100%;height:100%" frame="void" border="1px solid red">
									<tr>
										<td style="width:33%">공개
										</td>
										<td style="width:33%;">보존기간</td>
										<td style="width:33%;">5년</td>
									</tr>
								</table>
							</td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">제목</td>
							<td style="" colspan="2"><input name="db_title" id="db_title" style="width:98%" type="text"></td>
						</tr>   	 	    	 	  	 	  	 	  	 	    	 	  	 	  	 	   	 	   	 	 
						<tr>
							<td colspan="3">		
							<div>
								<textarea name="ir1" id="ir1" rows="24" cols="116">
								</textarea>	
							</div>					 	
							</td>
						</tr>   	 	 
					</tbody>
				</table>
				<div style="margin-top:4px;margin-right:4px;text-align:right">
					<input type="button" onclick="save()" value="저장">                 
					<button>닫기</button>                 
				</div>
			</div>
			
			</form>
			
<!--=====================================메인 테이블 끝==================================-->

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "/erp/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>	
</body>
</html>