package com.was.erp;

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
	public List<Map<String, Object>> salesSelect(Map<String, Object> pMap) {
		logger.info("Logic salesSelect =======");
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("salesSelect",pMap);
		return sList;
	}

}
