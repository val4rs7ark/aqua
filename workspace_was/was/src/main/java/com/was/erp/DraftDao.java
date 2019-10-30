package com.was.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DraftDao {
	Logger logger = LoggerFactory.getLogger(DraftLogic.class);
	@Autowired(required=false)
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public void draftAdd(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("draftAdd", pMap);
	}

	public List<Map<String, Object>> draft_selectEmp(List<Map<String,Object>> l_list) {
		List<Map<String, Object>> result_list = new ArrayList<>();
		try {
			sqlSessionTemplate.insert("draft_insertEmp",l_list);
			result_list = sqlSessionTemplate.selectList("draft_selectEmp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}

	public List<Map<String, Object>> draft_deleteEmp(List<String> l_list) {
		List<Map<String, Object>> result_list = new ArrayList<>();
		try {
			sqlSessionTemplate.delete("draft_deleteEmp",l_list);
			result_list = sqlSessionTemplate.selectList("draft_selectEmp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}

	public void draft_cancle() {
		try {
			sqlSessionTemplate.delete("draft_cancle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Map<String, Object>> draft_commitEmp(List<String> r_list) {
		List<Map<String, Object>> result_list = null;
		try {
			result_list = sqlSessionTemplate.selectList("draft_commitEmp",r_list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}
}
