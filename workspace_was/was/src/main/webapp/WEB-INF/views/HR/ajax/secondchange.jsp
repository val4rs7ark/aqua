<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
3초후에...
<%!
	int x =1;
 	public String newsList(String news){
		StringBuilder sb = new StringBuilder();
		sb.append("<table style='width:100%;height:100%;text-align:center;font-size:20px'>");
		sb.append("<tr><td>"+news+"</td></tr>");
		sb.append("</table>");
		return sb.toString();
	} 
%>    
<%
	
	String news1 = "3초 후에 창이 닫힙니다....&nbsp;";
	String news2 = "3초 후에 창이 닫힙니다...&nbsp;&nbsp;";
	String news3 = "3초 후에 창이 닫힙니다..&nbsp;&nbsp;&nbsp;";
	String datas = "";
	switch(x){
	case 1:
		datas = newsList(news1);
		x++;
		break;
	case 2:
		datas = newsList(news2);
		x++;
		break;
	case 3:
		datas = newsList(news3);//메소드 호출시 파라미터로 뉴스 정보 넘김.
		x=1;//기사 내보낸 후 다음 기사 정보를 가져오기 위해서 1씩 증가시킴.
		break;//case문을 탈출함. 다음 조건으로 넘어가면 안되니까
	}//////////////////end of switch
	//이전 요청에서 가지고 있던 정보 지우기
	//아래 코드를 생략하면 이전 정보를 계속 유지하므로 새로운 기사 처리 안됨.
	out.clear();
	//새로 읽어들인 정보 출력하기
	out.print(datas);
%>
