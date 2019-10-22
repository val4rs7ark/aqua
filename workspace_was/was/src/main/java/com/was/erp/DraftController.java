package com.was.erp;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/draft*")
public class DraftController {
	Logger logger = LoggerFactory.getLogger(DraftController.class);
	@Autowired(required=false)
	DraftLogic draftLogic = null;
	
	@GetMapping("/draftMain")
	public String draftMain(@RequestParam Map<String,Object> pMap) {
//		logger.info(pMap.get("db_title").toString());
//		logger.info(pMap.get("ir1").toString());
//		logger.info("hd_title:"+pMap.get("hd_title").toString());
		return "/draft/draft_main";
	}
	
	@GetMapping("/draft_basic")
	public String draft_basic(@RequestParam Map<String,Object> pMap) {
//		logger.info(pMap.get("db_title").toString());
//		logger.info(pMap.get("ir1").toString());
//		logger.info("hd_title:"+pMap.get("hd_title").toString());
		return "/draft/draft_basic";
	}
	
	@PostMapping("/draftAdd")
	public void draftAdd(@RequestParam Map<String,Object> pMap) {
		logger.info(pMap.get("db_title").toString());
		logger.info(pMap.get("ir1").toString());
		draftLogic.draftAdd(pMap);
	}
	
	@PostMapping("/general_dBChoice")
	public String dBChoice(@RequestParam Map<String,Object> pMap) {
		logger.info("general_dBChoice 호출 성공");
		return "redirect:/draft/choice.jsp";
	}

}
