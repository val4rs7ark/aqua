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
	@Autowired
	SalesGraphLogic salesGraphLogic;
	
	@GetMapping(value="wasEmpAttendance.was",produces="application/json;charset=UTF-8")
	public String wasEmpAttendance(@RequestParam Map<String,Object> pMap) {
		String gson = null;
		List<Map<String,Object>> rList = wasLogic.wasEmpAttendance(pMap);
		Gson g = new Gson();
		gson = g.toJson(rList);
		logger.info(gson);
		return gson;
	}
	@GetMapping(value="wasEmpStatusNoteDelete.was")
	public String wasEmpStatusNoteDelete(@RequestParam Map<String,Object> pMap) {
		String result = null;
		result = wasLogic.wasEmpStatusNoteDelete(pMap);
		return result;
	}
	@PostMapping(value="wasMainChart.was",produces="application/json;charset=UTF-8")
	public String wasMainChart(@RequestParam Map<String,Object> pMap,Model model) {
		List<Map<String,Object>> resultList = null;
		String gson =null;
		resultList = wasLogic.wasMainChart(pMap);
		Gson g = new Gson();
		gson = g.toJson(resultList);
		return gson;
	}


}          
