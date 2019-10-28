<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
	Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
	String Up_resident_no = rMap.get("resident_no").toString().substring(0, 6)+"-"+rMap.get("resident_no").toString().substring(6, 7) +"******";
	if("jungkyu".equals(rMap.get("table_gubun"))){
%>
		<thead>
	  		<tr>
				<th style="border:none; height: 40px; padding-left: 20px; padding-bottom: 20px;">사원정보</th>
	  		</tr>
	  	</thead>
	  	<tbody style="text-align: left;">
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">사원번호</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" id="empno" name="empno" value="<%=rMap.get("empno").toString()%>" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					<input type="hidden" id="emp_email" name="emp_email" value="<%=rMap.get("emp_email").toString()%>">
					<input type="hidden" id="emp_position" name="emp_position" value="<%=rMap.get("emp_position").toString()%>">
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="emp_name" value="<%=rMap.get("emp_name").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="resident_no" value="<%=Up_resident_no%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">소속</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="emp_sosoc" value="<%=rMap.get("emp_sosoc").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="emp_hp" value="<%=rMap.get("emp_hp").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">입사일</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="emp_indate" value="<%=rMap.get("emp_indate").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="emp_bank" value="<%=rMap.get("emp_bank").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  		<tr>
	  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
	  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
					<input type="text" class="form-control" name="sal_account" value="<%=rMap.get("sal_account").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
				</td>
	  		</tr>
	  	</tbody>
	  	<%
	}else if("one".equals(rMap.get("table_gubun"))){
	  	%>
  			<thead>
		  		<tr>
					<th style="border:none; height: 40px; padding-left: 20px; padding-bottom: 20px;">사원정보</th>
		  		</tr>
		  	</thead>
		  	<tbody style="text-align: left;">
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">임시사번</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" id="empno" name="empno" value="<%=rMap.get("empno").toString()%>" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
						<input type="hidden" id="emp_email" name="emp_email" value="<%=rMap.get("emp_email").toString()%>">
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">이름</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="emp_name" value="<%=rMap.get("emp_name").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">주민등록번호</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="resident_no" value="<%=Up_resident_no%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">임시소속</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="emp_sosoc" value="<%=rMap.get("emp_sosoc").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">전화번호</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="emp_hp" value="<%=rMap.get("emp_hp").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">초기등록일</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="emp_indate" value="<%=rMap.get("emp_indate").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">급여이체 은행</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="emp_bank" value="<%=rMap.get("emp_bank").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  		<tr>
		  			<td style=" height: 50px; padding-left: 40px; padding-top: 5px; padding-bottom: 5px; vertical-align: middle; color: darkgray; border:none;">계좌번호</td>
		  			<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle;">
						<input type="text" class="form-control" name="sal_account" value="<%=rMap.get("sal_account").toString()%>"  size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;"readonly>
					</td>
		  		</tr>
		  	</tbody>	  	
	  	<%
	}
	  	%>