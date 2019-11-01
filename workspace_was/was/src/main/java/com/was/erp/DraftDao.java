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

	public List<Map<String, Object>> draft_selectText(Map<String, Object> pMap) {
		List<Map<String, Object>> result_list = null;
		try {
			result_list = sqlSessionTemplate.selectList("draft_selectText",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}

	public List<Map<String, Object>> draft_permission_page(Map<String, Object> pMap) {
		List<Map<String, Object>> result_list = null;
		try {
			result_list = sqlSessionTemplate.selectList("draft_permission_page",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}

	public List<Map<String, Object>> draft_myWrite_list(Map<String, Object> pMap) {
		List<Map<String, Object>> result_list = null;
		try {
			result_list = sqlSessionTemplate.selectList("draft_myWrite_list",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}

	public void dismiss(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.update("draft_dismiss",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//결재버튼 프로시저
	public void permission(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.selectOne("draft_permission",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void permission_commit(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.update("draft_commit",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String draft_catchpw(Map<String, Object> pMap) {
		String pw = "";
		try {
			pw = sqlSessionTemplate.selectOne("draft_catchpw",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pw;
	}
	public void papersDelete(String draft_no) {
		logger.info("Dao>papersDelete 호출 성공");
		try {
			sqlSessionTemplate.delete("draft_delete",draft_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
