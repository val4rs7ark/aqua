<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="javax.mail.*,javax.mail.internet.*,java.util.Properties,com.util.Email_form, java.util.*" %>
<%
	Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("sal_pMap");
	
	String smtpServer = "smtp.naver.com";
	//사용하고자하는 smtp서버의 계정정보
	final String username = "zzanglkw";
	final String password = "ghost12#";//대소문자 구별
	//보내는 사람 이메일 주소
	String fromMail = "zzanglkw@naver.com";
	int smtpPort = 465;
	
	
	
	
	String subject = pMap.get("emp_name").toString()+"님의 19년 11월 급여명세서 입니다.(주)WAS";//메일 제목

	Email_form ef = new Email_form();
	String content = ef.email_form(pMap); 
	
	
	Properties props = System.getProperties();
	props.put("mail.smtp.host", smtpServer);
	props.put("mail.smtp.port", smtpPort);
	props.put("mail.smtp.auth", true);//인증처리
	props.put("mail.smtp.ssl.enable", true);
	props.put("mail.smtp.ssl.trust", smtpServer);
	
	/* //물리적으로 떨어져 있는 smtp서버에 접속하기 -인증처리-통과-전송가능함. */
	Session mySession = Session.getInstance(props, new Authenticator(){
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(username,password);
		}
	});
	mySession.setDebug(true);
		
	//받는이
		String toMail = pMap.get("emp_email").toString(); //한명일 경우
	/*	==========================================================================================
		여러명한테 보내기 수정
		받는이
	
		InternetAddress[] toMail = new InternetAddress[2];
		toMail[0] = new InternetAddress("1sinjn@gmail.com");
		toMail[1] = new InternetAddress("jongnamss@naver.com");
	
		여러명한테 보내기 수정
		==========================================================================================
	*/
	try{
		MimeMessage msg = new MimeMessage(mySession);
		msg.setFrom(new InternetAddress(fromMail));
		//msg.setRecipients(Message.RecipientType.TO, toMail[]); //여러명일 경우
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
		msg.setSubject(subject);
		msg.setContent(content, "text/html;charset=euc-kr");
		Transport.send(msg);
		out.print("성공적으로 전달되었습니다.");
		out.print("<a href='javascript:closed()'>닫기</a>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<meta charset="UTF-8" />
<html lang="ko">
<head>
<title>Waiting</title>
<script type="text/javascript">

function auto_close() {
setTimeout('closed()',3000);
}

function closed() {
self.close();
}

auto_close();
</script>
</head>
<body>
</body>
</html> 


<!-- 페이지 자동 이동 참고 코드 
<html>
<head>
    <title>META Tag  Refresh</title>
    <meta http-equiv="content-type" content="text/html; charset=euc-kr">
    <meta http-equiv="refresh" content="5; url=http://www.naver.com">
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
    <p><iframe name="ifrm1" src="http://www.daum.net/" frameborder="0" width="1046" height="523"></iframe></p>
</body>
</html> -->

<!-- 페이지 이동 코드... 버림 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="content-type" content="text/html; charset=euc-kr">
<meta http-equiv="refresh" content="3; url=HRSalery_insert;">
<title>Waiting</title>
</head>
<body>
</body>
</html> 
-->