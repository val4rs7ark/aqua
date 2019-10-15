package com.was.erp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//...만드는중~ 틀만 만들었음!
@RequestMapping(value="/sales*")
@Controller
public class SalesGraphContorller {
	private static final Logger logger = LoggerFactory.getLogger(SalesGraphContorller.class);
	@Autowired
	SalesGrapheLogic salesLogic;
	
	public String salesSelect(@RequestParam Map<String,Object> pMap,Model mod) {
		logger.info("Controller salesSelect =======");
		salesLogic.salesSelect(pMap);
		return "";
	}

}
