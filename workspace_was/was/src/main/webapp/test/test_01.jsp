<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<HTML>
<HEAD>
<TITLE>www.webmadang.net</TITLE>
<script type="text/javascript">
//[] <--문자 범위 [^] <--부정 [0-9] <-- 숫자  
//[0-9] => \d , [^0-9] => \D
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
     var num01;
     var num02;
     num01 = obj.value;
     num02 = num01.replace(rgx1,"");
     num01 = setComma(num02);
     obj.value =  num01;

}

function setComma(inNum){
     
     var outNum;
     outNum = inNum; 
     while (rgx2.test(outNum)) {
          outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
      }
     return outNum;

}
</script>
</HEAD>

<BODY>
<table width="650" border="0" cellspacing="1" cellpadding="5">
 <tr>
  <td width="109" bgcolor="#F2F2F2"><strong>희망급여</strong></td>
    <td width="518" align="left" bgcolor="#FFFFFF">
      <input name="mypay" type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" style="text-align:right;">
       원</td>
  </tr>
</table>
</BODY>
</HTML>