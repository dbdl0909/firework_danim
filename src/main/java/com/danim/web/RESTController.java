package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.TotalInfoService;

@Controller
public class RESTController {
	private static final Logger logger = LoggerFactory.getLogger(RESTController.class);
	
	@Autowired
    private TotalInfoService totalInfoService;
	
	Model model;
	
	@RequestMapping(value = "/plan/RESTLandmarkInfo")
	public String landmarkInfo(Model model, @RequestParam(value="clickCityName") String clickCityName) {
		logger.info("landmarkInfo() RESTController.java");
		logger.info("clickCityName : {} landmarkInfo() RESTController.java", clickCityName);

		model.addAttribute("totalInfo", totalInfoService.selectTotalInfoByCityName(clickCityName));
		//logger.info("listLandmarkInfo : {} landmarkInfo() RESTController.java", totalInfoService.selectTotalInfoByCityName(clickCityName));
		//logger.info("model : {} landmarkInfo() RESTController.java", model);
		
		return "/plan/landmarkInfo";
	}
	
}
