<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
   int x = 1;
   public String newsList(String news[]) {
      StringBuilder sb = new StringBuilder();
      sb.append("<table width='1000px'>");
      sb.append("<tr><td>"+news[0]+" > "+news[1]+"</td></tr>");
      sb.append("</table");
      return sb.toString();
   }
%>
<%
   String news1[] = {"<h4>  [날씨]","내일 저녁부터 영동·남부 비, 기온 오늘보다 낮아"+"</h4>"};
   String news2[] = {"<h4>  [날씨]","내일 공기질 청정…저녁~모레 영동·남부 비"+"</h4>"};
   String news3[] = {"<h4>  [날씨]","오늘의 날씨 "+"</h4>"};
   String news4[] = {"<h4>  [날씨]","경기북부 미세먼지 '보통'…대기정체 해소"+"</h4>"};
   String news5[] = {"<h4>  [날씨]","내일 구름 많고 포근...동해안·제주 비"+"</h4>"};
   String datas = "";
   switch(x) {
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
      x++;//기사 내보낸 후 다음 기사 정보를 가져오기 위해서 1씩 증가시킴. 
      break;
   case 5:
      datas = newsList(news5);//메소드 호출시 파라미터로 뉴스 정보 넘김
      x=1;//따라서 초기화가 피요함. 
      break;//case문을 탈출함, 다음 조건으로 넘어가면 안되니까 
   
   }////////////////////end of switch
   //이전 요청에서 가지고 있던 정보 지우기
   //아래 코드를 생략하면 이전 정보를 게쏙 유지하므로 새로운 기사 처리 안됨. 
   out.clear();
   //새로 읽어들인 정보 출력하기 
   out.print(datas);
%>