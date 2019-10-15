package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalesGrapheLogic {
	private static final Logger logger = LoggerFactory.getLogger(SalesGrapheLogic.class);
	@Autowired
	SalesGraphDao salesDao;
	public List<Map<String, Object>> salesSelect(Map<String, Object> pMap) {
		logger.info("Logic salesSelect =======");
		List<Map<String,Object>> sList = salesDao.salesSelect(pMap);
		
		return sList;
	}
	

}
