<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id_save = (String)request.getAttribute("id_save");
	String deli_no = (String)request.getAttribute("deli_no");
	String msg = (String)request.getAttribute("msg");
	String r_deli_start = (String)request.getAttribute("r_deli_start");
	int i = Integer.parseInt(id_save);
%>
		<td id="save_msg" style="width:345px; padding-top: 6px; padding-bottom: 10px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
        	<%=msg %>
		</td>
        <td style=" padding-top: 6px; padding-bottom: 10px; padding-left: 6px; padding-right: 3px;width:91px;">
				<button type="button" class="btn btn-light btn_firstrow btn_tableRow" onclick="javascript:bs_update(<%=i%>,<%=deli_no %>)" style="height:26px; width:40px;">수정</button>
        </td>
        <td style="padding-top: 6px; padding-bottom: 10px; padding-left: 3px; padding-right: 6px;width:115px;">
				<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_commit(<%=i%>,'<%=msg%>',<%=deli_no %>)" style="height:26px; width:80px;">배송완료</button>
		</td>
		<td class="bs_table_when" style="width:30%; text-align: right;">
			배정완료&nbsp;:&nbsp;<%=r_deli_start %>
		</td>
