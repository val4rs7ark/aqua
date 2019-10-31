<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript">
	function auto_close() {
	setTimeout('closed()',10000);
	}
	function closed() {
	self.close();
	}
	auto_close();
</script>
</head>
<body>
<script language='javascript'> 
  cnt = 10; // 카운트다운 시간 초단위로 표시 
  function countdown() { 
  if(cnt == 0){ 
          // 시간이 0일경우 
        self.close();
  }else { 
        // 시간이 남았을 경우 카운트다운을 지속한다. 
        document.all.choonDiv.innerHTML = cnt + "초후에 창이 닫힙니다."; 
        setTimeout("countdown()",1000); 
  cnt--; 
  } 
  } 
</script>
</body>
</html>