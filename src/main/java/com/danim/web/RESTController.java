package com.danim.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.TotalInfoService;
import com.danim.service.search.SearchDto;
import com.danim.service.search.SearchMoreService;

@Controller
public class RESTController {
	private static final Logger logger = LoggerFactory.getLogger(RESTController.class);
	
	@Autowired
    private TotalInfoService totalInfoService;
	
	@Autowired
	private SearchMoreService searchMoreService;	
	
	Model model;
	
	@RequestMapping(value = "/plan/RESTTotalInfo")
	public String totalInfo(Model model,
							@RequestParam(value="clickCityName") String clickCityName,
							@RequestParam(value="clickIcon") String clickIconName) {
		logger.info("totalInfo() RESTController.java");
		logger.info("clickCityName : {} totalInfo() RESTController.java", clickCityName);
		logger.info("clickIconName : {} totalInfo() RESTController.java", clickIconName);

		model.addAttribute("totalInfo", totalInfoService.selectTotalInfoByCityName(clickCityName));
		//logger.info("model : {} landmarkInfo() RESTController.java", model);
		logger.info("정상");
		
		//클릭한 탭이 무엇인지(명소, 식당, 숙소, 축제 중 하나) 가져와서 이동시킬 페이지를 분기시킨다.
		String infoPage = null;
		if(clickIconName.equals("명소")) {
			infoPage = "/plan/landmarkInfo";
		} else if(clickIconName.equals("식당")) {
			infoPage = "/plan/eateryInfo";
		} else if(clickIconName.equals("숙소")) {
			infoPage = "/plan/stayInfo";
		} else if(clickIconName.equals("축제")) {
			infoPage = "/plan/eventInfo";
		}
		
		return infoPage;
	}
	
	@RequestMapping(value = "/search/searchMore")
	public String searchMore(Model model, @RequestParam(value="search") String search, @RequestParam(value="moreView") int moreView) {
		logger.info("searchMore() RESTController.java");
		logger.info("search {} 값 입니다", search);
		logger.info("MoreView {} 값 입니다", moreView);
		
		List<SearchDto> selectEateryInfoList = searchMoreService.getSelectEateryInfo(search, moreView);
		
		model.addAttribute("searchMore", selectEateryInfoList);
	
		return "/search/eateryMore";
	}
}
