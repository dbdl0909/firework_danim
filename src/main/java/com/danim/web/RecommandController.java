package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.recommand.RecommandService;

@Controller
public class RecommandController {
	private static final Logger logger = LoggerFactory.getLogger(RecommandController.class);
	
	@Autowired
	RecommandService recommandService;
	
	@RequestMapping(value = "/recommand/recommandMain")
	public String recommandMain(Model model, @RequestParam(value = "memberId") String memberId) {
		logger.info("recommandMain RecommandController.java");
		logger.info("memberId {} RecommandController.java", memberId);
		
		//model.addAttribute("selectCityForGender" , recommandService.selectCityForGender());
		//model.addAttribute("selectPopularityCity", recommandService.selectPopularityCity());
		//model.addAttribute("selectSeasonCityTwenty", recommandService.selectSeasonCity2030());
		model.addAttribute(arg0);
		
		return "/recommand/recommandMain";
	}
}
