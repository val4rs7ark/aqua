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
	
	@GetMapping("/general_pummokSearch")
	public String pummoksearch(@RequestParam String gubun,Model mod) {
		logger.info("pummoksearch 호출 성공");
		logger.info("gubun="+gubun);
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		logger.info("invengroupList:"+invengroupList);
		mod.addAttribute("invengroupList",invengroupList);
		int getInvenGroupTotal = generalLogic.getInvenGroupTotal();
		mod.addAttribute("getInvenGroupTotal",getInvenGroupTotal);
		mod.addAttribute("gubun",gubun);
		return "general/pummoksearch";
	}
	
	@GetMapping("/general_checkbox")
	public String checkbox() {
		return "general/checkbox";
	}
	
	@GetMapping("/general_newresister")
	public String pummokList(@RequestParam Map<String,Object> pMap,
			Model mod) {
		String td = pMap.get("tdArr").toString();
		logger.info("td:"+td);
		String tdArr[] = td.split(",");
		String gubun = tdArr[0];
		String code = tdArr[1];
		String name = tdArr[2];
		String size = tdArr[3];
		pMap.put("gubun",gubun);
		pMap.put("code",code);
		pMap.put("name",name);
		pMap.put("size",size);
		mod.addAttribute("pMap",pMap);
		return "general/newresister";
	}
	
	@GetMapping("/general_resistercancel")
	public String resistercancel() {
		logger.info("resistercancel호출 성공");
		return "general/resistercancel";
	}
	
	@GetMapping("/general_invenDel")
	public String invenDel(@RequestParam String order_no,Model mod) {
		logger.info("general_invenDel 호출 성공");
		logger.info("order_no:"+order_no);
		List<String> list = new ArrayList<>();
		String orderArr[] = order_no.split(",");
		for(int i=0;i<orderArr.length;i++) {
			list.add(orderArr[i]);
		}
		generalLogic.invenDel(list);
		return "redirect:/general_invenList";
	}
	
	@PostMapping("/general_pommokAdd")
	public String pummokadd(@RequestParam Map<String,Object> pMap) {
		logger.info("GeneralController pummokadd 호출 성공");
		logger.info("123"+pMap.get("p_code").toString());
		generalLogic.pummokadd(pMap);
		return "redirect:general_invenList";
	}
	
	@GetMapping("/general_invendetail")
	public String invendetail(@RequestParam String checkRow) {
		logger.info("GeneralController invendetail 호출 성공");
		logger.info("checkRow="+checkRow);
		return "redirect:general_invenList";
	}
	
	
}































