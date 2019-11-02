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
public class BoardDao {
   private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
   @Autowired
   SqlSessionTemplate sqlSessionTemplate = null;
   public int boardTotal(Map<String, Object> pMap) {
      logger.info("boardTotal 호출 성공");
      int tot = 0;
      try {
         tot = sqlSessionTemplate.selectOne("boardTotal",pMap);
         logger.info("이상없음 tot:"+tot);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return tot;
   }
//===================================================================main 공지사항===========================================================================//
   
   public List<Map<String, Object>> boardList2(Map<String, Object> bMap) {
	   // TODO Auto-generated method stub
	   logger.info("main>boardList 호출 성공"); 
	   List<Map<String,Object>> boardList = null;
	   try {
		   boardList = sqlSessionTemplate.selectList("boardList_ghost",bMap); 
		   logger.info("boardList size:"+boardList.size());
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   return boardList; 
   }
//==============================================================================================================================================//

   public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
       logger.info("boardList 호출 성공"); 
        List<Map<String,Object>> boardList = null;
        try {
           boardList = sqlSessionTemplate.selectList("boardList",pMap); 
           logger.info("boardList size:"+boardList.size());
      } catch (Exception e) {
         e.printStackTrace();
      }
        return boardList; 
   }
	public List<Map<String, Object>> boardDetail(Map<String, Object> bMap) {
		logger.info("Dao>boardDetail 호출 성공");
		  List<Map<String, Object>> r_list = new ArrayList<>();
	      try { 
	    	  r_list = sqlSessionTemplate.selectList("boardDetail",bMap); 
	      } catch (Exception e) {
	               e.printStackTrace(); 
	      }
	      return r_list;
	}
   
   
}