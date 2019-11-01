<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.Enumeration, java.util.Iterator" %>
<%
      /* 
      ====================================================================================================================
                                             이 페이지는 지금 수정 중입니다.
      ====================================================================================================================                                       
      */
         int size = 0;
         Map<String,Object> rMap = 
               (Map<String,Object>)request.getAttribute("productsDetail");
         /* if(rMap!=null && rMap.size()>0){//널이 아니고 사이즈가 0보다 클 때
            Object[] keys = rMap.keySet().toArray(); // 오브젝트 배열 타입인 keys 선언 , HashMap의 항목들의 키값과 값들을 출력하기
            for(Object key : keys){
            out.print("key :"+key.toString()+" , value :"+rMap.get(key.toString()));
            out.print("<br>");
            }
         }  */


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container-fluid">
<div class="row">
   <div style="width:20%">
      
    </div>
    <div style="width:80%">

       <div class="row">
  <!-- ========================================================================================================================================
                                                   생산품 등록 및 상세보기 영역
        ======================================================================================================================================== -->
         <div class="col-md-3">
         
              <table class="table table-hover" style="width: 345px; margin-top: 16px; margin-left: -61px;">
                <thead">
                  <tr>
                    <h5><td colspan="4" style="height:50px; background-color: #F1F1F1; 
                            color:black; font-size:17px; text-align:center; -webkit-text-stroke-width: medium;"">생산품 등록</td></h5>     
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style="font-size:17px; text-align:center;"><strong>사원번호</strong></td>
                    <td><input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                             value="<%if(rMap.get("EMPNO")!=null) out.print(rMap.get("EMPNO")); %>" id="empno" /></td> 
                   </tr>
                   <tr>
                    <td style="width:20%; color:black; font-size:17px; text-align:center;"><strong>어선코드</strong></td>
                    <td style="width:25%;">
                       <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                               value="<%=rMap.get("SHIP_CODE") %>" id="ship_code" /></td>
                  </tr>
                  <tr>
                    <td style="width:20%; color:black; font-size:17px; text-align:center;"><strong>생산품</strong></td>
                    <td style="width:25%;">
                       <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                              value="<%=rMap.get("IVGROUP_NAME") %>" id="ivgroup_name" /></td>
                 </tr>
                 <tr>
                  <td style="width:20%; color:black; font-size:17px; text-align:center;"><strong>생산코드</strong></td>
                    <td style="width:25%;">
                       <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                               value="<%=rMap.get("IVGROUP_CODE") %>" id="ivgroup_code" />
                   </td>
                </tr>
                <tr>
                    <td style="width:22%; color:black; font-size:17px; text-align:center;"><strong>수량/무게</strong></td>
                    <td>
                       <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                              value="<%=rMap.get("SUPSO_COUNT") %>" id="ivgroup_count" />
                    </td>
                 </tr>
                 
                     
                  <tr>
                    <td style="width:20%; color:black; font-size:17px; text-align:center;"><strong>출항일</strong></td>
                    <td style="width:25%;">
                     <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                            value="<%=rMap.get("SUPSO_STARTDATE") %>" id="supso_startdate" />
                  </td>
                 </tr>
                 <tr>
                    <td style="width:20%; color:black; font-size:17px; text-align:center;"><strong>입항일</strong></td>
                    <td style="width:25%;">
                     <input class="form-control" style="width:180px; color:black; font-size:17px;text-align:center;"
                            value="<%=rMap.get("SUPSO_ENDDATE") %>" id="supso_enddate" />
                  </td>
                  </tr>
                </tbody>
            </table>
         </div>
  <!-- ===================================================================================================================================
                                                  		생산품 상세보기 영역 끝
        ==================================================================================================================================== -->
     
      </div>
   </div>

</body>
</html>
