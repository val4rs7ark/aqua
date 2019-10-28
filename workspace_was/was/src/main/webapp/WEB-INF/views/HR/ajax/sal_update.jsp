<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
	Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("pMap");
	String b_emp_bank = pMap.get("emp_bank").toString();
	String a_emp_bank = b_emp_bank.replace("은행", "");
%>
<div class="modal-dialog modal-dialog-centered" ">
			<div class="modal-content" style="height: 500px;">
			
				<!-- 조회버튼 -->
				<div class="modal-header">
					<div class="modal-title">급여정보 변경</div>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- select됨, 링크기능 -->
				<div class="modal-body">
					<table class="table" style="margin-bottom: 0px;">
						<tbody>
							<tr>
								<td colspan="3" style="border:none;height:62.5px;">
									<input type="hidden" id="emp_name" name="emp_name" value="<%=pMap.get("emp_name") %>" >
									<%=pMap.get("emp_name") %> (<%=pMap.get("empno") %>)
								</td>
								
							</tr>
							<tr>
								<td style="border:none; width:42%;font-weight: 800;">
									연봉 변동 내용	
								</td>
								<td style="border:none; width:16%;"></td>
								<td style="border:none; width:42%;"></td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input id="before_emp_sal" name="before_emp_sal" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " value="<%=pMap.get("emp_sal") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none; ">
									<input id="after_emp_sal" name="after_emp_sal" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;">
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none; width:42%;font-weight: 800;">
									입금계좌정보 변경
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input id="emp_bank" name="emp_bank" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " value="<%=pMap.get("emp_bank") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; width: 271.25px;">
									<div class="dropdown" style="width: 140px;" >
										<select class="btn btn-white dropdown_bs" id="r_emp_bank" name="r_emp_bank" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
											<option value="<%=a_emp_bank%>">선택</option>
											<option value="신한">신한은행</option>
											<option value="국민">국민은행</option>
											<option value="하나">하나은행</option>
											<option value="우리">우리은행</option>
											<option value="농협">농협</option>
											<option value="기업">기업은행</option>
											<option value="광주">광주은행</option>
											<option value="울산">울산은행</option>
											<option value="부산">부산은행</option>
											<option value="스탠다드차타드">스탠다드차타드은행</option>
										</select>
									</div>		
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input id="before_sal_account" name="before_sal_account" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " value="<%=pMap.get("sal_account") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none;height:40px;">
									<input id="after_sal_account" name="after_sal_account" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;">
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none;text-align: right;color: darkgray; " >작성자 : 이건우&nbsp;&nbsp;
									<input id="sal_writer" name="sal_writer" type="hidden" value="이건우">
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 클로즈 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" style="width:64px;" onclick="javascript:sal_update_complate('<%=pMap.get("empno") %>')">변경완료</button>
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" style="width:40px;" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>