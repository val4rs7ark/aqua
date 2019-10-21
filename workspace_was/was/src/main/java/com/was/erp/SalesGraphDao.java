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
	public List<Map<String, Object>> salesMainSelect(Map<String, Object> pMap) {
		logger.info("Logic salesMainSelect =======");
		logger.info("가져온 값은 잘 성장하고 있습니까?"+pMap.get("g_date_1"));
		logger.info("가져온 값은 잘 성장하고 있습니까?"+pMap.get("g_date_2"));
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesMainSelect",pMap);
	
		return sList;
	}

}
