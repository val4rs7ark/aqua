package com.was.erp;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;
//190918
public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);
	EmpDao empDao;
	public EmpLogic() {
		empDao = new EmpDao();
	}

	public List<Map<String, Object>> empSignUp(Map<String, Object> pMap) {
		empDao.empSignUp(pMap);
		List<Map<String,Object>> rList = new ArrayList<>();
		if(pMap.get("msg") != null) {
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("msg", pMap.get("msg"));
			rList.add(rMap);
		}
		return rList;
	}
}
