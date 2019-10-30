<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <%@ include file="/common/bootStrap4.jsp" %>
    <%@ include file="/common/styles.jsp" %>
    <title>급여내용 상세정보</title>
  <%@ include file="/common/bs_css.jsp"%>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#sal_update").show();
	});
</script>
<div class="container">

	<div class="modal" id="sal_update">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="height: 825px;">
				<!-- select됨, 링크기능 -->
				<div class="modal-body" style=" padding-top: 5px; padding-bottom: 5px;">
					<table class="table" style="margin-bottom: 0px;">
						<tbody>
							<tr>
								<td colspan="2" style="border:none;font-weight: 800; padding-top: 7px; padding-bottom: 7px; padding-left: 0px;">
									지급 내용	
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									기본급
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									연봉 x 1/12개월
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									식대
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									5,500<b style="font-size: 12px;">(원)</b> x 30일
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									교통비
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									12,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									통신비
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									12,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									생명수당
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									근무일수 x 50,000<b style="font-size: 12px;">(원)</b><br>
									<b style="font-size: 13px; color:red;">※(해당부서는 생산부에 한함)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									초과수당
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									<b style="font-size: 13px;">※초과근무대장에 의거 기입</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									직책수당
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									부서장 = 300,000<b style="font-size: 12px;">(원)</b><br>
									팀장 =  150,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									주휴수당
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									(기본급/30일) x 4<br>
									<b style="font-size: 13px;">※소정근로시간 : 9시 00분 부터 18시 00분까지<br>(휴게시간 : 13시 00분~14시 00분)</b><br>
									<b style="font-size: 13px;">※근무일/휴일 : 주 5일 근무, 주휴일 매주 일요일</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 47px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									육아수당
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									200,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<!-- =============================================================================================================================== -->
							<tr>
								<td colspan="2" style="font-weight: 800; padding-top: 7px; padding-bottom: 7px; padding-left: 0px; ">
									공제 내용
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									소득세
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									<b style="font-size: 13px;">※근로소득간이세액표에 의거산출</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									결근공제액
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									결석일수 x 50,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									국민연금
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									(기본급) x 9% x 50%
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									장기요양보험료
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									건강보험료 x 7.38% x 50%
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									노동조합비용
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									15,000<b style="font-size: 12px;">(원)</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									지방소득세
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									소득세 x 10%
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									연말정산 소득세
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									<b style="font-size: 13px;">※정산기록에 의거기입</b>
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									건강보험료
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									(기본급) x 6.24% x 50%
								</td>
							</tr>
							<tr>
								<td style="width: 165px; height: 35px; border: none; text-align: left; padding-left: 20px; padding-top: 5px;padding-bottom: 5px;">
									고용보험료
								</td>
								<td style="border:none; padding-top: 5px;padding-bottom: 5px;">
									(기본급) x 0.65%
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>