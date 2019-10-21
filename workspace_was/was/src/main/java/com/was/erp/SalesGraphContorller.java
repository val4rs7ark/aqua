package com.was.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//...여전히 수정중 1021
@RequestMapping(value="/sales*")
@Controller
public class SalesGraphContorller {
	private static final Logger logger = LoggerFactory.getLogger(SalesGraphContorller.class);
	@Autowired
	SalesGrapheLogic salesLogic;
	///////////////////////////////////   조회        ////////////////////////////////
	@GetMapping("salesMainSelect.was")
	public String salesMainSelect(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller salesMainSelect =======");
		List<Map<String,Object>> gList = null;
		gList = salesLogic.salesMainSelect(pMap);
		for(int i=0;i<gList.size();i++) {
			logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
		}
		mod.addAttribute("gList",gList);
		return "sales/salesGraph";
	}

}
