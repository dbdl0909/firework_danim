package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.danim.service.recommand.RecommandService;

@Controller
public class RecommandController {
	private static final Logger logger = LoggerFactory.getLogger(RecommandController.class);
	
	@Autowired
	RecommandService recommandService;
	
	@RequestMapping(value = "/recommand/recommandMain")
	public String recommandMain(Model model) {
		logger.info("recommandMain RecommandController.java");
		
		//model.addAttribute("selectCityForGender" , recommandService.selectCityForGender());
		//model.addAttribute("selectPopularityCity", recommandService.selectPopularityCity());
		model.addAttribute("selectSeasonCityTwenty", recommandService.selectSeasonCityTwenty());
		
		return "/recommand/recommandTest";
	}
}
