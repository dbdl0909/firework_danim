package com.danim.service.plan;

import java.util.List;

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
	
	//클릭한 도시에 해당하는 명소리스트 가져오는 메서드
	public List<LandmarkInfoDto> selectLandmarkInfoByCityName(String clickCityName) {
		logger.info("clickCityName(도시 이름) : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", clickCityName);
		
		//clickCityName에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<LandmarkInfoDto> listLandmarkInfoByCityName = totalInfoDao.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfoByCityName : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", listLandmarkInfoByCityName);
		
		return listLandmarkInfoByCityName;
    }

};
