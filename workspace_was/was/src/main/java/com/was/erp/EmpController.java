package com.was.erp;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//////////////////////// 아직 수정중.... 0928 

@RequestMapping(value="/emp*")
@Controller
public class EmpController {
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	@Autowired
	EmpLogic empLogic;
	
	///////////////////////////////////   조회        ////////////////////////////////
	@GetMapping("empListSignUp.was")
	public String empListSignUp(@RequestParam Map<String,Object> pMap, Model model,HttpServletRequest req) {
		logger.info("empListSignUp 호출 성공");
		logger.info("boardList  호출"+pMap.get("pageNumber"));
		logger.info("boardList  호출"+pMap.get("pageSize"));
		int tot = 0;
		tot = empLogic.getTot(null);
		HttpSession session = req.getSession();
		session.setAttribute("s_tot", tot);
		List<Map<String,Object>> eList = null;
		//페이지처리 초기값 담기
				int pageNumber = 0;
				int pageSize = 0;
				if(pMap.containsKey("pageNumber")) {
					pageNumber = Integer.parseInt
										(pMap.get("pageNumber").toString());
				}
				if(pMap.containsKey("pageSize")) {
					pageSize = Integer.parseInt
										(pMap.get("pageSize").toString());
				}
				logger.info(pageNumber+", "+pageSize);
		eList = empLogic.empListSignUp(pMap);
		model.addAttribute("eList",eList);
		return "/emp/empAdd";
	}
	///////////////////////////////////   상세조회        ////////////////////////////////
	@GetMapping("empSelect.was")
	public String empSelect(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("empSelect 호출 성공");
		String empno = pMap.get("empno").toString();
		logger.info("===================controller empSelect empno?"+empno);
		List<Map<String,Object>> sList =empLogic.empSelect(empno);
		logger.info(" ==================로직 다오 xml쿼리 다 다녀옴!!!");
		model.addAttribute("sList",sList);
		logger.info(" ==================여기까지 다 끝이고 이제 리턴만 잘 넘어가면됨!");
		return "/emp/empAddRight";
		
	}
	///////////////////////////////////   등록       ////////////////////////////////
	@PostMapping("empSignUp.was")
	public String empSignUp(@RequestParam Map<String,Object> pMap) {
		logger.info("empSignUp 호출 성공");
		empLogic.empSignUp(pMap);		
		return "redirect:empListSignUp.was";
	}
	///////////////////////////////////   삭제        ////////////////////////////////
	@RequestMapping(value="empDel.was", method=RequestMethod.GET)
	public String empDel(@RequestParam String tg_del) {
		logger.info("empDEL 호출 성공"+tg_del);
		empLogic.empDel(tg_del);
		return "forward:empListSignUp.was"; 
	}
	///////////////////////////////////   수정       ////////////////////////////////
	@PostMapping("empUPD.was")
	public String empUPD(@RequestParam Map<String,Object> pMap) {
		logger.info("empUPD 호출 성공");
		logger.info("값은 잘 성장하고 있습니까?"+pMap.get("empno"));
		empLogic.empUPD(pMap);
		return "redirect:empListSignUp.was";
	}
}
