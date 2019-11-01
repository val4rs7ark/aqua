package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class AndroidDao {
	private static final Logger logger = LoggerFactory.getLogger(WasDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void wasAndroidLogin(Map<String, Object> pMap) {
		pMap.put("msg", "");
		pMap.put("outtime", "");
		sqlSessionTemplate.selectOne("wasLogin", pMap);
	}

	public List<Map<String, Object>> deliveryList(Map<String, Object> pMap) {
		List<Map<String, Object>> deliveryList = null;
		pMap.put("cb_situation", 2);
		try {
			deliveryList = sqlSessionTemplate.selectList("androidDelivery",pMap);
			logger.info("deliveryList size :"+deliveryList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deliveryList;
	}

	public void DeliveryCommitState(Map<String, Object> pMap) {
		try {
				sqlSessionTemplate.update("commit_state",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String deliveryCommit(Map<String, Object> pMap) {
		String deli_afterTime = null;
		try {
			sqlSessionTemplate.selectOne("deli_afterTime",pMap);
			deli_afterTime = pMap.get("r_end_date").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deli_afterTime;
	}

	public int wasAndroidProductInsert(Map<String, Object> pMap) {
		int result = 0;
			result = sqlSessionTemplate.insert("supplyInsert",pMap);
		return result;
	}

	public List<Map<String, Object>> draftSelectText(Map<String, Object> pMap) {
		List<Map<String, Object>> result_list = null;
		try {
			result_list = sqlSessionTemplate.selectList("draft_selectText",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_list;
	}
}
