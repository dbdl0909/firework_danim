package com.danim.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.CityInfoDto;
import com.danim.service.plan.MainPlanDto;
import com.danim.service.plan.PlanAllDto;
import com.danim.service.plan.PlanDto;
import com.danim.service.plan.PlanService;
import com.danim.service.plan.TotalInfoService;

@Controller
public class PlanController {
	private static final Logger logger = LoggerFactory.getLogger(PlanController.class);
	
	@Autowired
    private TotalInfoService totalInfoService;
	@Autowired
    private PlanService planService;
	Model model;
	
	//mainPlan에서 넘어온 값들 받아서 입력하기 
	@RequestMapping(value = "/plan/planInfo", method = RequestMethod.POST)
	public String planInfo(Model model, MainPlanDto mainPlanDto) {
		logger.info("planInfo() PlanController.java");
		
		logger.info("planAndLandmarkPlanDto : {}", mainPlanDto);
		
		totalInfoService.insertPlanTotal(mainPlanDto);
		return "redirect:/";
	}

	
	//아이디값 받아서 내 플랜 보여주기
		@RequestMapping(value = "/plan/planList")
		public String MemberPlanList(Model model,@RequestParam(value="memberId") String memberId){
			
			List<PlanDto> planList = planService.selectPlanList(memberId);
			
			model.addAttribute("planList",planList);
			
			return "plan/planList";
		}
		//플랜넘버값 받아 상세플랜 보여주기
		@RequestMapping(value = "/plan/planDetailList")
		public String MemberPlanDetailList(Model model,@RequestParam(value="planNo") int planNo){
			
			List<PlanAllDto> PlanDetailList = planService.selectPlanDetailList(planNo);
			System.out.println(PlanDetailList);
			model.addAttribute("PlanDetailList",PlanDetailList);
			
			return "plan/planDetailList";
		}
	@RequestMapping(value = "/plan/mainPlan")
	public String mainPlan(Model model, @RequestParam(value="memberId")String memberId) {
		logger.info("mainPlan() PlanController.java");
		/*//지도 그림에서 도를 클릭했을때 do 담겨진 값을 doArea에 담는다.
		logger.info("doArea(도 이름) : {} <-- mainPlan() PlanController.java", doArea);
		
		//doArea(도 이름)의 값을 매개변수에 담아 해당 도의 도시들을 리스트에 담아 가져온다.
		List<CityInfoDto> listCityInfoByCityInfoDoName = totalInfoService.selectCityInfoByCityInfoDoName(doArea);
		*/
		List<CityInfoDto> listCityInfo = totalInfoService.selectCityInfoAll();
		//가져온 리스트를 jsp 페이지에서 출력하기 위해 model에 담는다. 
		model.addAttribute("listCityInfo", listCityInfo);
		model.addAttribute("memberId", memberId);
		
		return "plan/mainPlan";
	}
	
	@RequestMapping(value = "/plan/divisionTest")
	public String planTest() {
		return "plan/divisionTest";
	}
	
	@RequestMapping(value = "/plan/mainPlanTest")
	public String mainPlanTest(Model model) {
		logger.info("mainPlanTest() PlanController.java");
		/*//지도 그림에서 도를 클릭했을때 do 담겨진 값을 doArea에 담는다.
		logger.info("doArea(도 이름) : {} <-- mainPlan() PlanController.java", doArea);
		
		//doArea(도 이름)의 값을 매개변수에 담아 해당 도의 도시들을 리스트에 담아 가져온다.
		List<CityInfoDto> listCityInfoByCityInfoDoName = totalInfoService.selectCityInfoByCityInfoDoName(doArea);
		*/
		List<CityInfoDto> listCityInfo = totalInfoService.selectCityInfoAll();
		//가져온 리스트를 jsp 페이지에서 출력하기 위해 model에 담는다. 
		model.addAttribute("listCityInfo", listCityInfo);
		
		return "plan/mainPlanTest";
	}

}
