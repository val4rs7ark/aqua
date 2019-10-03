<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %> 
<%
		List<Map<String,Object>> sList = (List<Map<String,Object>>)request.getAttribute("sList");
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 아직 수정중.... 0928 -->
<div id="empAddRight">
 <div class="card bg-dark text-white" style="height:50px;margin-top: 20px;">
    <div class="card-body">사원등록</div>
  </div>
  <form id="f_empUPD">
  <input type="hidden" name="gap" value="1">
  <input type="hidden" name="empno" value="<%=sList.get(0).get("EMPNO") %>">
  <table class="table table-striped">
	<tr>
		<td style="width:15%; padding-top:14px; padding-bottom:9px;">&nbsp;사원명&nbsp;</td>
		<td align="left" style="width:15%;padding-top:7px; padding-bottom:7px;">
			<input type="text" class="form-control" style="width:80%;" value="<%=sList.get(0).get("EMP_NAME") %>" id="emp_name" name="emp_name" readonly>
		</td>
		<td style="width:15%; padding-top:14px; padding-bottom:9px;">전화번호</td>
		<td align="left" style="width:15%;padding-top:7px; padding-bottom:7px;">
			<input type="text" class="form-control" style="width:180px;" value="<%=sList.get(0).get("EMP_HP") %>" name="emp_hp"
				   onChange="javascript:textChange()">
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">영문성명</td>
		<td align="left" style="padding-top:6px; padding-bottom:6px;">
			<input type="text" class="form-control" style="height:35px;width:80%;" value="<%=sList.get(0).get("EMP_ENGNAME") %>" name="emp_engname"readonly>
		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">전역구분</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_mili" class="custom-select" style="width:80%"onChange="javascript:textChange()">
			      <option selected><%=sList.get(0).get("EMP_MILI") %></option>
			      <option value="만기전역">만기전역</option>
			      <option value="미필">미필</option>
			      <option value="의가사">의가사</option>
			      <option value="현역부적합">현역부적합</option>
 			</select>
 		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">주민번호</td>
		<td align="left" colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input type="text" class="form-control" style="height:35px;width:150px;display:inline-block" 
					value="<%=sList.get(1).get("RESIDENT_NO_1") %>" name="resident_no_1"readonly>
			<i><strong>-</strong></i>
			<input type="text" class="form-control" style="height:35px;width:150px;display:inline-block" 
					value="<%=sList.get(1).get("RESIDENT_NO_2") %>" name="resident_no_2"readonly>
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">우편번호</td>
		<td align="left" colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input id="zipcode" class="form-control" type="text" style="height:35px;width:170px;display:inline-block" 
					value="<%=sList.get(0).get("EMP_ZIPCODE") %>" name="emp_zipcode" onChange="javascript:textChange()">
			<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal_zip" style="height:38px;width:55px;">
			  <i id="btn_zipcode" style="font-size:28px;" class='far' onclick="location.href='#'">&#xf0e0;</i>
			</button>
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;주&nbsp;&nbsp;소&nbsp;</td>
		<td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input id="adrr1" class="form-control" type="text" style="height:35px;width:220px;display:inline-block" 
					value="<%=sList.get(1).get("EMP_ADDR_1") %>" name="emp_addr_1"onChange="javascript:textChange()">
			<input id="adrr2" class="form-control" type="text" style="height:35px;width:220px;display:inline-block"
					value="<%=sList.get(1).get("EMP_ADDR_2") %>" name="emp_addr_2"onChange="javascript:textChange()">
		</td>
	</tr>
	<tr>
        <td style="width:15%;padding-top:14px; padding-bottom:9px;">입사날짜</td>
        <td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">                    
            <input class="form-control" type="date" id="emp_indate" name="emp_indate" value="<%=sList.get(0).get("EMP_INDATE") %>"
            	 style="height:35px;width:200px;display:inline-block"readonly>
            <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
        </td>
     </tr>
     <tr>   
        <td style="width:15%;padding-top:14px; padding-bottom:9px;">퇴사날짜</td>
        <td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">                    
            <input type="date" class="form-control" id="emp_outdate" name="emp_outdate"  value="<%=sList.get(0).get("EMP_OUTDATE") %>"
            style="height:35px;width:200px;display:inline-block"onChange="javascript:textChange()">
            <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
        </td>
    </tr>
    	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">급여계좌</td>
		<td align="left" style="padding-top: 6px; padding-bottom: 6px;">
			<input type="text" class="form-control" style="height:35px;width:190px;font-size:8pt;display:inline-block" 
				   value="<%=sList.get(0).get("SAL_ACCOUNT") %>" name="sal_account"onChange="javascript:textChange()">
		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;은&nbsp;&nbsp;행&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_bank" class="custom-select" style="width:130px"onChange="javascript:textChange()">
			      <option selected><%=sList.get(0).get("EMP_BANK") %></option>
			      <option value="국민">국민</option>
			      <option value="농협">농협</option>
			      <option value="신한">신한</option>
			      <option value="하나">하나</option>
			      <option value="스탠다드차타드">스탠다드차타드</option>
 			</select>
 		</td>
	</tr>
    <tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;부서명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="dept_code" class="custom-select" style="width:130px"onChange="javascript:textChange()">
			      <option selected><%=sList.get(0).get("DEPT_CODE") %></option>
			      <option value="z001">배송부</option>
			      <option value="a001">총무부</option>
			      <option value="생산부">생산부</option>
 			</select>
 		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;직급명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="team_name" class="custom-select" style="width:130px"onChange="javascript:textChange()">
				<option selected><%=sList.get(0).get("TEAM_NAME") %></option>
			     <option value="배송1팀">배송1팀</option>
			     <option value="배송2팀">배송2팀</option>
			     <option value="배송3팀">배송3팀</option>
 			</select>
 		</td>	
	</tr>
	
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;직급명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_level" class="custom-select mb-2" style="width:130px"onChange="javascript:textChange()">
			      <option selected><%=sList.get(0).get("EMP_LEVEL") %></option>
			      <option value="사원">사원</option>
			      <option value="대리">대리</option>
			      <option value="부장">부장</option>
			      <option value="차장">차장</option>
			      <option value="팀장">팀장</option>
 			</select>
 		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;직책명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;">  
			<select name="emp_position" class="custom-select mb-2" style="width:130px"onChange="javascript:textChange()">
			      <option selected><%=sList.get(0).get("EMP_POSITION") %></option>
			      <option value="팀원">팀원</option>
			      <option value="생산1팀장">생산1팀장</option>
			      <option value="영업부장">영업부장</option>
 			</select>
 		</td>
	</tr>
	<tr>
		<td style="width:17%" colspan="4" align="right">
			<button class="btn btn-outline-dark" style="margin-right:2px" onclick="javascript:cancel()">취소</button>
			<button class="btn btn-outline-dark" onclick="javascript:updateAction()">수정</button>
		</td>
	</tr>
  </table>
  



  
  </form>
</div>
</body>
</html>