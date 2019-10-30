package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DraftLogic {
	Logger logger = LoggerFactory.getLogger(DraftLogic.class);
	
	@Autowired
	DraftDao draftDao = null;
	public void draftAdd(Map<String, Object> pMap) {
		draftDao.draftAdd(pMap);
	}
	public List<Map<String, Object>> draft_selectEmp(List<Map<String,Object>> l_list) {
		List<Map<String,Object>> result_List = draftDao.draft_selectEmp(l_list);
		return result_List;
	}
	public List<Map<String, Object>> draft_deleteEmp(List<String> l_list) {
		List<Map<String,Object>> result_List = draftDao.draft_deleteEmp(l_list);
		return result_List;
	}
	public void draft_cancle() {
		draftDao.draft_cancle();
	}
	public List<Map<String, Object>> draft_commitEmp(List<String> r_list) {
		List<Map<String,Object>> result_List = draftDao.draft_commitEmp(r_list);
		return result_List;
	}

}
