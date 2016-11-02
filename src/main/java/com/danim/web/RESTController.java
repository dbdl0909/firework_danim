package com.danim.web;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.LandmarkInfoDto;
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
		
		List<LandmarkInfoDto> listLandmarkInfo = totalInfoService.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfo : {} landmarkInfo() RESTController.java", listLandmarkInfo);
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("listLandmarkInfo", listLandmarkInfo);*/
		model.addAttribute("listLandmarkInfo", listLandmarkInfo);
		
		return "/plan/landmarkInfo";
	}
	
}
