<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.util.PageBar" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("list");
	String s_empno = (String)request.getAttribute("sal_empno"); 
	String sal_year = (String)request.getAttribute("sal_year"); 
	

    
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <%@ include file="/common/bootStrap4.jsp" %>
    <%@ include file="/common/styles.jsp" %>
    <title>Bootstrap 4</title>
  <%@ include file="/common/bs_css.jsp"%>
  <script type="text/javascript">
  	function sal_select(){
		$("#f_sal_year").attr("method","post");
		$("#f_sal_year").attr("action","/erp/HRsal_year.was");
		$("#f_sal_year").submit();
	}
	function hide_modal(modal_name){
		$("#"+modal_name+"").hide();
	}
  </script>
  <style type="text/css">
  	.tabler th, .tabler td{
  		border-top: 1px solid #E4E4E4;
  		border-left: 1px solid #E4E4E4;
  		border-bottom: 1px solid #E4E4E4;
		border-right: 1px solid #E4E4E4;
		padding-top: 5px;
		padding-bottom: 5px;
  	}
  	/* style="border-bottom: 1px solid darkgray;" */
  </style>
  </head>
  <body>
  	<div class="container-fluid" >
	<div class="row">
	<div style="width:100%" >
	<div class="container" style="margin-top:10px; margin-left: 0px;">
	<div class="base_table_div" style="width: 1500px; border:none;height:860px;">
	<!-- =======================================================상단 조회 검색 바========================================================================== -->
	<form id="f_sal_year">
		<input type="hidden" id="sal_empno" name="sal_empno" value="<%=s_empno%>">
		<table class="table table-hover" style="width: 1420px;margin-top: 1px;margin-bottom: 0px;">
		    <thead>
		      <tr>
		     	<th style="width: 1420px; height: 50px; border-bottom-width: 1px;padding-left: 40px; padding-right: 0px; vertical-align: middle;text-align: -webkit-right;">
			    	급여 연도 선택 :&nbsp;
				</th>
		        <th style="border-bottom-width: 1px; vertical-align: middle;text-align: -webkit-right;">
			        <div class="dropdown" style="width:90px;" >
						<select class="btn btn-white dropdown_bs" id="sal_year" name="sal_year" style=" margin-left: 0px; color:black; width:90px; height:28px; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px; border: solid; border-color: #efefef; border-width: 1px;">
							<option value="<%=sal_year%>"><%=sal_year%></option>
							<%	
								for(int i=2019;i>2008;i--){
							%>
								<option value="<%=i %>"><%=i%></option>
							<%	
								}
							%>
						</select>
					</div>	
				</th>
		        <th style="border-bottom-width: 1px; vertical-align: middle; text-align: right; padding-right: 50px; padding-left: 15px;">
		        	<button type="button" onclick="javascript:sal_select()" class="btn btn-dark" style="width: 65px; height: 27px; font-size: 14px; padding-top: 3px; padding-bottom: 4px; padding-left: 4px; padding-right: 4px;"><img src="/erp/images/search_sal_white.png" style="width: 22px;" alt="검색">검색</button>
				</th>
		      </tr>
	    	</thead>
	  	</table>
	</form>
	<!-- ===================================================================================================================================================== -->
		<div class="container" style="margin-left: 0px; margin-right: 0px;">
			<div class="row" style="margin-top:10px; width:1420px;;">
				<div class="container" style="margin-left: 0px; margin-right: 0px;">
					<div class="row" style="width:1420px;;">
						<div class="col" style="padding-right: 0px; padding-left: 0px;"> 
						  	<div class="row" style="width:1420px;;margin-left: 0px; margin-right: 0px;">
							  	<div style="width:100%; ">
								  	<div style="font-size: 15px; font-weight: bold; margin-bottom: 5px; margin-left: 20px;margin-top: 1px">
										⊙급여상세 내역
								  	</div>
								  	<div style="display: inline-flex; width: 100%;">
								  	<table class="table tabler" style="width: 10%;">
									  	<tr>
									     	<td style="width: 3%; height: 20px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">구분</td>
									     	<td style="width: 7%; height: 20px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">지급항목</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">지급</td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">기본급</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">성과급</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">식대</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">통신비</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">교통비</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">생명수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">초과수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">직책수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">주휴수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">육아수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">기타수당</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: #dfecfb; text-align: center;font-weight: 800;font-size: 13px;">지급계</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">공제</td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">소득세</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">연말정산소득세</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">지방소득세</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">결근공제액</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">국민연금</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">장기요양보험</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">건강보험</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;white-space: nowrap;font-size: 13px;">노동조합비용</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">고용보험</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">기타공제</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9;  text-align: center;font-weight: 800;font-size: 13px;"></td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; background-color: antiquewhite; text-align: center;font-weight: 800;font-size: 13px;">공제계</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #efefef; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">총</td>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #efefef; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">총지급계</td>
								  		</tr>
								  	</table>
								  	<table class="table tabler" style="width: 90%;">
								  	 	<tbody>
									  	 	<tr>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">1월</td>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">2월</td>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">3월</td>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">4월</td>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">5월</td>
										        <td style="width: 7%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">6월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">7월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">8월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">9월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">10월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">11월</td>
										        <td style="width: 8%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;font-size: 13px;">12월</td>
										        <!-- <td style="width: 17%; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">비고</td> 추가란 필요하면 이거 복사-->
										    </tr>
											<!-- =========================================================아래 세부항목========================================================================================= -->
											<%
										  	 	if(r_list.size()>0){
											    	for(int i=0;i<r_list.size();i++){
										  	 		 	Map<String,Object> rMap = r_list.get(i);
										  	%>
										    <tr>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Jany = "0";
											    		if(rMap.get("sal_Jany")!=null){
											    		 sal_Jany = rMap.get("sal_Jany").toString();											    			
											    		}
											    	%>
											    	<%=sal_Jany %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Feb = "0";
											    		if(rMap.get("sal_Feb")!=null){
											    			sal_Feb = rMap.get("sal_Feb").toString();											    			
											    		}
											    	%>
											    	<%=sal_Feb %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Mar = "0";
											    		if(rMap.get("sal_Mar")!=null){
											    			sal_Mar = rMap.get("sal_Mar").toString();											    			
											    		}
											    	%>
											    	<%=sal_Mar %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Apr = "0";
											    		if(rMap.get("sal_Apr")!=null){
											    			sal_Apr = rMap.get("sal_Apr").toString();											    			
											    		}
											    	%>
											    	<%=sal_Apr %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_May = "0";
											    		if(rMap.get("sal_May")!=null){
											    			sal_May = rMap.get("sal_May").toString();											    			
											    		}
											    	%>
											    	<%=sal_May %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Jun = "0";
											    		if(rMap.get("sal_Jun")!=null){
											    			sal_Jun = rMap.get("sal_Jun").toString();											    			
											    		}
											    	%>
											    	<%=sal_Jun %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_July = "0";
											    		if(rMap.get("sal_July")!=null){
											    			sal_July = rMap.get("sal_July").toString();											    			
											    		}
											    	%>
											    	<%=sal_July %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Aug = "0";
											    		if(rMap.get("sal_Aug")!=null){
											    			sal_Aug = rMap.get("sal_Aug").toString();											    			
											    		}
											    	%>
											    	<%=sal_Aug %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Sep = "0";
											    		if(rMap.get("sal_Sep")!=null){
											    			sal_Sep = rMap.get("sal_Sep").toString();											    			
											    		}
											    	%>
											    	<%=sal_Sep %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Oct = "0";
											    		if(rMap.get("sal_Oct")!=null){
											    			sal_Oct = rMap.get("sal_Oct").toString();											    			
											    		}
											    	%>
											    	<%=sal_Oct %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Nov = "0";
											    		if(rMap.get("sal_Nov")!=null){
											    			sal_Nov = rMap.get("sal_Nov").toString();											    			
											    		}
											    	%>
											    	<%=sal_Nov %>
											    </td>
											    <td style="vertical-align: middle; text-align: center;font-size: 13px;">
											    	<% 
											    		String sal_Dec = "0";
											    		if(rMap.get("sal_Dec")!=null){
											    			sal_Dec = rMap.get("sal_Dec").toString();											    			
											    		}
											    	%>
											    	<%=sal_Dec %>
											    </td>
										    </tr>
										 <%
										  	 		}
										  	 	}else{
										 %>
										 	<tr>
										 		<td colspan="12" style="border:none; height: 300px;"/>
										 	</tr>
										 	<tr>
										 		<td colspan="4" style="border:none;"/>
											 	<td colspan="4" style="border:none;">
												 	<div style="height:120px;width:90%;margin-left:5%;margin-right:5%;">
												      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:center;" >
												      </div>
												      <div style="display:table;height:50%;background-color:rgba(0,0,0,0);color:black;width:100%;">
												         <div style="display:table-cell;vertical-align:middle;text-align:center;">
												           <img style="heigth:20px;width:20px;padding-bottom: 3px;"src="/erp/images/error.png" alt="주의:">
												           <h6 style="display:inline;font-weight:bold;font-size:large;color:red">등록된 정보가 없습니다.</h6>
												         </div>   
												      </div>
												      <div style="background-color:rgba(0,0,0,0);height:25%;width:100%;text-align:right;display:table">
												      </div>
												    </div>
											    </td>
											    <td colspan="4" style="border:none;"/>
										    </tr>
										 <%	
										  	 	}
										  %>
								  	 	</tbody>
								  	</table>
							  		<!-- 에바코드 
							  			
							  		<table class="table tabler" style="width: 8%;">
									  	<tr>
									     	<td style="width: 3%; height: 20px; vertical-align: middle; background-color: #efefef; text-align: center;font-weight: 800;">총계</td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
									  	<tr>
									     	<td style="height: 30px; vertical-align: middle; border-top-color: #a3bad9; text-align: center;font-weight: 800;"> </td>
								  		</tr>
								  	</table> -->
								  	</div>
								</div>
						  	</div>
						</div>  
					</div>
				</div>
			</div>
		</div>
	</div>
    </div>
    </div>
 
    </div>
	</div>  	
  </body>
</html>

