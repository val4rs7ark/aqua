package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
////////////////////////아직 수정중.... 0928 
@Service
public class EmpLogic {
	private static final Logger logger = LoggerFactory.getLogger(EmpLogic.class);
	@Autowired
	EmpDao empDao;
	int total =0;

	public void empSignUp(Map<String, Object> pMap) {
		String resident_no=(pMap.get("resident_no_1").toString())+(pMap.get("resident_no_2").toString());
		logger.info("empSignUp Logic 호출 성공");
		String emp_addr=(pMap.get("emp_addr_1").toString())+"/"+(pMap.get("emp_addr_2").toString());
		pMap.put("resident_no", resident_no);
		pMap.put("emp_addr", emp_addr);
		empDao.empSignUp(pMap);
	}
	///////////////////////////////////   조회        ////////////////////////////////
	public List<Map<String, Object>> empListSignUp(Map<String, Object> pMap) {
		logger.info("EmpLogic --empListSignUp 호출 성공");
		List<Map<String,Object>> eList = empDao.empListSignUp(pMap);
		return eList;
	}
	/////////////////////////////////// 상세조회      ////////////////////////////////
	public List<Map<String, Object>> empSelect(String empno) {
		logger.info("EmpLogic --empSelect 호출 성공");
		List<Map<String, Object>> sList = empDao.empSelect(empno);
		logger.info("EmpLogic --.xml 쿼리문까지 다녀왔다!");
		//하나의 값을 두개의 텍스트박스에 넣어주기 위해서 분기.
		String s_resident_no = sList.get(0).get("RESIDENT_NO").toString();
		//분기해주기 위해 가운데 -를 넣어서 .insert를 이용할 건데, 그러려면 StringBuffer로 써줘야함.
		StringBuffer resident_no = new StringBuffer(s_resident_no);
		resident_no.insert(6, "-");
		StringTokenizer str = new StringTokenizer(resident_no.toString(),"-");
		//주민번호 앞자리, 뒷자리
		String rfront = str.nextToken();
		String rback = str.nextToken();
		//위 주민번호와 같은 방식으로 주소 또한 나눠줌.
		String s_empaddr = sList.get(0).get("EMP_ADDR").toString();
		StringTokenizer staddr = new StringTokenizer(s_empaddr,"/");
		//주소 앞자리, 뒷자리
		String addrfront = staddr.nextToken();
		String addrback = staddr.nextToken();
		Map<String,Object> sMap = new HashMap<>();
		sMap.put("RESIDENT_NO_1",rfront);
		sMap.put("RESIDENT_NO_2",rback);
		sMap.put("EMP_ADDR_1",addrfront);
		sMap.put("EMP_ADDR_2",addrback);
		logger.info(sList.get(0).get("SAL_ACCOUNT").toString());
		sList.add(sMap);
		return sList;
	}
	///////////////////////////////////   삭제        ////////////////////////////////
	public void empDel(String tg_del) {
		logger.info("EmpLogic --empDEL 호출 성공");
		empDao.empDel(tg_del);
	}
	public int getTot(Map<String,Object> pMap) {
		total =0;
		total=empDao.getTot(pMap);
		
		return total;
	}
	public void empUPD(Map<String, Object> pMap) {
		String resident_no=(pMap.get("resident_no_1").toString())+(pMap.get("resident_no_2").toString());
		logger.info("empUPD Logic 호출 성공");
		String emp_addr=(pMap.get("emp_addr_1").toString())+"/"+(pMap.get("emp_addr_2").toString());
		pMap.put("resident_no", resident_no);
		pMap.put("emp_addr", emp_addr);
		empDao.empUPD(pMap);
	}


}
