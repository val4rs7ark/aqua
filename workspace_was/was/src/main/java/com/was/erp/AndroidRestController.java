package com.was.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping(value="wasAndroidFile.was")
	public ResponseEntity wasAndroidFile(@RequestParam Map<String,Object> pMap) {
		logger.info("테스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ>"+pMap.get("draftNo").toString());
		Map<String,Object> rMap = null;
		rMap = androidLogic.wasAndroidFile(pMap);
		String fileName = rMap.get("fileName").toString();
		String fileLen = rMap.get("fileLen").toString();
		Resource resource = (Resource)rMap.get("resource");
		return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
	            .header(HttpHeaders.CONTENT_TYPE, MediaType.IMAGE_JPEG_VALUE)
	            .header(HttpHeaders.CONTENT_LENGTH, fileLen)
	            .body(resource);
	}
	
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
	public String deli_commit(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller //////////////// deli_commit 호출성공");
		String deli_no= (String)pMap.get("deli_no");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		androidLogic.DeliveryCommitState(pMap);
		String deli_afterTime = androidLogic.deliveryCommit(pMap);
		String result = deli_afterTime+"^"+"배송완료 되었습니다.";
		return result;
	}
	@PostMapping(value="/wasAndroidProductInsert.was")
	public String wasAndroidProductInsert(@RequestParam Map<String,Object> pMap) {
		logger.info("productInsert 메소드 호출 성공");
		String result = null;
		result = androidLogic.wasAndroidProductInsert(pMap);
		return result;	
	}
	@PostMapping("/wasAndroidDraft_selectText.was")
	public String draft_selectText(@RequestParam Map<String,Object> pMap) {
		logger.info("draft_selectText 호출 성공 -->"+pMap.get("empno"));
		List<Map<String,Object>> draftList = androidLogic.draftSelectText(pMap);
		List<Map<String,Object>> returnList = new ArrayList<>();
		Map<String,Object> returnMap = null;
		for(int i=0;i<draftList.size();i++) {
			Map<String,Object> rMap = draftList.get(i);
			if(rMap.get("DRAFT_NO")!=null && rMap.get("EMP_NAME") !=null) {
				returnMap = new HashMap<>();
				String draft_no = rMap.get("DRAFT_NO").toString();
				returnMap.put("DRAFT_NO", draft_no);
				String emp_name = rMap.get("EMP_NAME").toString();
				returnMap.put("EMP_NAME", emp_name);
				String draft_title = null;
				if("".equals(rMap.get("DRAFT_TITLE")) || rMap.get("DRAFT_TITLE")==null) {
					draft_title = "제목없음";
				}else {
					draft_title = rMap.get("DRAFT_TITLE").toString();
				}
				returnMap.put("DRAFT_TITLE", draft_title);
				returnList.add(returnMap);
				returnMap = null;
			}
		}
		Gson g = new Gson();
		String gson = null;
		try {
		gson = g.toJson(returnList);
		}catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("draft_selectText 리턴 전 --> "+gson);
		return gson;
	}
	
}
