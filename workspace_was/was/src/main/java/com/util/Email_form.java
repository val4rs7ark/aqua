package com.util;

import java.util.Map;

public class Email_form {
	public Email_form() {
	}
	public String email_form(Map<String,Object> pMap) {
		StringBuilder email_form_link = new StringBuilder();
			//개인 급여 명세서를 받아야 하므로 for및if문 구현, 변수처리
			
			email_form_link.append(
					"<!DOCTYPE html>\r\n" + 
					"<html>\r\n" + 
					"<head>\r\n" + 
					"<meta charset=\"UTF-8\">\r\n" + 
					"<title>Insert title here</title>\r\n" + 
					"</head>\r\n" + 
					"<body style=\"text-align: -webkit-center;\">\r\n" + 
					"<table style=\"border: solid 1px; width: 950px; height: 1000px;\">\r\n" + 
					"	<thead>\r\n" + 
					"		<tr>\r\n" + 
					"			<th style=\"padding-top: 60px; font-size: 45px;\">"+pMap.get("sal_when").toString().substring(5,7)+"월분 (주)WAS 급여 명세서</th>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td style=\"text-align: -webkit-center; padding-top: 35px;\">\r\n" + 
					"				<table style=\"border-collapse: collapse; width: 900px; text-align: center;\">\r\n" + 
					"					<thead>\r\n" + 
					"					<!-- =============================================================================================================== -->\r\n" + 
					"						<tr>\r\n" + 
					"							<td colspan=\"4\" style=\"text-align: right; padding-right: 20px;padding-bottom: 5px;\"> 지급일자 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+pMap.get("sal_when").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">사번</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("empno").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">성명</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("emp_name").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">소속</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("emp_sosoc").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">직책/직급</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("emp_position").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"					<!-- =============================================================================================================== -->\r\n" + 
					"						<tr>\r\n" + 
					"							<td colspan=\"4\" style=\"text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;\"> 급여계좌</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">은행</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("emp_bank").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">계좌번호</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_account").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"					<!-- =============================================================================================================== -->\r\n" + 
					"						<tr>\r\n" + 
					"							<td colspan=\"4\" style=\"text-align: left; padding-left: 20px; padding-top:25px;padding-bottom: 5px;\"> 급여 내역</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\" colspan=\"2\">급여내역</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\" colspan=\"2\">공제내역</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">기본급</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_default").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">소득세</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_soduc").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">성과급</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_plus").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">지방소득세</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_chon").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">식대</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_rice").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">연말정산소득세</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_jungsan").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">생명수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_life").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">결근공제액</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_nocheck").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">교통비</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_drive").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">국민연금</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_kukmin").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">통신비</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_tel").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">장기요양보험</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_long").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">초과수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_over").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">건강보험</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_health").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">직책수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_level").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">노동조합비용</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_pain").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">주휴수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_rest").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">고용보험</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_work").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">육아수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_baby").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\"></td>\r\n" + 
					"							<td style=\"border:solid 1px;\"></td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:30px;\">기타수당</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_etc_detail").toString()+" / "+pMap.get("sal_etc").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">기타공제</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("tax_etc_sudang_dt").toString()+" / "+pMap.get("tax_etc_sudang").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"				<!-- =============================================================================================================== -->\r\n" + 
					"						<tr>\r\n" + 
					"							<td colspan=\"4\" style=\"text-align: left; padding-left: 20px; padding-top:20px;\"></td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray; height:20px;\">지급액(공제전)</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("imsi_sal_total").toString()+"</td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">총공제액</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("imsi_minus_total").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td colspan=\"4\" style=\"text-align: left; padding-left: 20px; padding-top:5px;\"></td>\r\n" + 
					"						</tr>\r\n" + 
					"						<tr>\r\n" + 
					"							<td style=\"border:solid 1px; height:20px; border-top: none; border-left: none;border-bottom: none;border-right: none;\"></td>\r\n" + 
					"							<td style=\"border:solid 1px; border-left:none; border-top: none; none;border-bottom: none;\"></td>\r\n" + 
					"							<td style=\"border:solid 1px; border-color:#6c757d; background-color: lightgray;\">총지급액</td>\r\n" + 
					"							<td style=\"border:solid 1px;\">"+pMap.get("sal_total").toString()+"</td>\r\n" + 
					"						</tr>\r\n" + 
					"					</thead>\r\n" + 
					"					<tbody>\r\n" + 
					"					</tbody>\r\n" + 
					"				</table>\r\n" + 
					"			</td>\r\n" + 
					"		</tr>\r\n" + 
					"	</thead>\r\n" + 
					"	<tbody>\r\n" + 
					"		<tr>\r\n" + 
					"			<td style=\"padding-top:33px; text-align: center;\">귀하의 노고에 감사드립니다.</td>\r\n" + 
					"		</tr>\r\n" + 
					"		<tr>\r\n" + 
					"			<td style=\"text-align: right; padding-right: 50px;\">(주) WAS</td>\r\n" + 
					"		</tr>\r\n" + 
					"	</tbody>\r\n" + 
					"</table>\r\n" + 
					"</body>\r\n" + 
					"</html>");
				
		String email_form = email_form_link.toString();
		
		return email_form;
	}
}