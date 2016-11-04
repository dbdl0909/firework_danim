package com.danim.service.plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TotalInfoService {
	private static final Logger logger = LoggerFactory.getLogger(TotalInfoService.class);
	
	@Autowired
    private TotalInfoDao totalInfoDao;
	
	//도시리스트 가져오는 메서드
	public List<CityInfoDto> selectCityInfoAll() {
		logger.info("selectCityInfoByCityInfoDoName() TotalInfoService.java");
		List<CityInfoDto> listCityInfo = totalInfoDao.selectCityInfoAll();
		logger.info("listCityInfo : {} <-- selectCityInfoByCityInfoDoName() TotalInfoService.java", listCityInfo);
		
		return listCityInfo;
	}
	
	/*//클릭한 도시에 해당하는 명소리스트 가져오는 메서드
	public List<LandmarkInfoDto> selectLandmarkInfoByCityName(String clickCityName) {
		logger.info("clickCityName(도시 이름) : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", clickCityName);
		
		//clickCityName에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<LandmarkInfoDto> listLandmarkInfoByCityName = totalInfoDao.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfoByCityName : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", listLandmarkInfoByCityName);
		
		return listLandmarkInfoByCityName;
    }*/
	
	//클릭한 도시에 해당하는 명소, 식당, 숙소, 축제 리스트 가져오는 메서드
	public Map<String, Object> selectTotalInfoByCityName(String clickCityName, int infoMoreView) {
		logger.info("clickCityName(도시 이름) : {} <-- selectTotalInfoByCityName() TotalInfoService.java", clickCityName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clickCityName", clickCityName);
		map.put("infoMoreView", infoMoreView);
		
		List<LandmarkInfoDto> listLandmarkInfoByCityName = totalInfoDao.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listLandmarkInfoByCityName);
		
		List<EateryInfoDto> listEateryInfoByCityName = totalInfoDao.selectEateryInfoByCityName(map);
		logger.info("listEateryInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listEateryInfoByCityName);
		
		List<StayInfoDto> listStayInfoByCityName = totalInfoDao.selectStayInfoByCityName(map);
		logger.info("listStayInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listStayInfoByCityName);
		
		List<EventInfoDto> listEventInfoByCityName = totalInfoDao.selectEventInfoByCityName(map);
		logger.info("listEventInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listEventInfoByCityName);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("listLandmarkInfo", listLandmarkInfoByCityName);
		resultMap.put("listEateryInfo", listEateryInfoByCityName);
		resultMap.put("listStayInfo", listStayInfoByCityName);
		resultMap.put("listEventInfo", listEventInfoByCityName);
		
		return resultMap;
	}

};
