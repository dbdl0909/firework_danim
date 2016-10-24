package com.danim.service.plan;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityInfoService {
	private static final Logger logger = LoggerFactory.getLogger(CityInfoService.class);
	
	@Autowired
    private CityInfoDao cityInfoDao;
	
	//클릭한 도에 해당하는 도시리스트 가져오는 메서드
	public List<CityInfoDto> selectCityInfoByCityInfoDoName(String doArea) {
		logger.info("doArea(도 이름) : {} <-- selectCityInfoByCityInfoDoName() CityInfoService.java", doArea);
		
		//doArea에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<CityInfoDto> listCityInfoByCityInfoDoName = cityInfoDao.selectCityInfoByCityInfoDoName(doArea);
		logger.info("listCityInfoByCityInfoDoName : {} <-- selectCityInfoByCityInfoDoName() CityInfoService.java", listCityInfoByCityInfoDoName);
		
		return listCityInfoByCityInfoDoName;
    }

};
