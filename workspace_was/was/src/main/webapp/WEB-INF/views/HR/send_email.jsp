<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="javax.mail.*,javax.mail.internet.*,java.util.Properties,com.util.Email_form, java.util.*" %>


<meta charset="UTF-8" />
<html lang="ko">
<head>
    <%@ include file="/common/bootStrap4.jsp" %>
    <%@ include file="/common/styles.jsp" %>
    <%@ include file="/common/bs_css.jsp"%>
<title>Waiting</title>    
</head>
<body>
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
   /*   ==========================================================================================
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
      
      out.print("<div style='background-color:white;height:100%;width:100%;display:table;text-align:center;'>");
      out.print("<div style='display:table-cell;vertical-align:middle'>");
      out.print("<div style='font-size:20px'>e-mail ������ �Ϸ�Ǿ����ϴ�.</div>");
       out.print("<script type='text/javascript'>");
      out.print("setInterval(autoReload,1000);");
      out.print("function autoReload(){");
       out.print("$.ajax({");
      out.print("method:'get'");
      out.print(",url:'/erp/HRsecondchange'");
      out.print(",dataType:'html'");
      out.print(",success:function(result){");
      out.print("$('#d_news').html(result);}");
      out.print(",fail:function(xhrObject, textStatus){");
      out.print("alert('Request failed:'+textStatus);");
      out.print("alert(xhrObject.responseText);}");
      out.print("});"); 
      out.print("}");
      out.print("</script>");
      out.print("<div id='d_news'>");
      out.print("<div style='font-size:20px'>3�� �Ŀ� â�� �����ϴ�.....</div>");
      out.print("</div>");
      out.print("<a style='font-size:20px' href='javascript:closed()'>�ݱ�</a>");
      out.print("</div>");      
      out.print("</div>");
   }catch(Exception e){
      e.printStackTrace();
   }
%>

<script type="text/javascript">
   
   auto_close();
   function autoReload(){
      alert("autoReload");
   }
   function auto_close() {
   setTimeout('closed()',3500);
   }
   
   function closed() {
   self.close();
   }
</script>
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