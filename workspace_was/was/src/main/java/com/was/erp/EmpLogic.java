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
	///////////////////////////////////   등록       ////////////////////////////////
	public void empSignUp(Map<String, Object> pMap) {
		String resident_no=(pMap.get("resident_no_1").toString())+(pMap.get("resident_no_2").toString());
		logger.info("empSignUp Logic 호출 성공");
		String emp_addr=(pMap.get("emp_addr_1").toString())+"/"+(pMap.get("emp_addr_2").toString());
		pMap.put("resident_no", resident_no);
		pMap.put("emp_addr", emp_addr);
		pMap.put("msg", " ");
		empDao.empSignUp(pMap);
	}
	///////////////////////////////////   조회        ////////////////////////////////
	public List<Map<String, Object>> empListSignUp(Map<String, Object> pMap, int tot) {
		logger.info("EmpLogic --empListSignUp 호출 성공");
		int nowPage = 1;//현재 페이지
		if(pMap.get("nowPage")!=null) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString())+1;
		}
		int pagePer_Num = 11;//한페이지에 뿌려질 로우수
		int start = 0;
		int end = 0;
		if(nowPage>0) {
			start = ((nowPage-1)*pagePer_Num)+1;
			end = nowPage * pagePer_Num;
			pMap.put("start",start);
			if(end > tot) {
				pMap.put("end",tot);
			}else {
				pMap.put("end",end);
			}
		}
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
	///////////////////////////////////   수정        ////////////////////////////////
	public void empUPD(Map<String, Object> pMap) {
		String resident_no=(pMap.get("resident_no_1").toString())+(pMap.get("resident_no_2").toString());
		logger.info("empUPD Logic 호출 성공");
		String emp_addr=(pMap.get("emp_addr_1").toString())+"/"+(pMap.get("emp_addr_2").toString());
		
		//dept_name을 dept_code으로 바꿔서 내보내주자
		String dept_code= "";
		String dept_name = pMap.get("dept_code").toString();
				if(dept_name.equals("배송부")) {
					dept_code = "Z001";
				}
				else if(dept_name.equals("총무부")) {
					dept_code = "B001";
				}
				else if(dept_name.equals("생산부")) {
					dept_code = "D001";
				}
				else if(dept_name.equals("영업부")) {
					dept_code = "C001";
				}
				logger.info("dept_code"+dept_code);
		pMap.put("dept_code",dept_code);
		pMap.put("resident_no", resident_no);
		pMap.put("emp_addr", emp_addr);
		empDao.empUPD(pMap);
	}
	///////////////////////////////////   검색       ////////////////////////////////
	public List<Map<String, Object>> empSearch(Map<String, Object> pMap) {
		logger.info("empLogic empSearch 호출!");
		//empAdd 화면단에서 받아온 검색키워드(search_keyword_key) 값을 사용자가 입력한 값의 map key로 넣음.
		String searchKey = pMap.get("search_keyword_key").toString();
		String searchVal = pMap.get("search_keyword_val").toString();
		pMap.put(searchKey, searchVal);
		//값이 잘 들어갔는지 해체해서 까보기
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			logger.info("key :"+key.toString()+" , value :"+pMap.get(key.toString()));
		}
		List<Map<String,Object>> scList = empDao.empSearch(pMap);
		return scList;
	}


}
