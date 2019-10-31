package com.was.erp;

import java.util.ArrayList;
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
		List<Map<String,Object>> nList = new ArrayList<>();
		for(int i=0;i<result_List.size();i++) {
			if(("임시").equals(result_List.get(i).get("EMP_LEVEL"))){
				logger.info("임시");
				nList.add(result_List.get(i));
			}
		}
		for(int i=0;i<result_List.size();i++) {
			if(("사원").equals(result_List.get(i).get("EMP_LEVEL"))){
				logger.info("임시");
				nList.add(result_List.get(i));
			}
		}
		for(int i=0;i<result_List.size();i++) {
			if(("대리").equals(result_List.get(i).get("EMP_LEVEL"))){
				logger.info("임시");
				nList.add(result_List.get(i));
			}
		}
		for(int i=0;i<result_List.size();i++) {
			if(("차장").equals(result_List.get(i).get("EMP_LEVEL"))){
				logger.info("임시");
				nList.add(result_List.get(i));
			}
		}
		for(int i=0;i<result_List.size();i++) {
			if(("부장").equals(result_List.get(i).get("EMP_LEVEL"))){
				logger.info("임시");
				nList.add(result_List.get(i));
			}
		}
		return nList;
	}

}
