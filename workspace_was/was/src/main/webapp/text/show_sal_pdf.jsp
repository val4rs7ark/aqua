<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		try {
			String pdfFileName = "E:/git/AQUA/workspace_was/was/src/main/webapp/text/nts_data_info_tax.pdf";
			File pdfFile = new File(pdfFileName);
			//Ŭ���̾�Ʈ ���������� �ٷ� ���� ���(��� ����)
			response.setContentType("application/pdf");
			//�� �� ������ ������ [�ٿ�ε�], �� ������ ���ٸ� �ٷ� target ������ ���� view ���ݴϴ�.
			//response.addHeader("Content-Disposition", "attachment; filename="+pdfFile.getName()+".pdf");
			//���� �а� ���� �� �Ϲ����� Write����̶� �����մϴ�. �ٸ� reponse ��� ��Ʈ�� ��ü�� write.
			fis = new FileInputStream(pdfFile);
			int size = fis.available(); //���� ���Ͽ��� ���� �� �ִ� ����Ʈ ���� ��ȯ
			byte[] buf = new byte[size]; //���ۼ���
			int readCount = fis.read(buf);
			
			response.flushBuffer();
			bos = new BufferedOutputStream(response.getOutputStream());
			bos.write(buf, 0, readCount);
			bos.flush();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) fis.close(); //close�� ��! �ݵ��!
				if (bos != null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
%>