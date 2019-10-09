<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%
	List<Map<String,Object>> noteAjaxList = (List<Map<String,Object>>)request.getAttribute("noteAjax");
if(noteAjaxList!=null && noteAjaxList.size()>0){
	%>
	<div class="modal fade" id="myNote">
	<div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><%= noteAjaxList.get(0).get("NOTE_WRITE_DATE")%></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <%
        	for(int i=0;i<noteAjaxList.size();i++){
        		Map<String,Object> rMap = noteAjaxList.get(i);
        		out.print("<a href='javascript:noteDelete("+rMap.get("NOTE_NO")+")'>"+(i+1)+"</a> :"+rMap.get("NOTE_CONTENT"));
        		out.print("<strong>"+(i+1)+"</strong> :"+rMap.get("NOTE_CONTENT"));
        		out.print("<br>");
        	}
        %>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
  </div>
<%		
}
 %>