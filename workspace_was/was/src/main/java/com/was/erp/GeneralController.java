package com.was.erp;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/general*")
public class GeneralController {
	Logger logger = LoggerFactory.getLogger(GeneralController.class);
	@Autowired(required=false)
	GeneralLogic generalLogic = null;
	
	@GetMapping("/general_invenList")
	public String invenList(Model mod) {
		logger.info("invenList: String 호출");
		List<Map<String,Object>> invenList = null;
		invenList = generalLogic.invenList();
		logger.info("invenList:"+invenList);
		int getInvenTotal = generalLogic.getInvenTotal();
		logger.info("getInvenTotal 값은?:"+getInvenTotal);
		mod.addAttribute("invenList",invenList);
		mod.addAttribute("getInvenTotal",getInvenTotal);
		return "general/inventory";
	}
	
	@PostMapping("/general_invenAdd")
	public String invenAdd(@RequestParam Map<String,Object> pMap) {
		logger.info("invenAdd 호출 성공");
		int inven_no = 0;
		inven_no = generalLogic.getInven_no();
		logger.info("inven_no=?"+inven_no);
		pMap.put("inven_no",inven_no);
		generalLogic.invenAdd(pMap);
		return "redirect:general_invenList";
	}
	
	@PostMapping("/general_invenAdd2")
	public String invenAdd2(@RequestParam Map<String,Object> pMap) {
		logger.info("invenAdd2 호출 성공");
		int order_count = Integer.parseInt(pMap.get("order_count").toString());
		logger.info("inven_count:"+order_count);
		int order_unitprice = Integer.parseInt(pMap.get("order_unitprice").toString());
		pMap.put("order_count",order_count);
		pMap.put("order_unitprice",order_unitprice);
		generalLogic.invenAdd2(pMap);
		return "redirect:general_invenList";
	}
	
	@PostMapping("general_invengroupList")
	public String invengroupList(Model mod){
		logger.info("invengroupList 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		mod.addAttribute("invengroupList",invengroupList);
		return "forward:invenList.jsp";
	}
	
	@GetMapping("/general_pummoksearch")
	public String pummoksearch(Model mod) {
		logger.info("pummoksearch 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		logger.info("invengroupList:"+invengroupList);
		mod.addAttribute("invengroupList",invengroupList);
		int getInvenGroupTotal = generalLogic.getInvenGroupTotal();
		mod.addAttribute("getInvenGroupTotal",getInvenGroupTotal);
		return "general/pummoksearch";
	}
	
	@GetMapping("/general_checkbox")
	public String checkbox() {
		return "general/checkbox";
	}

}
