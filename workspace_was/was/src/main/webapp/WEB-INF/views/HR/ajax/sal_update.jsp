<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
	Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("pMap");
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
									<%=pMap.get("emp_name") %> (<%=pMap.get("empno") %>)
								</td>
								
							</tr>
							<tr>
								<td style="border:none; width:42%;font-weight: 800;">
									기본급 변동 내용	
								</td>
								<td style="border:none; width:16%;"></td>
								<td style="border:none; width:42%;"></td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right; " value="<%=pMap.get("emp_sal") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none; ">
									<input id="sal_long_one" name="sal_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;">
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none; width:42%;font-weight: 800;">
									입금계좌정보 변경
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " value="<%=pMap.get("emp_back") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="padding-top: 5px; padding-bottom: 5px; border:none; vertical-align: middle; width: 271.25px;">
									<div class="dropdown" style="width: 140px;" >
										<select class="btn btn-white dropdown_bs" id="sal_life_one" name="sal_life_one" style=" margin-left: 0px; color:black; width:140px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: lightgray; border-width: 1px;">
											<option value="#">선택</option>
											<option value="#">신한은행</option>
											<option value="#">국민은행</option>
											<option value="#">외환은행</option>
										</select>
									</div>		
								</td>
							</tr>
							<tr>
								<td style="border:none;text-align: right; ">
									<input type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; " value="<%=pMap.get("sal_account") %>" readonly>
								</td>
								<td style="border:none;text-align: center; ">
									<div>
										<img src="/erp/images/right.png" width="30" height="30">
									</div>
								</td>
								<td style="border:none;height:40px;">
									<input id="sal_long_one" name="sal_long_one" type="text" class="form-control" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent; display:inline; text-align:right;">
								</td>
							</tr>
							<tr>
								<td colspan="3" style="border:none;text-align: right;color: darkgray; ">작성자 : 이건우&nbsp;&nbsp;
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<!-- 클로즈 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" style="width:64px;" data-dismiss="modal">변경완료</button>
					<button type="button" class="btn btn-secondary btn_firstrow btn_tableRow" style="width:40px;" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>