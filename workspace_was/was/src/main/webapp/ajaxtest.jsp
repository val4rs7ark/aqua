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
		
		html2canvas($('#pdf_wrap')[0]).then(function(canvas) {
		    var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
		    var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
		    doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
		    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))
		    {
		    	doc.output('save', 'filename.pdf'); //Try to save PDF as a file (not works on ie before 10, and some mobile devices)
		    	
		    }
		    else
		    {
		    	//doc.output('save', 'filename.pdf'); //Try to save PDF as a file (not works on ie before 10, and some mobile devices)
		    	doc.output('dataurlnewwindow');
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