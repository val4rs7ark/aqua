package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HRLogic {
	Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	HRDao hrDao = null;
	
	public List<Map<String, Object>> HRSalery_insert() {
		logger.info("HRSalery_insert//////////////////logic");
		
		List<Map<String,Object>> r_List = hrDao.HRSalery_insert();
		return r_List;
	}

	public String HRSalery_insert_commit(Map<String, Object> pMap) {
		logger.info("HRSalery_insert_commit//////////////////logic");
		String gubun = pMap.get("sal_gubun").toString();
		String msg = null;
		if("jung".equals(gubun)) {// 정규식 등록 버튼일경우
			msg = hrDao.HRSalery_insert_commit(pMap);
		}else if("one".equals(gubun)) {// 일용직 등록 버튼일경우
			msg = hrDao.HRSalery_insert_commit_one(pMap);
		}
		return msg;
	}

}
