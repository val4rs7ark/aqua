<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap"%>
<%@ page import="com.util.PageBar"%>
<%
	Map<String,Object> imsi_Map = (Map<String,Object>)request.getAttribute("imsi_Map");
	List<Map<String,Object>> r_list = null;
	if(imsi_Map.get("one")!=null){
		r_list = (List<Map<String,Object>>)imsi_Map.get("one");
	}
	List<Map<String,Object>> myWrite_list =null;
	if(imsi_Map.get("two")!=null){
		myWrite_list = (List<Map<String,Object>>)imsi_Map.get("two");
	}
	String msg = (String)request.getAttribute("msg");
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js" /></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js" /></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js" /></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<title>기안문서 조회</title>
<%@ include file="/common/bs_css.jsp"%>
<style type="text/css">
tr.gubun_bar td {
	border-left: none;
	border-right: none;
}
</style>
<script type="text/javascript">

    var popupX = ((window.screen.width)/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function openText(draft_no,gubun){
		window.open('draft_permission_page?draft_no='+draft_no+"&gubun="+gubun,'팝업창2','width=948px,height=880px,left='+popupX+',top='+ popupY);
	}
	function delete_draft(draft_no){
		//alert("삭제"+draft_no);
		var empno = $("#imsi_empno").val();
	    location.href="/erp/draft_papersDelete?draft_no="+draft_no+"&empno="+empno;
		
	}
  </script>
</head>
<body style="color: #212529ba;">

	<div class="container-fluid">
		<div class="row">
			<div style="width: 20%">
				<%@ include file="/common/MenuCommon.jsp"%>
				<!-- ======================================================================================================================================================================= -->
				<!-- 															여기부터 내영역																					 -->
				<!-- ======================================================================================================================================================================= -->
			</div>
			<div style="width: 80%">
			<input type="hidden" id="imsi_empno" value="<%=s_emp_no%>">
				<div class="container" style="margin-left: 20px;">
					<div class="base_table_div"
						style="width: 1350px; border: none; height: 969px;">
						<!--================================공통코드로 추가할 추가 상단바===========================================-->
						<div style="margin-top: 45px; padding-left: 26px"></div>
						<!--================================공통코드로 추가할 추가 상단바===========================================-->
						<!--================================상단바===========================================-->
						<div class="card bg-dark text-white"
							style="height: 50px; margin-top: 7px">
							<div class="card-body" style="font-size: 17px; font-weight: 900;">전자결재
								> 문서보관함</div>
						</div>
						<div class="row"></div>
						<!--================================상단바===========================================-->


						<div class="container"
							style="margin-left: 0px; margin-right: 0px;">
							<div class="row" style="margin-top: 10px; width: 1345px;">
								<div class="col" style="padding-left: 5px; padding-right: 5px;">
									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#qwe"
											style="padding-top: 2px; padding-bottom: 2px; font-size: 13px; font-weight: 700;">미결제
												문서</a></li>
										<li class="nav-item"><a class="nav-link "
											data-toggle="tab" href="#asd"
											style="padding-top: 2px; padding-bottom: 2px; font-size: 13px; font-weight: 700;">결제완료
												문서</a></li>
										<li class="nav-item"><a class="nav-link "
											data-toggle="tab" href="#pdf"
											style="padding-top: 2px; padding-bottom: 2px; font-size: 13px; font-weight: 700;">내가
												작성한 문서</a></li>
									</ul>
									<div class="tab-content">
										<!-- =================미결제 문서============================== -->
										<div class="tab-pane fade show active" id="qwe"
											style="border: 1px solid #dee2e6; height: 790px; border-top: none;">
											<table style="width: 100%;">
												<tr>
													<td colspan="6" style="height: 30px;"></td>
												</tr>
												<tr class="gubun_bar">
													<td colspan="6"
														style="background-color: #dee2e6ad; border-top: 1px solid #dee2e6; border-bottom: none; height: 31px;">
														<select id="sal_drive" name="sal_drive"
														style="font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
															<option value="">검색조건</option>
															<option value=""></option>
													</select>
													</td>
												</tr>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; background-color: #F1F1F1; height: 31px; text-align: center; font-size: 13px;">
													<td style="width: 11%;">문서번호</td>
													<td style="width: 15%;">기안일자</td>
													<td style="width: 15%;">결제일자</td>
													<td style="width: 24%;">문서명</td>
													<td style="width: 16%;">기안자</td>
													<td style="width: 14%;">상태</td>
												</tr>
												<%
													//다음 if함수 통과 변수 :String pass = "pass" or "break";
														if(r_list.size()!=0){
															String perm_date = "";
															String pass = "pass";
															for(int i=0;i<r_list.size();i++){ //list는 문서 목록이 들어있는 list
																Map<String,Object> rMap = r_list.get(i);
																	if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ //아직 결재 안함
																		if(s_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;">미결제</td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재 진행중</td>
													<%
																							}else if("2".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재 완료</td>
													<%
																							}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">반려</td>
													<%
																							}
																						%>
												</tr>
												<%	
																			pass ="break";
																		}else{//내꺼아니야
																			pass ="break";
																		}
																	}else{//결재했음.
																		if(s_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임.
																			pass ="break";
																		}else{//내꺼아니야
																		  //변수 안담기고 통과
																		}
																	}
																	
																	/////////////////////////////////////////////두번째 if문
																	if("pass".equals(pass)){
																		if("0".equals(rMap.get("SECCOND_PERM_DATE").toString())){ //아직 결재 안함
																			if(s_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;">미결제</td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																						if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
													<td style="width: 10%;">결재중</td>
													<%
																							}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
													<td style="width: 10%;">반려</td>
													<%
																						}
																					%>
												</tr>
												<%	
																				pass ="break";
																			}else{//내꺼아니야
																				pass ="break";
																			}
																		}else{//결재했음.
																			if(s_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
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
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;">미결제</td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재중</td>
													<%
																							}else if("44".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">반려</td>
													<%
																							}
																						%>
												</tr>
												<%	
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
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
																				if(s_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;">미결제</td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재중</td>
													<%
																							}else{
																						%>
													<td style="width: 10%;">결재 완료</td>
													<%
																							}
																						%>
												</tr>
												<%	
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
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
											</table>
										</div>
										<!-- =================미결제 문서============================== -->
										<!-- =================결제완료 문서============================ -->
										<div class="tab-pane fade" id="asd"
											style="border: 1px solid #dee2e6; height: 790px; border-top: none;">
											<table style="width: 100%;">
												<tr>
													<td colspan="6" style="height: 30px;"></td>
												</tr>
												<tr class="gubun_bar">
													<td colspan="6"
														style="background-color: #dee2e6ad; border-top: 1px solid #dee2e6; border-bottom: none; height: 31px;">
														<select id="sal_drive" name="sal_drive"
														style="font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
															<option value="">검색조건</option>
															<option value=""></option>
													</select>
													</td>
												</tr>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; background-color: #F1F1F1; height: 31px; text-align: center; font-size: 13px;">
													<td style="width: 11%;">문서번호</td>
													<td style="width: 15%;">기안일자</td>
													<td style="width: 15%;">결제일자</td>
													<td style="width: 24%;">문서명</td>
													<td style="width: 16%;">기안자</td>
													<td style="width: 14%;">상태</td>
												</tr>
												<%
													//다음 if함수 통과 변수 :String pass = "pass" or "break";
														if(r_list.size()!=0){
															String perm_date = "";
															String pass = "pass";
															for(int i=0;i<r_list.size();i++){ //list는 문서 목록이 들어있는 list
																Map<String,Object> rMap = r_list.get(i);
																	if("0".equals(rMap.get("FIRST_PERM_DATE").toString())){ //아직 결재 안함
																		if(s_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임
																			pass ="break";
																		}else{//내꺼아니야
																			pass ="break";
																		}
																	}else{//결재했음.
																		if(s_emp_no.equals(rMap.get("FIRST_PERMISSION").toString())){//내꺼임.
											%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																					if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																				%>
													<td style="width: 10%;">결재중</td>
													<%
																					}else{
																				%>
													<td style="width: 10%;">결재 완료</td>
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
																			if(s_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
																				pass ="break";
																			}else{//내꺼아니야
																				pass ="break";
																			}
																		}else{//결재했음.
																			if(s_emp_no.equals(rMap.get("SECCOND_PERMISSION").toString())){//내꺼임.
												%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																						if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																					%>
													<td style="width: 10%;">결재중</td>
													<%
																						}else{
																					%>
													<td style="width: 10%;">결재 완료</td>
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
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재중</td>
													<%
																							}else{
																						%>
													<td style="width: 10%;">결재 완료</td>
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
																				if(s_emp_no.equals(rMap.get("FORTH_PERMISSION").toString())){//내꺼임.
																					pass ="break";
																				}else{//내꺼아니야
																					pass ="break";
																				}
																			}else{//결재했음.
																				if(s_emp_no.equals(rMap.get("THIRD_PERMISSION").toString())){//내꺼임.
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td style="width: 10%;"><%=rMap.get("DRAFT_NO")%></td>
													<td style="width: 10%;"><%=rMap.get("DRAFT_INDATE")%></td>
													<td style="width: 10%;"><%=rMap.get("FIRST_PERM_DATE") %></td>
													<td style="width: 15%;"><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','no_my')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td style="width: 10%;"><%=rMap.get("EMP_NAME")%></td>
													<%
																							if("1".equals(rMap.get("DRAFT_STATUS").toString())){
																						%>
													<td style="width: 10%;">결재중</td>
													<%
																							}else{
																						%>
													<td style="width: 10%;">결재 완료</td>
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
											</table>
										</div>
										<!-- =================결제완료 문서============================ -->
										<!-- =================내가작성한 문서============================ -->
										<div class="tab-pane fade" id="pdf"
											style="border: 1px solid #dee2e6; height: 790px; border-top: none;">
											<table style="width: 100%;">
												<tr>
													<td colspan="7" style="height: 30px;"></td>
												</tr>
												<tr class="gubun_bar">
													<td colspan="7"
														style="background-color: #dee2e6ad; border-top: 1px solid #dee2e6; border-bottom: none; height: 31px;">
														<select id="sal_drive" name="sal_drive"
														style="font-size: 11px; color: black; width: 103px; height: 21px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; margin-left: 5px; border: solid; border-color: lightgray; border-width: 1px;">
															<option value="">검색조건</option>
															<option value=""></option>
													</select>
													</td>
												</tr>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; background-color: #F1F1F1; height: 31px; text-align: center; font-size: 13px;">
													<td style="width: 12%;">문서번호</td>
													<td style="width: 16%;">기안일자</td>
													<td style="width: 25%;">문서명</td>
													<td style="width: 17%;">기안자</td>
													<td style="width: 15%;">상태</td>
													<td style="width: 10%;">삭제</td>
												</tr>
												<%
														if(myWrite_list.size()>0){
															for(int i=0;i<myWrite_list.size();i++){
																Map<String,Object> rMap = myWrite_list.get(i);
													%>
												<tr class="gubun_bar"
													style="border-top: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6; height: 25px; text-align: center; font-size: 13px;">
													<td><%=rMap.get("DRAFT_NO")%></td>
													<td><%=rMap.get("DRAFT_INDATE")%></td>
													<td><a
														href="javascript:openText('<%=rMap.get("DRAFT_NO")%>','my_writer')"><%=rMap.get("DRAFT_TITLE")%></a>
													</td>
													<td><%=rMap.get("EMP_NAME")%></td>
													<%
															if("1".equals(rMap.get("DRAFT_STATUS").toString())){
														%>
													<td>결재중</td>
													<%
															}else{
														%>
													<td>결재 완료</td>
													<%
															}
														%>
													<td><a
														href="javascript:delete_draft('<%=rMap.get("DRAFT_NO")%>')"
														style="text-decoration: underline;">삭제</a></td>
												</tr>
												<%
															}
														}else{
													%>
												<tr class="gubun_bar"
													style="border-bottom: 1px solid #dee2e6; height: 31px; text-align: center; font-size: 13px;">
													<td colspan="7">해당정보가 없습니다.</td>
												</tr>
												<%
														}
													%>
											</table>
										</div>
										<!-- =================결제완료 문서============================ -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================================================================================================= -->
	<!-- ===============================================================경고 모달창================================================================= -->
	<!-- ============================================================================================================================================= -->
	<div class="modal" id="Access_insert" data-backdrop="static"
		data-keyboard="true">
		<div class="modal-dialog modal-dialog-centered"
			style="text-align: center">
			<div class="modal-content"
				style="height: 120px; width: 90%; margin-left: 5%; margin-right: 5%;">
				<div
					style="background-color: rgba(0, 0, 0, 0); height: 25%; width: 100%; text-align: center;">
				</div>
				<div
					style="display: table; height: 50%; background-color: rgba(0, 0, 0, 0); color: black; width: 100%;">
					<div
						style="display: table-cell; vertical-align: middle; text-align: center;">
						<img style="heigth: 20px; width: 20px; padding-bottom: 3px;"
							src="/erp/images/error.png" alt="주의:">
						<h6
							style="display: inline; font-weight: bold; font-size: large; color: red;">사원정보</h6>
						<h6 style="display: inline; font-weight: bold; font-size: large">,
						</h6>
						<h6
							style="display: inline; font-weight: bold; font-size: large; color: red;">총지급액</h6>
						<h6 style="display: inline; font-weight: bold; font-size: large">,
						</h6>
						<h6
							style="display: inline; font-weight: bold; font-size: large; color: red;">지급일자</h6>
						<h6 style="display: inline; font-weight: bold; font-size: large">
							는 <br>필수 입력사항입니다
						</h6>
					</div>
				</div>
				<div
					style="background-color: rgba(0, 0, 0, 0); height: 25%; width: 100%; text-align: right; display: table">
					<button
						style="width: 42px; height: 25px; border-top-width: 0px; border-bottom-width: 0px; padding-bottom: 0px; margin-right: 3px; padding-top: 0px; border-left-width: 0px; padding-right: 0px; padding-left: 0px; border-right-width: 0px; display: table-cell; font-size: 14px"
						type="button" class="btn btn-dark"
						onclick="javascript:hide_modal('Access_insert')">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================================================================================================= -->
	<!-- ===============================================================경고 모달창================================================================= -->
	<!-- ============================================================================================================================================= -->


</body>
</html>

