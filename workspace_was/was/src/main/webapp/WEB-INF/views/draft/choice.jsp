<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	  crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"/></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"/></script>
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"/></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<TITLE>sub</TITLE>
	<style>
		table.table_sub{
			border: 1px solid gray;
		}
		td.first_box{
			border: 1px solid gray;
			vertical-align: text-top;
			width: 130px;
			height: 300px;
			padding-top: 15px;
		}
		td.seccond_box{
			border: 1px solid gray;
			vertical-align: text-top;
			width: 140px;
			height: 300px;
		}
		td.third_box{
			width: 50px;
			height: 300px;
		}
		td.fourth_box{
			border: 1px solid gray;
			vertical-align: text-top;
			width: 200px;
			height: 300px;
		}
		ul.checktree, ul.checktree ul {
		 list-style-type: none;
		 padding: 0;
		 margin: 0;
		 font: 14px sans-serif;
		}
		
		ul.checktree li {
		 background: url(http://www.blueb.co.kr/SRC/javascript/image3/node.gif) no-repeat;
		 margin: 0;
		 padding: 0 0 0 16px;
		 cursor: default;
		}
		ul.checktree li.last {
		 background-image: url(http://www.blueb.co.kr/SRC/javascript/image3/node-last.gif);
		}
		ul.checktree li.plus {
		 background-image: url(http://www.blueb.co.kr/SRC/javascript/image3/plus.gif);
		}
		ul.checktree li.plus-last {
		 background-image: url(http://www.blueb.co.kr/SRC/javascript/image3/plus-last.gif);
		}
		ul.checktree li.minus {
		 background-image: url(http://www.blueb.co.kr/SRC/javascript/image3/minus.gif);
		}
		ul.checktree li.minus-last {
		 background-image: url(http://www.blueb.co.kr/SRC/javascript/image3/minus-last.gif);
		}
		
		ul.checktree span.count {
		 text-indent: 5pt;
		 color: #999;
		 font-style: italic;
		}
	</style>
	<%@include file="/common/checkTree_Script.jsp"%>
	<script type="text/javascript">
		function select_emp(){
			var chk = document.getElementsByName("chk"); 
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
		
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 
			
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
			$.ajax({
				 url:"/erp/draft_selectEmp?rowid="+rowid
				,method:"get"
				,success:function(data){
						$( 'input[name="chk"]' ).prop( 'checked', false );
						$("#fourth_box").html(data)
				}
			});
		}
		//삭제하는 코드
		function delete_emp(){
			var chk = document.getElementsByName("del_chk"); 
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
		
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 
			
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
			$.ajax({
				 url:"/erp/draft_deleteEmp?rowid="+rowid
				,method:"get"
				,success:function(data){
						$("#fourth_box").html(data)
				}
			});
		}
		//팀명을 선택하면 타는 함수 사원들을 뿌려준다.
		function search_mem(team_name){
			$.ajax({
				 url:"/erp/wasSearch_mem?team_name="+team_name
				,method:"get"
				,success:function(data){
					$("#seccond_box").html(data);
				}
			});
		}
		//sub창 등록 fourth에 있는 값을 가져와서 결제 장소에 뿌려준다.
		function draft_insert(){
			var chk = document.getElementsByName("del_chk"); 
			var len = chk.length;    //체크박스의 전체 개수
			var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
			var checkCnt = 0;        //체크된 체크박스의 개수
			var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
			var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
			var cnt = 0;                 
		
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
					checkCnt++;        //체크된 체크박스의 개수
					checkLast = i;     //체크된 체크박스의 인덱스
				}
			} 
			
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){  //체크가 되어있는 값 구분
					checkRow = chk[i].value;
					if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
						rowid += checkRow;        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
						if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
							rowid += checkRow;  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
						}else{
							rowid += checkRow+",";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
			if(checkCnt==4){
				var txt ="";
				$.ajax({
					 url:"/erp/wasDraft_commitEmp?rowid="+rowid
					,method:"get"
					,success:function(data){
						opener.document.getElementById("imsi_jsonData").value = data;
						opener.parent.jsonload();
						$.ajax({
							 url:"/erp/draft_cancle"
							,method:"get"
							,success:function(data){
								$("#imsi_cancle").html(data);
								window.close();
							}
						});
					}
				}); 
			}else{
				alert("4명만 선택해 주세요");
			}
		}
		//sub창 취소
		function draft_cancle(){
			//delete아작스 이후에 창닫기
			$.ajax({
				 url:"/erp/draft_cancle"
				,method:"get"
				,success:function(data){
					$("#imsi_cancle").html(data);
					window.close();
				}
			});
		}
		
	<!--
	var checkmenu = new CheckTree('checkmenu');
	//-->
	</script>
</head>
<body>
<div style="border:1px solid black;width: 526px;">
	<div>
		<form id="f_empno">
			<table class="table_sub">
				<tr>
					<td class="first_box">
							<ul id="tree-checkmenu" class="checktree">
								<li id="show-explorer">&nbsp;부서선택
									<span id="count-explorer" class="count"></span>
									<ul id="tree-explorer">
										<li id="show-chongmu">&nbsp;총무부										
											<span id="count-chongmu" class="count"></span>
											<ul id="tree-chongmu">
												<li>
													<a onclick="javascript:search_mem('chongmu_1team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;총무1팀</a>
												</li>
												<li>
													<a onclick="javascript:search_mem('chongmu_2team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;총무2팀</a>
												</li>
												<li class="last">
													<a onclick="javascript:search_mem('chongmu_3team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;총무3팀</a>
												</li>
											</ul>
										</li>
										<li id="show-insa">&nbsp;인사부									
											<span id="count-insa" class="count"></span>
											<ul id="tree-insa">
												<li>
													<a onclick="javascript:search_mem('insa_1team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;인사1팀</a>
												</li>
												<li>
													<a onclick="javascript:search_mem('insa_2team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;인사2팀</a>
												</li>
												<li class="last">
													<a onclick="javascript:search_mem('insa_3team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;인사3팀</a>
												</li>
											</ul>
										</li>
										<li id="show-beasong">&nbsp;배송부									
											<span id="count-beasong" class="count"></span>
											<ul id="tree-beasong">
												<li>
													<a onclick="javascript:search_mem('beasong_1team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;배송1팀</a>
												</li>
												<li>
													<a onclick="javascript:search_mem('beasong_2team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;배송2팀</a>
												</li>
												<li class="last">
													<a onclick="javascript:search_mem('beasong_3team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;배송3팀</a>
												</li>
											</ul>
										</li>
										<li id="show-prod">&nbsp;생산부									
											<span id="count-prod" class="count"></span>
											<ul id="tree-prod">
												<li>
													<a onclick="javascript:search_mem('prod_1team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;생산1팀</a>
												</li>
												<li>
													<a onclick="javascript:search_mem('prod_2team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;생산2팀</a>
												</li>
												<li class="last">
													<a onclick="javascript:search_mem('prod_3team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;생산3팀</a>
												</li>
											</ul>
										</li>
										<li id="show-sales">&nbsp;영업부									
											<span id="count-sales" class="count"></span>
											<ul id="tree-sales">
												<li>
													<a onclick="javascript:search_mem('sales_1team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;영업1팀</a>
												</li>
												<li>
													<a onclick="javascript:search_mem('sales_2team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;영업2팀</a>
												</li>
												<li class="last">
													<a onclick="javascript:search_mem('sales_3team')" style="cursor: pointer; color:black; text-decoration:none;">&nbsp;영업3팀</a>
												</li>
											</ul>
										</li>
									</ul>
								</li>
								<li class="last">고충상담부
								</li>
							</ul>
					</td>
					<td id="seccond_box" class="seccond_box">
						<!-- <a onclick="#" id="seccond_box_a"></a> -->
					</td>
					<td class="third_box">
						<a onclick="javascript:select_emp()" style="cursor: pointer;">
			        			<img alt="plus" src="/erp/images/arrow_right.png" style="width:50px;">
			        	</a> 
						<a onclick="javascript:delete_emp()" style="cursor: pointer;">
			        			<img alt="minus" src="/erp/images/arrow_left.png" style="width:50px;">
			        	</a> 
					</td>
					<td id="fourth_box" class="fourth_box">
					
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="text-align: right;">
		<button type="button" onclick="javascript:draft_cancle()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 10px; margin-bottom:3px; margin-left:10px; padding-top: 2px; padding-bottom: 2px; ">취소</button>
		<button type="button" onclick="javascript:draft_insert()" class="btn btn-dark btn pull-right" style="width:54.5px; margin-top: 10px; padding-top: 2px; padding-bottom: 2px;">등록</button>
	</div>
	<div id="imsi_cancle" >
	</div>
</div>
</body>
</html>