package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.util.Encryption;

@Service
public class WasLogic {
	private static final Logger logger = LoggerFactory.getLogger(WasLogic.class);
	@Autowired
	WasDao wasDao;
	
	public void wasLogin(Map<String, Object> pMap) {
		Encryption et = new Encryption();
		logger.info("wasLogin:::::::::::::::::::"+pMap.get("firstLogin"));
		logger.info("건들이기 전 sid :"+pMap.get("session_no"));
		wasDao.wasLogin(pMap);
		String emp_name = pMap.get("msg").toString();
		if(!"존재하지 않는 사원코드입니다..".equals(emp_name)&&!"비밀번호를 다시 확인하세요".equals(emp_name))  {
			//첫 로그인일때만 타는 if문
			if(pMap.get("firstLogin")!=null) {
				//암호화처리할 때 더미값을 넣을 index위치를 사원의 생일날자를 이용하기위해
				//DB에서 사원의 생일날자를 땡겨오는로직.
				String dumyIndex = wasDao.dumyIndex(pMap.get("empno").toString()).substring(4, 6);
				//세션아이디를 DB에 담기 전에 암호화처리. 
				String dumy_session = et.encryption(pMap.get("session_no").toString(), dumyIndex);
				pMap.put("session_no", dumy_session); 
				//세션이 생성 돼는 즉 첫번째 로그인일때만 DB에 세션아이디를 업데이트 해야 하기 때문에
				//index.jsp에서 로그인할때만 request에 firstLogin속성이 담겨있다.
				wasDao.firstLogin(pMap);
			}
			else {
				logger.info("n번의 로그인인 경우 :"+pMap.get("empno"));
				Map<String,Object> dumy_session = wasDao.checkLogin(pMap);
				String origin_session = et.decryption(dumy_session);
				if(!origin_session.equals(pMap.get("session_no").toString())) {
					logger.info("세션아이디가 다를 경우");
					logger.info("복호화 sid :"+origin_session);
					logger.info("현재 접속 sid :"+pMap.get("session_no").toString());
					pMap.put("emp_name", "기존 아이디로 새로운 접속이 감지되었습니다.");
					return;
				}
			}
		}
		pMap.put("emp_name", emp_name);
	}

	public List wasEmpStatus(String empno) {
		List<Map<String,Object>> empStatus = wasDao.wasEmpStatus(empno);
		return empStatus;
	}
}
