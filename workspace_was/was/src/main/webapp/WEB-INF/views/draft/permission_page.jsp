<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%	
	//기안서에 대한 정보가 들어있음
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
	Map<String,Object> rMap = r_list.get(0);
	//기안서 내에 결재자에 대한 정보가 들어있음.
	List<Map<String,Object>> list_Map = (List<Map<String,Object>>)r_list.get(1).get("list_Map");
	//내가 작성한건지, 아니면 내가 결재자인지 구별하는 변수
	String gubun = (String)request.getAttribute("gubun");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>기안서(기본)</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <%@ include file="/common/bs_css.jsp" %>
   
<title>Insert title here</title>
<script type="text/javascript" src="/erp/se2/js/service/HuskyEZCreator.js" charset="utf-8">
</script>
<script type="text/javascript">
	var popupX = (window.screen.width/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function dismiss(draft_no,empno){//반려버튼
		window.open("/erp/draft_catchpw?draft_no="+draft_no+"&empno="+empno+"&gubun=dismiss" ,"open the window","toolbar=no, width=210, height=150, top=70, left=730");
	}
	function permission(draft_no,empno){//결재버튼
		window.open("/erp/draft_catchpw?draft_no="+draft_no+"&empno="+empno+"&gubun=permission" ,"open the window","toolbar=no, width=210, height=150, top=70, left=730");
	}
	//닫기 버튼 클릭햇을때
	function close_mypage(){
		opener.parent.location.reload();
		window.close()
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
<%
	if("my_writer".equals(gubun)){//내가 작성한 문서로 들어올 경우
%>
<!-- 			<input type="hidden" id="hd_title" name="hd_title"> -->
			<input type="hidden" id="s_emp_no" name="s_emp_no" value="<%=s_emp_no%>">
			<div style="width:850px;height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
				<h1 style="width: 948px;">기 안 서<span style="font-size:30px">(기본)</span></h1>
			<table style="table-layout:fixed;width:850px;height:780px;" border="1px solid" > 
					<tbody style="text-align:center;font-size:15px;">        	 
						<tr>
							<td style="width:15%;height:40px;background:#dee2e6">문서종류</td>
							<td style="width:30%;"><input name="draft_kind" type="text" value="공통-기안서(기본)" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
							<td style="width:55%;" rowspan="3">
								<table style="table-layout:fixed;width:100%;height:100%;" frame="void" border="1px solid red">
									<tr style="height:25%">
										<td rowspan="3" style="background:#dee2e6">결<br><br>재</td>
										<td style="">
											<input type="text" id="team_name_1" name="team_name_1" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(0).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_2" name="team_name_2" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(1).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_3" name="team_name_3" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(2).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_4" name="team_name_4" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(3).get("TEAM_NAME").toString()%>">
										</td>
									</tr>
									<tr style="height:50%">
										<td id="choice_td">
											<input type="text" id="emp_name_1" name="emp_name_1" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(0).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(0).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_2" name="emp_name_2" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(1).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(1).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_3" name="emp_name_3" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(2).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(2).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_4" name="emp_name_4" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(3).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(3).get("EMP_LEVEL").toString()%>">
										</td>
									</tr>
									<tr style="height:25%">
										<td>
										<!-- 결재자 정보를 꺼내서 내 세션 아이디랑 비교후 같으면 결재 화면을 보여주고 아니면 결재진행중인지, 결재 완료인지 화면 보여줄것. -->
										<!-- 내거가 아직 결재가 안됬으면 버튼 만들고 아작스 처리 -->
										<%
											if(s_emp_no.equals(list_Map.get(0).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("FIRST_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("FIRST_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%				
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(1).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("SECCOND_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("SECCOND_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(2).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("THIRD_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("THIRD_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(3).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("FORTH_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<div>미결재</div>
										<%			
												}else if("44".equals(rMap.get("FORTH_PERM_DATE").toString())){// 반려인거
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%			
												}else{// 결재했음
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
									</tr>
								</table>
							</td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">기안일</td>
							<td><%=rMap.get("DRAFT_INDATE").toString()%></td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">작성자</td>
							<td style="text-align:center">
								<input type="text" name="writer" value="<%=rMap.get("EMP_NAME")%>" style="border:none;outline:none;text-align:center" onfocus="this.blur()">
							</td>
						</tr>   	 	    	 	  	 	  	 	    	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">제목</td>
							<td colspan="2"><%=rMap.get("DRAFT_TITLE") %></td>
						</tr>   	 	    	 	  	 	  	 	  	 	    	 	  	 	  	 	   	 	   	 	 
						<tr>
							<td colspan="3">		
							<div style="text-align: -webkit-center;">
									<%=rMap.get("DRAFT_CONTENTS").toString()%>
							</div>					 	
							</td>
						</tr>   	 	 
					</tbody>
				</table>
				<div style="margin-top:4px;margin-right:4px;text-align:right;width: 917px;">
					<button onclick="javascript:close_mypage()">닫기</button>                 
				</div>
			</div>
			<input type="hidden" id="imsi_jsonData" value="">

<%		
	}else{//그 외에
%>
<!--=====================================메인 테이블 시작==================================-->
<!-- 			<input type="hidden" id="hd_title" name="hd_title"> -->
			<input type="hidden" id="s_emp_no" name="s_emp_no" value="<%=s_emp_no%>">
			<div style="width:850px;height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
				<h1 style="width: 948px;">기 안 서<span style="font-size:30px">(기본)</span></h1>
			<table style="table-layout:fixed;width:850px;height:780px;" border="1px solid" > 
					<tbody style="text-align:center;font-size:15px;">        	 
						<tr>
							<td style="width:15%;height:40px;background:#dee2e6">문서종류2</td>
							<td style="width:30%"><input name="draft_kind" type="text" value="공통-기안서(기본)" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
							<td style="width:55%" rowspan="3">
								<table style="table-layout:fixed;width:100%;height:100%;" frame="void" border="1px solid red">
									<tr style="height:25%">
										<td rowspan="3" style="background:#dee2e6">결<br><br>재</td>
										<td style="">
											<input type="text" id="team_name_1" name="team_name_1" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(0).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_2" name="team_name_2" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(1).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_3" name="team_name_3" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(2).get("TEAM_NAME").toString()%>">
										</td>
										<td style="">
											<input type="text" id="team_name_4" name="team_name_4" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(3).get("TEAM_NAME").toString()%>">
										</td>
									</tr>
									<tr style="height:50%">
										<td id="choice_td">
											<input type="text" id="emp_name_1" name="emp_name_1" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(0).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(0).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_2" name="emp_name_2" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(1).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(1).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_3" name="emp_name_3" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(2).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(2).get("EMP_LEVEL").toString()%>">
										</td>
										<td>
											<input type="text" id="emp_name_4" name="emp_name_4" style="width:100%;border: none;text-align: center;" value="<%=list_Map.get(3).get("EMP_NAME").toString()%>&nbsp;<%=list_Map.get(3).get("EMP_LEVEL").toString()%>">
										</td>
									</tr>
									<tr style="height:25%">
										<td>
										<!-- 결재자 정보를 꺼내서 내 세션 아이디랑 비교후 같으면 결재 화면을 보여주고 아니면 결재진행중인지, 결재 완료인지 화면 보여줄것. -->
										<!-- 내거가 아직 결재가 안됬으면 버튼 만들고 아작스 처리 -->
										<%
											if(s_emp_no.equals(list_Map.get(0).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<button onclick="javascript:permission('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >결재</button>
										<%			
												}else if("44".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												미결재
										<%			
												}else if("44".equals(rMap.get("FIRST_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%			
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(1).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<button onclick="javascript:dismiss('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >반려</button>
												<button onclick="javascript:permission('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >결재</button>
										<%			
												}else if("44".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												미결재
										<%			
												}else if("44".equals(rMap.get("SECCOND_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(2).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<button onclick="javascript:dismiss('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >반려</button>
												<button onclick="javascript:permission('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >결재</button>
										<%			
												}else if("44".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												미결재
										<%			
												}else if("44".equals(rMap.get("THIRD_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
										<td>
										<%
											if(s_emp_no.equals(list_Map.get(3).get("EMPNO").toString())){ // 내결재임
												if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												<button onclick="javascript:dismiss('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >반려</button>
												<button onclick="javascript:permission('<%=rMap.get("DRAFT_NO")%>','<%=s_emp_no%>')" >결재</button>
										<%			
												}else if("44".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}else{ // 내 결재아님
												if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 아직 결재하지 않음
										%>
												미결재
										<%			
												}else if("44".equals(rMap.get("FORTH_PERM_DATE").toString())){ // 결재했음
										%>
												<img alt="반려" src="/erp/images/reject.jpg" style="width: 70%;">
										<%		
												}else{
										%>
												<img alt="결재완료" src="/erp/images/confirm.jpg" style="width: 70%;">
										<%		
												}
											}
										%>
										</td>
									</tr>
								</table>
							</td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">기안일</td>
							<td><%=rMap.get("DRAFT_INDATE").toString()%></td>
						</tr>   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">작성자</td>
							<td style="text-align:center">
								<input type="text" name="writer" value="<%=rMap.get("EMP_NAME")%>" style="border:none;outline:none;text-align:center" onfocus="this.blur()">
							</td>
						</tr>   	 	    	 	  	 	  	 	   	 	    	 	  	 	  	 	 
						<tr>
							<td style="height:40px;background:#dee2e6">제목</td>
							<td colspan="2"><%=rMap.get("DRAFT_TITLE") %></td>
						</tr>   	 	    	 	  	 	  	 	  	 	    	 	  	 	  	 	   	 	   	 	 
						<tr>
							<td colspan="3">		
							<div style="text-align: -webkit-center;">
									<%=rMap.get("DRAFT_CONTENTS").toString()%>
							</div>					 	
							</td>
						</tr>   	 	 
					</tbody>
				</table>
				<div style="margin-top:4px;margin-right:4px;text-align:right;width: 917px;">
					<button onclick="javascript:close_mypage()">닫기</button>                 
				</div>
				<div id="imsi_result"></div>
			</div>
			<input type="hidden" id="imsi_jsonData" value="">
<%		
	}
%>
</body>
</html>