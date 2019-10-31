<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>기안서(기본)</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <%@ include file="/common/bs_css.jsp" %>
   
<title>Insert title here</title>
<script type="text/javascript" src="/erp/se2/js/service/HuskyEZCreator.js" charset="utf-8">
</script>
<script type="text/javascript">
/*    function save(){
      alert("save호출");
      var title = $("#db_title").val();
      alert(title);
      var sb = "<td><input name='db_title' style='width:90%' type='text'>";
      sb += title;
      sb += "</td>";
      alert(sb);
      $("#hd_title").val(sb);
       $("#f_draft_basic").attr("method","post");
      $("#f_draft_basic").attr("action","/erp/general_draftAdd");
      oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
      $("#f_draft_basic").submit();
   } */
   //등록하기 눌렀을때
   function save(){
       $("#f_draft_basic").attr("method","post");
      $("#f_draft_basic").attr("action","/erp/draftAdd");
      oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
      $("#f_draft_basic").submit();
      window.close();
   }
   var popupX = (window.screen.width/2)-(900/2);
   //만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
   var popupY= (window.screen.height/2)-(800/1.7);
   //만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
   
   function manSelect(){
      alert("결재자 선택");
      window.open('./text.jsp','팝업창1','width=880px,height=880px,left='+popupX+',top='+ popupY);   
   }
   var d = new Date();
   var today = d.getFullYear()+'년'+(d.getMonth()+1)+'월'+d.getDate()+'일';
   var month = d.getMonth()+1;
   var date = d.getDate();
   if(d.getMonth()+1<10){month ='0'+(d.getMonth()+1)}
   if(d.getDate()<10){date ='0'+d.getDate()}
   today = d.getFullYear() + '년 '+month+'월 '+date+'일 ';
   //$("#save").click(function(){ oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); $("#frm").submit(); })
   function choice(){
      window.open('/erp/draft_inner_choice','팝업창1','width=527px,height=360px,left='+popupX+',top='+ popupY);   
      /* $.ajax({
         url:"/erp/general_dBChoice"
         ,method:"post"
         ,success:function(data){
            $("#choice").html(data);
         }
         ,error:function(e){
            alert(e.responseText);
         }
      });    */
   }
    function jsonload(){
      var imsi_jsonData = $("#imsi_jsonData").val();
      var jsonData_c = JSON.parse(imsi_jsonData);
      if(jsonData_c.length>0){
         $("#team_name_1").val(jsonData_c[0].TEAM_NAME);
         $("#team_name_2").val(jsonData_c[1].TEAM_NAME);
         $("#team_name_3").val(jsonData_c[2].TEAM_NAME);
         $("#team_name_4").val(jsonData_c[3].TEAM_NAME);
          $.ajax({
             url:"/erp/draft_choice?choice="+jsonData_c[0].EMP_NAME+" "+jsonData_c[0].EMP_LEVEL
            ,method:"get"
            ,success:function(data){
               $("#choice_td").html(data);
            }
         }); 
         $("#emp_name_2").val(jsonData_c[1].EMP_NAME+' '+jsonData_c[1].EMP_LEVEL);
         $("#emp_name_3").val(jsonData_c[2].EMP_NAME+' '+jsonData_c[2].EMP_LEVEL);
         $("#emp_name_4").val(jsonData_c[3].EMP_NAME+' '+jsonData_c[3].EMP_LEVEL);
         $("#access_1").val("대기중");
         $("#access_2").val("대기중");
         $("#access_3").val("대기중");
         $("#access_4").val("대기중");
         $("#first_permission").val(jsonData_c[0].EMPNO);
         $("#seccond_permission").val(jsonData_c[1].EMPNO);
         $("#third_permission").val(jsonData_c[2].EMPNO);
         $("#forth_permission").val(jsonData_c[3].EMPNO);
      }
   } 
</script>
</head>
<body>
<%
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
   String s_emp_no = null;
   String s_emp_pw = null;
   String s_emp_name = null;
   String s_outtime = null;//아직 프로시저 수정 중
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
   if(session.getAttribute("s_emp_no")!=null && session.getAttribute("s_emp_pw")!=null
      && session.getAttribute("s_emp_name")!=null && session.getAttribute("s_outtime")!=null){
      s_emp_no = session.getAttribute("s_emp_no").toString();
      s_emp_pw = session.getAttribute("s_emp_pw").toString();
      s_emp_name = session.getAttribute("s_emp_name").toString();
      s_outtime = session.getAttribute("s_outtime").toString();
   }
%>                            
<!--=====================================메인 테이블 시작==================================-->
         <form id="f_draft_basic">
<!--          <input type="hidden" id="hd_title" name="hd_title"> -->
         <input type="hidden" id="s_emp_no" name="s_emp_no" value="<%=s_emp_no%>">
         <div style="height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
            <h1>기 안 서<span style="font-size:30px">(기본)</span></h1>
         <table style="height:780px;margin-right:100px" border="1px solid"> 
               <tbody style="text-align:center;font-size:15px;">            
                  <tr>
                     <td style="width:33%;height:40px;background:#dee2e6">&nbsp;문&nbsp;서&nbsp;종&nbsp;류&nbsp;</td>
                     <td style="width:33%;"><input name="draft_kind" type="text" value="공통-기안서(기본)" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
                     <td style="width:33%;" rowspan="3">
                        <table style="width:100%;height:100%;" frame="void" border="1px solid red">
                           <tr style="height:25%">
                              <td rowspan="3" style="width:20%;background:#dee2e6">&nbsp;결&nbsp;재&nbsp;</td>
                              <td style="width:20%">
                                 <input type="text" id="team_name_1" name="team_name_1" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="first_permission" name="first_permission" value="">
                              </td>
                              <td style="width:20%">
                                 <input type="text" id="team_name_2" name="team_name_2" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="seccond_permission" name="seccond_permission" value="">
                              </td>
                              <td style="width:20%">
                                 <input type="text" id="team_name_3" name="team_name_3" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="third_permission" name="third_permission" value="">
                              </td>
                              <td style="width:20%">
                                 <input type="text" id="team_name_4" name="team_name_4" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="forth_permission" name="forth_permission" value="">
                              </td>
                           </tr>
                           <tr style="height:50%">
                              <td id="choice_td">
                                 <a href="javascript:choice()" style="color:black; cursor:pointer;color: black; cursor: pointer; border: 1px solid gray; padding-top: 3px; padding-right: 5px; padding-bottom: 3px; padding-left: 5px; background-color: lightgray; font-size: 14px;font-weight: 600;" id="emp_name_1">선택</a>
                              </td>
                              <td>
                                 <input type="text" id="emp_name_2" name="emp_name_2" style="border: none;text-align: center;" value="">
                              </td>
                              <td>
                                 <input type="text" id="emp_name_3" name="emp_name_3" style="border: none;text-align: center;" value="">
                              </td>
                              <td>
                                 <input type="text" id="emp_name_4" name="emp_name_4" style="border: none;text-align: center;" value="">
                              </td>
                           </tr>
                           <tr style="height:25%">
                              <td>
                                 <input type="text" id="access_1" name="access_1" style="border: none;text-align: center;" value="">
                              </td>
                              <td>
                                 <input type="text" id="access_2" name="access_2" style="border: none;text-align: center;" value="">
                              </td>
                              <td>
                                 <input type="text" id="access_3" name="access_3" style="border: none;text-align: center;" value="">
                              </td>
                              <td>
                                 <input type="text" id="access_4" name="access_4" style="border: none;text-align: center;" value="">
                              </td>
                           </tr>
                        </table>
                     </td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">&nbsp;기&nbsp;안&nbsp;일&nbsp;</td>
                     <td><script>document.write(today)</script></td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">&nbsp;작&nbsp;성&nbsp;자&nbsp;</td>
                     <td style="text-align:center">
                        <input type="text" name="writer" value="<%=s_emp_name%>" style="border:none;outline:none;text-align:center" onfocus="this.blur()">
                     </td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">&nbsp;제&nbsp;목&nbsp;</td>
                     <td style="" colspan="2"><input name="db_title" id="db_title" style="width:98%" type="text"></td>
                  </tr>                                                                                                  
                  <tr>
                     <td colspan="3">      
                     <div>
                        <textarea name="ir1" id="ir1" rows="24" cols="116">
                        </textarea>   
                     </div>                   
                     </td>
               	  </tr>           
               </tbody>
         </table>
            <div style="margin-top:4px;margin-right:4px;text-align:right;width: 917px;">
               <input type="button" onclick="save()" value="저장">                 
               <button>닫기</button>                 
            </div>
         </div>
         <input type="hidden" id="imsi_jsonData" value="">
         </form>
         
<!--=====================================메인 테이블 끝==================================-->

<script type="text/javascript">
   var oEditors = [];
   nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "/erp/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
   });
</script>   
</body>
</html>