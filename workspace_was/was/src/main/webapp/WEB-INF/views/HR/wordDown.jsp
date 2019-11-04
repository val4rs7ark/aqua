<%@ page language="java" contentType="application/vnd.word;charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	List<Map<String,Object>> r_list = (List<Map<String,Object>>)request.getAttribute("r_list");
	Map<String,Object> r_Map = r_list.get(0);
	
	Date date=new Date();
	SimpleDateFormat dayformat=new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	SimpleDateFormat hourformat=new SimpleDateFormat("hhmmss", Locale.KOREA);
	String day=dayformat.format(date);
	String hour=hourformat.format(date);
	String fileName="imsi_execl"+day+"_"+hour;
	
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".doc");
	response.setHeader("Content-Description", "JSP Generated Data");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: -webkit-center;">
<center>
<table style="border: solid 1px; width: 950px; height: 1000px;">
	<thead>
		<tr>
			<th style="padding-top: 60px; font-size: 45px;"><%=r_Map.get("SAL_WHEN").toString().substring(5,7)%>월분 (주)WAS 급여 명세서</th>
		</tr>
		<tr>
			<td style="text-align: -webkit-center; padding-top: 35px;">
				<table style="border-collapse: collapse; width: 900px; text-align: center;">
					<thead>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: right; padding-right: 20px;padding-bottom: 5px;"> 지급일자 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=r_Map.get("SAL_WHEN").toString()%></td> 
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">사번</td>
							<td style="border:solid 1px;"><%=r_Map.get("EMPNO").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">성명</td>
							<td style="border:solid 1px;"><%=r_Map.get("EMP_NAME").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">소속</td>
							<td style="border:solid 1px;"><%=r_Map.get("EMP_SOSOC").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">직책/직급</td>
							<td style="border:solid 1px;"><%=r_Map.get("EMP_POSITION").toString()%></td>
						</tr>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;"> 급여계좌</td>
						</tr>
						<tr>
							<td colspan="2" style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">은행 및 계좌번호</td>
							<td colspan="2" style="border:solid 1px;"><%=r_Map.get("EMP_BANK_UP").toString()%></td>
						</tr>
					<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;"> 급여 내역</td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;" colspan="2">급여내역</td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;" colspan="2">공제내역</td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">기본급</td> 
							<td style="border:solid 1px;"><%=r_Map.get("SAL_DEFAULT").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">소득세</td>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_SODUC").toString()%></td>
						</tr>
						<tr> 
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">성과급</td>
						<%
							if(r_Map.get("SAL_PLUS")!=null){
						%>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_PLUS").toString()%></td>
						<%		
							}else{
						%>
							<td style="border:solid 1px;">0</td>
						<%		
							}
						%>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">지방소득세</td>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_CHON").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">식대</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_RICE").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">연말정산소득세</td>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_JUNGSAN").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">생명수당</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_LIFE").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">결근공제액</td>
						<%
							if(r_Map.get("TAX_NOCHECK")!=null){
						%>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_NOCHECK").toString()%></td>
						<%		
							}else{
						%>
							<td style="border:solid 1px;">0</td>
						<%		
							}
						%>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">교통비</td> 
							<td style="border:solid 1px;"><%=r_Map.get("SAL_DRIVE").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">국민연금</td> 
							<td style="border:solid 1px;"><%=r_Map.get("TAX_KUKMIN").toString()%></td> 
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">통신비</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_TEL").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">장기요양보험</td> 
							<td style="border:solid 1px;"><%=r_Map.get("TAX_LONG").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">초과수당</td>
						<%
							if(r_Map.get("SAL_OVER")!=null){
						%>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_OVER").toString()%></td>
						<%		
							}else{
						%>
							<td style="border:solid 1px;">0</td>
						<%		
							}
						%>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">건강보험</td>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_HEALTH").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">직책수당</td> 
							<td style="border:solid 1px;"><%=r_Map.get("SAL_LEVEL").toString()%></td> 
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">노동조합비용</td> 
							<td style="border:solid 1px;"><%=r_Map.get("TAX_PAIN").toString()%></td> 
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">주휴수당</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_REST").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;\">고용보험</td>
							<td style="border:solid 1px;\"><%=r_Map.get("TAX_WORK").toString()%></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;">육아수당</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_BABY").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;"></td> 
							<td style="border:solid 1px;"></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">기타수당</td>
						<%
							if(r_Map.get("SAL_ETC")!=null & r_Map.get("SAL_ETC_DETAIL")!=null){
						%>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_ETC_DETAIL").toString()%> / <%=r_Map.get("SAL_ETC").toString()%></td>
						<%		
							}else{
						%>
							<td style="border:solid 1px;"> / </td>
						<%		
							}
						%>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">기타공제</td>
						<%
							if(r_Map.get("TAX_ETC_SUDANG")!=null & r_Map.get("TAX_ETC_SUDANG_DT")!=null){
						%>
							<td style="border:solid 1px;"><%=r_Map.get("TAX_ETC_SUDANG_DT").toString()%> / <%=r_Map.get("TAX_ETC_SUDANG").toString()%></td>
						<%		
							}else{
						%>
							<td style="border:solid 1px;"> / </td>
						<%		
							}
						%>
						</tr>
				<!-- =============================================================================================================== -->
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:20px;"></td>
						</tr>
						<tr>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray; height:20px;">지급액(공제전)</td>
							<td style="border:solid 1px;"><%=r_Map.get("IMSI_SAL_TOTAL").toString()%></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">총공제액</td>
							<td style="border:solid 1px;"><%=r_Map.get("IMSI_MINUS_TOTAL").toString()%></td>
						</tr>
						<tr>
							<td colspan="4" style="text-align: left; padding-left: 20px; padding-top:5px;"></td> 
						</tr> 
						<tr>
							<td style="border:solid 1px; height:20px; border-top: none; border-left: none;border-bottom: none;border-right: none;"></td> 
							<td style="border:solid 1px; border-left:none; border-top: none; none;border-bottom: none;"></td>
							<td style="border:solid 1px; border-color:#6c757d; background-color: lightgray;">총지급액</td>
							<td style="border:solid 1px;"><%=r_Map.get("SAL_TOTAL").toString()%></td>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="padding-top:33px; text-align: center;">귀하의 노고에 감사드립니다.</td>
		</tr>
		<tr>
			<td style="text-align: right; padding-right: 50px;">(주) WAS</td>
		</tr>
	</tbody>
</table>
</body>
</html>