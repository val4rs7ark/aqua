package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
////////////////////////아직 수정중.... 0928 
@Service
public class EmpDao {
	private static final Logger logger = LoggerFactory.getLogger(EmpDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	int total =0;
	///////////////////////////////////   등록       ////////////////////////////////
	public void empSignUp(Map<String, Object> pMap) {
		logger.info("empSignUp Dao 호출 성공");
		sqlSessionTemplate.selectOne("empSignUp", pMap);
	}
	
	///////////////////////////////////   조회        ////////////////////////////////
	public List<Map<String, Object>> empListSignUp(Map<String, Object> pMap) {
		logger.info("EmpDao --empListSignUp 호출 성공");
		List<Map<String,Object>> eList = 
				sqlSessionTemplate.selectList("empListSignUp",pMap);
		return eList;
	}
	///////////////////////////////////  상세조회       ////////////////////////////////
	public List<Map<String, Object>> empSelect(String empno) {
		logger.info("EmpDao --empSelect 호출 성공");
		List<Map<String,Object>> sList = 
				sqlSessionTemplate.selectList("empSelect",empno);
		String sal_account=sList.get(0).get("SAL_ACCOUNT").toString();
		logger.info("EmpDao --볼 일 끝났다.  "+sal_account);
		return sList;
	}
	///////////////////////////////////   삭제        ////////////////////////////////
	public void empDel(String tg_del) {
		logger.info("EmpDao --empDel 호출 성공");
		sqlSessionTemplate.selectOne("empDel", tg_del);
		
	}
	///////////////////////////////////   목록 로우값        ////////////////////////////////
	public int getTot(Map<String, Object> pMap) {
		total=0;
		try {
			total= sqlSessionTemplate.selectOne("getTotal",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return total;////////페이지 네이션 수정 중......건들기만해봐. 진짜 가만 안둬.
	}
	///////////////////////////////////   수정       ////////////////////////////////
	public void empUPD(Map<String, Object> pMap) {
		logger.info("empUPD Dao 호출 성공");
		sqlSessionTemplate.selectOne("empUPD", pMap);
	}
}
