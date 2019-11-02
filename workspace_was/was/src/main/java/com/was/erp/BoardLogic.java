package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardLogic {
   private static final Logger logger = LoggerFactory.getLogger(BoardLogic.class);
   @Autowired
   BoardDao boardDao;

   public int boardTotal(Map<String, Object> pMap) {
      logger.info("boardTotal 호출 성공");
      int tot = boardDao.boardTotal(pMap);
      return tot;
   }
   //==================================================================main 공지사항==========================================================================//

   public List<Map<String, Object>> boardList(Map<String, Object> bMap) {
	   List<Map<String, Object>> boardList = boardDao.boardList2(bMap);
	   return boardList;
   }

   //==================================================================main 공지사항==========================================================================//
  
   public List<Map<String, Object>> boardList(Map<String, Object> pMap, int tot) {
      logger.info("Logic-productList 호출 성공");
      int nowPage = 1;// 현재 페이지
      if (pMap.get("nowPage") != null) {
         nowPage = Integer.parseInt(pMap.get("nowPage").toString()) + 1;
      }
      int pagePer_Num = 5;// 한페이지에 뿌려질 로우수
      int start = 0;
      int end = 0;
      if (nowPage > 0) {
         start = ((nowPage - 1) * pagePer_Num) + 1;
         end = nowPage * pagePer_Num;
         pMap.put("start", start);
         if (end > tot) {
            pMap.put("end", tot);
         } else {
            pMap.put("end", end);
         }
      }
      logger.info("tot :" + tot);
      logger.info("nowPage :" + nowPage);
      logger.info("start :" + start);
      logger.info("end :" + end);
      List<Map<String, Object>> boardList = boardDao.boardList(pMap);
      return boardList;
   }
   //============================================================================================================================================//

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


}