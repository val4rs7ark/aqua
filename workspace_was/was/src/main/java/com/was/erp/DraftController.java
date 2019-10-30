package com.was.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "/draft/choice";
	}
	//선택창 눌르면 켜지는 모달창
	@PostMapping("/draft_SubDraft")
	public String dBsubDraft(@RequestParam Map<String,Object> pMap) {
		logger.info("draft_SubDraft 호출 성공");
		return "/draft/subDraft";
	}

	//기안서 선택창에서 사원을 선택을 했을 경우
	@GetMapping("/draft_selectEmp")
	public String draft_selectEmp(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("draft_selectEmp호출 성공");
		String rowid = null;
		List<Map<String,Object>> r_list = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();
			String r_rowid[] = rowid.split(",");
			List<Map<String,Object>> list = new ArrayList<>();
			for(int i=0;i<r_rowid.length;i++) {
				Map<String,Object> rMap = new HashMap<>();
				rMap.put("sub_empno",r_rowid[i]);
				list.add(rMap);
			}
			r_list = draftLogic.draft_selectEmp(list); 
		}
		model.addAttribute("result_List",r_list);
		return "general/ajax/lastbox_empName";
	}
	//기안서 제거창에서 사원을 선택을 했을 경우
	@GetMapping("/draft_deleteEmp")
	public String draft_deleteEmp(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("draft_deleteEmp호출 성공");
		String rowid = null;
		List<String> r_list = new ArrayList<>();
		List<Map<String,Object>> rm_list = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();
			String r_rowid[] = rowid.split(",");
			for(int i=0;i<r_rowid.length;i++) {
				r_list.add(r_rowid[i]);
			}
			rm_list = draftLogic.draft_deleteEmp(r_list); 
		}
		model.addAttribute("result_List",rm_list);
		return "general/ajax/lastbox_empName";
	}
	@GetMapping("/draft_cancle")
	public String draft_cancle(@RequestParam Map<String,Object> pMap) {
		logger.info("draft_cancle 호출 성공");
		draftLogic.draft_cancle(); 
		return "draft/choice";
	}
	//선택버튼은 글짜가 안바뀜 결국 아작스
	@GetMapping("/draft_choice")
	public String draft_choice(@RequestParam Map<String,Object> pMap,Model model) {
		model.addAttribute("choice", pMap.get("choice").toString()); 
		return "draft/ajax/draft_ajax";
	}
	//선택버튼 눌러서 들어가는 페이지
	@GetMapping("/draft_inner_choice")
	public String draft_inner_choice() {
		logger.info("draft_inner_choice 호출 성공");
		return "draft/choice";
	}
}
