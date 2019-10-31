<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
3초후에...
<%-- <%!
	int x =1;
	public String newsList(String news[]){
		StringBuilder sb = new StringBuilder();
		sb.append("<table width='550px' border='1'>");
		sb.append("<tr><td><"+news[0]+">"+news[1]+"</td></tr>");
		sb.append("</table>");
		return sb.toString();
	}
%>    
<%
	String news1[] = {"연합뉴스","풀영상,이인영  한국당 비례대표 폐지 주장"};
	String news2[] = {"경향신문","정부 투자회생 올인…대기업 투자세액공제율 2배로"};
	String news3[] = {"조선일보","BJ열매 vs 우창범 사생활 폭로…'정준영 단톡방' 논란 재점화"};
	String news4[] = {"JTBC","모택동과 회견하는 이방카?…조롱 패러디 '봇물'"};
	String news5[] = {"교도통신", "'日 정부, 한국 규제 확대 검토중'"};
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
		datas = newsList(news3);
		x++;
		break;
	case 4:
		datas = newsList(news4);
		x++;
		break;
	case 5:
		datas = newsList(news5);//메소드 호출시 파라미터로 뉴스 정보 넘김.
		x=1;//기사 내보낸 후 다음 기사 정보를 가져오기 위해서 1씩 증가시킴.
		break;//case문을 탈출함. 다음 조건으로 넘어가면 안되니까
	}//////////////////end of switch
	//이전 요청에서 가지고 있던 정보 지우기
	//아래 코드를 생략하면 이전 정보를 계속 유지하므로 새로운 기사 처리 안됨.
	out.clear();
	//새로 읽어들인 정보 출력하기
	out.print(datas);
%> --%>