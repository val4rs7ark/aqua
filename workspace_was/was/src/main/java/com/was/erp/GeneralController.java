package com.was.erp;

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
@RequestMapping("/general*")
public class GeneralController {
	Logger logger = LoggerFactory.getLogger(GeneralController.class);
	@Autowired(required=false)
	GeneralLogic generalLogic = null;
	
	@GetMapping("/generalinvenList")
	public String invenList(Model mod) {
		logger.info("invenList: String 호출");
		List<Map<String,Object>> invenList = null;
		invenList = generalLogic.invenList();
		logger.info("invenList:"+invenList);
		int getInvenTotal = generalLogic.getInvenTotal();
		logger.info("getInvenTotal 값은?:"+getInvenTotal);
		mod.addAttribute("invenList",invenList);
		mod.addAttribute("getInvenTotal",getInvenTotal);
		return "forward:general/inventory.jsp";
	}
	
	@PostMapping("/invenAdd")
	public String invenAdd(@RequestParam Map<String,Object> pMap) {
		logger.info("invenAdd 호출 성공");
		int inven_no = 0;
		inven_no = generalLogic.getInven_no();
		logger.info("inven_no=?"+inven_no);
		pMap.put("inven_no",inven_no);
		generalLogic.invenAdd(pMap);
		return "redirect:invenList";
	}
	
	@PostMapping("/invenAdd2")
	public String invenAdd2(@RequestParam Map<String,Object> pMap) {
		logger.info("invenAdd2 호출 성공");
		int inven_count = Integer.parseInt(pMap.get("inven_count").toString());
		int buy_unitprice = Integer.parseInt(pMap.get("buy_unitprice").toString());
		int buy_totalprice = Integer.parseInt(pMap.get("buy_totalprice").toString());
		pMap.put("inven_count",inven_count);
		pMap.put("buy_unitprice",buy_unitprice);
		pMap.put("buy_totalprice",buy_totalprice);
		generalLogic.invenAdd2(pMap);
		return "redirect:invenList";
	}
	
	@GetMapping("invengroupList")
	public String invengroupList(Model model){
		logger.info("invengroupList 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		model.addAttribute("invengroupList",invengroupList);
		return "forward:invenList.jsp";
	}

}
