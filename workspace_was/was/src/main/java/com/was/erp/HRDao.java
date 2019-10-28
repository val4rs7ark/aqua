package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HRDao {
	Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> HRSalery_insert() {
		logger.info("HRSalery_insert//////////////////Dao");
		List<Map<String, Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRSalery_insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}

	public String HRSalery_insert_commit(Map<String, Object> pMap) {
		logger.info("HRSalery_insert_commit//////////////////Dao");
		int result = 0;
		String msg = null;
		try {
			result = sqlSessionTemplate.insert("HRSalery_insert_commit",pMap);
			logger.info(String.valueOf(result));
			if(result==1) {
				msg="정상적으로 입력이 되었습니다.";
			}else {
				msg="확인후 다시 입력해주십시오";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	public String HRSalery_insert_commit_one(Map<String, Object> pMap) {
		logger.info("HRSalery_insert_commit_one//////////////////Dao");
		int result = 0;
		String msg = null;
		try {
			result = sqlSessionTemplate.insert("HRSalery_insert_commit_one",pMap);
			logger.info(String.valueOf(result));
			if(result==1) {
				msg="정상적으로 입력이 되었습니다.";
			}else {
				msg="확인후 다시 입력해주십시오";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}

	public Map<String, Object> HRsalary_change_account(Map<String, Object> pMap) {
		logger.info("HRsalary_change_account//////////////////Dao");
		pMap.put("empno","");
		pMap.put("emp_name","");
		pMap.put("resident_no","");
		pMap.put("emp_hp","");
		pMap.put("emp_indate","");
		pMap.put("emp_sosoc","");
		pMap.put("emp_level","");
		try {
			sqlSessionTemplate.selectOne("HRsalary_change_account",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pMap;
	}

	public List<Map<String, Object>> HRseach_emp_name(Map<String, Object> pMap) {
		logger.info("HRSalery_insert//////////////////Dao");
		List<Map<String, Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRSalery_insert",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}

	public String HRcatch_Access(String empno) {
		logger.info("HRcatch_Access//////////////////Dao");
		String dept_name = null;
		try {
			dept_name = sqlSessionTemplate.selectOne("HRcatch_Access",empno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dept_name;
	}

	public List<Map<String, Object>> HRsal_select(Map<String, Object> pMap) {
		List<Map<String,Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRsal_empselect",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}

	public List<Map<String, Object>> HRsal_year(Map<String, Object> pMap) {
		List<Map<String,Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRsal_year",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}

	public List<Map<String, Object>> HRsal_select_f(Map<String, Object> pMap) {
		List<Map<String,Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRsal_select_f",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}
}
