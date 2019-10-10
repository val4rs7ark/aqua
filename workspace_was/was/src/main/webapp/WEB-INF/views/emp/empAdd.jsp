<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%@ page import="com.util.PageBar" %>
<%
		//총 로우 갯수
		int tot = 0;
		if(session.getAttribute("s_tot")!=null){
			tot = Integer.parseInt(session.getAttribute("s_tot").toString());
			//out.print(tot);
		}
		int size = 0;
		List<Map<String,Object>> rList = 
		      (List<Map<String,Object>>)request.getAttribute("eList");
		Map<String,Object> scMap = (Map<String,Object>)request.getAttribute("scMap");
		if(rList !=null && rList.size()>0){
		   size = rList.size();
		}
		///////////////// 페이지 네이션 /////////////////
		int numPerPage = 11; //페이지당 로우 수 
		int nowPage = 0; //현재 페이지
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>WAS,AQUA - 사원등록</title>
<meta charset="utf-8">
<!-- 아직 수정중.... 0928 -->
<%@ include file="/common/bootStrap4.jsp" %>
<%@ include file="/common/styles.jsp" %>
	<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<style type="text/css">
	input[id=btn_save] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}
	input[id=btn_search] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}
	input[id=btn_cancel] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}
	input[id=btn_del] {
	  background-color: #343A40;
	  border: 0;
	  border-radius: 4px;
	  cursor: pointer;
	  color: #fff;
	  font-size:15px;
	  line-height: 1.1;
	  padding: 9px;
	  width: 55px
	}
	</style>
	<script type="text/javascript">
	//삭제 로직을 위한 체크박스 empno 값 담을 변수
	var tg_del;
	var s_empno;
	var s_empname;
	//수정된 텍스트박스가 있는지 감지하기 위한 변수
	var textChang=0;
	
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#postcode1").val(data.postcode1);
					jQuery("#postcode2").val(data.postcode2);
					jQuery("#zonecode").val(data.zonecode);
					jQuery("#address").val(data.address);
					jQuery("#address_etc").focus();
					console.log(data);
				}
			}).open();
		}
		function saveZipcode(){
			var zipcode =$("#zonecode").val();
			$("#zipcode").val(zipcode);
			var adrr1 = $("#address").val();
			var adrr2 = $("#address_etc").val();
			$("#adrr1").val(adrr1);
			$("#adrr2").val(adrr2);
		}
		//사원목록 로우 클릭시 empno 값 가져다가  사원등록에 뿌리는 ajax처리
		function C_selectEmp(data){
			var empno = $("#s_empname"+data).val();
			alert(empno);
			 $.ajax({
				method:"get"
				,url:"empSelect.was?empno="+empno
			    ,success:function(data){
			    	$("#empAddRight").html(data);
			    }		
			}); 
		}
		//핸드폰 번호에 하이픈 추가해주는 메소드(onChange)
		function set_hp(){
			var temp = $("#emp_hp").val();
			var imsi = temp.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3" );
			$("#emp_hp").val(imsi);
		}
		//사원 수정 내역쪽에서 핸드폰 번호 하이픈 추가해주는 메소드(onChange)
		function R_set_hp(){
			var temp = $("#emp_hp").val();
			var imsi = temp.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3" );
			$("#emp_hp").val(imsi);
			textChange();
		}
		//수정 버튼 누르기 전, 수정된 텍스트 항목이 있는지 감지
		function textChange(){
			textChang = 1;
			//alert("체인지!");
		}
		//수정 버튼 - empAddRight.jsp
		function updateAction(){
			if(textChang==1){
				$("#f_empUPD").attr("method","post");
				$("#f_empUPD").attr("action","/erp/empUPD.was");
				$("#f_empUPD").submit();
			}
			else if(textChang==0){
				confirm("수정할 내용이 없습니다.");
				location.href="empListSignUp.was";
			}
		}
		//체크박스 클릭시 선택한 로우 EMPNO값 가져오기
		function targetDel(data){
			tg_del = data;
		}
		//체크박스 선택 후 삭제버튼
		function empDel(){
			alert(tg_del);
	    	location.href="empDel.was?tg_del="+tg_del;
		}
		//저장 옆 취소버튼
		function cancel(){
			 alert("cancel호출");
			 location.href="empListSignUp.was";
		}
		function btn_search(){
			var v_search_keyword_key = $("#search_keyword_key").val();
			var v_search_keyword_val = $("#search_keyword_val").val();
			var v_search_date_key = $("#search_date_key").val();
			var v_emp_date_1 = $("#emp_date_1").val();
			var v_emp_date_2 = $("#emp_date_2").val();
			alert("서치버튼");
			$.ajax({
				method:"get"
				,url:"empSearch.was"
				,data :"search_keyword_key="+v_search_keyword_key+"&search_keyword_val="+v_search_keyword_val+
					   "&search_date_key="+v_search_date_key+"&emp_date_1="+v_emp_date_1+
					   "&emp_date_2="+v_emp_date_2
				,success:function(data){
					alert("아작스 석세스");
				    $("#t_empList").html(data);
				 }	
			}); 
		}
		
		$(document).ready(function() {
			//최상단 체크박스 클릭
			$("#checkall").click(function() {
				//클릭되었으면
				if ($("#checkall").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input[name=checkbox]").prop("checked", true);
					//클릭이 안되있으면
				} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input[name=checkbox]").prop("checked", false);
				}
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
<div class="row">
    <!-- ========================================검색창 ================================ -->
  <div class="w3-container" style="margin-top: 30px; height: 80px;width:100%">
  <div class="box-container" style="margin-top: 30px; height: 40px;" align="center">
  <div id="box">
  <table>
     <thead>
        <th>
           <td>
              <td style="width:14%"> 
				<select id="search_keyword_key" class="btn btn-dark dropdown_bs" style="width:130px;height:35px">
				      <option selected>검색 키워드</option>
				      <option value="dept_name">부서명</option>
				      <option value="emp_name">사원명</option>
				      <option value="empno">사원번호</option>
	 			</select>
 			</td> 
           </td>
           <td>
              <input type="text" id="search_keyword_val" class="form-control" width="150px;" height="35px;">
           </td>
        </th>
        <th>
           <td>
           		<select id="search_date_key" class="btn btn-dark dropdown_bs" style="width:115px;height:35px">
           		   	<option selected>입사/퇴사</option>
				      <option value="emp_indate">입사일자</option>
				      <option value="emp_outdate">퇴사일자</option>
	 			</select>
           </td>
           <td>
              <input type="date" id="emp_date_1" class="form-control">
           </td>
           <td><i class="fas fa-minus-square" style="font-size:36px" valign="center"></i></td>
           <td>
              <input type="date" id="emp_date_2" class="form-control">
           </td>
           <td><input id="btn_search" type="submit" value="조회" onClick="javascript:btn_search()"></td>
        </th>
     </thead>
  </div>
  </div>
  </table>
  </div>
  </div>
  </div>
    <!-- ========================================검색창 메인모양================================ -->

 <!-- 
================================================================================================================================
												사원목록 부분(왼쪽) 
================================================================================================================================
-->
<div class="col-sm-6">
 <div class="card bg-dark text-white" style="height:50px;margin-top: 5px;">
  <div class="card-body" style="height:30px;">사원목록</div>
  </div>
  <table id="t_empList" class="table table-striped">
    <thead>
      <tr>
      	<th><input id="checkall" type="checkbox" ></th>
        <th>사원번호</th>
        <th>사원명</th>
        <th>부서명</th>
        <th>핸드폰번호</th>
      </tr>
    </thead>
    <tbody>
<%
   if(size==0){
%>    
       <tr>
          <td colspan="6">조회 결과가 없습니다.</td>
       </tr>
<%
   }
   else if(size>0){
	   for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
		   if(size == i) break;
		   Map<String,Object> rMap = rList.get(i);
%>
		<tr>
			<td>
				<input id="checkbox" name="checkbox" type="checkbox" onClick="targetDel('<%=rMap.get("EMPNO")%>')">
			</td>
			
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empno<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMPNO") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_empname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_deptname<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("DEPT_NAME") %></td>
			<td onClick="C_selectEmp(<%=i%>)"><input type="hidden" id="s_emphp<%=i %>" value="<%=rMap.get("EMPNO") %>"/><%=rMap.get("EMP_HP") %></td>
		</tr>
<% 
	   }
   }
%>      
    </tbody>
  </table>
	<input id="btn_del" type="button" value="삭제" onclick="javascript:empDel()">
</div>
 <!-- 
================================================================================================================================
												사원등록 부분(오른쪽)
================================================================================================================================
-->
<div class="col-sm-6" id="empAddRight">
 <div class="card bg-dark text-white" style="height:50px;margin-top: 5px;">
    <div class="card-body">사원등록</div>
  </div>
  <form id="f_empAdd" method="post" action="/erp/empSignUp.was">
  <input type="hidden" name="gap" value="1"> <!-- spring에서는 @RequestParam이 알아서 Map담아주는데 pojo는 커스텀으로 Map으로 강제로 담은행위인데 get post 다르게처리해야해서 -->
  <table class="table table-striped">
	<tr>
		<td style="width:15%; padding-top:14px; padding-bottom:9px;">&nbsp;사원명&nbsp;</td>
		<td align="left" style="width:15%;padding-top:7px; padding-bottom:7px;">
			<input type="text" class="form-control" style="width:80%;" placeholder="&nbsp;사원명" id="emp_name" name="emp_name" 
				 required oninvalid="this.setCustomValidity('사원명을 작성해주십시오.')" oninput="setCustomValidity('')">
		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">영문성명</td>
		<td align="left" style="padding-top:6px; padding-bottom:6px;">
			<input type="text" class="form-control" style="height:35px;width:80%;" placeholder="&nbsp;영문성명" name="emp_engname">
		</td>
	</tr>
	<tr>
		<td style="width:15%; padding-top:14px; padding-bottom:9px;">전화번호</td>
		<td colspan="3" align="left" style="width:15%;padding-top:7px; padding-bottom:7px;">
			<input type="text" class="form-control" style="height:35px;width:230px;font-size:8pt;" placeholder="'-'를 제외한 숫자만 입력하시오" 
					id="emp_hp" name="emp_hp" onchange="javascript:set_hp()"
					required oninvalid="this.setCustomValidity('전화번호를 작성해주십시오.')" oninput="setCustomValidity('')">
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">전역구분</td>
		<td colspan="3" style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_mili" class="custom-select" style="width:30%">
			      <option selected>선택하세요</option>
			      <option value="만기전역">만기전역</option>
			      <option value="미필">미필</option>
			      <option value="의가사">의가사</option>
			      <option value="현역부적합">현역부적합</option>
 			</select>
 		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">주민번호</td>
		<td align="left" colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input type="text" class="form-control" style="height:35px;width:30%;display:inline-block" 
					placeholder="&nbsp;주민등록번호" name="resident_no_1"
					required oninvalid="this.setCustomValidity('주민등록 번호를 작성해주십시오.')" oninput="setCustomValidity('')">
			<i><strong>-</strong></i>
			<input type="text" class="form-control" style="height:35px;width:30%;display:inline-block" name="resident_no_2">
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">우편번호</td>
		<td align="left" colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input id="zipcode" class="form-control" type="text" style="height:35px;width:30%;display:inline-block" 
					placeholder="&nbsp;버튼을 클릭하세요." name="emp_zipcode">
			<button type="button" class="btn btn-light" data-toggle="modal" data-target="#myModal_zip" 
					style="height:36px;width:auto;padding-left:2px;padding-right:2px;padding-top:3px">
			  <i id="btn_zipcode" style="font-size:28px;" class='far'>&#xf0e0;</i>
			</button>
		</td>
	</tr>
	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;주&nbsp;&nbsp;소&nbsp;</td>
		<td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">
			<input id="adrr1" class="form-control" type="text" style="height:35px;width:220px;display:inline-block" 
					placeholder="&nbsp;주소" name="emp_addr_1" >
			<input id="adrr2" class="form-control" type="text" style="height:35px;width:220px;display:inline-block"
					 name="emp_addr_2">
		</td>
	</tr>
	<tr>
        <td style="width:15%;padding-top:14px; padding-bottom:9px;">입사일자</td>
        <td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">                    
            <input class="form-control" type="date" id="emp_indate" name="emp_indate" style="height:35px;width:200px;display:inline-block"
            	required oninvalid="this.setCustomValidity('날짜를 선택해주십시오.')" oninput="setCustomValidity('')" >
            <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
        </td>
     </tr>
     <tr>   
        <td style="width:15%;padding-top:14px; padding-bottom:9px;">퇴사일자</td>
        <td colspan="3" style="padding-top: 6px; padding-bottom: 6px;">                    
            <input type="date" class="form-control" id="emp_outdate" name="emp_outdate" style="height:35px;width:200px;display:inline-block">
            <i class="fa fa-calendar-check-o" style="font-size:24px"></i>
        </td>
    </tr>
    	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">급여계좌</td>
		<td align="left" style="padding-top: 6px; padding-bottom: 6px;">
			<input type="text" class="form-control" style="height:35px;width:190px;font-size:8pt;display:inline-block" 
					placeholder="'-'를 제외한 숫자만 입력하시오" name="sal_account">
		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;은&nbsp;&nbsp;행&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_bank" class="custom-select" style="width:130px"  >
			      <option selected>선택하세요</option>
			      <option value="국민">국민</option>
			      <option value="농협">농협</option>
			      <option value="신한">신한</option>
			      <option value="하나">하나</option>
			      <option value="스탠다드차타드">스탠다드차타드</option>
 			</select>
 		</td>
	</tr>
    <tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;부서명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="dept_code" class="custom-select" style="width:130px"  >
			      <option selected>선택하세요</option>
			      <option value="Z001">배송부</option>
			      <option value="B001">총무부</option>
			      <option value="D001">생산부</option>
			      <option value="C001">영업부</option>
 			</select>
 		</td>
 		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;팀&nbsp;&nbsp;명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="team_name" class="custom-select" style="width:130px">
			      <option selected>선택하세요</option>
			      <option value="배송1팀">배송1팀</option>
			      <option value="배송2팀">배송2팀</option>
			      <option value="배송3팀">배송3팀</option>
			      <option value="총무1팀">총무1팀</option>
			      <option value="생산1팀">생산1팀</option>
			      <option value="생산2팀">생산2팀</option>
			      <option value="생산3팀">생산3팀</option>
			      <option value="영업1팀">영업1팀</option>
			      <option value="영업2팀">영업2팀</option>
 			</select>
 		</td>
	</tr>

	<tr>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;직급명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_level" class="custom-select" style="width:130px">
			      <option selected>선택하세요</option>
			      <option value="사원">사원</option>
			      <option value="대리">대리</option>
			      <option value="부장">부장</option>
			      <option value="차장">차장</option>
			      <option value="팀장">팀장</option>
 			</select>
 		</td>
		<td style="width:15%;padding-top:14px; padding-bottom:9px;">&nbsp;직책명&nbsp;</td>
		<td style="padding-top: 6px; padding-bottom: 6px;"> 
			<select name="emp_position" class="custom-select" style="width:130px">
			      <option selected>선택하세요</option>
			      <option value="팀원">팀원</option>
			      <option value="팀장">팀장</option>
			      <option value="생산부장">생산부장</option>
			      <option value="영업부장">영업부장</option>
			      <option value="총무부장">총무부장</option>
			      <option value="배송부장">배송부장</option>
			      <option value="대표">대표이사</option>
 			</select>
 		</td>
		
	</tr>
	<tr>
		<td colspan="4" align="right">
			<input id="btn_cancel" type="button" value="취소" onclick="javascript:cancel()"> 
			<input id="btn_save" type="submit" value="저장">
		</td>
	</tr>
  </table>
  </form>
</div>
<!-- 
================================================================================================================================
												Pagination (페이지네이션)
================================================================================================================================
-->
<div class="container" style="margin-left: 0px;">
  <ul class="pagination" style="justify-content: center;">
	<%		
			String keyward = null; 
			String befor_date_ud = null; 
			String after_date_ud = null; 
			String cb_situation = null; 
			/* if(scMap.get("keyword")!=null){
				keyward = scMap.get("keyword").toString();
			}
			if(scMap.get("befor_date_ud")!=null){
				befor_date_ud = scMap.get("befor_date_ud").toString();
			}
			if(scMap.get("after_date_ud")!=null){
				after_date_ud = scMap.get("after_date_ud").toString();
			}
			if(scMap.get("after_date_ud")!=null){
				after_date_ud = scMap.get("after_date_ud").toString();
			}
			if(scMap.get("cb_situation")!=null){
				cb_situation = scMap.get("cb_situation").toString();
			} */
			String pagePath = "/erp/empListSignUp.was";
			PageBar pb = new PageBar(numPerPage,tot,nowPage,pagePath);
			String pagination = null;
			pagination = pb.getPageBar();
			out.print(pagination);
	%>
  </ul>
</div>

</div>
</div>
</div>
</div>
<!-- 
================================================================================================================================
												Modal 다이얼로그 창 (우편번호 검색기)
================================================================================================================================
-->
<div class="modal fade" id="myModal_zip" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
			<h3>우편번호 검색</h3>
			<input id="postcode1" type="text" value="" style="width:50px; margin-top:10px;" readonly/>
			&nbsp;-&nbsp;
			<input id="postcode2" type="text" value="" style="width:50px;" readonly/>
			&nbsp;&nbsp;
			<input id="zonecode" type="text" value="" style="width:70px;" readonly/>
			&nbsp;
			<button class="btn btn-dark" onClick="openDaumZipAddress();"style="height:39px;">우편번호</button>
			<br/>
			<input type="text" id="address" value="" style="width:240px; margin-top:5px;" readonly/>
			<input type="text" id="address_etc" value="" style="width:200px;"/>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="saveZipcode();" data-dismiss="modal">저장</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>

</body>
</html>
