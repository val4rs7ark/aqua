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
         <div style="width:500px;height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
            <h1>기 안 서<span style="font-size:30px">(기본)</span></h1>
         <table style="width:500px;height:780px;margin-right:100px" border="1px solid"> 
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
                     <td></td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">&nbsp;작&nbsp;성&nbsp;자&nbsp;</td>
                     <td style="text-align:center">
                        <input type="text" name="writer" value="" style="border:none;outline:none;text-align:center" onfocus="this.blur()">
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
</body>
</html>