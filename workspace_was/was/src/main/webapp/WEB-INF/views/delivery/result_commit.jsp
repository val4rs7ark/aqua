<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//int gubun = (int)request.getAttribute("gubun");
	//if(gubun==0){
	String id_commit = (String)request.getAttribute("id_commit");
	String msg = (String)request.getAttribute("msg");
	String deli_afterTime = (String)request.getAttribute("deli_afterTime");
	String deli_no = (String)request.getAttribute("deli_no");
	int i = Integer.parseInt(id_commit);
	//}
%>
<td style="width:345px; padding-top: 6px; padding-bottom: 9px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
     	<%=msg %>
</td>
<td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
	<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_cancle(<%=i %>,'<%=msg%>',<%=deli_no%>)" style="height:26px; width:64px; ">완료취소</button>
</td>
<td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
</td>
<td class="bs_table_when" style="width:30%; text-align: right;">
	배송완료&nbsp;:&nbsp;<%=deli_afterTime %>
</td>