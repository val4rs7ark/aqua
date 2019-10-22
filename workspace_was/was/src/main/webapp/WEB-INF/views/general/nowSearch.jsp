<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">현재재고조회</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <table class="table" style="border-top-style: solid; border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;"> 
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="padding-top:7px; padding-bottom: 7px;width:25%">
           	   			<select class="btn btn-dark" style="height:38px;">
			    			<option>품목명
			    			<option>품목코드
			   			</select>
		             </td>
		             <td style="padding-top: 5px; padding-bottom: 5px;width:45%">
		             	<input type="text" class="form-control">
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom: 7px;width:25%">
		        	 	<button class="btn btn-dark" style="height:38px;">조회</button>
		           	 </td>
		          </tr>
       		</tbody>
    	</table>
    	<table class="table table-striped" style="border-top-style:solid; border-bottom-style:solid;width:100%;border-top-width:2px;border-bottom-width:2px;" > 
              <thead style="text-align:center;">
                 <tr style="width:10%">
                    <th style="width:">구분</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                    <th style="width:">수량</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
<%
	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("invengroupList");
		for(int i=0;i<list.size();i++){
			Map<String,Object> pMap = new HashMap<>();
			pMap = list.get(i);
%>              
              	 <tr>
              		<td><%=pMap.get("IVGROUP_GUBUN")%></td>
              		<td><%=pMap.get("IVGROUP_CODE")%></td>
              		<td><%=pMap.get("IVGROUP_NAME")%></td>
              		<td><%=pMap.get("IVGROUP_SIZE")%></td>
              		<td><%=pMap.get("IVGROUP_COUNT")%></td>
              	 </tr>      
<%
	}
%>              	      	             	             	             	 
              </tbody>
         </table> 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-dark">적용</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
      </div>

    </div>
  </div>