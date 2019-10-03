package com.was.erp;


import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ProductController implements ActionServlet {
	Logger logger = Logger.getLogger(ProductController.class);
	Map<String, Object> pMap = null;
	String mapping = null;
	ProductLogic productLogic = null;

	public ProductController(Map<String, Object> pMap, String mapping) {
		this.pMap = pMap;
		this.mapping = mapping;
		productLogic = new ProductLogic();
	}
	@Override
	public Model execute() {
		logger.info("mapping --"+mapping);
		Model model = new Model();
		if("productInsert".equals(mapping)) {
			List<Map<String,Object>> rList = productLogic.productInsert(pMap);
			logger.info("productInsert 결과 :::::::::"+rList.get(0).get("msg").toString());
			model.setAddAttribute(rList);
			model.setViewPath("WEB-INF/views/products");
			model.setViewName("productsAdd");
			model.setViewExtension("jsp");
		}
		else if("productList".equals(mapping)) {
			List<Map<String,Object>> rList = productLogic.productList(pMap);
			model.setAddAttribute(rList);
			model.setViewPath("WEB-INF/views/products");
			model.setViewName("productsAdd");
			model.setViewExtension("jsp");
		}
		else if("productShipIn".equals(mapping)) {
			List<Map<String,Object>> rList = productLogic.productShipIn(pMap);
			logger.info("productShipOut 결과 :::::::::"+rList.get(0).get("msg").toString());
			model.setAddAttribute(rList);
			model.setViewPath("WEB-INF/views/products");
			model.setViewName("main");
			model.setViewExtension("jsp");
		}
		else if("productShipOut".equals(mapping)) {
			List<Map<String,Object>> rList = productLogic.productShipOut(pMap);
			logger.info("productShipOut 결과 :::::::::"+rList.get(0).get("msg").toString());
			model.setAddAttribute(rList);
			model.setViewPath("WEB-INF/views/products");
			model.setViewName("main");
			model.setViewExtension("jsp");
		}
		return model;
	}

}
