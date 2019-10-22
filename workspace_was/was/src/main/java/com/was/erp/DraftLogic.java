package com.was.erp;

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

}
