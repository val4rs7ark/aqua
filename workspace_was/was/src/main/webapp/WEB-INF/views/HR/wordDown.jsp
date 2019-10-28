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
<body>

<h3>회원 목록</h3>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>전화번호</th>
            </tr>
        </thead>

         

        <tbody>

            <tr>

                <td>patriot2</td>

                <td>유관순</td>

                <td style='mso-number-format: "@";'>0431234567</td>

            </tr>

            <tr>

                <td>pitcher</td>

                <td>류현진</td>

                <td style='mso-number-format: "@";'>01034567890</td>

            </tr>

            <tr>

                <td>historian</td>

                <td>신채호</td>

                <td>001886123456</td>

            </tr>

        </tbody>

    </table>
</body>
</html>