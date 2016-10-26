package com.danim.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.search.SearchDto;
import com.danim.service.search.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping(value="/infoSearch")
	public String infoSearch(Model model, String search) {
		// search : 검색어(도시이름)
		logger.info("search {} 값 입니다", search);
		SearchDto selectCityInfoName = searchService.getselectCityInfoName(search);
		List<SearchDto> selectLandmarkInfo = searchService.getSelectLandmarkInfo(search);
		List<SearchDto> selectEateryInfo = searchService.getSelectEateryInfo(search);
		List<SearchDto> selectEventInfo = searchService.getSelectEventInfo(search);
		List<SearchDto> selectStayInfo = searchService.getSelectStayInfo(search);
		
		model.addAttribute("selectCityInfoName", selectCityInfoName);
		model.addAttribute("selectLandmarkInfo", selectLandmarkInfo);
		model.addAttribute("selectEateryInfo", selectEateryInfo);
		model.addAttribute("selectEventInfo", selectEventInfo);
		model.addAttribute("selectStayInfo", selectStayInfo);
		
		
		return "search/infoSearch";
	}
	
	@RequestMapping(value="/landmarkInfo")
	public String landmarkInfo(Model model, @RequestParam(value="landmarkInfoNo") String landmarkInfoNo) {
		// landmarkInfoNo(명소정보번호) : infoSearch(검색화면)에서 검색된 해당 지역 명소의 가이드북을 클릭할 때 넘겨주는 명소번호
		logger.info("landmarkInfoNo 값 {} 입니다", landmarkInfoNo);
		List<SearchDto> selectLandmarkInfoOne
		= searchService. 
		
		return "information/landmarkInformation";
	}

}
