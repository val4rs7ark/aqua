<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap,java.util.Map,java.util.List"%>
<!--========================콤보 박스 체크 관련 로직 시작=============================================-->
<script type="text/javascript">

</script>

<!--========================콤보 박스 체크 관련 로직 끝=============================================-->
<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 시작===========================-->
<%  						 
	List<Map<String,Object>> invengroupList = null;
	invengroupList = (List<Map<String,Object>>)request.getAttribute("invengroupList");
	int getInvenGroupTotal = 
			Integer.parseInt(request.getAttribute("getInvenGroupTotal").toString());
	int size = invengroupList.size();
	out.print("size:"+size);
%>

<!--========================모달로직 (메인 - 신규 등록 -품목검색) 관련 로직 끝===========================-->
<!-- ===================================모달창 (메인 - 신규 등록 -품목검색) 시작===================================== -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">품목검색</h5>
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
                    <th style="width"></th>
                    <th style="width:">구분</th>
                    <th style="width:">코드</th>
                    <th style="width:">품목명</th>
                    <th style="width:">규격</th>
                 </tr>
              <tbody style="text-align:center;font-size:13px;">
<%
	if(invengroupList.size()>0){
			Map<String,Object> pMap = new HashMap<>();
		for(int i=0;i<invengroupList.size();i++){
			pMap = invengroupList.get(i);
			String ivgroup_code = null;
			if(pMap.get("IVGROUP_CODE")!=null){
				ivgroup_code = pMap.get("IVGROUP_CODE").toString();
			}
%>              
              	 <tr>
              		<td><input type="checkbox" name="user_CheckBox"
              				   onclick="onlyOneCheck(this)"></td>
              		<td><%=pMap.get("IVGROUP_GUBUN")%></td>
              		<td><%=pMap.get("IVGROUP_CODE")%></td>
              		<td><%=pMap.get("IVGROUP_NAME")%></td>
              		<td><%=pMap.get("IVGROUP_SIZE")%></td>
              	 </tr>     
<%
	}
%>             	          	             	             	             	 
              </tbody>
         </table> 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
 
        <button type="button" class="btn btn-dark" onClick="javascript:selectBtn('update,'+<%=Integer.parseInt(request.getAttribute("i").toString())%>)">적용</button>
        <button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
<%
}
%>		
         
      </div>
    </div>
  </div>
<!-- ===================================모달창 (메인 - 신규 등록 -품목검색) 끝===================================== -->