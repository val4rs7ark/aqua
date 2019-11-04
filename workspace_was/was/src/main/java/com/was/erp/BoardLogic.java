package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class BoardLogic {
   private static final Logger logger = LoggerFactory.getLogger(BoardLogic.class);
   @Autowired
   BoardDao boardDao;

   //==================================================================main 공지사항==========================================================================//

   public List<Map<String, Object>> boardList(Map<String, Object> bMap) {
	   List<Map<String, Object>> boardList = boardDao.boardList2(bMap);
	   return boardList;
   }

   //==================================================================main 공지사항==========================================================================//

	public List<Map<String, Object>> boardDetail(Map<String, Object> bMap) {
		logger.info("Logic>boardDetail 호출 성공");
		List<Map<String, Object>> r_list = null;
		Map<String, Object> boardDetail = new HashMap<>();
		int bo_no = 0; 
		if (bMap.get("bo_no") != null) { 
			bo_no = Integer.parseInt(bMap.get("bo_no").toString()); 
			boardDetail.put("bo_no", bo_no);
			logger.info("bo_no : "+bo_no);
		}
		r_list = boardDao.boardDetail(boardDetail);
		return r_list;
	}

	public int boardInsert(Map<String, Object> pMap) {
		logger.info("boardInsert 호출 성공");
        int result = 0;
        try { 
          result = boardDao.boardInsert(pMap);
        }
        catch (DataAccessException e) { 
           throw e; 
        } 
        return result;      
		
	}


}