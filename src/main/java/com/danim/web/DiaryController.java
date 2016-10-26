package com.danim.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danim.service.diary.DiaryService;

@Controller
public class DiaryController {
	 private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);
	    @Autowired
	    private DiaryService diaryService;
	    
	 @RequestMapping(value="/diary")
	    public String diary(Model model
	                            ,@RequestParam(value="dDayYear",defaultValue="0") int dDayYear
	                            ,@RequestParam(value="dDayMonth",defaultValue="0") int dDayMonth
	                            ,@RequestParam(value="dDayOption",defaultValue="default") String dDayPage) {
	       /* Map<String, Object> map = diaryService.getDayList(dDayYear, dDayMonth, dDayPage);
	    //    model.addAttribute("map", map);
	        model.addAttribute("dayList", map.get("dayList"));
	        model.addAttribute("ddayYear", map.get("ddayYear"));
	        model.addAttribute("ddayMonth", map.get("ddayMonth"));*/
	        return "/diary/diary";
	    }
}
