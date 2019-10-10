package com.was.erp;

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
//190918
@RequestMapping("/product*")
@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductLogic productLogic;
	
	@PostMapping(value="/productShipIn")
	public String productShipIn(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productShipIn 메소드 호출 성공");
		productLogic.productShipIn(pMap);
		
		return "";//190909 이메소드는 아직 수정 중 입니다.
	}
	@PostMapping(value="/productShipOut")
	public String productShipOut(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productShipOut 메소드 호출 성공");
		productLogic.productShipOut(pMap);
		return "";//190909 이메소드는 아직 수정 중 입니다.
	}
	public int get_Total(Map<String,Object> pMap) {
		int tot = productLogic.get_Total(pMap);
		return tot;
	}
	@GetMapping(value="/productList")
	public String productList(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productList 메소드 호출 성공");
		Map<String,Object> pl_Map = new HashMap<>();
		int tot = this.get_Total(pMap);
		List<Map<String,Object>> rList = productLogic.productList(pMap, tot);
		model.addAttribute("pl_Map",pl_Map); //조건검색을 유지하기 위해 Map에 담아서 뷰로 보낸다.
		model.addAttribute("rList",rList);
		model.addAttribute("tot",tot);
		return "products/productsAdd";
	}
	@GetMapping(value="/productDetail")
	public String productList_test(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productDetail호출 성공");
		//List<Map<String,Object>> rList = productLogic.productDetail(pMap);
		//logger.info("imsi :"+rList);
		//model.addAttribute("imsi",rList);
		return "products/productsDetail";//191009 이메소드는 아직 수정 중 입니다.
	}
	@GetMapping(value="/productInsert")
	public String productInsert(@RequestParam Map<String,Object> pMap,Model model) {
		logger.info("productInsert 메소드 호출 성공");
		productLogic.productInsert(pMap);
		return "redirect:productList";	
	}
	@RequestMapping(value="/productDelete")
	public String productDelete(@RequestParam Map<String,Object> pMap) {
		logger.info("productDelete 호출 성공");
		String rowid = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();//2
			String r_rowid[] = rowid.split(",");//2,3,5 -> 
			productLogic.productDelete(r_rowid);//[2],[3],[5]
			logger.info("rowid==========================================================================================================="+rowid);
			logger.info(r_rowid.toString());
	}
		return "redirect:productList";
//		return "products/productsAdd";
	}
}
