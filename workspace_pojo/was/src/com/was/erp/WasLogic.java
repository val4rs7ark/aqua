package com.was.erp;
//190925
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;

import com.util.Encryption;

public class WasLogic {
	Logger logger = Logger.getLogger(WasLogic.class);
	WasDao wasDao;
	public WasLogic() {
		wasDao = new WasDao();
	}
	public List<Map<String, Object>> wasLogin(Map<String, Object> pMap) {
		Encryption et = new Encryption();
		logger.info("wasLogin:::::::::::::::::::"+pMap.get("firstLogin"));
		wasDao.wasLogin(pMap);
		String emp_name = pMap.get("msg").toString();
		if(!"존재하지 않는 사원코드입니다..".equals(emp_name)&&!"비밀번호를 다시 확인하세요".equals(emp_name))  {
			//첫 로그인일때만 타는 if문
			if(pMap.get("firstLogin")!=null) {
				//암호화처리할 때 더미값이 고정인 점을 보완하기 위해 더미값에 사원의 생일날자를 더하기 위해
				//DB에서 사원의 생일날자를 땡겨오는로직.
				String dumyIndex = wasDao.dumyIndex(pMap.get("empno").toString()).substring(4, 6);
				//세션아이디를 DB에 담기 전에 암호화처리. 
				String dumy_session = et.encryption(pMap.get("session_no").toString(), dumyIndex);
				pMap.put("session_no", dumy_session); 
				//세션이 생성 돼는 즉 첫번째 로그인일때만 DB에 세션아이디를 업데이트 해야 하기 때문에
				//index.jsp에서 로그인할때만 request에 firstLogin속성이 담겨있다.
				wasDao.firstLogin(pMap);
			}else {	//첫 로그인이 아닌 경우
				logger.info("n번의 로그인인 경우 :"+pMap.get("empno"));
				Map<String,Object> dumy_session = wasDao.checkLogin(pMap);
				String origin_session = et.decryption(dumy_session);
				if(!origin_session.equals(pMap.get("session_no").toString())) {
					List<Map<String,Object>> rList = new ArrayList<>();
					pMap.put("emp_name", "기존 아이디로 새로운 접속이 감지되었습니다.");
					rList.add(pMap);
					return rList;
				}
			}
		}
		List<Map<String,Object>> rList = new ArrayList<>();
		if(pMap.get("msg") != null) {
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("emp_name", pMap.get("msg"));
			rMap.put("outtime", pMap.get("outtime"));
			rMap.put("empno", pMap.get("empno"));
			rMap.put("emp_pw", pMap.get("emp_pw"));
			rList.add(rMap);
		}
		return rList;
	}
	public List<Map<String, Object>> wasEmpStatus(Map<String, Object> pMap) {
		logger.info("pMap:::::::::"+pMap.keySet().toString());
		String empno = pMap.get("empno").toString();
		List<Map<String, Object>> result = wasDao.wasEmpStatus(empno);
		return result;
	}
}
