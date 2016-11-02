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
		public List<CityRouteDto> selectCityRouteByCityRouteDepartureCity(String cityRouteDepartureCity) {
		logger.info("cityRouteDepartureCity: {} <-- diaryService.java", cityRouteDepartureCity);
		
		//doArea에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<CityRouteDto> selectCityRouteByCityRouteDepartureCity = diaryDao.selectCityRouteByCityRouteDepartureCity(cityRouteDepartureCity);
		logger.info("cityRouteDepartureCity : {} <-- selectCityInfoByCityInfoDoName() CityInfoService.java", cityRouteDepartureCity);
		
		return selectCityRouteByCityRouteDepartureCity;
	}
	public List<CityRouteDto> selectCityRoute() {
		logger.info("cityRouteNo <-- diaryService.java");
		
		//doArea에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<CityRouteDto> cityRouteList = diaryDao.selectCityRoute();
		logger.info("cityRouteList: {} <-- selectCityInfoByCityInfoDoName() CityInfoService.java",cityRouteList);
		
		return cityRouteList;
	}
	
	public int selectcityRouteDepartureTimeBycityRouteNo(String cityRouteNo){
		int selectcityRouteDepartureTimeBycityRouteNo =diaryDao.selectcityRouteDepartureTimeBycityRouteNo(cityRouteNo);
		return selectcityRouteDepartureTimeBycityRouteNo;
	}
	
	public int update(){
		
		return diaryDao.updateCityRouteDepartureTime();
	}//시간응 변경하는 메소드
	
	public Map<String, Object> getDayList(int dayYear, int dayMonth, String dayPage) {
			Map map = new HashMap<String, Object>();
	        // dDay : ?년 + ?월 + 1일 오늘 날짜
	        Calendar Day = Calendar.getInstance();
	        Day.set(Calendar.DATE, 1);
	        if(dayPage.equals("prev")) {//페이지값이 이전 페이지이면
	        	Day.set(dayYear, dayMonth,1);
	        	Day.add(Calendar.MONTH, -1);//달에 -1 해준다
	        }else if(dayPage.equals("next")) {//페이지값이 다음 페이지이면
	        	Day.set(dayYear, dayMonth,1);
	        	Day.add(Calendar.MONTH, 1);//원래 +1해준상태니까 그냥 1 해준다
	        }
	        //이번주 요일 
	        int firstWeek = Day.get(Calendar.DAY_OF_WEEK);
	        logger.info("firstWeek는 {}일 입니다",firstWeek);

	        List<DayDto> dayList = new ArrayList<DayDto>();
	        
	        // 마지막 날짜
	        int endDay = Day.getActualMaximum(Calendar.DATE); // 달의 마지막 날짜를 구하는 메서드
	        logger.info("마지막 날짜는 {}일 입니다",endDay);
	        
	        // 7의배수가 되기위해 필요한 List size(날짜가 들어가야할 <td>의 갯수)
	        int daySize = (firstWeek-1)+endDay;//0~31일.
	        if(daySize/7 != 0) {
	        	daySize = daySize+(7-(daySize%7));
	        }
	        
	        // 이전달 마지막 일
	        Calendar preMonth = Calendar.getInstance();
	        preMonth.set(Calendar.MONTH, Day.get(Calendar.MONTH)-1);//이전달
	        int preLastDay = preMonth.getActualMaximum(Calendar.DATE);//이전달의마지막날
	        int beginSpace = preLastDay - (firstWeek-2) ;//마지막날-2
	        int endSpace = 1;
	        for(int i=0; i<daySize; i++) {
	        	DayDto dayDto;
	            if(i<(firstWeek-1)){
	            	dayDto = new DayDto();
	            	dayDto.setDay(beginSpace);
	                beginSpace++;
	            } else if(i<((firstWeek-1)+endDay)){
	            	dayDto = new DayDto();
	            	dayDto.setYear(Day.get(Calendar.YEAR));
	            	dayDto.setMonth(Day.get(Calendar.MONTH)+1);
	            	dayDto.setDay((i+1)-(firstWeek-1));
	                String cityRouteDate = dayDto.getYear()+"-"+dayDto.getMonth()+"-"+dayDto.getDay();
	                
	                	//특정년도+반복 dayDto스케줄 타이틀 리스트
	                List<CityRouteDto> cityRouteList = diaryDao.selectCityRouteDepartureCityByCityRouteDate(cityRouteDate);
	                //cityRouteList.addAll(diaryDao.selectCityRouteDepartureCityByCityRouteDate(cityRouteDate.substring(5)));
	                dayDto.setCityRouteList(cityRouteList);
	                //dayDto와 diary테이블 ResultSet 반복시키며 비교 매핑
	            } else {
	            	dayDto = new DayDto();
	            	dayDto.setDay(endSpace);
	                endSpace++;
	            }
	            dayList.add(dayDto);
	        }
	        
	        map.put("dayList",dayList);
	        map.put("dayYear", Day.get(Calendar.YEAR));
	        map.put("dayMonth", Day.get(Calendar.MONTH));
	        
	        return map;
	    }
}



