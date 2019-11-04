<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	Map<String,Object> imsi_list = (Map<String,Object>)request.getAttribute("imsi_list");
	String gubun = (String)request.getAttribute("gubun");
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)imsi_list.get("one");
	List<Map<String,Object>> myWrite_list = (List<Map<String,Object>>)imsi_list.get("two");
	String new_emp_no = (String)request.getAttribute("p_empno");

	
	if("no".equals(gubun)){
%>
		<tr>
			<td colspan="6" style="height: 30px;"></td>
		</tr>
		<tr class="gubun_bar">
			<td colspan="6" style="background-color:#dee2e6ad;border-top:1px solid #dee2e6;border-bottom:none;height: 31px;">
				<select id="search_no_chogun" name="" onchange="javascript:gubun_select('no')" style=" font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
						<option value="검색조건">검색조건</option>
						<option value="문서명">문서명</option>
						<option value="기안자">기안자</option>
				</select>
				<div id="gubun_selectno" style="width:300px;display:inline-block">
				</div>
			</td>
		</tr>
		<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; background-color: #F1F1F1;height: 31px;text-align: center; font-size: 13px;">
			<td style="width:11%;">문서번호</td>
			<td style="width:15%;">기안일자</td>
			<td style="width:15%;">결제일자</td>
			<td style="width:24%;">문서명</td>
			<td style="width:16%;">기안자</td>
			<td style="width:14%;">상태</td>
		</tr>
		<%
		//다음 if함수 통과 변수 :String pass = "pass" or "break";
			if(r_list.size()!=0){
				String perm_date = "";
				String pass = "pass";
				for(int i=0;i<r_list.size();i++){ //list는 문서 목록이 들어있는 list
					Map<String,Object> rMap = r_list.get(i);
						if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ //아직 결재 안함
							if(new_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임
		%> 
										<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
											<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
											<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
											<td style="width:10%;">미결제</td>
											<td style="width:15%;">
												<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
											</td>
											<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
											<%
												if("1".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;">결재 진행중</td>
											<%
												}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:blue;">결재 완료</td>
											<%
												}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:red;">반려</td>
											<%
												}
											%>
									 	</tr> 
		<%	
								pass ="break";
							}else{//내꺼아니야
								pass ="break";
							}
						}else if("44".equals(rMap.get("FIRST_PERM_DATE").toString())){ //반려함
							pass ="break";
						}else{//결재했음.
							if(new_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임.
								pass ="break";
							}else{//내꺼아니야
							  //변수 안담기고 통과
							}
						}
						
						/////////////////////////////////////////////두번째 if문
						if("pass".equals(pass)){
							if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ //아직 결재 안함
								if(new_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
		%> 
									<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
										<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
										<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
										<td style="width:10%;">미결제</td>
										<td style="width:15%;">
											<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
										</td>
										<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
										<%
											if("1".equals(rMap.get("DRAFT_STATUS").toString())){
										%>
											<td style="width:10%;">결재 진행중</td>
										<%
											}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
										%>
											<td style="width:10%;color:blue;">결재 완료</td>
										<%
											}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
										%>
											<td style="width:10%;color:red;">반려</td>
										<%
											}
										%>
								 	</tr> 
	<%	
									pass ="break";
								}else{//내꺼아니야
									pass ="break";
								}
							}else if("44".equals(rMap.get("SECCOND_PERM_DATE").toString())){ //반려함
								pass ="break";
							}else{//결재했음.
								if(new_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
									pass ="break";
								}else{//내꺼아니야
								  //변수 안담기고 통과
								}
							}
						 }else if("break".equals(pass)){
							//통과
						 }	
						
						
							/////////////////////////////////////////////세번째 if문
							if("pass".equals(pass)){
								if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ //아직 결재 안함
									if(new_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
		%> 
										<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
											<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
											<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
											<td style="width:10%;">미결제</td>
											<td style="width:15%;">
												<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
											</td>
											<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
											<%
												if("1".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;">결재 진행중</td>
											<%
												}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:blue;">결재 완료</td>
											<%
												}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:red;">반려</td>
											<%
												}
											%>
									 	</tr> 
		<%	
										pass ="break";
									}else{//내꺼아니야
										pass ="break";
									}
								}else if("44".equals(rMap.get("THIRD_PERM_DATE").toString())){ //반려함
									pass ="break";
								}else{//결재했음.
									if(new_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
										pass ="break";
									}else{//내꺼아니야
									  //변수 안담기고 통과
									}
								}
							}else if("break".equals(pass)){
								//통과
							 }	
							
							/////////////////////////////////////////////네번째 if문
							if("pass".equals(pass)){
								if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ //아직 결재 안함
									if(new_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
		%> 
										<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
											<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
											<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
											<td style="width:10%;">미결제</td>
											<td style="width:15%;">
												<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
											</td>
											<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
											<%
												if("1".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;">결재 진행중</td>
											<%
												}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:blue;">결재 완료</td>
											<%
												}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
											%>
												<td style="width:10%;color:red;">반려</td>
											<%
												}
											%>
									 	</tr> 
		<%	
										pass ="break";
									}else{//내꺼아니야
										pass ="break";
									}
								}else if("44".equals(rMap.get("FORTH_PERM_DATE").toString())){ //반려함
									pass ="break";
								}else{//결재했음.
									if(new_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
										pass ="break";
									}else{//내꺼아니야
										  //변수 안담기고 통과
									}
								}
							 }else if("break".equals(pass)){
								//통과
							 }
							pass ="pass";
						}
				}	
			//	}
			//}else{
		%>
		<!-- <tr class="gubun_bar" style="border-bottom:1px solid #dee2e6;height: 31px;text-align: center; font-size: 13px;">
			<td colspan="6">해당정보가 없습니다.</td>
		</tr>	 -->
		 		
		<%
			//}
		%>
<%		
	}else if("yes".equals(gubun)){
%>
<tr>
														<td colspan="6" style="height: 30px;"></td>
													</tr>
													<tr class="gubun_bar">
														<td colspan="6" style="background-color:#dee2e6ad;border-top:1px solid #dee2e6;border-bottom:none;height: 31px;">
															<select id="sal_drive" name="sal_drive" onchange="javascript:gubun_select('yes')" style=" font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="">검색조건</option>
																	<option value="">문서명</option>
																	<option value="">기안자</option>
															</select>
															<div id="gubun_selectyes" style="width:300px;display:inline-block">
															</div>															
														</td>
													</tr>
													<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; background-color: #F1F1F1;height: 31px;text-align: center; font-size: 13px;">
														<td style="width:11%;">문서번호</td>
														<td style="width:15%;">기안일자</td>
														<td style="width:15%;">결제일자</td>
														<td style="width:24%;">문서명</td>
														<td style="width:16%;">기안자</td>
														<td style="width:14%;">상태</td>
													</tr>
													<%
													//다음 if함수 통과 변수 :String pass = "pass" or "break";
														if(r_list.size()!=0){
															String perm_date = "";
															String pass = "pass";
															for(int i=0;i<r_list.size();i++){ //list는 문서 목록이 들어있는 list
																Map<String,Object> rMap = r_list.get(i);
																	if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ //아직 결재 안함
																		if(new_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임
																			pass ="break";
																		}else{//내꺼아니야
																			pass ="break";
																		}
																	}else{//결재했음.
																		if(new_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임.
											%> 
																			<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
																				<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
																				<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
																				<td style="width:10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
																				<td style="width:15%;">
																					<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
																				</td>
																				<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
																				<%
																					if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																				%>
																					<td style="width:10%;">결재 진행중</td>
																				<%
																					}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
																				%>
																					<td style="width:10%;color:blue;">결재 완료</td>
																				<%
																					}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																				%>
																					<td style="width:10%;color:red;">반려</td>
																				<%
																					}
																				%>
																		 	</tr> 
											<%	
																			pass ="break";
																		}else{//내꺼아니야
																		  //변수 안담기고 통과
																		}
																	}
																	
																	/////////////////////////////////////////////두번째 if문
																	if("pass".equals(pass)){
																		if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ //아직 결재 안함
																			if(new_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
																				pass ="break";
																			}else{//내꺼아니야
																				pass ="break";
																			}
																		}else{//결재했음.
																			if(new_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
												%> 
																				<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
																					<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
																					<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
																					<td style="width:10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
																					<td style="width:15%;">
																						<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
																					</td>
																					<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
																					<%
																						if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
																						<td style="width:10%;">결재 진행중</td>
																					<%
																						}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
																						<td style="width:10%;color:blue;">결재 완료</td>
																					<%
																						}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
																						<td style="width:10%;color:red;">반려</td>
																					<%
																						}
																					%>
																			 	</tr> 
												<%	
																				pass ="break";
																			}else{//내꺼아니야
																			  //변수 안담기고 통과
																			}
																		}
																	 }else if("break".equals(pass)){
																		//통과
																	 }	
																	
																	
																		/////////////////////////////////////////////세번째 if문
																		if("pass".equals(pass)){
																			if("0".equals(rMap.get("THIRD_PERM_DATE").toString())){ //아직 결재 안함
																				if(new_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(new_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
													%> 
																					<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
																						<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
																						<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
																						<td style="width:10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
																						<td style="width:15%;">
																							<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
																						</td>
																						<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
																						<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;">결재 진행중</td>
																						<%
																							}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;color:blue;">결재 완료</td>
																						<%
																							}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;color:red;">반려</td>
																						<%
																							}
																						%>
																				 	</tr> 
													<%	
																					pass ="break";
																				}else{//내꺼아니야
																				  //변수 안담기고 통과
																				}
																			}
																		}else if("break".equals(pass)){
																			//통과
																		 }	
																		
																		/////////////////////////////////////////////네번째 if문
																		if("pass".equals(pass)){
																			if("0".equals(rMap.get("FORTH_PERM_DATE").toString())){ //아직 결재 안함
																				if(new_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(new_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
													%> 
																					<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
																						<td style="width:10%;"><%=rMap.get("DRAFT_NO")%></td>
																						<td style="width:10%;"><%=rMap.get("DRAFT_INDATE")%></td>
																						<td style="width:10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
																						<td style="width:15%;">
																							<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
																						</td>
																						<td style="width:10%;"><%=rMap.get("EMP_NAME")%></td>
																						<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;">결재 진행중</td>
																						<%
																							}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;color:blue;">결재 완료</td>
																						<%
																							}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
																							<td style="width:10%;color:red;">반려</td>
																						<%
																							}
																						%>
																				 	</tr> 
													<%	
																					pass ="break";
																				}else{//내꺼아니야
																					  //변수 안담기고 통과
																				}
																			}
																		 }else if("break".equals(pass)){
																			//통과
																		 }
																		pass ="pass";	
																	}
															}	
														//	}
														//}else{
													%>
													<!-- <tr class="gubun_bar" style="border-bottom:1px solid #dee2e6;height: 31px;text-align: center; font-size: 13px;">
														<td colspan="6">해당정보가 없습니다.</td>
													</tr>	 -->
													 		
													<%
														//}
													%>
<%		
	}else if("my".equals(gubun)){
%>
<tr>
														<td colspan="7" style="height: 30px;"></td>
													</tr>
													<tr class="gubun_bar">
														<td colspan="6" style="background-color:#dee2e6ad;border-top:1px solid #dee2e6;border-bottom:none;height: 31px;">
															<select id="sal_drive" name="sal_drive" onchange="javascript:gubun_select('my')" style=" font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
																	<option value="">검색조건</option>
																	<option value="">문서명</option>
																	<option value="">기안자</option>
															</select>
															<div id="gubun_selectmy" style="width:300px;display:inline-block">
															</div>
														</td>
													</tr>
													<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; background-color: #F1F1F1;height: 31px;text-align: center; font-size: 13px;">
														<td style="width:12%;">문서번호</td>
														<td style="width:16%;">기안일자</td>
														<td style="width:25%;">문서명</td>
														<td style="width:17%;">기안자</td>
														<td style="width:15%;">상태</td>
														<td style="width:10%;">삭제</td>
													</tr>
													<%
														if(myWrite_list.size()>0){
															for(int i=0;i<myWrite_list.size();i++){
																Map<String,Object> rMap = myWrite_list.get(i);
													%>
													<tr class="gubun_bar" style="border-top:1px solid #dee2e6;border-bottom:1px solid #dee2e6; height: 25px;text-align: center; font-size: 13px;">
														<td><%=rMap.get("DRAFT_NO")%></td>
														<td><%=rMap.get("DRAFT_INDATE")%></td>
														<td>
															<a href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','my_writer')"><%=rMap.get("DRAFT_TITLE")%></a>
														</td>
														<td><%=rMap.get("EMP_NAME")%></td>
														<%
															if("1".equals(rMap.get("DRAFT_STATUS").toString())){
														%>
															<td style="width:10%;">결재 진행중</td>
														<%
															}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
														%>
															<td style="width:10%;color:blue;">결재 완료</td>
														<%
															}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
														%>
															<td style="width:10%;color:red;">반려</td>
															<!-- ================================================================================================== -->
														<%
															}
															if("2".equals(rMap.get("DRAFT_STATUS").toString())){
														%>
															<td><b style="color:red" >불가</b></td>
														<%		
															}else{
														%>
															<td><a href="javascript:delete_draft('<%=rMap.get("DRAFT_NO")%>')" style="text-decoration: underline;" >삭제</a></td>
														<%		
															}
														%>
													</tr>
													<%
															}
														}else{
													%>
													<tr class="gubun_bar" style="border-bottom:1px solid #dee2e6;height: 31px;text-align: center; font-size: 13px;">
														<td colspan="7">해당정보가 없습니다.</td>
													</tr>	
													<%
														}
													%>
<%		
	}
%>