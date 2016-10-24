package com.danim.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.plan.CityInfoDto;
import com.danim.service.plan.CityInfoService;

@Controller
public class PlanController {
	private static final Logger logger = LoggerFactory.getLogger(PlanController.class);
	
	@Autowired
    private CityInfoService cityInfoService;
	
	Model model;
	
	@RequestMapping(value = "/plan/mainPlan")
	public String mainPlan(Model model, @RequestParam(value="do")String doArea) {
		//지도 그림에서 도를 클릭했을때 do 담겨진 값을 doArea에 담는다.
		logger.info("doArea(도 이름) : {} <-- mainPlan() PlanController.java", doArea);
		
		//doArea(도 이름)의 값을 매개변수에 담아 해당 도의 도시들을 리스트에 담아 가져온다.
		List<CityInfoDto> listCityInfoByCityInfoDoName = cityInfoService.selectCityInfoByCityInfoDoName(doArea);
		//가져온 리스트를 jsp 페이지에서 출력하기 위해 model에 담는다. 
		model.addAttribute("listCityInfoByCityInfoDoName", listCityInfoByCityInfoDoName);
		
		return "plan/mainPlan";
	}
	
	/*@RequestMapping(value = "/plan/planTest")
	public String planTest() {
		logger.info("Welcome planTest! The client locale is {}.");
		
		
		return "plan/planTest";
	}*/

}
