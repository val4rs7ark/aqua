<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
	<script type="text/javascript" src="/erp/se2/js/service/HuskyEZCreator.js" charset="utf-8">        
    <script>    
        //$(document.ready(function(){ .. });

        $(function(){
            //$("#dialog").dialog();
            $("#dialog").dialog({
                autoOpen:false, //자동으로 열리지않게
                position:[100,200], //x,y  값을 지정
                //"center", "left", "right", "top", "bottom"
                modal:true, //모달대화상자
                resizable:false, //크기 조절 못하게
                
                buttons:{
                    "확인":function(){
                        $(this).dialog("close");
                    },"취소":function(){
                        $(this).dialog("close");
                    }
                }
            });

            //창 열기 버튼을 클릭했을경우
            $("#btn").on("click",function(){
                $("#dialog").dialog("open"); //다이얼로그창 오픈                
            });
        });
    </script>

</head>
<body>

<input type="button" id="btn" value="창 열기"/>

<div id="dialog" title="공지사항">
	<textarea style="width:100%" name="ir1" id="ir1" rows="10" cols="100">
		에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.
	</textarea>	
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "/erp/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>
    
</div>


</body>
</html>