package com.danim.service.diary;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiaryService {
   
	private static final Logger logger = LoggerFactory.getLogger(DiaryService.class);
	@Autowired
	private DiaryDao diaryDao;
	public Map<String, Object> getDayList(int dDayYear, int dDayMonth, String dDayPage) {
			Map map = new HashMap<String, Object>();
	        // dDay : ?년 + ?월 + 1일 오늘 날짜
	        Calendar dDay = Calendar.getInstance();
	        dDay.set(Calendar.DATE, 1);
	        if(dDayPage.equals("prev")) {//페이지값이 이전 페이지이면
	        	dDay.set(dDayYear, dDayMonth,1);
	        	dDay.add(Calendar.MONTH, -1);//달에 -1 해준다
	        }else if(dDayPage.equals("next")) {//페이지값이 다음 페이지이면
	        	dDay.set(dDayYear, dDayMonth,1);
	        	dDay.add(Calendar.MONTH, 1);//원래 +1해준상태니까 그냥 1 해준다
	        }
	        // 1일의 요일
	        int firstWeek = dDay.get(Calendar.DAY_OF_WEEK);
	        logger.info("firstWeek는 {}일 입니다",firstWeek);

	        List<DayDto> dayList = new ArrayList<DayDto>();
	        
	        // 마지막 날짜
	        int endDay = dDay.getActualMaximum(Calendar.DATE); // 달의 마지막 날짜를 구하는 메서드
	        logger.info("마지막 날짜는 {}일 입니다",endDay);
	        
	        // 7의배수가 되기위해 필요한 List size(날짜가 들어가야할 <td>의 갯수)
	        int listSize = (firstWeek-1)+endDay;
	        if(listSize/7 != 0) {
	            listSize = listSize+(7-(listSize%7));
	        }
	        
	        // 이전달 마지막 일
	        Calendar preMonth = Calendar.getInstance();
	        preMonth.set(Calendar.MONTH, dDay.get(Calendar.MONTH)-1);
	        int preLastDay = preMonth.getActualMaximum(Calendar.DATE);
	        int beginSpace = preLastDay - (firstWeek-2) ;
	        int endSpace = 1;
	        for(int i=0; i<listSize; i++) {
	        	DayDto dayDto;
	            if(i<(firstWeek-1)){
	            	dayDto = new DayDto();
	            	dayDto.setDay(beginSpace);
	                beginSpace++;
	            } else if(i<((firstWeek-1)+endDay)){
	            	dayDto = new DayDto();
	            	dayDto.setYear(dDay.get(Calendar.YEAR));
	            	dayDto.setMonth(dDay.get(Calendar.MONTH)+1);
	            	dayDto.setDay((i+1)-(firstWeek-1));
	                String cityRouteNo = dayDto.getYear()+"-"+dayDto.getMonth()+"-"+dayDto.getDay();
	                
	                // 특정년도+반복 dayDto스케줄 타이틀 리스트
	                List<CityRouteDto> cityRouteList 
	                    = diaryDao.selectCityRouteByCityRouteNo(cityRouteNo);
	                cityRouteList.addAll(diaryDao.selectCityRouteByCityRouteNo(cityRouteNo.substring(5)));
	                dayDto.setCityRouteList(cityRouteList);
	                // dayDto와 diary테이블 ResultSet 반복시키며 비교 매핑
	            } else {
	            	dayDto = new DayDto();
	            	dayDto.setDay(endSpace);
	                endSpace++;
	            }
	        //    System.out.println(oneDay.getDay()+":"+oneDay.getScheduleList());
	            dayList.add(dayDto);
	        }
	        
	        map.put("dayList",dayList);
	        map.put("dDayYear", dDay.get(Calendar.YEAR));
	        map.put("dDayMonth", dDay.get(Calendar.MONTH));
	        
	        return map;
	    }
}
