package com.was.erp;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//인사담당 업무 컨트롤러
@Controller
@RequestMapping("/HR*")
public class HRController {
	Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	HRLogic hrLogic = null;
	
	//급여 등록 초기화면
	@RequestMapping(value="/HRSalery_insert")
	public String HRSalery_insert(@RequestParam Map<String,Object> pMap,String msg, Model model) {
		//파라미터로 받는 msg는 등록버튼을 누르고 정상적으로 입력했다는 메시지가 forward로 날라오는걸 받아주는 파라미터임
		//따로 모델에 담지 않아도 자동으로 모델에 담겨서 jsp로 가는거 확인함.19-10-08/ghost
		logger.info("HRSalery_insert//////////////////controller");
		List<Map<String,Object>> r_list = hrLogic.HRSalery_insert();
		model.addAttribute("r_list", r_list);
		return "HR/salery_insert";
	}
	//급여 등록버튼 클릭시
	@RequestMapping(value="/HRSalery_insert_commit", method=RequestMethod.POST)
	public String HRSalery_insert_commit(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRSalery_insert_commit//////////////////controller");
		String msg = hrLogic.HRSalery_insert_commit(pMap);
		model.addAttribute("msg", msg);
		return "forward:/HRSalery_insert";
	}
	@RequestMapping(value="/HRemp_sal_update")
	public String HRemp_sal_update(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRemp_sal_update//////////////////controller");
		model.addAttribute("pMap", pMap);
		return "HR/ajax/sal_update";
	}
	//기본급 아작스 변경 화면
	@RequestMapping(value="/HRsalary_change_default")
	public String HRsalary_change_default(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRemp_sal_update//////////////////controller");
		model.addAttribute("pMap", pMap);
		return "HR/ajax/change_default";
	}
	//급여 등록 사원 선택시 바뀌는 아작스 페이지
	@RequestMapping(value="/HRsalary_select_empno", method=RequestMethod.GET)
	public String HRsalary_select_empno(@RequestParam Map<String,Object> pMap, Model model) {
		model.addAttribute("rMap", pMap);
		return "HR/ajax/sal_table";
	}
	//계좌번호 변경시 바뀌는 아작스 페이지
	@RequestMapping(value="/HRsalary_change_account", method=RequestMethod.POST)
	public String HRsalary_change_account(@RequestParam Map<String,Object> pMap, Model model) {
		//현재 pMap에는 sal_account, emp_sal, empno, emp_bank, sal_writer 이정보가 들어있음
		Map<String,Object> rMap = hrLogic.HRsalary_change_account(pMap); 
		model.addAttribute("rMap", rMap);
		return "HR/ajax/sal_table";
	}
	//계좌번호 변경시 페이지 새로고침됨
	@RequestMapping(value="/HRsalary_change_account_href", method=RequestMethod.GET)
	public String HRsalary_change_account_href(@RequestParam Map<String,Object> pMap, Model model) {
		//현재 pMap에는 sal_account, emp_sal, empno, emp_bank, sal_writer 이정보가 들어있음
		Map<String,Object> rMap = hrLogic.HRsalary_change_account(pMap); 
		model.addAttribute("rMap", rMap);
		return "redirect:HRSalery_insert";
	}
	//사원검색버튼에서 사원명 검색시 변경되는 아작스 페이지
	@RequestMapping(value="/HRseach_emp_name", method=RequestMethod.GET)
	public String HRseach_emp_name(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRseach_emp_name//////////////////controller");
		//현재 pMap에는 emp_name 이정보가 들어있음
		List<Map<String,Object>> r_list = hrLogic.HRseach_emp_name(pMap);
		if(pMap.get("imsi_gubun")!=null){
			model.addAttribute("imsi_gubun", pMap.get("imsi_gubun").toString());
		}
		model.addAttribute("r_list", r_list);
		return "HR/ajax/search_name_after";
	}
	//급여 화면에 접근이 가능한 인원인지 분별하는 메소드
	@RequestMapping(value="/HRcatch_Access", method=RequestMethod.POST)
	public String HRcatch_Access(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRcatch_Access//////////////////controller");
		pMap.put("empno",pMap.get("empno"));
		String empno = pMap.get("empno").toString();
		String dept_name = hrLogic.HRcatch_Access(empno);
		String path = "";
		if("총무부".equals(dept_name)){ //총무부일경우
			path="redirect:HRSalery_insert";
		}else { //총무부가 아닐경우
			path="redirect:HRnoAccess";	
		}
		return path;
	}
	
	//접근 권한이 없을경우 페이지
	@RequestMapping(value="/HRnoAccess", method=RequestMethod.GET)
	public String HRnoAccess(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRnoAccess//////////////////controller");
		return "HR/noAccess";
	}
	//메인 페이지로 이동하는 메소드
	@RequestMapping(value="/HRmain", method=RequestMethod.GET)
	public String HRmain() {
		logger.info("HRmain//////////////////controller");
		return "login/main";
	}
	//급여등록 화면에서 급여 명세서 이메일 보내기 버튼 메소드
	@RequestMapping(value="/HRSal_send", method=RequestMethod.POST)
	public String HRSal_send(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRSal_send//////////////////controller");
		//받아온 파라미터는 급여명세서 정보
		model.addAttribute("sal_pMap",pMap);
		return "HR/send_email";
	}
	
	
	//명세서 생긴꼴 확인 하는 메소드
	@RequestMapping(value="/HRimsi_sal", method=RequestMethod.GET)
	public String HRimsi_sal(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRimsi_sal//////////////////controller");
		//logger.info("email : "+pMap.get("email").toString());
		//model.addAttribute("email",pMap.get("email"));
		return "HR/salery_form";
	}
	//급여 조회 컨트롤 - 처음 메뉴바를 눌러서 들어갈때
	@RequestMapping(value="/HRsal_select_f", method=RequestMethod.POST)
	public String HRsal_select_f(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRsal_select//////////////////controller");
		List<Map<String,Object>> r_list = hrLogic.HRsal_select_f(pMap);
		model.addAttribute("first_info",r_list);
		return "HR/sal_empselect";
	}
	
	//급여 조회 컨트롤 - 조회버튼을 눌렀을경우
	@RequestMapping(value="/HRsal_select", method=RequestMethod.POST)
	public String HRsal_select(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRsal_select//////////////////controller");
		String sal_when = pMap.get("sal_when_year").toString()+"-"+pMap.get("sal_when_mon").toString();
		pMap.put("p_sal_when",sal_when);
		List<Map<String,Object>> r_list = hrLogic.HRsal_select(pMap);
		model.addAttribute("r_list",r_list);
		return "HR/sal_empselect";
	}
	
	
	//연간 급여 조회
	@RequestMapping(value="/HRsal_year", method=RequestMethod.POST)
	public String HRsal_year(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRsal_year//////////////////controller");
		List<Map<String,Object>> r_list = hrLogic.HRsal_year(pMap);
		model.addAttribute("sal_empno",pMap.get("sal_empno").toString());
		model.addAttribute("sal_year",pMap.get("sal_year").toString());
		model.addAttribute("list",r_list);
		return "HR/sal_year";
	}
	
	//급여조회한거 워드로 다운 하기
	@RequestMapping(value="/HRdown_word", method=RequestMethod.POST)
	public String HRdown_word(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("HRdown_word//////////////////controller");
		String sal_when = pMap.get("sal_when_year").toString()+"-"+pMap.get("sal_when_mon").toString();
		pMap.put("p_sal_when",sal_when);
		List<Map<String,Object>> r_list = hrLogic.HRsal_select(pMap);
		model.addAttribute("r_list",r_list);
		return "HR/wordDown";
	}

	//급여정보 확인 컨트롤
	@GetMapping(value="HRsalery_info")// 제이슨으로 내보낼때 사용하는 코드 : produces="application/json;charset=UTF-8"
	public String HRsalery_info(@RequestParam Map<String,Object> pMap) {
		logger.info("HRsalery_info 호출성공");
		String path = "";
		if("jung".equals(pMap.get("gubun").toString())){
			path = "HR/salery_info";
		}else if("one".equals(pMap.get("gubun").toString())){
			path = "HR/salery_info_one";
		}
		return path;
	}
	
	// 두날짜 사이 평일 테스트용
	@GetMapping(value="HRtest_imsi")// 제이슨으로 내보낼때 사용하는 코드 : produces="application/json;charset=UTF-8"
	public boolean HRtest_imsi(String currnetDate, int beginDay) {
		/**
	     * 지정일부터 작업전날까지.
	     * <pre>작업 전날 구하기.
	     * 1.그달 마지막일이 일요일이면 3일전까지
	     * 2.그달 마지막일이 토요일이면 2일전까지
	     * 3.그달 마지막일이 평일이면  1일전까지.
	     * </pre>
	     * @param currnetDate
	     * @return
	     */
	        String currentDate = currnetDate.replaceAll("-","");
	        int year = Integer.parseInt(currentDate.substring(0,4));
	        int month = Integer.parseInt(currentDate.substring(4,6));
	        int day = Integer.parseInt(currentDate.substring(6,8));

	        int endDay;

	        Calendar cal = Calendar.getInstance(); //예 2019 10 12
	        cal.set(year, month-1, day ); //달력 필드 YEAR, MONTH 및 DAY_OF_MONTH의 값을 설정. 히브리 달력 시스템에서 다른 년에는 13이기 때문에 -1을 해줌
	        int lastDayOfMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);// DAY_OF_MONTH: 현재월의 날짜. getActualMaximum 입력받은 달의 마지막 날짜를 구하는 메소드
	        
	        cal.set(Calendar.DAY_OF_MONTH, lastDayOfMonth ); //현재 객체의 특정 필드를 다른 값으로 설정한다. 
	        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);// DAY_OF_WEEK: 요일의 숫자값. 현재 객체의 주어진 값의 필드에 해당하는 상수 값을 반환한다.이 상수값은 Calendar 클래스의 상수중에 가진다. 
	        												//일요일 1, 토요일 7
	        if( dayOfWeek == Calendar.SATURDAY ){ //요일이 토요일의 숫자값과같니?
	            endDay=lastDayOfMonth-2; 		  //그럼 그달의 마지막날 -2를 endDay에 넣어
	        }
	        else if( dayOfWeek == Calendar.SUNDAY ){
	            endDay=lastDayOfMonth-3;
	        }
	        else {
	            endDay=lastDayOfMonth-1;
	        }

	        return day >= beginDay && day <= endDay;
	}
	@GetMapping("HRsecondchange")
	public String change_default() {
	   return "/HR/ajax/secondchange";
	}
}
