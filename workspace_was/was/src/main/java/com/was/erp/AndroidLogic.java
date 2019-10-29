package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AndroidLogic {
	private static final Logger logger = LoggerFactory.getLogger(WasLogic.class);
	@Autowired
	AndroidDao androidDao;

	public String wasAndroidLogin(Map<String, Object> pMap) {
		androidDao.wasAndroidLogin(pMap);
		String result = pMap.get("msg").toString();
		return result;
	}

	public List<Map<String, Object>> wasAndroidDelivery_List(Map<String, Object> pMap) {
		List<Map<String, Object>> deliveryList = androidDao.deliveryList(pMap);
		return deliveryList;
	}

	public void DeliveryCommitState(Map<String, Object> pMap) {
		androidDao.DeliveryCommitState(pMap);
		
	}

	public String deliveryCommit(Map<String, Object> pMap) {
		pMap.put("r_end_date", "");
		String deli_afterTime = androidDao.deliveryCommit(pMap);
		return deli_afterTime;
	}

	public String wasAndroidProductInsert(Map<String, Object> pMap) {
		int result = 0;
		String string = null;
		result = androidDao.wasAndroidProductInsert(pMap);
		if(result == 0) {
			string ="입력사항을 다시 확인하세요.";
		}else {
			string ="입력 성공하였습니다.";
		}
		return string;
	}
}
