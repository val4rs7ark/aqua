<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%
	Map<String,Object> delivery_rMap = (Map<String,Object>)request.getAttribute("delivery_rMap");
	List<Map<String,Object>> delivery_cList = (List<Map<String,Object>>)delivery_rMap.get("c_list");
	List<Map<String,Object>> delivery_fList = (List<Map<String,Object>>)delivery_rMap.get("f_list");
	Map<String,Object> cMap = delivery_cList.get(0);
%>
<tbody style="text-align: left;">
	<tr>
		<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
		<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="companyname" value="<%=cMap.get("CUS_NAME")%>" size="27" style="height: 28px;width:160px; font-size: 13px; background-color: transparent;" readonly>
			<input name="cus_code" type="hidden" value="<%=cMap.get("CUS_CODE")%>">
		</td>
		<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
			<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" data-toggle="modal" data-target="#comp_name">검색</zealot>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
			<input type="text" class="form-control" name="business_no" value="<%=cMap.get("BUSINESS_NO")%>" size="27" style="height: 28px;width:140px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_CEONAME")%>" size="27" style="height: 28px;width:100px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_HP")%>" size="27" style="height: 28px;width:120px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_busikind" value="<%=cMap.get("CUS_BUSIKIND")%>" size="27" style="height: 28px;width:100px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_zipcode" value="<%=cMap.get("CUS_ZIPCODE")%>" size="27" style="height: 28px;width:80px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_addr" value="<%=cMap.get("CUS_ADDR")%>" size="27" style="height: 28px;width:210px; font-size: 13px; background-color: transparent;" readonly>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
		<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_man"  size="27" style="height: 28px;width:100px; font-size: 13px;">
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 번호</td>
		<td style="padding-top: 5px; padding-bottom: 5px; width:80px">
			<input type="text" class="form-control" name="cus_manhp_a"  size="27" style="height: 28px;width:60px; font-size: 13px;">
		</td>
		<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
			-
		</td>
		<td style="padding-top: 5px; padding-bottom: 5px; width: 99.5px;">
			<input type="text" class="form-control" name="cus_manhp_b"  size="27" style="height: 28px;width:80px; font-size: 13px;">
		</td>
		<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
			-
		</td>
		<td style="padding-top: 5px; padding-bottom: 5px;">
			<input type="text" class="form-control" name="cus_manhp_c"  size="27" style="height: 28px;width:80px; font-size: 13px;">
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
		<td style="padding-top: 7px; padding-bottom: 7px;" colspan="3">
  			<div class="dropdown" style="width:180px">
				<select name="fish_code" class="dropdown_tableRow" style="width:150px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
					<option value="">품목 선택</option>
					<%
						for(int i=0;i<delivery_fList.size();i++){
							Map<String,Object> f_Map = delivery_fList.get(i);
					%>
						<option value=<%=f_Map.get("IVGROUP_CODE") %>><%=f_Map.get("IVGROUP_NAME") %></option>
					<%
						}
					%>
				</select>
			</div>
		</td>
		<td style="padding-top: 7px; padding-bottom: 7px;"  colspan="2">
			<zealot class="btn btn-secondary btn_firstrow btn_tableRow" data-toggle="modal" data-target="#iven_insert" style="cursor:pointer; height:26px; width:90px;">품목등록</zealot>
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
		<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
			<input type="text" class="form-control" name="deli_weight"  size="27" style="height: 28px;width:80px; font-size: 13px;">
		</td>
		<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;">t</td>
		<td colspan="2"></td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송일</td>
		<td colspan="3" style="padding-top: 7px; padding-bottom: 7px; padding-right: 0px;">
			<input name="deli_when_date" type="date" class="form-control" style="height:30px;width:160px;">
		</td>
				<td colspan="2" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px;">
			<input name="deli_when_time" type="time" class="form-control" style="height:30px;width:140px;">
		</td>
	</tr>
	<tr>
		<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
		<td colspan="5" style="height:165px;pxpadding-top: 7px; padding-bottom: 7px;">
			<textarea name="deli_memo" style="height:95%; width:95%;"></textarea>
		</td>
	</tr>
</tbody>