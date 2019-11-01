package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalesGraphDao {
	private static final Logger logger = LoggerFactory.getLogger(SalesGraphDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	///////////////////////////////////   매출현황 메인 페이지 그래프        ////////////////////////////////
	public List<Map<String, Object>> salesMainSelect(Map<String, Object> pMap) {
		logger.info("Logic salesMainSelect =======");
		logger.info("가져온 값은 잘 성장하고 있습니까?"+pMap.get("gYear3"));
		logger.info("가져온 값은 잘 성장하고 있습니까?"+pMap.get("gMonth0"));
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			logger.info("가져온 값은 잘 성장하고 있습니까? key: "+key.toString()+" value :"+pMap.get(key.toString()));
		}
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesMainSelect",pMap);
		return sList;
	}
	///////////////////////////////////   월별 시작/끝 달만         ////////////////////////////////
	public List<Map<String, Object>> salesStartEndMonth(Map<String, Object> pMap) {
		logger.info("Dao salesStartEndMonth ======= 연속적인 달");
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			logger.info("가져온 값은 잘 성장하고 있습니까? key: "+key.toString()+" value :"+pMap.get(key.toString()));
		}
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesStartEndMonth",pMap);
		return sList;
	}
	public List<Map<String, Object>> salesYear(Map<String, Object> pMap) {
		logger.info("Logic salesSelect =======");
		//화면에서 받아온 유저가 클릭한 달 확인
		logger.info("하루하루 멀어져 간다. "+pMap.get("today_year").toString());
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesSelect_year",pMap);
		return sList;
	}
	public List<Map<String, Object>> salesSelectMonth(Map<String, Object> pMap) {
		logger.info("Logic salesSelectMonth =======");
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			logger.info("가져온 값은 잘 성장하고 있습니까? key: "+key.toString()+" value :"+pMap.get(key.toString()));
		}
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesSelect_month",pMap);
	
		return sList;
	}
	public List<Map<String, Object>> salesTwoSelect(Map<String, Object> pMap) {
		logger.info("Logic salesTwoSelect Dao =======");
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			logger.info("key :"+key.toString()+" , value :"+pMap.get(key.toString()));
		}
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesSelectTwomonth",pMap);
		return sList;
	}

}
