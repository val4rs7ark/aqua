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

import com.google.gson.Gson;

@Controller
@RequestMapping("/general*")
public class GeneralController {
	Logger logger = LoggerFactory.getLogger(GeneralController.class);
	@Autowired(required=false)
	GeneralLogic generalLogic = null;
	
	@GetMapping("/general_invenList")
	public String invenList(@RequestParam Map<String,Object> pMap,Model mod) {

		//***********************************************************************************
		List<Map<String,Object>> invenList = null;
		logger.info("invenList:"+invenList);
		Map<String,Object> rMap = new HashMap<>();
		if(pMap.get("s_gubun")!=null) {
			logger.info("pMap('s_gubun') :null? "+pMap.get("s_gubun").toString());
		}
		//*********************************************************************************
		//화면에서 받아온 날짜값은 선택하지 않아도 null이 아닌것으로 넘어옴.
		String s_start_date_ud = null;
		String s_end_date_ud = null;
		pMap.put("s_start_date_ud",null);
		pMap.put("s_end_date_ud",null);
		if(pMap.get("s_start_date")!=null) {
			if(pMap.get("s_start_date").toString().length()<11 && pMap.get("s_start_date").toString().length()>8) {
				s_start_date_ud = pMap.get("s_start_date").toString();
				pMap.put("s_start_date_ud",s_start_date_ud);
				rMap.put("s_start_date_ud",s_start_date_ud);
				logger.info("s_start_date_ud :"+s_start_date_ud);
			}
		}else {
			String msg ="날짜를 잘못 입력 하였습니다.";
		}
		if(pMap.get("s_end_date")!=null) {
			if(pMap.get("s_end_date").toString().length()<11 && pMap.get("s_end_date").toString().length()>8) {
				s_end_date_ud = pMap.get("s_end_date").toString();
				pMap.put("s_end_date_ud",s_end_date_ud);
				rMap.put("s_end_date_ud",s_end_date_ud);
				logger.info("s_end_date_ud :"+s_end_date_ud);
			}else {
				String msg ="날짜를 잘못 입력 하였습니다.";
			}
		}
		if("".equals(pMap.get("s_gubun"))) { //구분 콤보박스에서 구분을 택하면 널이 입력됨
			pMap.put("s_gubun","null");
			logger.info(pMap.get("s_gubun").toString());
		}
		if(pMap.get("s_keyword")!=null) {
			rMap.put("s_keyword",pMap.get("s_keyword"));
			logger.info(pMap.get("s_keyword").toString());
		}
		if(pMap.get("s_pummok")!=null) {
			rMap.put("s_pummok",pMap.get("s_pummok"));
			logger.info(pMap.get("s_pummok").toString());
		}
		rMap.put("s_gubun",pMap.get("s_gubun"));
		int getInvenTotal = generalLogic.getInvenTotal(pMap);
		logger.info("getInvenTotal 값은?:"+getInvenTotal);		
		//페이지 네이션 시작,끝 지점 설정.
		int nowPage = 1;//현재 페이지
		if(pMap.get("nowPage")!=null) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString())+1;
		}
		int pagePer_Num = 10;//한페이지에 뿌려질 로우수
		int start = 0;
		int end = 0;
		if(nowPage>0) {
			start = ((nowPage-1)*pagePer_Num)+1;
			end = nowPage * pagePer_Num;
			pMap.put("start",start);
			if(end > getInvenTotal) {
				pMap.put("end",getInvenTotal);
			}else {
				pMap.put("end",end);
			}
		}
		invenList = generalLogic.invenList(pMap,getInvenTotal);		
		mod.addAttribute("rMap",rMap);
		mod.addAttribute("invenList",invenList);
		mod.addAttribute("getInvenTotal",getInvenTotal);
		return "general/inventory";
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

	@PostMapping("general_nowSearch")
	public String invengroupList(Model mod){
		logger.info("invengroupList 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		mod.addAttribute("invengroupList",invengroupList);
		return "general/nowSearch";
	}
	         
	@GetMapping("/general_pummokSearch")
	public String pummoksearch(/* @RequestParam String gubun, */Model mod) {
		logger.info("pummoksearch 호출 성공");
		//logger.info("gubun="+gubun);
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		logger.info("invengroupList:"+invengroupList);
		mod.addAttribute("invengroupList",invengroupList);
		int getInvenGroupTotal = generalLogic.getInvenGroupTotal();
		mod.addAttribute("getInvenGroupTotal",getInvenGroupTotal);
		return "general/pummoksearch";
	}
	@GetMapping("/general_pummokSearch2")
	public String pummoksearch2(@RequestParam int i,Model mod) {
		logger.info("pummoksearch2 호출 성공,i=============>"+i);
		//logger.info("gubun="+gubun);
		List<Map<String,Object>> invengroupList = null;
		invengroupList = generalLogic.invengroupList();
		logger.info("invengroupList:"+invengroupList);
		mod.addAttribute("invengroupList",invengroupList);
		int getInvenGroupTotal = generalLogic.getInvenGroupTotal();
		mod.addAttribute("getInvenGroupTotal",getInvenGroupTotal);
		mod.addAttribute("i",i);
		return "general/pummoksearch2";
	}
	
	@GetMapping("/general_checkbox")
	public String checkbox() {
		return "general/checkbox";
	}
	
	@GetMapping("/general_newresister")
	public String pummokList(@RequestParam Map<String,Object> pMap,
			Model mod) {
		logger.info("general_newresister 호출 성공");
		String td = pMap.get("tdArr").toString();
		logger.info("td:"+td);
		String gubun2 = pMap.get("gubun2").toString();
		logger.info("gubun2:"+gubun2);
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
		mod.addAttribute("gubun2",gubun2);
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
	
	@PostMapping("/general_invenUpdate")
	public String invenUpdate(@RequestParam Map<String,Object> pMap) {
		logger.info("general_invenUpdate 호출 성공");
		logger.info("1.구분:"+pMap.get("order_gubun").toString());
		logger.info("2.코드:"+pMap.get("ivgroup_code").toString());
		logger.info("3:품목명"+pMap.get("ivgroup_name").toString());
		logger.info("4_order_no========================="+pMap.get("order_no").toString());
		generalLogic.invenUpdate(pMap);
		return "redirect:general_invenList";
	}
	
	@GetMapping("/general_jungbokAlert")
	public String jungbokAlert(@RequestParam String pid_code,Model mod) {
		logger.info("jungbokAlert 호출성공");
		logger.info("pid_code:"+pid_code);
		logger.info("1");
		String result = generalLogic.jungbokAlert(pid_code);
		logger.info("컨트롤러 result="+result);
		if(result==null) {
			logger.info("상수null박힘");
		}
		mod.addAttribute("result",result);
		mod.addAttribute("pid_code",pid_code);
		return "general/jungbokAlert";
	}
	
	//구매신청건 승인처리(구매부장만 가능)
	@PostMapping("/general_confirm")
	public String confirm(@RequestParam int order_no,String r_order_no,Model mod) {
		logger.info("order_no:"+order_no);
		generalLogic.confirm(order_no);
		return "redirect:general_invenList";
	}
	
//	@PostMapping("/general_invenAdd")
//	public String invenAdd(@RequestParam Map<String,Object> pMap) {
//		logger.info("invenAdd 호출 성공");
//		int inven_no = 0;
//		inven_no = generalLogic.getInven_no();
//		logger.info("inven_no=?"+inven_no);
//		pMap.put("inven_no",inven_no);
//		generalLogic.invenAdd(pMap);
//		return "redirect:general_invenList";
//	}

}




