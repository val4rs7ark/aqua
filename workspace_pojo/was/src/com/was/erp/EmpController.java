package com.was.erp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
//190918
public class EmpController implements ActionServlet {
	private static final Logger logger = Logger.getLogger(EmpController.class);
	Map<String,Object> pMap = null;
	String mapping = null;
	EmpLogic empLogic = null;

	public EmpController(Map<String, Object> pMap, String mapping) {
		this.pMap = pMap;
		this.mapping = mapping;
		empLogic = new EmpLogic();
	}

	@Override
	public Model execute() {
		Model model = new Model();
		logger.info("mapping --"+mapping);
		 if("empSignUp".equals(mapping)) {
			List<Map<String,Object>> rList = empLogic.empSignUp(pMap);
			model.setAddAttribute(rList);
			model.setViewName("main");
			model.setViewPath("WEB-INF/views/login");
			model.setViewExtension("jsp");
		}else if("empListSignUp".equals(mapping)) {
			//아직 로직 미구현
			model.setViewName("empAdd");
		}
		return model;
	}
}
