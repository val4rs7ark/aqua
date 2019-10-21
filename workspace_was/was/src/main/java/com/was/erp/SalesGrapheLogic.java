package com.was.erp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
	public List<Map<String, Object>> salesMainSelect(Map<String, Object> pMap) {
		logger.info("Logic salesMainSelect =======");
		//현재 달과 현재로부터 6달전 값 구하기
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Object day1  = date.format(cal.getTime());
		cal.add(Calendar.MONTH, -6);
		Object day2  = date.format(cal.getTime());
		//쿼리문에서 사용될 현재 달과 현재 달-6 값 넣기
		pMap.put("g_date_1", day1);
		pMap.put("g_date_2", day2);
		List<Map<String,Object>> sList = salesDao.salesMainSelect(pMap);
		//DB에서 가져온 날짜 잘라서 Map안에 값 변경하기
		String[] sgDates = null;
		List<Map<String,Object>> rList = new ArrayList<>();
		for(int i =0;i<sList.size();i++) {
			Map<String,Object> rMap = new HashMap<>();
			rMap = sList.get(i);
			String sgDate = sList.get(i).get("MONTH").toString();
			sgDates = sgDate.split("-");
			logger.info("가져온 날짜을 보여주세요 : "+sgDates[1]);
			rMap.put("MONTH", sgDates[1]);
			rList.add(rMap);
			rMap = null;
		}
		return rList;
	}
	

}
