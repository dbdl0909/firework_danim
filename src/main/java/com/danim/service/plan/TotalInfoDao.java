package com.danim.service.plan;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TotalInfoDao {
	    private static final Logger logger = LoggerFactory.getLogger(TotalInfoDao.class);
	    
	    @Autowired
	    private SqlSessionTemplate sessionTemplate;
	    
	    private final String namesPace = "com.danim.service.TotalInfoMapper";
	    
	    //전체 도시 리스트 가져오는 매퍼 호출
	    public List<CityInfoDto> selectCityInfoAll() {
	    	logger.info("selectCityInfo() TotalInfoDao.java");
	    	
	    	return sessionTemplate.selectList(namesPace + ".selectCityInfo");
	    }
	    
	    //클릭한 도시에 해당하는 명소리스트 가져오는 매퍼 호출
	    public List<LandmarkInfoDto> selectLandmarkInfoByCityName(String clickCityName) {
			logger.info("clickCityName(도시 이름) : {} <-- selectLandmarkInfoByCityName() TotalInfoDao.java", clickCityName);
			
	        return sessionTemplate.selectList(namesPace + ".selectLandmarkInfoByCityName", clickCityName);
	    }
	    
	    //클릭한 도시에 해당하는 식당리스트 가져오는 매퍼 호출
	    public List<EateryInfoDto> selectEateryInfoByCityName(String clickCityName) {
	    	logger.info("clickCityName(도시 이름) : {} <-- selectEateryInfoByCityName() TotalInfoDao.java", clickCityName);
	    	
	    	return sessionTemplate.selectList(namesPace + ".selectEateryInfoByCityName", clickCityName);
	    }
	    
	    //클릭한 도시에 해당하는 숙소리스트 가져오는 매퍼 호출
		public List<StayInfoDto> selectStayInfoByCityName(String clickCityName) {
			logger.info("clickCityName(도시 이름) : {} <-- selectStayInfoByCityName() TotalInfoDao.java", clickCityName);
			
			return sessionTemplate.selectList(namesPace + ".selectStayInfoByCityName", clickCityName);
		}

		public List<EventInfoDto> selectEventInfoByCityName(String clickCityName) {
			logger.info("clickCityName(도시 이름) : {} <-- selectEventInfoByCityName() TotalInfoDao.java", clickCityName);
			
			return sessionTemplate.selectList(namesPace + ".selectEventInfoByCityName", clickCityName);
		}
}
