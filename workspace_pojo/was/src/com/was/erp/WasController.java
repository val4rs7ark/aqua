package com.was.erp;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
//190925
public class WasController implements ActionServlet{
	private static final Logger logger = Logger.getLogger(EmpController.class);
	Map<String,Object> pMap = null;
	String mapping = null;
	WasLogic wasLogic = null;

	public WasController(Map<String, Object> pMap, String mapping) {
		this.pMap = pMap;
		this.mapping = mapping;
		wasLogic = new WasLogic();
	}

	@Override
	public Model execute() {
		Model model = new Model();
		logger.info("mapping --"+mapping);
		if("wasEmpAttendance".equals(mapping)) {
			List<Map<String,Object>> rList = wasLogic.wasEmpAttendance(pMap);
			model.setAddAttribute(rList);
			model.setListName("attendanceJson");
			model.setViewName("attendanceJson");
			model.setViewPath("WEB-INF/views/login");
			model.setViewExtension("jsp");
		}
		else if("wasEmpStatusNoteInsert".equals(mapping)) {
			logger.info("컨트롤러에서 분기 정해짐.");
			List<Map<String,Object>> rList = wasLogic.wasEmpStatusNoteInsert(pMap);
			model.setAddAttribute(rList);
			model.setListName("noteInsertGson");
			model.setViewName("insertAjax");
			model.setViewPath("WEB-INF/views/was/calendar");
			model.setViewExtension("jsp");
		}
		else if("wasEmpStatusNoteDetail".equals(mapping)) {
			List<Map<String,Object>> rList = wasLogic.wasEmpStatusNoteDetail(pMap);
			model.setAddAttribute(rList);
			model.setListName("noteAjax");
			model.setViewName("noteAjax");
			model.setViewPath("WEB-INF/views/was/calendar");
			model.setViewExtension("jsp");
		}
		else if("wasEmpStatusNoteList".equals(mapping)) {
			List<Map<String,Object>> rList = wasLogic.wasEmpStatusNoteList(pMap);
			model.setAddAttribute(rList);
			model.setListName("wasEmpStatusA");
			model.setViewName("calendarAjax");
			model.setViewPath("WEB-INF/views/was/calendar");
			model.setViewExtension("jsp");
		}
		else if("wasEmpStatus".equals(mapping)) {
			List<Map<String,Object>> rList = wasLogic.wasEmpStatus(pMap);
			model.setAddAttribute(rList);
			if(rList.get((rList.size()-1)).get("calendar_bungi")!=null) {
				model.setListName("wasEmpStatus");
				model.setViewName("empStatus");
				model.setViewPath("WEB-INF/views/was/calendar");
				model.setViewExtension("jsp");
			}else {
				model.setListName("wasEmpStatusA");
				model.setViewName("calendarAjax");
				model.setViewPath("WEB-INF/views/was/calendar");
				model.setViewExtension("jsp");
			}
		}
		else if("wasLogin".equals(mapping)) {
			List<Map<String,Object>> rList = wasLogic.wasLogin(pMap);
			model.setAddAttribute(rList);
			String result = rList.get(0).get("emp_name").toString();
			if("존재하지 않는 사원코드입니다..".equals(result) || "비밀번호를 다시 확인하세요".equals(result) 
										    || "기존 아이디로 새로운 접속이 감지되었습니다.".equals(result)) {
				model.setListName("wasLogin");
				model.setViewName("index");
				model.setViewPath("");
				model.setViewExtension("jsp");
			}else{
				//세션처리해야하는 업무라고 표시하기
				model.setConfirmSession(1);
				model.setListName("wasLogin");
				model.setViewName("main");
				model.setViewPath("WEB-INF/views/login");
				model.setViewExtension("jsp");
			}
		}
		return model;
	}
}
