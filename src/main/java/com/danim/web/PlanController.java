package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.CityInfoService;

@Controller
public class PlanController {
	
	private static final Logger logger = LoggerFactory.getLogger(PlanController.class);
	
	@Autowired
    private CityInfoService cityInfoService;
	Model model;
	@RequestMapping(value = "/plan/mainPlan")
	public String mainPlan(Model model, @RequestParam(value="do")String doArea) {
		logger.info("도시이름: {}", doArea);
		
		logger.info("모델:{}",cityInfoService.selectcityInfo(doArea));
		model.addAttribute("listCityInfoDto", cityInfoService.selectcityInfo(doArea));
		
		return "plan/mainPlan";
	}
	@RequestMapping(value = "/plan/planTest")
	public String planTest() {
		logger.info("Welcome planTest! The client locale is {}.");
		
		
		return "plan/planTest";
	}
	
	@RequestMapping(value = "/plan/city")
	public String cityInfo() {
		return null;
	}

}
