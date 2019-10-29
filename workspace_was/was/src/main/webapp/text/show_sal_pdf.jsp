<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		try {
			String pdfFileName = "E:/git/AQUA/workspace_was/was/src/main/webapp/text/nts_data_info_tax.pdf";
			File pdfFile = new File(pdfFileName);
			//클라이언트 브라우져에서 바로 보는 방법(헤더 변경)
			response.setContentType("application/pdf");
			//★ 이 구문이 있으면 [다운로드], 이 구문이 없다면 바로 target 지정된 곳에 view 해줍니다.
			//response.addHeader("Content-Disposition", "attachment; filename="+pdfFile.getName()+".pdf");
			//파일 읽고 쓰는 건 일반적인 Write방식이랑 동일합니다. 다만 reponse 출력 스트림 객체에 write.
			fis = new FileInputStream(pdfFile);
			int size = fis.available(); //지정 파일에서 읽을 수 있는 바이트 수를 반환
			byte[] buf = new byte[size]; //버퍼설정
			int readCount = fis.read(buf);
			
			response.flushBuffer();
			bos = new BufferedOutputStream(response.getOutputStream());
			bos.write(buf, 0, readCount);
			bos.flush();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) fis.close(); //close는 꼭! 반드시!
				if (bos != null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
%>