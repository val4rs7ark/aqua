package com.was.erp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
	DraftLogic draftLogic;
	/*
	 * @Autowired SalesGraphLogic salesGraphLogic;
	 */
	
	@GetMapping(value="wasEmpAttendance.was",produces="application/json;charset=UTF-8")
	public String wasEmpAttendance(@RequestParam Map<String,Object> pMap) {
		logger.info("android �뀒�뒪�듃 ::::::::::::::::::::::::::");
		String gson = null;
		List<Map<String,Object>> rList = wasLogic.wasEmpAttendance(pMap);
		Gson g = new Gson();
		gson = g.toJson(rList);
		logger.info(gson);
		return gson;
	}
	@GetMapping(value="wasEmpStatusNoteDelete.was")
	public String wasEmpStatusNoteDelete(@RequestParam Map<String,Object> pMap) {
		logger.info("noteNO :"+pMap.get("note_no"));
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
	//퇴직금 : 직근 3개월 평균 비용 구하기
	@GetMapping(value="wasAvgofSal")
	public String wasAvgofSal(@RequestParam Map<String,Object> pMap,Model model) {
		pMap.put("g_empno", pMap.get("empno").toString());
		String result = null;
		result = wasLogic.wasAvgofSal(pMap);
		return result;
	}
	// 재직일자 구하는 메소드
	@GetMapping(value="wasCountWork")
	public String countWork(@RequestParam Map<String,Object> pMap)
	{
	    String date1 = pMap.get("start_date").toString();
	    String date2 = pMap.get("end_date").toString();
	    
	    String result_date = "";
	    try{ // String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 여기서 예외처리 해주지 않으면 컴파일러에서 에러가 발생해서 컴파일을 할 수 없다.
	        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
	        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
	        Date FirstDate = format.parse(date1);
	        Date SecondDate = format.parse(date2);
	        
	        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
	        // 연산결과 -950400000. long type 으로 return 된다.
	        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
	        
	        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
	        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
	        long calDateDays = calDate / ( 24*60*60*1000); 
	 
	        calDateDays = Math.abs(calDateDays);
	        result_date = String.valueOf(calDateDays); //재직일 변수
	        
	        logger.info("두 날짜의 날짜 차이: "+result_date);
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
	    return result_date;
	}   
	//생일자 구하는 로직
	@GetMapping(value="wasEmp_birth")
	public String wasEmp_birth() {
		String result = null;
		String gubun = "birth";
		result = wasLogic.wasEmp_birth(gubun);
		return result;
	}
	//오늘날짜 구하는 로직
	@GetMapping(value="wasTo_day")
	public String wasTo_day() {
		String result = null;
		String gubun = "to_day";
		result = wasLogic.wasEmp_birth(gubun);
		
		return result;
	}
	//기안서 등록눌렀을때
	@GetMapping("wasDraft_commitEmp")
	public String draft_commitEmp(@RequestParam Map<String,Object> pMap) {
		logger.info("draft_commitEmp 호출 성공");
		String rowid = null;
		List<String> r_list = new ArrayList<>();
		List<Map<String,Object>> rm_list = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();
			String r_rowid[] = rowid.split(",");
			for(int i=0;i<r_rowid.length;i++) {
				r_list.add(r_rowid[i]);
			}
			rm_list = draftLogic.draft_commitEmp(r_list); 
		}
		String gson = "";
		Gson g = new Gson();
		gson = g.toJson(rm_list);
		return gson;
	}
	//버튼 눌렀을때 반응하는 메소드
	@GetMapping("/wasDraft_buttonLoot")
	public String draft_buttonLoot(@RequestParam Map<String,Object> pMap,Model model) {
		draftLogic.draft_buttonLoot(pMap);
		return "버튼 이벤트";
	}
	
}
