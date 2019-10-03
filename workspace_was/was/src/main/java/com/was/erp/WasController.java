package com.was.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"s_emp_no","s_emp_pw","s_emp_name","s_outtime"})
@Controller
@RequestMapping("/was*")
public class WasController {
	private static final Logger logger = LoggerFactory.getLogger(WasController.class);
	@Autowired
	WasLogic wasLogic;
//////////////SessionAttributes가 처음 실행 되었을 때 아직 request로 받기 전이라 null방지///////////	
	@ModelAttribute("s_emp_no")
	public String setSempNo() {
	return "";
	}
	@ModelAttribute("s_emp_pw")
	public String setSempPw() {
	return "";
	}
	@ModelAttribute("s_emp_name")
	public String setSempName() {
	return "";
	}
	@ModelAttribute("s_outtime")
	public String setSouttime() {
		return "";
	}
//////////////SessionAttributes가 처음 실행 되었을 때 아직 request로 받기 전이라 null방지///////////	
	@PostMapping("wasEmpStatus.was")
	public String wasEmpStatus(@RequestParam String empno,Model model) {
		logger.info("wasEmpStatus 호출 성공");
		List empStatusList = wasLogic.wasEmpStatus(empno);
		return "";//191002수정중
	}
	@PostMapping("wasLogin.was")
	public String wasLogin(@RequestParam Map<String,Object> pMap,Model model,HttpServletRequest req) {
		logger.info("wasLogin 호출 성공");
		pMap.put("session_no",req.getSession().getId());
		wasLogic.wasLogin(pMap);
		String path = "";
		String result = pMap.get("emp_name").toString();
		if("존재하지 않는 사원코드입니다..".equals(result) || "비밀번호를 다시 확인하세요".equals(result) 
			    || "기존 아이디로 새로운 접속이 감지되었습니다.".equals(result)) {
			path ="forward:index.jsp";
			model.addAttribute("emp_name", result);
			
		}else{
			   ////////////////////////////세션에담기////////////////////////////////////
			   model.addAttribute("s_emp_no",pMap.get("empno").toString());
			   model.addAttribute("s_emp_pw",pMap.get("emp_pw").toString());
			   model.addAttribute("s_emp_name",pMap.get("emp_name").toString());
			   model.addAttribute("s_outtime",pMap.get("outtime").toString()); 
			   ////////////////////////////세션에담기////////////////////////////////////
			path ="login/main";
		}
		return path;//190918 이메소드는 아직 수정 중 입니다.
	}	
}
