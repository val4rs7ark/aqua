<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript">
	window.onload = function () {
		/* html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    doc.save('sample-file.pdf'); //pdf저장
		}) */
		$.ajax({
		 	async: false
		   ,type : "POST"
		   ,url : "/erp/wasAndroidFile.was"
		   ,data : "gap=1"
		   ,success:function(data){
			   alert(data);
					   }
				   })
		   }
</script>
</head>
<body>
<div id="pdf_wrap">
안녕~! 나는 pdf파일이 되었어!!
</div>
</body>
</html>