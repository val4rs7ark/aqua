package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//인사담당 업무 컨트롤러
@Controller
@RequestMapping("/HR*")
public class HRController {
	Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	HRLogic hrLogic = null;
	
	//급여 등록 초기화면
	@RequestMapping(value="/HRSalery_insert")
	public String HRSalery_insert(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRSalery_insert//////////////////controller");
		List<Map<String,Object>> r_list = hrLogic.HRSalery_insert();
		model.addAttribute("r_list", r_list);
		return "HR/salery_insert";
	}
	//급여 등록 사원 선택시 바뀌는 아작스 페이지
	@RequestMapping(value="/HRsalary_select_empno", method=RequestMethod.GET)
	public String HRsalary_select_empno(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRsalary_select_empno//////////////////controller");
		logger.info("empno : "+pMap.get("empno").toString());
		logger.info("resident_no : "+pMap.get("resident_no").toString());
		logger.info("emp_hp : "+pMap.get("emp_hp").toString());
		logger.info("emp_indate : "+pMap.get("emp_indate").toString());
		logger.info("emp_sosoc : "+pMap.get("emp_sosoc").toString());
		logger.info("emp_back : "+pMap.get("emp_back").toString());
		logger.info("sal_account : "+pMap.get("sal_account").toString());
		
		model.addAttribute("rMap", pMap);
		return "HR/ajax/sal_table";
	}
}
