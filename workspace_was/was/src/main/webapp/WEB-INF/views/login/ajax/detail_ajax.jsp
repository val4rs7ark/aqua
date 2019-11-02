<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	List<Map<String,Object>> returnList = (List<Map<String,Object>>)request.getAttribute("boardDetail");
	Map<String,Object> returnMap = returnList.get(0);
%>
	<div class="modal-dialog">
		      <div class="modal-content" style="width: fit-content;">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h1 class="modal-title">사내 공지사항</h1>
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <table id="board_detail" class="table-board" title="상세보기" 
					     style="width:700px;height:380px;padding:10px;background:#fafafa;">
						<tr>
							<td>작성자</td>
							<td><input class="form-control" value="<%=returnMap.get("EMP_NAME") %>"></td>
							<td>작성일</td>
							<td><input class="form-control" value="<%=returnMap.get("BO_DATE") %>"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td colspan="3"><input class="form-control" value="<%if(returnMap.get("BO_TITLE")!=null) out.print(returnMap.get("BO_TITLE"));%>"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3"><input class="form-control" style="height:500px;" value="<%=returnMap.get("BO_CONTENT") %>"></td>
						</tr>
					</table>
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
    </div>