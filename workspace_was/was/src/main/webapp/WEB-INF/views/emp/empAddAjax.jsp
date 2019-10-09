<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%@ page import="com.util.PageBar" %>
<%
		//총 로우 갯수
		int tot = 0;
		if(session.getAttribute("s_tot")!=null){
			tot = Integer.parseInt(session.getAttribute("s_tot").toString());
			//out.print(tot);
		}
		int size = 0;
		List<Map<String,Object>> rList = 
		      (List<Map<String,Object>>)request.getAttribute("eList");
		Map<String,Object> scMap = (Map<String,Object>)request.getAttribute("scMap");
		if(rList !=null && rList.size()>0){
		   size = rList.size();
		}
		///////////////// 페이지 네이션 /////////////////
		int numPerPage = 11; //페이지당 로우 수 
		int nowPage = 0; //현재 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
%>    
 <!-- 
================================================================================================================================
												사원목록 부분(왼쪽) 
================================================================================================================================
-->
    <thead>
      <tr>
      	<th><input id="checkall" type="checkbox" ></th>
        <th>사원번호</th>
        <th>사원명</th>
        <th>부서명</th>
        <th>핸드폰번호</th>
      </tr>
    </thead>
    <tbody>
<%
   if(size==0){
%>    
       <tr>
          <td colspan="6">조회 결과가 없습니다.</td>
       </tr>
<%
   }
   else if(size>0){
	   for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
		   if(size == i) break;
		   Map<String,Object> rMap = rList.get(i);
%>
		<tr>
			<td>
				<input id="checkbox" name="checkbox" type="checkbox" onClick="targetDel('<%=rMap.get("EMPNO")%>')">
			</td>
			
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empno<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMPNO") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_deptname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("DEPT_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_emphp<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_HP") %></td>
		</tr>
<% 
	   }
   }
%>      
    </tbody>
 

