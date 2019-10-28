<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.List" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
	String imsi_gubun = (String)request.getAttribute("imsi_gubun");
%>
<thead>
	<tr>
		<th style="width:150px;">사번</th>
		<th style="width:150px;">이름</th>
		<th style="width:150px;">소속</th>
	</tr>
</thead>
<tbody>

<%
	if(r_list!=null){
		for(int i=0;i<r_list.size();i++){
			Map<String,Object> rMap = r_list.get(i);
			if("one".equals(imsi_gubun)){
				if("임시".equals(rMap.get("EMP_LEVEL").toString())){
%>
			<tr>
				<td>
					<a href="javascript:select_empno_one('<%=rMap.get("EMPNO").toString()%>','one')" style="color:black;" >
						<%=rMap.get("EMPNO")%>
					</a>
				</td>
				<td>
					<%=rMap.get("EMP_NAME") %>
				</td>
				<td>
					<%=rMap.get("EMP_SOSOC") %>
				</td>
			</tr>
<%
				}
			}else if("jung".equals(imsi_gubun)){
				if(!"임시".equals(rMap.get("EMP_LEVEL").toString())){
%>
			<tr>
				<td>
					<a href="javascript:select_empno('<%=rMap.get("EMPNO").toString()%>','jungkyu')" style="color:black;" >
						<%=rMap.get("EMPNO")%>
					</a>
				</td>
				<td>
					<%=rMap.get("EMP_NAME") %>
				</td>
				<td>
					<%=rMap.get("EMP_SOSOC") %>
				</td>
			</tr>
<%
				}
			}else if("search".equals(imsi_gubun)){
%>
			<tr>
				<td>
					<a href="javascript:select_empno('<%=rMap.get("EMPNO").toString()%>','jungkyu')" style="color:black;" >
						<%=rMap.get("EMPNO")%>
					</a>
				</td>
				<td>
					<%=rMap.get("EMP_NAME") %>
				</td>
				<td>
					<%=rMap.get("EMP_SOSOC") %>
				</td>
			</tr>
<%
			}else if("search_one".equals(imsi_gubun)){
%>
			<tr>
				<td>
					<a href="javascript:select_empno_one('<%=rMap.get("EMPNO").toString()%>','jungkyu')" style="color:black;" >
						<%=rMap.get("EMPNO")%>
					</a>
				</td>
				<td>
					<%=rMap.get("EMP_NAME") %>
				</td>
				<td>
					<%=rMap.get("EMP_SOSOC") %>
				</td>
			</tr>
<%
			}
		}
	}
%>
</tbody>