<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
   <%@ include file="/common/bootStrap4.jsp" %>
<title>기안서 작</title>
<meta http-equiv="Content-Type" content="text/html;">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <%@ include file="/common/bs_css.jsp" %>
   
<title>Insert title here</title>
<script type="text/javascript" src="/erp/se2/js/service/HuskyEZCreator.js" charset="utf-8">
</script>
<script type="text/javascript">
	$(document).ready(function(){
/* 		oEditors.getById["#ir1"].exec("SET_IR", [""]); */
	});
/* 	$(function(){
	    //$("#dialog").dialog();
	    $("#열어줄element의id(ex.div)").dialog({
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
	    //id #...인 버튼을 클릭했을때 이벤트 발생
	    $("#").on("click",function(){
	        $("#ir1").dialog("open"); //다이얼로그창 오픈                
	    });
	}); */
	function save(){
		alert("save호출");
/* 		var imsi = $("#se_td").val();
		alert(imsi); */
		var title = $("#db_title").val();
		alert(title);
		var sb = "<td><input name='db_title' style='width:90%' type='text'>";
		sb += title;
		sb += "</td>";
		alert(sb);
		$("#hd_title").val(sb);
 		$("#f_draft_basic").attr("method","post");
		$("#f_draft_basic").attr("action","/erp/general_draftAdd");
		//$("#f_se_td").submit();
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); 
		$("#f_draft_basic").submit();
	}
	var popupX = (window.screen.width/2)-(900/2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(800/1.7);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	function manSelect(){
		alert("결재자 선택");
		window.open('./text.jsp','팝업창1','width=880px,height=880px,left='+popupX+',top='+ popupY);	
	}
	//$("#save").click(function(){ oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); $("#frm").submit(); })
</script>
</head>
<body>                            
<!--=====================================메인 테이블 시작==================================-->
			<form id="f_draft_basic">
			<input type="hidden" id="hd_title" name="hd_title">
			<div style="width:850px;height:780px;padding-left:0px;padding-right:0px;text-align:center;margin-left:10px;">
				<h1>기 안 서<span style="font-size:30px">(공통)</span></h1>
			<table border="1px solid black">
				<colgroup>
					<col class="eword_th_width">
					<col class="eword_td_min_width">
					<col class="eword_th_width">
					<col class="eword_td_min_width">
					<col style="width: 50%;">
					<!-- 문서번호, 결재선/협조선 -->
				</colgroup>
				<tbody>
					<tr class="eword_meta_height">
						<th style="border-top: none; border-left: none;">문서번호</th>
						<td class="pad15l" colspan="3" style="border-top: none;"><span
							id="sub_subject" style="display: inline;"> <input
								type="text" id="WordNo" name="WordNo" style="border: 0pt;"
								value="1910-XXXX" size="10" readonly="">
						</span> <span id="sub_subject1" style="display: none;"> <input
								type="text" id="WordNo1" name="WordNo" value="1910-XXXX"
								size="10">
						</span> <!-- 문서번호 등록 --> <input type="checkbox" id="AutoWordNo"
							name="AutoWordNo" value="1" class="form_transparent"
							onclick="getAutoWordNo()"> <span>문서번호 등록</span></td>

						<td rowspan="6" style="border-top: none; border-right: none;">
							<table border="1px solid black" id="eword_orderline" class="eword_meta">
								<colgroup>
									<col class="orderline_th_width">
									<col class="orderline_width" span="5">
									<!-- 결재선 -->
								</colgroup>
								<tbody>
									<tr class="txt_ce" style="height: 20px;">
										<th rowspan="3" style="border-left: none; border-top: none;">
											<!-- 결재선/협조선 제목 --> <!-- 결재 --> 결<br>
										<br>재
										</th>
										<!-- 결재자/협조자 직급 표시 영역 -->
										<td style="border-top: none;"><input type="text"
											name="OrderTitle1" value="사원" readonly=""
											class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td style="border-top: none;"><input type="text"
											name="OrderTitle2" value="상무이사" readonly=""
											class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td style="border-top: none;"><input type="text"
											name="OrderTitle3" value="차장" readonly=""
											class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td style="border-top: none;"><input type="text"
											name="OrderTitle4" value="과장" readonly=""
											class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td style="border-top: none;"><input type="text"
											name="OrderTitle5" value="과장" readonly=""
											class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
									</tr>
									<tr class="date" style="height: 61px;">
										<!-- 결재 버튼/결재완료 서명 표시 영역 -->
										<td><input type="text" name="OrderName1" value="유종환"
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId1" value="ME"></td>
										<td><input type="text" name="OrderName2" value="김수한"
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId2" value="desk26">
											<!-- 지정/취소 버튼 -->
											<div id="MembersFindCell2" class="btn_page pad15l overf">
												<!-- 취소 -->
												<a class="cursor" onclick="MembersDelete(2);"> <span>취소</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName3" value="김동헌"
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId3" value="desk21">
											<!-- 지정/취소 버튼 -->
											<div id="MembersFindCell3" class="btn_page pad15l overf">
												<!-- 취소 -->
												<a class="cursor" onclick="MembersDelete(3);"> <span>취소</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName4" value="박성우"
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId4" value="desk20">
											<!-- 지정/취소 버튼 -->
											<div id="MembersFindCell4" class="btn_page pad15l overf">
												<!-- 취소 -->
												<a class="cursor" onclick="MembersDelete(4);"> <span>취소</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName5" value="한규리"
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId5" value="desk23">
											<!-- 지정/취소 버튼 -->
											<div id="MembersFindCell5" class="btn_page pad15l overf">
												<!-- 취소 -->
												<a class="cursor" onclick="MembersDelete(5);"> <span>취소</span>
												</a>
											</div></td>
									</tr>
									<tr class="date" style="height: 20px;">
										<!-- 결재일시 표시 영역 -->
										<td><span id="appDate1">&nbsp;</span></td>
										<td><span id="appDate2">&nbsp;</span></td>
										<td><span id="appDate3">&nbsp;</span></td>
										<td><span id="appDate4">&nbsp;</span></td>
										<td><span id="appDate5">&nbsp;</span></td>
									</tr>
									<!-- 협조선 -->
									<tr class="txt_ce" style="height: 20px;">
										<th rowspan="3"
											style="border-left: none; border-top: none; border-bottom: none;">
											<!-- 결재선/협조선 제목 --> <!-- 협조 --> 협<br>
										<br>조
										</th>
										<!-- 결재자/협조자 직급 표시 영역 -->
										<td><input type="text" name="OrderTitle11" value=""
											readonly="" class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td><input type="text" name="OrderTitle12" value=""
											readonly="" class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td><input type="text" name="OrderTitle13" value=""
											readonly="" class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td><input type="text" name="OrderTitle14" value=""
											readonly="" class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
										<td><input type="text" name="OrderTitle15" value=""
											readonly="" class="form_transparent"
											style="width: 100%; line-height: 21px;"></td>
									</tr>
									<tr class="date" style="height: 61px;">
										<!-- 결재 버튼/결재완료 서명 표시 영역 -->
										<td><input type="text" name="OrderName11" value=""
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId11" value=""> <!-- 지정/취소 버튼 -->
											<div id="MembersFindCell11" class="btn_page pad15l overf">
												<!-- 지정 -->
												<a class="openPopup"
													href="myOrderUserAppointPopup.php?mode=order&amp;number=11&amp;total=5&amp;WordUseHelper=Y">
													<span>지정</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName12" value=""
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId12" value=""> <!-- 지정/취소 버튼 -->
											<div id="MembersFindCell12" class="btn_page pad15l overf">
												<!-- 지정 -->
												<a class="openPopup"
													href="myOrderUserAppointPopup.php?mode=order&amp;number=12&amp;total=5&amp;WordUseHelper=Y">
													<span>지정</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName13" value=""
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId13" value=""> <!-- 지정/취소 버튼 -->
											<div id="MembersFindCell13" class="btn_page pad15l overf">
												<!-- 지정 -->
												<a class="openPopup"
													href="myOrderUserAppointPopup.php?mode=order&amp;number=13&amp;total=5&amp;WordUseHelper=Y">
													<span>지정</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName14" value=""
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId14" value=""> <!-- 지정/취소 버튼 -->
											<div id="MembersFindCell14" class="btn_page pad15l overf">
												<!-- 지정 -->
												<a class="openPopup"
													href="myOrderUserAppointPopup.php?mode=order&amp;number=14&amp;total=5&amp;WordUseHelper=Y">
													<span>지정</span>
												</a>
											</div></td>
										<td><input type="text" name="OrderName15" value=""
											readonly="" class="form_transparent" style="width: 100%;">
											<input type="hidden" name="OrderId15" value=""> <!-- 지정/취소 버튼 -->
											<div id="MembersFindCell15" class="btn_page pad15l overf">
												<!-- 지정 -->
												<a class="openPopup"
													href="myOrderUserAppointPopup.php?mode=order&amp;number=15&amp;total=5&amp;WordUseHelper=Y">
													<span>지정</span>
												</a>
											</div></td>
									</tr>
									<tr class="date" style="height: 20px;">
										<!-- 결재일시 표시 영역 -->
										<td style="border-bottom: none;"><span id="appDate11">&nbsp;</span>
										</td>
										<td style="border-bottom: none;"><span id="appDate12">&nbsp;</span>
										</td>
										<td style="border-bottom: none;"><span id="appDate13">&nbsp;</span>
										</td>
										<td style="border-bottom: none;"><span id="appDate14">&nbsp;</span>
										</td>
										<td style="border-bottom: none;"><span id="appDate15">&nbsp;</span>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<!-- 문서종류 -->
					<tr class="eword_meta_height">
						<th style="border-left: none;">문서종류</th>
						<td class="pad15l" colspan="3">휴가계 &gt; 정기휴가계</td>
					</tr>
					<!-- 부서 -->
					<tr class="eword_meta_height">
						<th style="border-left: none;">부서</th>
						<td class="pad15l" colspan="3">대표이사</td>
					</tr>
					<!-- 기안일 -->
					<tr class="eword_meta_height">
						<th style="border-left: none;">기안일</th>
						<td class="pad15l" colspan="3"><input name="DraftingY"
							type="text" value="2019" size="4" maxlength="4"> <label>년</label>
							<input name="DraftingM" type="text" value="10" size="2"
							maxlength="2"> <label>월</label> <input name="DraftingD"
							type="text" value="16" size="2" maxlength="2"> <label>일</label>
						</td>
					</tr>
					<!-- 기안자, (출장인원) -->
					<tr class="eword_meta_height">
						<th style="border-left: none;">기안자</th>
						<td class="pad15l " colspan="3">사원 유종환</td>
						<!-- 출장인원 -->
					</tr>
					<!-- 공개여부, 보존기간 -->
					<tr class="eword_meta_height">
						<th style="border-left: none;">공개여부</th>
						<td class="txt_ce">
							<!-- 작성 --> <select name="Opening"
							onchange="ReceiveTreeKeyButton();"><option label="공개"
									value="Y" selected="selected">공개</option>
								<option label="비공개" value="N">비공개</option>
						</select>
						</td>
						<th>보존기간</th>
						<td class="txt_ce">
							<!-- 작성 --> <select name="StoragePeriod"><option
									label="3 개월" value="3">3 개월</option>
								<option label="6 개월" value="6">6 개월</option>
								<option label="1 년" value="12">1 년</option>
								<option label="2 년" value="24">2 년</option>
								<option label="3 년" value="36">3 년</option>
								<option label="4 년" value="48">4 년</option>
								<option label="5 년" value="60">5 년</option>
								<option label="6 년" value="72">6 년</option>
								<option label="7 년" value="84">7 년</option>
								<option label="8 년" value="96">8 년</option>
								<option label="9 년" value="108">9 년</option>
								<option label="10 년" value="120" selected="selected">10년</option>
								<option label="무기한" value="12000">무기한</option>
						</select>
						</td>
					</tr>
				</tbody>
			</table>
			<table style="width:850px;height:780px;" border="1px solid" > 
					<tbody style="text-align:center;font-size:15px;">        	 
						<tr>
							<td style="height:40px">제목</td>
							<td><input name="db_title" id="db_title" style="width:90%" type="text"></td>
						</tr>   	 	 
						<tr>
							<td style="height:40px">결재자</td>
							<td>
								<input type="button" value="선택" onclick="javascripnt:manSelect()">
								<input style="width:90%" type="text">
							</td>
						</tr>   	 	 
						<tr>
							<td style="height:40px">참조자</td>
							<td>
								<input type="button" value="선택" onclick="javascripnt:manSelect()">
								<input style="width:90%" type="text">
							</td>
						</tr>   	 	 
						<tr>
							<td colspan="2">		
							<div>
								<textarea name="ir1" id="ir1" rows="27" cols="118">
									내용을 입력하세요.
								</textarea>	
							</div>					 	
							</td>
						</tr>   	 	 
					</tbody>
				</table>
				<div style="margin-top:4px;margin-right:4px;text-align:right">
					<input type="button" onclick="save()" value="저장">                 
					<button>닫기</button>                 
				</div>
			</div>
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