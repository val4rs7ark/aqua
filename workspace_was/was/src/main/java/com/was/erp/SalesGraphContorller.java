package com.was.erp;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
//...여전히 수정중 1021
@RequestMapping(value="/sales*")
@Controller
public class SalesGraphContorller {
	private static final Logger logger = LoggerFactory.getLogger(SalesGraphContorller.class);
	@Autowired
	SalesGraphLogic salesLogic;
	///////////////////////////////////   매출현황 메인 페이지 그래프        ////////////////////////////////
	@GetMapping("salesMainSelect.was")
	public String salesMainSelect(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller salesMainSelect =======");
		List<Map<String,Object>> gList = null;
		gList = salesLogic.salesMainSelect(pMap);
		for(int i=0;i<gList.size();i++) {
			logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
		}
		mod.addAttribute("gList",gList);
		return "sales/salesGraph";
	}
	///////////////////////////////////   연도별 그래프 기본 조회 (< 금년  >)       ////////////////////////////////
	@GetMapping("salesYear.was")
	public String salesYear(@RequestParam Map<String,Object> pMap,Model mod) {
	logger.info("Controller===== salesSelect =======");
	logger.info("Controller===== salesSelect ======="+pMap.get("today_year").toString());
	List<Map<String,Object>> gList = null;
	gList = salesLogic.salesYear(pMap);
	for(int i=0;i<gList.size();i++) {
	logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
	}
	mod.addAttribute("gList",gList);
	return "sales/salesGraphYear";
	}
	///////////////////////////////////   연도별 그래프 선택  조회        ////////////////////////////////
	@GetMapping("salesSelectYear.was")
	public String salesSelectYear(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller===== salesSelect =======");
		logger.info("Controller===== salesSelect ======="+pMap.get("today_year").toString());
		List<Map<String,Object>> gList = null;
		gList = salesLogic.salesYear(pMap);
		for(int i=0;i<gList.size();i++) {
			logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
		}
		mod.addAttribute("gList",gList);
		return "sales/salesGraphAjax";
	}
	
	///////////////////////////////////   월별 그래프 조회 (< 금월  >)        ////////////////////////////////
	@GetMapping("salesSelectMonth.was")
	public String salesSelectMonth(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller===== salesSelectMonth =======");
		logger.info("Controller===== salesSelectMonth ======="+pMap.get("today_year").toString());
		logger.info("Controller===== salesSelectMonth ======="+pMap.get("today_month").toString());
		List<Map<String,Object>> gList = null;
		gList = salesLogic.salesSelectMonth(pMap);
		for(int i=0;i<gList.size();i++) {
		logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
		}
		mod.addAttribute("gList",gList);
		return "sales/salesGraphBarAjax";
	}
	
	///////////////////////////////////   월별 그래프 기간 선택 조회       ////////////////////////////////
	@GetMapping("salesTwoSelect.was")
	public String salesTwoSelect(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller===== salesTwoSelect =======");
		logger.info("Controller===== salesTwoSelect ======="+pMap.get("today_1").toString());
		logger.info("Controller===== salesTwoSelect ======="+pMap.get("today_2").toString());
		//가져온 월 정보가 연속적이거나 아닐 때 로직분기(예: 1월-2월 or 1월-3월
		String today_1 = pMap.get("today_1").toString();
		String today_2 = pMap.get("today_2").toString();
		String today1[] = today_1.split("-");
		String today2[] = today_2.split("-");
		int todays1 = Integer.parseInt(today1[1]);
		int todays2 = Integer.parseInt(today2[1]);
		List<Map<String,Object>> gList = null;
		logger.info("Controller===== salesTwoSelect ======="+todays2+"   :   "+todays1);
		if((todays2-todays1)==1||(todays2-todays1)==0) {//가져온 달이 연속적일 때(ex: 1월-2월일 경우 가운데 달이 없을때
			logger.info("Controller===== salesTwoSelect ======= 연속적인 달");
				pMap.put("gYear0",today1[0].toString());
				pMap.put("gYear1",today2[0].toString());
				pMap.put("gMonth0", today1[1].toString());
				pMap.put("gMonth1", today2[1].toString());
				gList = salesLogic.salesStartEndMonth(pMap);
		}
		
		else {
			logger.info("Controller===== salesTwoSelect ======= 연속적이지 않은 달");
		gList = salesLogic.salesTwoSelect(pMap);
		for(int i=0;i<gList.size();i++) {
			logger.info("내가 가진 모든 걸 드릴게요 ======="+gList.get(i).toString());
		}
		}
		mod.addAttribute("gList",gList);
		return "sales/salesGraphBarAjax";
	}

}
