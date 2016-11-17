package com.danim.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.TotalInfoService;
import com.danim.service.recommand.RecommandService;
import com.danim.service.search.SearchMoreService;

@Controller
public class RESTController {
	private static final Logger logger = LoggerFactory.getLogger(RESTController.class);
	
	@Autowired
    private TotalInfoService totalInfoService;
	
	@Autowired
	private SearchMoreService searchMoreService;
	
	@Autowired
	private RecommandService recommandService;
	
	Model model;
	
	@RequestMapping(value = "/plan/RESTTotalInfo")
	public String totalInfo(Model model,
							@RequestParam(value="clickCityName") String clickCityName,
							@RequestParam(value="clickIcon") String clickIconName,
							@RequestParam(value="infoMoreView") int infoMoreView) {
		logger.info("totalInfo() RESTController.java");
		logger.info("clickCityName : {} totalInfo() RESTController.java", clickCityName);
		logger.info("clickIconName : {} totalInfo() RESTController.java", clickIconName);

		model.addAttribute("totalInfo", totalInfoService.selectTotalInfoByCityName(clickCityName, infoMoreView));
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
	
	// 검색결과 하면 더보기 버튼 클릭시
	@RequestMapping(value = "/search/searchMore")
	public String searchMore(Model model,
							@RequestParam(value="search") String search,
							@RequestParam(value="moreView") int moreView,
							@RequestParam(value="clickMoreView") int clickMoreView) {
		logger.info("searchMore() RESTController.java");
		logger.info("search {} 값 입니다", search);
		logger.info("MoreView {} 값 입니다", moreView);
		logger.info("clickMoreView {} 값 입니다", clickMoreView);
		
		String searchMore = null;
		if(clickMoreView == 0) {
			searchMore = "/search/landmarkMore";
		}else if(clickMoreView == 1) {
			searchMore = "/search/eateryMore";
		}else if(clickMoreView == 2) {
			searchMore = "/search/eventMore";
		}else if(clickMoreView == 3) {
			searchMore = "/search/stayMore";
		}
		
		model.addAttribute("searchMore", searchMoreService.searchMore(search, moreView));
	
		return searchMore;
	}
	
	// 성별간 많이 가는 도시 top5 / 성별간 많이가는 도 특별광역시
	@RequestMapping(value = "/recommand/recommandGender")
	public String recommandGender(Model model, @RequestParam(value="gender") String gender) {
		logger.info("recommandGender RecommandController.java");
		logger.info("gender {} RecommandController.java", gender);
		
		model.addAttribute("selectCityForGender" , recommandService.selectCityForGender(gender));
		model.addAttribute("selectCityAllByGender", recommandService.selectCityAllByGender(gender));
		model.addAttribute("gender", gender);
		
		return "/recommand/recommandGender";
	}
	
	// 전체 회원 많이 여행 간 도시 지오차트
	@RequestMapping(value = "/recommand/recommandPopularity")
	public String recommandPopularity(Model model) {
		logger.info("recommandPopularity RecommandController.java");
		
		model.addAttribute("selectPopularityCity", recommandService.selectPopularityCity());
		
		return "/recommand/recommandPopularity";
	}
	
	// 전체 회원 많이 여행 간 도시 지오차트
	@RequestMapping(value = "/recommand/recommandProvince")
	public String recommandProvince(Model model, @RequestParam(value="province") String province) {
		logger.info("recommandProvince RecommandController.java");
		logger.info("province {} RecommandController.java", province);
		
		model.addAttribute("selectCityByProvince", recommandService.selectCityByProvince(province));
		model.addAttribute("province", province);
		
		return "/recommand/recommandProvince";
	}
}
