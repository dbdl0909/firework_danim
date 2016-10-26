	package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class FrontController {
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@RequestMapping(value = "/")
	public String indexController() {
		logger.info("indexController FrontController.java");
		return "index";		
	}
	
	@RequestMapping(value = "/search")
	public String searchController() {
		logger.info("searchController FrontController.java");
		return "search/infoSearch";
	}
}
