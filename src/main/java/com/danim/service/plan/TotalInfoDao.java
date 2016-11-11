package com.danim.service.plan;

import java.util.List;
import java.util.Map;

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
	    public List<EateryInfoDto> selectEateryInfoByCityName(Map<String, Object> map) {
	    	logger.info("clickCityName(도시 이름) : {} <-- selectEateryInfoByCityName() TotalInfoDao.java", map);
	    	
	    	return sessionTemplate.selectList(namesPace + ".selectEateryInfoByCityName", map);
	    }
	    
	    //클릭한 도시에 해당하는 숙소리스트 가져오는 매퍼 호출
		public List<StayInfoDto> selectStayInfoByCityName(Map<String, Object> map) {
			logger.info("clickCityName(도시 이름) : {} <-- selectStayInfoByCityName() TotalInfoDao.java", map);
			
			return sessionTemplate.selectList(namesPace + ".selectStayInfoByCityName", map);
		}

		public List<EventInfoDto> selectEventInfoByCityName(Map<String, Object> map) {
			logger.info("clickCityName(도시 이름) : {} <-- selectEventInfoByCityName() TotalInfoDao.java", map);
			
			return sessionTemplate.selectList(namesPace + ".selectEventInfoByCityName", map);
		}
		
		//plan 테이블의 PK인 planNo의 제일 큰 숫자를 가져오는 매퍼 호출
		public int selectMaxPlanNo() {
			logger.info("selectMaxPlanNo() TotalInfoDao.java");
			
			return sessionTemplate.selectOne(namesPace + ".selectMaxPlanNo");
		}
		//plan 테이블에 값 입력하는 매퍼 호출
		public int insertPlan(PlanDto planDto) {
			logger.info("insertPlan() TotalInfoDao.java");
			
			return sessionTemplate.insert(namesPace + ".insertPlan", planDto);
		}
		public int selectMaxCityRouteNo() {
			logger.info("selectMaxCityRouteNo() TotalInfoDao.java");
			
			return sessionTemplate.selectOne(namesPace + ".selectMaxCityRouteNo");
		}
		//city_route 테이블에 값 입력하는 매퍼 호출
		public int insertCityRoute(Map<String, Object> map) {
			logger.info("insertCityRoute() TotalInfoDao.java");
			
			return sessionTemplate.insert(namesPace + ".insertCityRoute", map);
		}
}
