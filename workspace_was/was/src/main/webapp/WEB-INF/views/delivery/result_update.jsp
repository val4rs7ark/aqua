<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id_update = (String)request.getAttribute("id_update");
	String deli_no = (String)request.getAttribute("deli_no");
	String msg = (String)request.getAttribute("msg");
	int i = Integer.parseInt(id_update);
%>
<td style="width:125px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
	<div class="dropdown">
		<select id="team_name_<%=deli_no%>" name="team_name"class="dropdown_tableRow" style="border: groove; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
	  		<option value="">배송팀 선택</option>
	  		<option value="배송1팀">배송1팀</option>
	  		<option value="배송2팀">배송2팀</option>
	  		<option value="배송3팀">배송3팀</option>
		</select>
	</div> 
</td>
<td style="width:220px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
	<input id="deli_man_<%=deli_no%>" name="deli_man" type="text" class="form-control" id="deli_name" name="deli_name" placeholder="담당자를 입력하세요."  size="27" style="height: 27px;width:100%;min-width:140px; font-size: 13px;">
	<input id="deli_no_<%=deli_no%>" name="deli_no" type="hidden" value='<%=deli_no%>'>
</td>
<td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;" >
			<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_save(<%=i%>,<%=deli_no%>)" style="height:26px; width:64px; ">저장하기</button>
</td>
<td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
</td>
<td class="bs_table_when" style="width:30%; text-align: right;"></td>
<%
if(!"update_null".equals(msg)){
	out.println("<script>alert('" + msg + "');</script>"); 
}
%>