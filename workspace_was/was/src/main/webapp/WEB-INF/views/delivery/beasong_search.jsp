<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page import="com.util.PageBar" %>
<%
	int r_size = 0;
	List<Map<String,Object>> r_deliveryList = (List<Map<String,Object>>)request.getAttribute("deliveryList");
	if(r_deliveryList!=null){
		r_size = r_deliveryList.size();
	}	
	//////////페이지 네비게이션 추가분////////////
	int r_numPerPage = 8;
	int r_nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		r_nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
		Map<String,Object> pMap = new HashMap<>();
		for(int i=r_numPerPage*r_nowPage+0;i<r_numPerPage*r_nowPage+8;i++){
			if(i==r_size) break;
			pMap = r_deliveryList.get(i);
			pMap.put("msg",pMap.get("ORDER_DELIINFO").toString());
			if("1".equals(pMap.get("STATE").toString())){
	%>
	  <!-- ====================================여기서 for문======================================= -->
	      <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("FISH_NAME")%>/<%=pMap.get("DELI_WEIGHT")%>
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	<%=pMap.get("CUS_ADDR")%>/<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>" data-backdrop="static">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELI_WHEN") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
	        <td style="width:125px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
				<div class="dropdown">
					<select id="team_name_<%=pMap.get("DELI_NO")%>" name="team_name" class="dropdown_tableRow" style="border: groove; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
				  		<option value="">배송팀 선택</option>
				  		<option value="e001_1">배송1팀</option>
				  		<option value="e001_2">배송2팀</option>
				  		<option value="e001_3">배송3팀</option>
					</select>
				</div> 
			</td>
	        <td style="width:220px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
				<input id="deli_man_<%=pMap.get("DELI_NO")%>" name="deli_man" type="text" class="form-control" placeholder="담당자를 입력하세요."  size="27" style="height: 27px;width:100%;min-width:140px; font-size: 13px;">
				<input id="deli_no_<%=pMap.get("DELI_NO")%>" name="deli_no" type="hidden" value="<%=pMap.get("DELI_NO")%>">
	        </td>
	        <td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;" >
						<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_save(<%=i%>,<%=pMap.get("DELI_NO")%>)" style="height:26px; width:64px;">저장하기</button>
	        </td>
	        <td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 6px; padding-right: 6px;">
	        </td>
	        <td class="bs_table_when" style="width:30%; text-align: right;"></td>
	      </tr>
	  <!-- ====================================여기서 for문 닫힘======================================= -->
	<%
			}else if("2".equals(pMap.get("STATE").toString())){
	%>	   
		  <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	<%=pMap.get("FISH_NAME")%>/<%=pMap.get("DELI_WEIGHT")%>
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	<%=pMap.get("CUS_ADDR")%>/<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELI_WHEN") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
			<td id="save_msg" style="width:345px; padding-top: 6px; padding-bottom: 10px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
	        	<%=pMap.get("msg") %>
			</td>
	        <td style=" padding-top: 6px; padding-bottom: 10px; padding-left: 6px; padding-right: 3px;width:91px;">
					<button type="button" class="btn btn-light btn_firstrow btn_tableRow" onclick="javascript:bs_update(<%=i%>,<%=pMap.get("DELI_NO")%>)" style="height:26px; width:40px;">수정</button>
	        </td>
	        <td style="padding-top: 6px; padding-bottom: 10px; padding-left: 3px; padding-right: 6px;width:115px;">
					<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_commit(<%=i%>,'<%=pMap.get("msg") %>',<%=pMap.get("DELI_NO")%>)" style="height:26px; width:80px;">배송완료</button>
			</td>
			<td class="bs_table_when" style="width:30%; text-align: right;">
				배정완료&nbsp;:&nbsp;<%=pMap.get("DELI_START") %>
			</td>
		  </tr>
	
	<% 
			}else if("3".equals(pMap.get("STATE").toString())){
	%>
		  <tr>
	        <td rowspan="2" style="width:5%; text-align:center; vertical-align:middle;"  >
	        	<div><input type="checkbox" class="bs_checkbox" name="chk" value="<%=pMap.get("ORDER_NO")%>"></div>
	        </td>
	        <td rowspan="2" style="padding-top: 22px; padding-left: 30px; padding-bottom: 5px; padding-right: 70px; font-size: 20px; font-family: -webkit-pictograph; width: 25%; min-width: 120px; color: black;" data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	<%=pMap.get("FISH_NAME")%>/<%=pMap.get("DELI_WEIGHT")%>
	        </td>
	        <td colspan="4" class="bs_table_body" style="width:50%; border-bottom: hidden; padding-bottom: 5px; padding-top: 10px; " data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	<%=pMap.get("CUS_ADDR")%>/<%=pMap.get("CUS_NAME")%>
	        </td>
	        <td class="bs_table_when" style="width:30%;border-bottom: hidden; padding-bottom: 5px;" data-toggle="modal" data-target="#bs_info_<%=i%>">
	        	완료기한&nbsp;:&nbsp;<%=pMap.get("DELI_WHEN") %>
	        </td>
	      </tr>
	      <tr id="bs_table_update_<%=i%>"> 
			<td style="width:345px; padding-top: 6px; padding-bottom: 9px; padding-left: 12px; padding-right: 6px; font-size: 13px;" colspan="2">
			     	<%=pMap.get("msg") %>
			</td>
			<td style="width:91px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
				<button class="btn btn-secondary btn_firstrow btn_tableRow" onclick="javascript:bs_cancle(<%=i %>,'<%=pMap.get("msg") %>',<%=pMap.get("DELI_NO")%>)" style="height:26px; width:64px; ">완료취소</button>
			</td>
			<td style="width:115px; padding-top: 6px; padding-bottom: 9px; padding-left: 3px; padding-right: 6px;">
			</td>
			<td class="bs_table_when" style="width:30%; text-align: right;">
				배송완료&nbsp;:&nbsp;<%=pMap.get("DELI_END")%>
			</td>
		  </tr>
	<%	
			}
		}
	%>