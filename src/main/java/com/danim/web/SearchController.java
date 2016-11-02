package com.danim.web;

import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value="search/infoSearch")
	public String infoSearch(Model model, String search, @RequestParam(value="moreView", defaultValue="5") int moreView) {
		// search : 검색어(도시이름)
		logger.info("search {} 값 입니다", search);
		logger.info("moreView {} 값 입니다", moreView);
		List<SearchDto> selectCityInfoName = searchService.getselectCityInfoName(search);
		List<SearchDto> selectLandmarkInfo = searchService.getSelectLandmarkInfo(search);
		List<SearchDto> selectEateryInfo = searchService.getSelectEateryInfo(search, moreView);
		List<SearchDto> selectEventInfo = searchService.getSelectEventInfo(search);
		List<SearchDto> selectStayInfo = searchService.getSelectStayInfo(search);
		List<String> selectCityAll = searchService.getSelectCityAll();
		
		model.addAttribute("search", search);
		model.addAttribute("moreView", moreView);
		model.addAttribute("selectCityInfoName", selectCityInfoName);
		model.addAttribute("selectLandmarkInfo", selectLandmarkInfo);
		model.addAttribute("selectEateryInfo", selectEateryInfo);
		model.addAttribute("selectEventInfo", selectEventInfo);
		model.addAttribute("selectStayInfo", selectStayInfo);
		model.addAttribute("selectCityAll", selectCityAll);
		
		
		return "/search/infoSearch";
	}
	
	@RequestMapping(value="search/landmarkInfo")
	public String landmarkInfo(Model model, @RequestParam(value="landmarkInfoNo") String landmarkInfoNo, @RequestParam(value="cityInfoName") String cityInfoName) {
		// landmarkInfoNo(명소정보번호) : infoSearch(검색화면)에서 검색된 해당 지역 명소의 가이드북을 클릭할 때 넘겨주는 명소번호
		logger.info("landmarkInfoNo 값 {} 입니다", landmarkInfoNo);
		logger.info("cityInfoName 값 {} 입니다", cityInfoName);
		Map<String, Object> selectLandmarkInfoOne = searchService.getSelectLandmarkInfoOne(landmarkInfoNo);
		
		model.addAttribute("selectLandmarkInfoOne", selectLandmarkInfoOne);
		model.addAttribute("cityInfoName", cityInfoName);
		
		return "/search/landmarkInformation";
	}
	
/*	@RequestMapping(value="search/eateryInfo")
	public String eateryInfo(Model model, @RequestParam(value="eateryNo") String eateryNo, @RequestParam(value="cityInfoName") String cityInfoName) {
		// eateryNo(음식점번호) : infoSearch(검색화면)에서 검색된 해당 지역 음식점의 가이드북을 클릭할 때 넘겨주는 음식점번호
		logger.info("eateryNo 값 {} 입니다", eateryNo);
		logger.info("cityInfoName 값 {} 입니다", cityInfoName);
		Map<String, Object> selectEateryInfoOne = searchService.getSelectEateryInfoOne(eateryNo);
		
		model.addAttribute("selectEateryInfoOne", selectEateryInfoOne);
		model.addAttribute("cityInfoName", cityInfoName);
		
		return "/search/eateryInformation";
	}*/
	
	@RequestMapping(value="search/eventInfo")
	public String eventInfo(Model model, @RequestParam(value="eventInfoName") String eventInfoName, @RequestParam(value="cityInfoName") String cityInfoName) {
		// eventInfoName(축제정보이름) : infoSearch(검색화면)에서 검색된 해당 지역 축제의 가이드북을 클릭할 때 넘겨주는 축제이름
		logger.info("eventInfoName 값 {} 입니다", eventInfoName);
		logger.info("cityInfoName 값 {} 입니다", cityInfoName);
		Map<String, Object> selectEventInfoOne = searchService.getSelectEventInfoOne(eventInfoName);
		
		model.addAttribute("selectEventInfoOne", selectEventInfoOne);
		model.addAttribute("cityInfoName", cityInfoName);
		
		return "/search/eventInformation";
	}
	
	@RequestMapping(value="search/stayInfo")
	public String stayInfo(Model model, @RequestParam(value="stayInfoNo") String stayInfoNo, @RequestParam(value="cityInfoName") String cityInfoName) {
		// eventInfoName(축제정보이름) : infoSearch(검색화면)에서 검색된 해당 지역 축제의 가이드북을 클릭할 때 넘겨주는 축제이름
		logger.info("stayInfoNo 값 {} 입니다", stayInfoNo);
		logger.info("cityInfoName 값 {} 입니다", cityInfoName);
		Map<String, Object> selectStayInfoOne = searchService.getSelectStayInfoOne(stayInfoNo);
		
		model.addAttribute("selectStayInfoOne", selectStayInfoOne);
		model.addAttribute("cityInfoName", cityInfoName);
		
		return "/search/stayInformation";
	}

}
