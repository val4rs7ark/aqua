<%@ page contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    //출력 데이타 받기
	Object obj = request.getAttribute("excel_list");
	obj= (obj == null) ? new ArrayList() : obj ;
	List<Map<String,String>> list=(List) obj;
	
	//파일명에 다운로드 날짜 붙여주기 위해 작성
	Date date=new Date();
	SimpleDateFormat dayformat=new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	SimpleDateFormat hourformat=new SimpleDateFormat("hhmmss", Locale.KOREA);
	String day=dayformat.format(date);
	String hour=hourformat.format(date);
	String fileName="imsi_execl"+day+"_"+hour;
	
	//필수 선언 부분
	//.getBytes("KSC5601"),"8859_1") 을 통한 한글파일명 깨짐 방지
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setHeader("Content-Description", "JSP Generated Date");


%>

<!doctype html>
<html lang="ko" style="overflow:hidden">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title></title>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">

<table width="784" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bordercolordark="#6C717D" cellspacing="0" cellpadding="0">
	<thead>
	   <tr align="center">
		<th scope="col" bgcolor="CDCDCD">거래처명</th>
		<th scope="col" bgcolor="CDCDCD">사업자 번호</th>
		<th scope="col" bgcolor="CDCDCD">대표이름</th>
		<th scope="col" bgcolor="CDCDCD">대표전화번호</th>
		<th scope="col" bgcolor="CDCDCD">업태</th>
		<th scope="col" bgcolor="CDCDCD">거래처 주소</th>
		<th scope="col" bgcolor="CDCDCD">담당자이름</th>
		<th scope="col" bgcolor="CDCDCD">담당자 연락처</th>
		<th scope="col" bgcolor="CDCDCD">품명</th>
		<th scope="col" bgcolor="CDCDCD">수량</th>
		<th scope="col" bgcolor="CDCDCD">배송담당자 이름</th>
		<th scope="col" bgcolor="CDCDCD">배송담당자 전화번호</th>
		<th scope="col" bgcolor="CDCDCD">배송담당자 소속</th>
		<th scope="col" bgcolor="CDCDCD">접수 날짜</th>
		<th scope="col" bgcolor="CDCDCD">배송 기한</th>
		<th scope="col" bgcolor="CDCDCD">배송 시작</th>
		<th scope="col" bgcolor="CDCDCD">배송 종료</th>
		<th scope="col" bgcolor="CDCDCD">비고</th>
		<th scope="col" bgcolor="CDCDCD">현재 상태</th>
	   </tr>
	</thead>
	<tbody>
	<% 
		for(int i=0; i<list.size(); i++){ 	
	%>
		<tr>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_NAME")!=null){
			%>
				<%=list.get(i).get("CUS_NAME")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("BUSINESS_NO")!=null){
			%>
				<%=list.get(i).get("BUSINESS_NO")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_CEONAME")!=null){
			%>
				<%=list.get(i).get("CUS_CEONAME")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_HP")!=null){
			%>
				<%=list.get(i).get("CUS_HP")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_BUSIKIND")!=null){
			%>
				<%=list.get(i).get("CUS_BUSIKIND")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_ADDR")!=null){
			%>
				<%=list.get(i).get("CUS_ADDR")%>
			<%
				}
			%>	
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_MAN")!=null){
			%>
				<%=list.get(i).get("CUS_MAN")%>
			<%
				}
			%>	
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("CUS_MANHP")!=null){
			%>
				<%=list.get(i).get("CUS_MANHP")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("IVGROUP_NAME")!=null){
			%>
				<%=list.get(i).get("IVGROUP_NAME")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%=String.valueOf(list.get(i).get("ORDER_COUNT"))%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("EMP_NAME")!=null){
			%>
				<%=list.get(i).get("EMP_NAME")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("EMP_HP")!=null){
			%>
				<%=list.get(i).get("EMP_HP")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("TEAM_NAME")!=null){
			%>
				<%=list.get(i).get("TEAM_NAME")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("ORDER_INDATE")!=null){
			%>
				<%=list.get(i).get("ORDER_INDATE")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("DELIVERY_DATE")!=null){
			%>
				<%=list.get(i).get("DELIVERY_DATE")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("ORDER_STARTDATE")!=null){
			%>
				<%=list.get(i).get("ORDER_STARTDATE")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("ORDER_ENDDATE")!=null){
			%>
				<%=list.get(i).get("ORDER_ENDDATE")%>
			<%
				}
			%>
			</td>
			<td style="text-align:left;">
			<%
				if(list.get(i).get("ORDER_MEMO")!=null){
			%>
				<%=list.get(i).get("ORDER_MEMO")%>
			<%
				}
			%>
			</td>
			<% 
				String delivery_state = String.valueOf(list.get(i).get("DELIVERY_STATE"));
				if("1".equals(delivery_state)){
			%>
				<td style="text-align:left;">배송전</td>
			<%		
				}else if("2".equals(delivery_state)){
			%>
			<td style="text-align:left;">배송중</td>
			<%		
				}else if("3".equals(delivery_state)){
			%>
			<td style="text-align:left;">배송완료</td>
			<%		
				}else if("44".equals(delivery_state)){
			%>
			<td style="text-align:left;">취소</td>
			<%		
				}
			%>
			
			<%-- <td style="text-align:left; mso-number-format:\#\,\#\#0\;" ><%=list.get(i).get("PRICE")%> </td> --%>
		</tr>
	 <%
	 	}
	 %>
	</tbody>
</table>

</body>

</html>