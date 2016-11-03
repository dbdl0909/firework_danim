package com.danim.web;
	
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.danim.service.index.IndexLandmarkImageDto;
import com.danim.service.index.IndexService;

@Controller
@RequestMapping(value = "/")
public class FrontController {
	@Autowired
	IndexService indexService;
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	
	@RequestMapping(value = "/")
	public String indexController(Model model) {
		logger.info("indexController FrontController.java");
		List<IndexLandmarkImageDto> selectLandmarkImageForIndex = indexService.selectLandmarkImageForIndex();
		
		model.addAttribute("selectLandmarkImageForIndex", selectLandmarkImageForIndex);
		
		return "index";		
	}
	
	@RequestMapping(value = "/search")
	public String searchController() {
		logger.info("searchController FrontController.java");
		return "search/infoSearch";
	}
}
