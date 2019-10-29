<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%@ page import="com.util.PageBar" %>
<%
      int size = 0;
      List<Map<String,Object>> rList = 
            (List<Map<String,Object>>)request.getAttribute("rList");
      Map<String,Object> pl_Map = (Map<String,Object>)request.getAttribute("pl_Map");
      int tot = (int)request.getAttribute("tot");
      if(rList !=null && rList.size()>0){
         size = rList.size();
      }
      //////////페이지 네비게이션 추가분////////////
      int numPerPage = 10; //한 페이지당 뿌려질 로우갯수
      int nowPage = 0;     //현재 페이지
      if(request.getParameter("nowPage")!=null){
         nowPage = Integer.parseInt(request.getParameter("nowPage"));
      }
      //out.print(rList);
      //out.print(pl_Map);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
<title>생산품 등록/조회</title>
<script type="text/javascript">
   function getSelectValue(result){
      result.ship_code.value    = result.shipcode.options[result.shipcode.selectedIndex].value;
      result.ivgroup_code.value = result.ivgroup_name.options[result.ivgroup_name.selectedIndex].value;
   }
   function productSearch(){
      //alert("조회검색");
      $("#tb_Search").attr("method","post");
      $("#tb_Search").attr("action","/erp/productList");
      $("#tb_Search").submit();
   }
   function prod_Insert() {
      //alert("등록");
      $("#productAdd").submit();
   }
   function prod_delete(){
      //alert("삭제");
      var chk = document.getElementsByName("chk");
      var len = chk.length;//체크박스의 전체 개수
      var checkRow = '';//체크된 체크박스의 value를 담기위한 변수 
      var checkCnt = 0;//체크된 체크박스의 개수
      var checkLast = '';//체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
      var rowid = '';//체크된 체크박스의 모든 value 값을 담는다
      var cnt = 0;        
      for(var i=0; i<len; i++){//12
         if(chk[i].checked == true){//체크가 되어있는 값 구분
            checkCnt++;//체크된 체크박스의 개수
            checkLast = i;//체크된 체크박스의 인덱스
         }
      } 
      for(var i=0; i<len; i++){//12
         if(chk[i].checked == true){//체크가 되어있는 값 구분
            checkRow = chk[i].value;//체크 되어있는 값을 checkRow에 담기
            if(checkCnt == 1){//체크된 체크박스의 개수가 한 개 일때,
               rowid += checkRow;//'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
            }else{//체크된 체크박스의 개수가 여러 개 일때,
               if(i == checkLast){//체크된 체크박스 중 마지막 체크박스일 때,
                  rowid += checkRow;//'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
               }else{
                  rowid += checkRow+",";//'value',의 형태 (뒤에 ,(콤마)가 붙게)                  
               }
               //alert(rowid+"둘");
            }
            cnt++;
            checkRow = '';//checkRow초기화.
         }
      }
      location.href="/erp/productDelete?rowid="+rowid;
      //alert(rowid);
   }
   
   $(document).ready(function() {
      //최상단 체크박스 클릭
      $("#checkall").click(function() {
         //alert("click");
         //클릭되었으면
         if ($("#checkall").prop("checked")) {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=chk]").prop("checked", true);
            //클릭이 안되있으면
         } else {
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=chk]").prop("checked", false);
         }
      });
      
      // 테이블의 Row 클릭시 값 가져오기
      $("#prod_List tr").click(function(){    
         var str = ""
         var tdArr = new Array();   // 배열 선언
         // 현재 클릭된 Row(<tr>)
         var tr = $(this);
         var td = tr.children();
         // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
         // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
         td.each(function(i){
            tdArr.push(td.eq(i).text());
         });
         // td.eq(index)를 통해 값을 가져올 수도 있다.
         var supso_no_r = td.eq(1).text();//번호
         var ivgroup_code = td.eq(2).text();//재고코드
         var ivgroup_name = td.eq(3).text();//상품명
         var empno = td.eq(4).text();//사원번호
         var emp_name = td.eq(5).text();//사원명
         var supso_startdate = td.eq(6).text();//출항일
         var supso_enddate = td.eq(7).text();//입항일
         var supso_count = td.eq(8).text();//생산수량
         var supso_date = td.eq(9).text();//등록일
         var ship_code = td.eq(10).text();//어선코드 
         $.ajax({
               method:"get"
               ,url:"productsDetail?supso_no_r="+supso_no_r
               ,success:function(data){
                  /* alert("수정");
                  alert("data:"+data); */
                  $("#product_UPD").html(data);
               }
               /* ,error: function (request, status, error){ */        
               ,error: function (jqXHR, exception){
                  /* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);  */
                   var msg = '';
                    if (jqXHR.status === 0) {
                        msg = 'Not connect.\n Verify Network.';
                    } 
                    else if (jqXHR.status == 404) {
                        msg = 'Requested page not found. [404]';
                    } 
                    else if (jqXHR.status == 500) {
                        msg = 'Internal Server Error [500].';
                    } 
                    else if (exception === 'parsererror') {
                        msg = 'Requested JSON parse failed.';
                    } 
                    else if (exception === 'timeout') {
                        msg = 'Time out error.';
                    } 
                    else if (exception === 'abort') {
                        msg = 'Ajax request aborted.';
                    } 
                    else {
                        msg = 'Uncaught Error.\n' + jqXHR.responseText;
                    }
                    $('#product_UPD').html(msg);
                   
               }
         });
      });
   });
</script>
</head>
<body>
<div class="container-fluid">
<div class="row">
   <div style="width:20%">
      <%@ include file="/common/MenuCommon.jsp" %>
    </div>
  <div style="width:78%">
  
  <!-- ======================================================================================================================================
                                                  생산품 상세검색 영역 시작
        ======================================================================================================================================= -->
  <form id="tb_Search">
  <div class="card bg-dark text-white" style="height:50px; margin-top:15px">
       <div class="card-body" style="font-size:20px;display:table">
          <div style="display:table-cell;valign:middle;">생산품 등록 조회</div>
       </div>
     </div>
     <div class="row">
   </div>  
  <table class="table table-hover" style="background-color:#F1F1F1; height:30px;">
   <td style="width:150px;">
      <select class="form-control" id="ivgroup_search" name="ivgroup_search" align="center" 
              style="background-color:#FFFFFF; width:150px; padding-right:0px; padding-left:0px;">
        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;생산품 선택</option>
        <option value="Z00011">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;광어</option>
        <option value="Z00012">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오징어</option>
        <option value="Z00013">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;돔</option>
        <option value="Z00014">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참치</option>
      </select>
   </td>
   <td style="width:150px;">
     <select class="form-control" id="ship_search" name="ship_search" align="center" 
             style="background-color:#FFFFFF; width:150px;">
        <option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어선 선택</option>
        <option value="S00001">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태양호</option>
        <option value="S00002">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;참수리</option>
        <option value="S00003">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태극호</option>
        <option value="S00004">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오양호</option>
        <option value="S00005">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동해호</option>
     </select>
   </td style="width:150px;">
   <td style="width:150px;"><button type="button" class="form-control">출항일</button></td>
   <td style="width:150px;"><input type="date" id="before_date" name="before_date" class="form-control"></td>
   <td style="width:50px;"><i class='fas fa-minus-square' style='font-size:36px'/></td>
   <td style="width:150px;"><button type="button" class="form-control">입항일</button></td>
   <td style="width:150px;"><input type="date" id="after_date" name="after_date" class="form-control"></td>
   <td><button onclick="javascript:productSearch()" class="form-control" style="float: right; width:70px; margin-right: 300px;">조회</button></td>
  </table>
  </form>
  <hr>
  
  <!-- ======================================================================================================================================
                                                  생산품 상세검색 영역 끝
        ======================================================================================================================================= -->
    <div class="row">
  <!-- ========================================================================================================================================
                                                   생산품 등록 및 상세보기 영역
        ======================================================================================================================================== -->
   <div class="col-md-3">
        <form id="productAdd" action="/erp/productInsert" method="get">
        <!-- spring일 때는 없어도 됨. pojo에서:get방식인지 post방식인지 구분하기 위해서 -->
        <input type="hidden" name="gap" value="0">
        <!-- <input id="table_gubun" type="hidden" value="1"> -->
        <div id="product_UPD" style="margin-top: -10px;">
          <button type="button" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
                border-color: #efefef;font-size:15px;font-weight:900;margin-left: 13px;height: 33px;width: 100px;" 
                onclick="location.href='javascript:prod_delete()'">삭제</button>
          <button type="button" class="btn btn-dark" style="background: #efefef;padding: 3px 3px 3px 3px;color:black;
                border-color: #efefef;font-size:15px;font-weight:900;margin-left: 13px;height: 33px;width: 100px;" 
                onclick="location.href='javascript:prod_Insert()'">등록</button>
          <table class="table table-hover" style="width: 345px; margin-top: 10px; margin-left: 15px;" data-options="multiSelect:'true',toolbar: '#productUPD'">
          <thead">
            <tr>
              <h5><td colspan="4" style="height:50px; background-color: #F1F1F1; 
                      color:black; font-size:17px; text-align:center; -webkit-text-stroke-width: medium;">생산품 등록</td></h5>     
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="font-size:17px; text-align:center;"><strong>사원번호</strong></td>
              <td><input class="form-control" id="empno" name="empno" type="text" style="width:180px; background-color: #efefef; 
                      color:black; font-size:17px;text-align:center;"value=<%=s_emp_no%> readonly="false"/></td>
            </tr>
            <tr>
              <td style="text-align:center;"><strong>사원명</strong></td>
              <td><input class="form-control" id="emp_name" name="emp_name" type="text" style="width:180px;background-color: #efefef; 
                      color:black; font-size:17px;text-align:center;"value=<%=s_emp_name%> readonly="false"></td>
            </tr>
            <tr>
              <td style="width:20%; font-size:17px; text-align:center;"><strong>어선</strong></td>
              <td style="width:25%;">
                 <select class="form-control" id="shipcode" name="shipcode" onChange="getSelectValue(this.form);" 
                         style="background-color:#FFFFFF; width:180px;">
                 <option value="S00001">&nbsp;태양호</option>
                 <option value="S00002">&nbsp;참수리</option>
                 <option value="S00003">&nbsp;태극호</option>
                 <option value="S00004">&nbsp;오양호</option>
                 <option value="S00005">&nbsp;동해호</option>
                </select>
           </td>
           </tr>
           <tr>
              <td style="width:30%; font-size:17px; text-align:center;"><strong>어선코드</strong></td>
              <td style="width:25%;"><input class="form-control" id="ship_code" name="ship_code" type="text" style="width:180px;"/></td>
            </tr>
            <tr>
              <td style="width:20%; font-size:17px; text-align:center;"><strong>생산품</strong></td>
              <td style="width:25%;">
               <select class="form-control" id=ivgroup_name" name="ivgroup_name" onChange="getSelectValue(this.form);" 
                       style="background-color:#FFFFFF;width:180px;">
                 <option value="Z00011">&nbsp;광어</option>
                 <option value="Z00012">&nbsp;오징어</option>
                 <option value="Z00013">&nbsp;돔</option>
                 <option value="Z00014">&nbsp;참치</option>
               </select>
            </td>
          </tr>
          <tr>
            <td style="width:30%; font-size:17px; text-align:center;"><strong>생산코드</strong></td>
              <td style="width:25%;"><input class="form-control" id="ivgroup_code" name="ivgroup_code" type="text" style="width:180px;"/></td>
            <tr>
              <td style="font-size:17px; text-align:center;"><strong>수량/무게</strong></td>
              <td><input class="form-control" id="supso_count" name="supso_count" type="text" 
                         style="width:180px; display:inline-block;"/>&nbsp;<font size="5" face="맑은고딕">t</font></td>
            </tr>
            <tr>
              <td style="font-size:17px; width:20%; text-align:center;"><strong>출항일</strong></td>
              <td style="width:25%;">
               <input class="form-control" id="supso_startdate" name="supso_startdate" placeholder="YYYY/MM/DD" type="date" style="width:180px; display:inline-block;"/>
            </td>
           </tr>
           <tr>
              <td style="font-size:17px; width:20%; text-align:center;"><strong>입항일</strong></td>
              <td style="width:25%;">
               <input class="form-control" id="supso_enddate" name="supso_enddate" placeholder="YYYY/MM/DD" type="date" style="width:180px;"/>
            </td>
            </tr>
          </tbody>
        </table>
        </div>
      </form>
   </div>
  <!-- ===================================================================================================================================
                                                  생산품 상세보기 영역 끝
        ==================================================================================================================================== -->
     
  <!-- <div class="row"> -->
   <div class="col-md-9">

  <!-- ====================================================================================================================================
                                                    생산품 목록 영역 시작
       ==================================================================================================================================== -->


      <table class="table table-hover" id="prod_List" style="margin: 33px; margin-left: 0px; width:1000px;
             color:black; font-size:17px;text-align:center;">   
         <thead>
         <tr style="width:1000px; height:50px; background-color: #F1F1F1; color:black; font-size:17px;text-align:center;">
            <td>
            <div class="checkbox checkbox-primary">
             <input id="checkall" name="chk" type="checkbox" check>
            </div>
            </td> 
            <!-- <td>No.</td> -->
            <td style="-webkit-text-stroke-width: medium; text-align:center;">N0.</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;">생산품명</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;">사원번호</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;">출항일</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;">입항일</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;">생산수량</td>
            <td style="-webkit-text-stroke-width: medium; text-align:center;display:none;">등록일</td>
         </tr>
         </thead>
         <tbody>
<%
   if(size==0){
%>    
          <tr>
             <td colspan="6">조회결과가 없습니다.</td>
          </tr>
<%
   }
   else if(size>0){
      for(int i=0;i<size;i++){
         if(size == i) break;
         Map<String,Object> rMap = rList.get(i);
%>
         <tr style="text-align:center; width:300px; height:60px;">
            <td>
            <div class="checkbox checkbox-primary">
               <input id="chk" name="chk" type="checkbox" value="<%=rMap.get("SUPSO_NO_R")%>">
            </div>
            </td>
            <%-- <td><%=rMap.get("SNO") %></td> --%>
            <td><%=rMap.get("SUPSO_NO_R") %></td>
            <td><%=rMap.get("IVGROUP_NAME") %></td>
            <td><%=rMap.get("EMPNO") %></td>
            <td style="display:none;"><%=rMap.get("EMP_NAME") %></td>
            <td><%=rMap.get("SUPSO_STARTDATE") %></td>
            <td><%=rMap.get("SUPSO_ENDDATE") %></td>
            <td><%=rMap.get("SUPSO_COUNT") %></td>
            <td style="display:none;"><%=rMap.get("SUPSO_DATE") %></td>
         </tr>
<% 
      }
   }
%> 
         </tbody>
      </table>
   </div>
     <hr>
     </div>
     <hr>
  <!-- ========================================================================================================================================
                                                  생산품 목록 영역 끝
       ======================================================================================================================================== -->

  <!-- ========================================================================================================================================
                                                  페이지네이션 영역 및 조건검색 시작 
       ======================================================================================================================================== -->
        <div class="container" style="margin-left: 0px; text-align: -webkit-center;">
       <table>
        <ul class="pagination" style="justify-content: center;">
         <%      
               String befor_date_ud = null; 
               String after_date_ud = null; 
               String ivgroup_search = null; 
               String ship_search = null; 
               if(pl_Map.get("befor_date_ud")!=null){
                  befor_date_ud = pl_Map.get("befor_date_ud").toString();
               }
               if(pl_Map.get("after_date_ud")!=null){
                  after_date_ud = pl_Map.get("after_date_ud").toString();
               }
               if(pl_Map.get("ivgroup_search")!=null){
                  ivgroup_search = pl_Map.get("ivgroup_search").toString();
               } 
               if(pl_Map.get("ship_search")!=null){
                  ship_search = pl_Map.get("ship_search").toString();
               } 
               String pagePath = "/erp/productList?befor_date="+befor_date_ud+"&after_date="+after_date_ud+"&ivgroup_search="+ivgroup_search+"&ship_search="+ship_search;
               PageBar pb = new PageBar(numPerPage,tot,nowPage,pagePath);
               String pagination = null;
               pagination = pb.getPageBar();
               out.print(pagination);
         %>
        </ul>
    </div> 
       <tr>
   </tr>
       </table>
       </div>
  <!-- ========================================================================================================================================
                                                  페이지네이션 영역 및 조건검색 종료 
       ======================================================================================================================================== -->
</div>
</div>
</div>
</body>
</html>