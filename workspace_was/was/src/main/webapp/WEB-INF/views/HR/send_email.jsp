<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="javax.mail.*,javax.mail.internet.*,java.util.Properties,com.util.Email_form, java.util.*" %>
<%
	Map<String,Object> pMap = (Map<String,Object>)request.getAttribute("sal_pMap");
	
	String smtpServer = "smtp.naver.com";
	//����ϰ����ϴ� smtp������ ��������
	final String username = "zzanglkw";
	final String password = "ghost12#";//��ҹ��� ����
	//������ ��� �̸��� �ּ�
	String fromMail = "zzanglkw@naver.com";
	int smtpPort = 465;
	
	
	
	
	String subject = pMap.get("emp_name").toString()+"���� 19�� 11�� �޿����� �Դϴ�.(��)WAS";//���� ����

	Email_form ef = new Email_form();
	String content = ef.email_form(pMap); 
	
	
	Properties props = System.getProperties();
	props.put("mail.smtp.host", smtpServer);
	props.put("mail.smtp.port", smtpPort);
	props.put("mail.smtp.auth", true);//����ó��
	props.put("mail.smtp.ssl.enable", true);
	props.put("mail.smtp.ssl.trust", smtpServer);
	
	/* //���������� ������ �ִ� smtp������ �����ϱ� -����ó��-���-���۰�����. */
	Session mySession = Session.getInstance(props, new Authenticator(){
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(username,password);
		}
	});
	mySession.setDebug(true);
		
	//�޴���
		String toMail = pMap.get("emp_email").toString(); //�Ѹ��� ���
	/*	==========================================================================================
		���������� ������ ����
		�޴���
	
		InternetAddress[] toMail = new InternetAddress[2];
		toMail[0] = new InternetAddress("1sinjn@gmail.com");
		toMail[1] = new InternetAddress("jongnamss@naver.com");
	
		���������� ������ ����
		==========================================================================================
	*/
	try{
		MimeMessage msg = new MimeMessage(mySession);
		msg.setFrom(new InternetAddress(fromMail));
		//msg.setRecipients(Message.RecipientType.TO, toMail[]); //�������� ���
		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
		msg.setSubject(subject);
		msg.setContent(content, "text/html;charset=euc-kr");
		Transport.send(msg);
		out.print("���������� ���޵Ǿ����ϴ�.");
		out.print("<a href='javascript:closed()'>�ݱ�</a>");
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


<!-- ������ �ڵ� �̵� ���� �ڵ� 
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

<!-- ������ �̵� �ڵ�... ���� 
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