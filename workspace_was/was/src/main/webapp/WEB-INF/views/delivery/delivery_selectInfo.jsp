<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<%
	Map<String,Object> cMap = (Map<String,Object>)request.getAttribute("delivery_selectInfo");
	List<Map<String, Object>> f_list = (List<Map<String, Object>>)cMap.get("f_list");
	String insert_gubun = null;
	String deli_no = null;
	if(cMap.get("insert_gubun")!=null){
		insert_gubun = cMap.get("insert_gubun").toString();
	}
	if(cMap.get("deli_no")!=null){
		deli_no = cMap.get("deli_no").toString();
	}
	if("2".equals(insert_gubun)){  //등록 취소 화면
%>
<h5 style="display:inline;">배송등록취소</h5>
	  		<button type="button" onclick="javascript:back(<%=deli_no%>)" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">뒤로</button>
	  		<button type="button" onclick="javascript:cancle_pix()" class="btn btn-dark btn pull-right" style="width: 84.5px; padding-top: 2px; padding-bottom: 2px;">취소완료</button>
	  		<input id="table_gubun" type="hidden" value="2">
	  		<form id="f_cancle_pix">
	  			<input name="deli_no" type="hidden" value="<%=deli_no%>">
		  		<table id="trance_table_search_comp_2" class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
		  			<tbody style="text-align: left;">
						<tr>
							<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
							<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="companyname" value="<%=cMap.get("CUS_NAME")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly>
								<input name="cus_code" type="hidden" value="<%=cMap.get("CUS_CODE")%>">
							</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
								<input type="text" class="form-control" name="business_no" value="<%=cMap.get("BUSINESS_NO")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly> 
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_CEONAME")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_HP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_busikind" value="<%=cMap.get("CUS_BUSIKIND")%>" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_zipcode" value="<%=cMap.get("CUS_ZIPCODE")%>" size="27" style="height: 28px;width:70px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_addr" value="<%=cMap.get("CUS_ADDR")%>" size="27" style="height: 28px;width:200px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_man" value="<%=cMap.get("CUS_MAN")%>" size="27" style="height: 28px;width:70px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<%
								String cus_manhp = cMap.get("CUS_MANHP").toString();
								String cus_manhp_a = cus_manhp.substring(0,3);
								String cus_manhp_b = cus_manhp.substring(4,8); 
								String cus_manhp_c = cus_manhp.substring(9);
							%>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 번호</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width:80px">
		  						<input type="text" class="form-control" name="cus_manhp_a" value="<%=cus_manhp_a%>" size="27" style="height: 28px;width:60px; font-size: 13px;" readonly>
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 99.5px;">
		  						<input type="text" class="form-control" name="cus_manhp_b" value="<%=cus_manhp_b%>" size="27" style="height: 28px;width:80px; font-size: 13px;" readonly>
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px;">
		  						<input type="text" class="form-control" name="cus_manhp_c" value="<%=cus_manhp_c%>" size="27" style="height: 28px;width:80px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
							<td style="padding-top: 7px; padding-bottom: 7px;" colspan="5">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("IVGROUP_NAME")%>" size="27" style="height: 28px;width:100px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
							<td style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="deli_weight" value="<%=cMap.get("ORDER_COUNT")%>&nbsp;t" size="27" style="height: 28px;width:60px; font-size: 13px;" readonly>
							</td>
							<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;"></td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송기한</td>
							<td colspan="5" style="padding-top: 7px; padding-bottom: 7px;">
								<input type="text" class="form-control" name="deli_when" value="<%=cMap.get("DELIVERY_DATE")%>" size="27" style="height: 28px;width:140px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">취소 사유</td>
							<td colspan="5" style="height:165px;pxpadding-top: 7px; padding-bottom: 7px;">
								<textarea name="deli_memo" placeholder=" 육하원칙에 의거 작성하세요." style="height:95%; width:95%; padding-left: 6px; padding-top: 6px; padding-right: 6px; padding-bottom: 6px; font-family: 바탕체;"></textarea>
							</td>
						</tr>
					</tbody>
		  		</table>
	  		</form>
<%
	}else if("3".equals(insert_gubun)){ //수정버튼을 눌를때만 insert_gubun이 3으로 날라온다.
%>
<!-- ============================================================================================================================ -->
<h5 style="display:inline;">배송수정</h5>
	  		<button type="button" onclick="javascript:back(<%=deli_no%>)" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">뒤로</button>
	  		<button type="button" onclick="javascript:bs_update_insert()" class="btn btn-dark btn pull-right" style="width: 84.5px; padding-top: 2px; padding-bottom: 2px;">수정완료</button>
	  		<input id="table_gubun" type="hidden" value="2">
	  		<form id="f_deli_update">
	  			<input name="deli_no" type="hidden" value="<%=deli_no%>">
		  		<table id="trance_table_search_comp_2" class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
		  			<tbody style="text-align: left;">
						<tr>
							<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
							<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="companyname" value="<%=cMap.get("CUS_NAME")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly>
								<input name="cus_code" type="hidden" value="<%=cMap.get("CUS_CODE")%>">
							</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
								<zealot class="btn btn-secondary btn_firstrow btn_tableRow" style="height:26px; width:45px; cursor:pointer;'" data-toggle="modal" data-target="#comp_name">검색</zealot>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
								<input type="text" class="form-control" name="business_no" value="<%=cMap.get("BUSINESS_NO")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly> 
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_CEONAME")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표전화</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_HP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_busikind" value="<%=cMap.get("CUS_BUSIKIND")%>" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_zipcode" value="<%=cMap.get("CUS_ZIPCODE")%>" size="27" style="height: 28px;width:70px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_addr" value="<%=cMap.get("CUS_ADDR")%>" size="27" style="height: 28px;width:200px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_man" value="<%=cMap.get("CUS_MAN")%>" size="27" style="height: 28px;width:70px; font-size: 13px; ">
							</td>
						</tr>
						<tr>
							<%
								String cus_manhp = cMap.get("CUS_MANHP").toString();
								String cus_manhp_a = cus_manhp.substring(0,3);
								String cus_manhp_b = cus_manhp.substring(4,8); 
								String cus_manhp_c = cus_manhp.substring(9);
							%>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 번호</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width:80px">
		  						<input type="text" class="form-control" name="cus_manhp_a" value="<%=cus_manhp_a%>" size="27" style="height: 28px;width:60px; font-size: 13px;" >
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 99.5px;">
		  						<input type="text" class="form-control" name="cus_manhp_b" value="<%=cus_manhp_b%>" size="27" style="height: 28px;width:80px; font-size: 13px;" >
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px; width: 5px; padding-left: 0px; padding-right: 0px; ">
		  						-
							</td>
		  					<td style="padding-top: 5px; padding-bottom: 5px;">
		  						<input type="text" class="form-control" name="cus_manhp_c" value="<%=cus_manhp_c%>" size="27" style="height: 28px;width:80px; font-size: 13px;" >
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
		  					<td colspan="4" style="padding-top: 7px; padding-bottom: 7px;">
					  			<div class="dropdown" style="width:180px">
									<select name="fish_code" class="dropdown_tableRow" style="width:150px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
										<option value="<%=cMap.get("IVGROUP_CODE")%>"><%=cMap.get("IVGROUP_NAME")%></option>
										<%
											for(int i=0;i<f_list.size();i++){
												Map<String,Object> f_Map = f_list.get(i);
										%>
												<option value="<%=f_Map.get("IVGROUP_CODE")%>"><%=f_Map.get("IVGROUP_NAME")%></option>
										<%
											}
										%>
									</select>
								</div>
							</td>
		  					<td style="padding-top: 7px; padding-bottom: 7px;"  >
		  					</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
							<td style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="deli_weight" value="<%=cMap.get("ORDER_COUNT")%>" size="27" style="height: 28px;width:60px; font-size: 13px;">
							</td>
							<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;">t</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송기한</td>
							<%
								String deli_when = cMap.get("DELIVERY_DATE").toString();
								String deli_when_date = deli_when.substring(0, 10);
							%>
							<td colspan="3" style="padding-top: 7px; padding-bottom: 7px; padding-right: 0px;">
								<input name="deli_when_date" type="date" value="<%=deli_when_date%>" class="form-control" style="height:30px;width:160px;">
							</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px;">
								<input name="deli_when_time" type="time" class="form-control" style="height:30px;width:140px;">
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
							<td colspan="5" style="height:165px;pxpadding-top: 7px; padding-bottom: 7px;">
								<textarea name="deli_memo" style="height:95%; width:95%; padding-left: 6px; padding-top: 6px; padding-right: 6px; padding-bottom: 6px; font-family: 바탕체;"><%=cMap.get("ORDER_MEMO")%></textarea>
							</td>
						</tr>
					</tbody>
		  		</table>
	  		</form>

<!-- ============================================================================================================================ -->
<%
	}else{ //상세조회 화면 
		if("44".equals(cMap.get("DELIVERY_STATE").toString())){//상세조회화면중 등록이 취소된 내역 화면
%>
<h5 style="display:inline;">배송등록</h5>
	  		<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">뒤로</button>
	  		<form id="f_deli_insert">
	  			<input id="deli_no" type="hidden" value="<%=deli_no%>">
		  		<table class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
		  			<tbody style="text-align: left;">
						<tr>
							<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
							<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="companyname" value="<%=cMap.get("CUS_NAME")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly>
								<input name="cus_code" type="hidden" value="<%=cMap.get("CUS_CODE")%>">
							</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
								<input type="text" class="form-control" name="business_no" value="<%=cMap.get("BUSINESS_NO")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly> 
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; width: 172.5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_CEONAME")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
							<td style="padding-top: 5px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px; width: 111.25px;">대표전화</td>
							<td style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_HP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_busikind" value="<%=cMap.get("CUS_BUSIKIND")%>" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_zipcode" value="<%=cMap.get("CUS_ZIPCODE")%>" size="27" style="height: 28px;width:70px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_addr" value="<%=cMap.get("CUS_ADDR")%>" size="27" style="height: 28px;width:200px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; width: 172.5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_MAN")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
							<td style="padding-top: 5px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px; width: 111.25px;">담당자 번호</td>
							<td style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_MANHP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
							<td style="padding-top: 7px; padding-bottom: 7px;" colspan="5">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("IVGROUP_NAME")%>" size="27" style="height: 28px;width:100px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="deli_weight" value="<%=cMap.get("ORDER_COUNT")%>&nbsp;&nbsp;&nbsp;t" size="27" style="height: 28px;width:60px; font-size: 13px;" readonly>
							</td>
							<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">접수날짜</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
								<input type="text" class="form-control" name="deli_date" value="<%=cMap.get("ORDER_INDATE")%>" size="27" style="height: 28px;width:140px; font-size: 13px; " readonly>
							</td>
							<td style="padding-top: 9px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert"  style="padding-top: 9px; padding-bottom: 7px;">배송상태</td>
							<%
								if("1".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송준비중" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("2".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송중" size="27" style="height: 28px;width:70px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("3".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송완료" size="27" style="height: 28px;width:80px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("44".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="취소" size="27" style="height: 28px;width:80px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송기한</td>
							<td colspan="5" style="padding-top: 7px; padding-bottom: 7px;">
								<input type="text" class="form-control" name="deli_when" value="<%=cMap.get("DELIVERY_DATE")%>" size="27" style="height: 28px;width:140px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">취소 사유</td>
							<td colspan="5" style="height: 199.25px; pxpadding-top: 7px; padding-bottom: 7px;">
								<textarea name="deli_memo" style="height:95%; width:95%; background-color: #e9ecef; padding-left: 6px; padding-top: 6px; padding-right: 6px; padding-bottom: 6px; font-family: 바탕체;" readonly ><%=cMap.get("ORDER_MEMO")%></textarea>
							</td>
						</tr>
					</tbody>
		  		</table>
	  		</form>
<%
		}
		else{
%>
<h5 style="display:inline;">배송등록</h5>
	  		<button type="button" onclick="javascript:bs_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px;">뒤로</button>
	  		<button type="button" onclick="javascript:insert_cancle(<%=cMap.get("DELIVERY_STATE").toString()%>)" class="btn btn-dark btn pull-right" style="width: 84.5px; margin-left:10px;  padding-top: 2px; padding-bottom: 2px;">등록취소</button>
	  		<button type="button" onclick="javascript:bs_update(<%=cMap.get("DELIVERY_STATE").toString()%>)" class="btn btn-dark btn pull-right" style="width:54.5px; padding-top: 2px; padding-bottom: 2px;">수정</button>
	  		<form id="f_deli_insert">
	  			<input id="deli_no" type="hidden" value="<%=deli_no%>">
		  		<table class="table" style="border-top-style: solid;  border-bottom-style: solid; width: 100%; border-top-width: 2px; border-bottom-width: 2px;margin-bottom: 0px;"> 
		  			<tbody style="text-align: left;">
						<tr>
							<td class="bi_table_insert" style="width:140px; padding-top: 7px; padding-bottom: 7px;" >업체명</td>
							<td colspan="3" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="companyname" value="<%=cMap.get("CUS_NAME")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly>
								<input name="cus_code" type="hidden" value="<%=cMap.get("CUS_CODE")%>">
							</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">사업자번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;" >
								<input type="text" class="form-control" name="business_no" value="<%=cMap.get("BUSINESS_NO")%>" size="27" style="height: 28px;width:160px; font-size: 13px; " readonly> 
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">대표이름</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; width: 172.5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_CEONAME")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
							<td style="padding-top: 5px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px; width: 111.25px;">대표전화</td>
							<td style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_HP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">업태</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_busikind" value="<%=cMap.get("CUS_BUSIKIND")%>" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">우편번호</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_zipcode" value="<%=cMap.get("CUS_ZIPCODE")%>" size="27" style="height: 28px;width:70px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">주소</td>
							<td colspan="5" style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_addr" value="<%=cMap.get("CUS_ADDR")%>" size="27" style="height: 28px;width:200px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">담당자 이름</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; width: 172.5px;">
								<input type="text" class="form-control" name="cus_ceoname" value="<%=cMap.get("CUS_MAN")%>" size="27" style="height: 28px;width:70px; font-size: 13px;" readonly>
							</td>
							<td style="padding-top: 5px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 0px; width: 111.25px;">담당자 번호</td>
							<td style="padding-top: 5px; padding-bottom: 5px;">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("CUS_MANHP")%>" size="27" style="height: 28px;width:120px; font-size: 13px;" readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">품목</td>
							<td style="padding-top: 7px; padding-bottom: 7px;" colspan="5">
								<input type="text" class="form-control" name="cus_hp" value="<%=cMap.get("IVGROUP_NAME")%>" size="27" style="height: 28px;width:100px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">무게</td>
							<td colspan="2" style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px;">
								<input type="text" class="form-control" name="deli_weight" value="<%=cMap.get("ORDER_COUNT")%>&nbsp;&nbsp;&nbsp;t" size="27" style="height: 28px;width:60px; font-size: 13px;" readonly>
							</td>
							<td colspan="1" class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px; padding-left: 5px;"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">접수날짜</td>
							<td colspan="2" style="padding-top: 7px; padding-bottom: 7px;">
								<input type="text" class="form-control" name="deli_date" value="<%=cMap.get("ORDER_INDATE")%>" size="27" style="height: 28px;width:140px; font-size: 13px; " readonly>
							</td>
							<td style="padding-top: 9px; padding-bottom: 5px; width: 32.5px; padding-right: 0px;">&nbsp;/&nbsp;</td>
							<td class="bi_table_insert"  style="padding-top: 9px; padding-bottom: 7px;">배송상태</td>
							<%
								if("1".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송준비중" size="27" style="height: 28px;width:100px; font-size: 13px;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("2".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송중" size="27" style="height: 28px;width:70px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("3".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="배송완료" size="27" style="height: 28px;width:80px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
							<%
								if("44".equals(cMap.get("DELIVERY_STATE").toString())){
							%>
								<td style="padding-top: 7px; padding-bottom: 7px;">
									<input type="text" class="form-control" name="cus_addr" value="취소" size="27" style="height: 28px;width:80px; font-size: 13px; color: red;" readonly>
								</td>
							<%
								}
							%>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">배송기한</td>
							<td colspan="5" style="padding-top: 7px; padding-bottom: 7px;">
								<input type="text" class="form-control" name="deli_when" value="<%=cMap.get("DELIVERY_DATE")%>" size="27" style="height: 28px;width:140px; font-size: 13px; " readonly>
							</td>
						</tr>
						<tr>
							<td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;">비고</td>
							<td colspan="5" style="height: 199.25px; pxpadding-top: 7px; padding-bottom: 7px;">
								<textarea name="deli_memo" style="height:95%; width:95%; background-color: #e9ecef; padding-left: 6px; padding-top: 6px; padding-right: 6px; padding-bottom: 6px; font-family: 바탕체;" readonly ><%=cMap.get("ORDER_MEMO")%></textarea>
							</td>
						</tr>
					</tbody>
		  		</table>
	  		</form>
<%
		}
	}
%>