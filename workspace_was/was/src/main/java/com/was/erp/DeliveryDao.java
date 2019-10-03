package com.was.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeliveryDao {
	Logger logger = LoggerFactory.getLogger(DeliveryDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> deliveryList(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////deliveryList호출성공");
		List<Map<String, Object>> deliveryList = null;
		try {
			deliveryList = sqlSessionTemplate.selectList("delivery",pMap);
			logger.info("deliveryList size :"+deliveryList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deliveryList;
	}

	public void deliveryInsert_List(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////deliveryInsert_List호출성공");
		pMap.put("msg","");
		try {sqlSessionTemplate.selectOne("deliveryInsert_List",pMap);
		logger.info(pMap.get("msg").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Map<String, Object>> deliveryInsert_ListF() {
		logger.info("DeliveryDao////////////deliveryInsert_ListF호출성공");
		List<Map<String, Object>> deliveryInsert_ListF = sqlSessionTemplate.selectList("deliveryInsert_ListF");
		return deliveryInsert_ListF;
	}

	public List<Map<String, Object>> deliveryInsert_ListS() {
		logger.info("DeliveryDao////////////deliveryInsert_ListS호출성공");
		List<Map<String, Object>> deliveryInsert_ListS = sqlSessionTemplate.selectList("deliveryInsert_ListS");
		return deliveryInsert_ListS;
	}

	public Map<String,Object> deli_save(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////deli_save호출성공");
		//Map<String,Object> result_Map = null;
		try {
			sqlSessionTemplate.selectOne("deli_save",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pMap;
	}

	public String deli_commit(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////deli_commit호출성공");
		String deli_afterTime = null;
		try {
			sqlSessionTemplate.selectOne("deli_afterTime",pMap);
			deli_afterTime = pMap.get("r_end_date").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deli_afterTime;
	}

	public void commit_state(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////commit_state호출성공");
		int result = 0;
		try {
			result = sqlSessionTemplate.update("commit_state",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("result : "+result);
	}
	public void update_state(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////update_state호출성공");
		int result = 0;
		try {
			result = sqlSessionTemplate.update("update_state",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("result : "+result);
	}
	public void cancle_state(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////cancle_state호출성공");
		int result = 0;
		try {
			result = sqlSessionTemplate.update("cancle_state",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("result : "+result);
	}

	public List<Map<String, Object>> delivery_selectcomp(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////delivery_selectcomp호출성공");
		List<Map<String, Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("delivery_selectcomp",pMap);
		} catch (Exception e) {
			e.printStackTrace();
	}
		return r_list;
	}
	public List<Map<String, Object>> delivery_selectfish() {
		logger.info("DeliveryDao////////////delivery_selectfish호출성공");
		List<Map<String, Object>> f_list = null;
		try {
			f_list = sqlSessionTemplate.selectList("delivery_selectfish");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f_list;
	}

	public String select_start(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////delivery_selectfish호출성공");
		String r_deli_start = null;
		try {
			r_deli_start = sqlSessionTemplate.selectOne("select_start",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_deli_start;
	}

	public Map<String, Object> delivery_selectInfo(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////delivery_selectInfo호출성공");
		List<Map<String, Object>> r_List = null;
		Map<String, Object> r_Map = null;
		try {
			r_List = sqlSessionTemplate.selectList("delivery_selectInfo",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		r_Map= r_List.get(0);
		return r_Map;
	}

	public void delivery_Update_Insert(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////delivery_Update_Insert호출성공");
		try {
			sqlSessionTemplate.selectOne("delivery_Update",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int get_total(Map<String, Object> pMap) {
		logger.info("DeliveryDao////////////get_total호출성공");
		int tot = 0;
		try {
			tot = sqlSessionTemplate.selectOne("delivery_getTotal",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tot;
	}

	public void deli_delete(String r_rowid[]) {
		logger.info("DeliveryDao////////////deli_delete호출성공");
		List<Integer> list = new ArrayList<>();
		for(int i=0;i<r_rowid.length;i++) {
			list.add(Integer.parseInt(r_rowid[i]));
		}
		try {
			sqlSessionTemplate.delete("deli_delete",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
