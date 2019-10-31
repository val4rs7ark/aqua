<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="width:850px;height:780px;" border="1px solid" > 
               <tbody style="text-align:center;font-size:15px;">            
                  <tr>
                     <td style="width:15%;height:40px;background:#dee2e6">문서종류</td>
                     <td style="width:30%;"><input name="draft_kind" type="text" value="공통-기안서(기본)" style="border:none;outline:none;text-align:center" onfocus="this.blur()"></td>
                     <td style="width:55%;" rowspan="4">
                        <table style="width:100%;height:100%;" frame="void" border="1px solid red">
                           <tr style="height:25%">
                              <td rowspan="3" style="width:10%;background:#dee2e6">결<br><br>재</td>
                              <td style="width:18%">
                                 <input type="text" id="team_name_1" name="team_name_1" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="first_permission" name="first_permission" value="">
                              </td>
                              <td style="width:18%">
                                 <input type="text" id="team_name_2" name="team_name_2" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="seccond_permission" name="seccond_permission" value="">
                              </td>
                              <td style="width:18%">
                                 <input type="text" id="team_name_3" name="team_name_3" style="border: none;text-align: center;" value="">
                                 <input type="hidden" id="third_permission" name="third_permission" value="">
                              </td>
                              <td style="width:18%">
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
                     <td style="height:40px;background:#dee2e6">기안일</td>
                     <td><script>document.write(today)</script></td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">작성자</td>
                     <td style="text-align:center">
                        <input type="text" name="writer" style="border:none;outline:none;text-align:center" onfocus="this.blur()">
                     </td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">공개여부</td>
                     <td style="">
                        <table style="width:100%;height:100%" frame="void" border="1px solid red">
                           <tr>
                              <td style="width:33%">
                                 <select id="open_yubu" name="open_yubu" style="border: 1px solid darkgray; padding-top: 1px; padding-bottom: 2px; padding-left: 2px; padding-right: 2px;">
                                      <option value="1">공개</option>
                                      <option value="0">비공개</option>
                                 </select>
                              </td>
                              <td style="width:33%;">보존<br>기간</td>
                              <td style="width:33%;">5년</td>
                           </tr>
                        </table>
                     </td>
                  </tr>                                        
                  <tr>
                     <td style="height:40px;background:#dee2e6">제목</td>
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
</body>
</html>