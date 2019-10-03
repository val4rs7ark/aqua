<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.util.PageBar" %>
<%
	int size = 0;
	List<Map<String,Object>> testList = (List<Map<String,Object>>)request.getAttribute("test_bs_List");
	if(testList!=null){
		size = testList.size();
	}	
	//////////페이지 네비게이션 추가분////////////
	int numPerPage = 8;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>
<%
	Map<String,Object> pMap = new HashMap<>();
	for(int i=numPerPage*nowPage+0;i<numPerPage*nowPage+8;i++){
		if(i==size) break;
		pMap = testList.get(i);
%>
  <!-- ====================================여기서 for문======================================= -->
      <tr>
        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
        	<div><input type="checkbox" class="bs_checkbox" name="chk"></div>
        </td>
        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("inven_count") %>
        </td>
        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("comp_name") %>
        </td>
        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>">
        	<%=pMap.get("when") %>
        </td>
      </tr>
      <tr id="bs_table_update_<%=i%>"> 
        <td style="width:125px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
			<div class="dropdown">
				<select class="dropdown_tableRow" style="border: groove; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
			  		<option value="">배송팀 선택</option>
			  		<option value="week">link1</option>
				</select>
			</div> 
		</td>
        <td style="width:220px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
			<input type="text" class="form-control" id="companyname" name="companyname" placeholder="담당자를 입력하세요."  size="27" style="height: 27px;width:100%;min-width:140px; font-size: 13px;">
        </td>
        <td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;" >
					<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_save(<%=i%>)" style="height:26px; width:64px; ">저장하기</button>
        </td>
        <td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
        </td>
        <td class="bs_table_when" style="width:30%; text-align: right;"></td>
      </tr>
  <!-- ====================================여기서 for문 닫힘======================================= -->
<%
	}
%>