package com.danim.service.recommand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommandService {
	@Autowired
	RecommandDao recommandDao;
	
	private static final Logger logger = LoggerFactory.getLogger(RecommandService.class);
	
	// 성별 별 많이 여행가는 도시 top5
    public Map<String, Object> selectCityForGender() {
    	logger.info("selectCityForGender() RecommandService.java");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	List<RecommandDto> selectCityForFemale = recommandDao.selectCityForGender("F");
    	List<RecommandDto> selectCityForMale = recommandDao.selectCityForGender("M");

		logger.info("selectCityForFemale {} RecommandController.java", selectCityForFemale);
    	
    	map.put("selectCityForFemale", selectCityForFemale);
    	map.put("selectCityForMale", selectCityForMale);
    	
		return map;
    	
    }
    
    // 전국 많이 가는 도시 순위
    public List<RecommandDto> selectPopularityCity() {
    	logger.info("selectPopularityCity() RecommandService.java");
		
    	List<RecommandDto> selectPopularityCity = recommandDao.selectPopularityCity();
    	
    	return selectPopularityCity;
    	
    }
    
    // 20대가 계절 별 많이 찾는 도시
    public Map<String, Object> selectSeasonCityTwenty() {
    	logger.info("selectSeasonCityTwenty() RecommandService.java");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	int selectSpringCityTwenty = recommandDao.selectSeasonCityTwenty("spring");
    	int selectSummerCityTwenty = recommandDao.selectSeasonCityTwenty("summer");		
    	int selectFallCityTwenty = recommandDao.selectSeasonCityTwenty("fall");
    	int selectWinterCityTwenty = recommandDao.selectSeasonCityTwenty("winter");
    	
    	map.put("selectSpringCityTwenty", selectSpringCityTwenty);
    	map.put("selectSummerCityTwenty", selectSummerCityTwenty);
    	map.put("selectFallCityTwenty", selectFallCityTwenty);
    	map.put("selectWinterCityTwenty", selectWinterCityTwenty);
  	
    	return map;
    	
    }
    
    // 여행 타입 별 많이 여행가는 도시
    public Map<String, Object> selectCityByPlanType() {
    	logger.info("selectCityByPlanType() RecommandService.java");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
		return map;
    	
    }    

}
