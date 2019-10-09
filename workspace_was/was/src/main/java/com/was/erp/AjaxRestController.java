package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value="/was*",produces="text/plain;charset=UTF-8")
public class AjaxRestController {
	private static final Logger logger = LoggerFactory.getLogger(AjaxRestController.class);
	@Autowired
	WasLogic wasLogic;
	
	@GetMapping(value="wasEmpAttendance.was",produces="application/json;charset=UTF-8")
	public String wasEmpAttendance(@RequestParam Map<String,Object> pMap,Model model) {
		String gson = null;
		List<Map<String,Object>> rList = wasLogic.wasEmpAttendance(pMap);
		Gson g = new Gson();
		gson = g.toJson(rList);
		logger.info(gson);
		return gson;
	}
}