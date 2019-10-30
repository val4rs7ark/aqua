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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

@RestController
@RequestMapping(value="/wasAndroid*",produces="text/plain;charset=UTF-8")
public class AndroidRestController {
	private static final Logger logger = LoggerFactory.getLogger(AndroidRestController.class);
	@Autowired
	WasLogic wasLogic;
	@Autowired
	AndroidLogic androidLogic;
	
	@PostMapping(value="wasAndroidLogin.was")
	public String wasAndroidLogin(@RequestParam Map<String,Object> pMap) {
		String reuslt =null;
		reuslt = androidLogic.wasAndroidLogin(pMap);
		return reuslt;
	}
	@PostMapping(value="wasAndroidStatus.was",produces="application/json;charset=UTF-8")
	public String wasAndroidStatus(@RequestParam Map<String,Object> pMap) {
		logger.info("android 테스트 ::::::::::::::::::::::::::");
		String gson = null;
		List<Map<String,Object>> rList = wasLogic.wasEmpAttendance(pMap);
		Gson g = new Gson();
		gson = g.toJson(rList);
		logger.info(gson);
		return gson;
	}
	@PostMapping(value="wasAndroidDelivery_List.was",produces="application/json;charset=UTF-8")
	public String wasAndroidDelivery_List(@RequestParam Map<String,Object> pMap) {
		logger.info("android 테스트 ::::::::::::::::::::::::::");
		String gson = null;
		List<Map<String,Object>> rList = androidLogic.wasAndroidDelivery_List(pMap);
		Gson g = new Gson();
		gson = g.toJson(rList);
		logger.info(gson);
		return gson;
	}
	@PostMapping(value="/wasAndroidDeliveryCommit.was")
	public String deli_commit(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("Controller //////////////// deli_commit 호출성공");
		String deli_no= (String)pMap.get("deli_no");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		androidLogic.DeliveryCommitState(pMap);
		String deli_afterTime = androidLogic.deliveryCommit(pMap);
		String result = deli_afterTime+"^"+"배송완료 되었습니다.";
		return result;
	}
	@PostMapping(value="/wasAndroidProductInsert.was")
	public String wasAndroidProductInsert(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productInsert 메소드 호출 성공");
		String result = null;
		result = androidLogic.wasAndroidProductInsert(pMap);
		return result;	
	}
}
