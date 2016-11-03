package com.danim.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.diary.CityRouteDto;
import com.danim.service.diary.DiaryService;
import com.danim.service.plan.CityInfoDto;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class DiaryController {
	 private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	    @Autowired
	    private DiaryService diaryService;
	    Model model;
	@RequestMapping(value="/diary")//다이어리
	    public String diary(Model model
	                            ,@RequestParam(value="dayYear",defaultValue="0") int dayYear
	                            ,@RequestParam(value="dayMonth",defaultValue="0") int dayMonth
	                            ,@RequestParam(value="dayPage",defaultValue="default") String dayPage) {
	      Map<String, Object> map = diaryService.getDayList(dayYear, dayMonth, dayPage);
	        model.addAttribute("map", map);
	        model.addAttribute("dayList", map.get("dayList"));
	        model.addAttribute("dayYear", map.get("dayYear"));
	        model.addAttribute("dayMonth", map.get("dayMonth"));
	        model.addAttribute("dayPage", map.get("dayPage"));

	        return "/diary/diary";
	    }
	
	@RequestMapping(value="/diary1")//다이어리
    public String diary1(Model model
                            ,@RequestParam(value="dayYear",defaultValue="0") int dayYear
                            ,@RequestParam(value="dayMonth",defaultValue="0") int dayMonth
                            ,@RequestParam(value="dayPage",defaultValue="default") String dayPage
                            ) {
      Map<String, Object> map = diaryService.getDayAllList(dayYear, dayMonth, dayPage);
        model.addAttribute("map", map);
        model.addAttribute("dayList", map.get("dayList"));
        model.addAttribute("dayYear", map.get("dayYear"));
        model.addAttribute("dayMonth", map.get("dayMonth"));
        model.addAttribute("dayPage", map.get("dayPage"));

        return "/diary/diaryList";
    }
	@RequestMapping(value="/diaryList")
	public String diaryList(Model model
            ,@RequestParam(value="cityRouteDate",defaultValue="0") String cityRouteDate){
		return "/diary/diaryList";
	}
	 
	 @RequestMapping(value="/search")
	 public String searchTest(Model model){
		 List<CityRouteDto> cityRouteList = diaryService.selectCityRoute();
		 model.addAttribute("cityRouteList", cityRouteList);
		 return "diary/search";
	 }
	@RequestMapping(value="/search/list")
	 public String searchlist(Model model ,@RequestParam(value="cityRouteDepartureCity") String cityRouteDepartureCity){
		logger.info("cityRouteDepartureCity:{}",cityRouteDepartureCity);
		List<CityRouteDto> cityRouteList = diaryService.selectCityRouteByCityRouteDepartureCity(cityRouteDepartureCity);
			//가져온 리스트를 jsp 페이지에서 출력하기 위해 model에 담는다. 
			model.addAttribute("cityRouteList", cityRouteList);
		 return "diary/searchList";
	 }
	
	
	@RequestMapping(value="date")
	public void date(){
		Date today = new Date();
		System.out.println(today);
	}
@RequestMapping(value="/search/updateForm")
	public String updateForm(Model model ,@RequestParam(value="cityRouteNo",defaultValue="0")String cityRouteNo){
	int cityRouteDepartureTime = diaryService.selectcityRouteDepartureTimeBycityRouteNo(cityRouteNo);
	model.addAttribute("cityRouteDepartureTime",cityRouteDepartureTime);
		//시간을 갖고와 폼에 뿌려주기
		return "diary/updateForm";
	}

	@RequestMapping(value = "/search/update")
	public String update() {
		return "diary/update";
	}
	@RequestMapping(value="/test")
	private String test(Model model) {
		Map<String, Object> map =(Map<String, Object>) diaryService.test();
		map.put("map", map);
		return "/diary/diaryList";
	}
}
