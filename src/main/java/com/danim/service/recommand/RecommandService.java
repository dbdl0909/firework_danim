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
    public List<RecommandDto> selectCityForGender(String gender) {
    	logger.info("selectCityForGender() RecommandService.java");
    	
    	List<RecommandDto> selectCityForGender = recommandDao.selectCityForGender(gender);
    	   	
		return selectCityForGender;
    	
    }
    
	// 성별 별 많이 여행가는 모든 도 / 특별광역시
    public List<RecommandDto> selectCityAllByGender(String gender) {
    	logger.info("selectCityAllByGender() RecommandService.java");
    	
    	List<RecommandDto> selectCityAllByGender = recommandDao.selectCityAllByGender(gender);
    	   	
		return selectCityAllByGender;
    	
    }
    
    // 전국 많이 가는 도시 순위
    public List<RecommandDto> selectPopularityCity() {
    	logger.info("selectPopularityCity() RecommandService.java");
		
    	List<RecommandDto> selectPopularityCity = recommandDao.selectPopularityCity();
    	
    	return selectPopularityCity;
    	
    }
    
    // 도 안에서 많이찾은 시 순위
    public List<RecommandDto> selectCityByProvince(String province) {
    	logger.info("selectCityByProvince() RecommandService.java");
		
    	List<RecommandDto> selectCityByProvince = recommandDao.selectCityByProvince(province);
    	
    	return selectCityByProvince;
    	
    }
    
    // 2030 계절 별 많이 찾는 도시
    public Map<String, Object> selectSeasonCity2030() {
    	logger.info("selectSeasonCityTwenty() RecommandService.java");
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	int selectSpringCityTwenty = recommandDao.selectSeasonCityTwenty("spring");
    	int selectSummerCityTwenty = recommandDao.selectSeasonCityTwenty("summer");		
    	int selectFallCityTwenty = recommandDao.selectSeasonCityTwenty("fall");
    	int selectWinterCityTwenty = recommandDao.selectSeasonCityTwenty("winter");
    	
    	int selectSpringCityThirty = recommandDao.selectSeasonCityThirty("spring");
    	int selectSummerCityThirty = recommandDao.selectSeasonCityThirty("summer");		
    	int selectFallCityThirty = recommandDao.selectSeasonCityThirty("fall");
    	int selectWinterCityThirty = recommandDao.selectSeasonCityThirty("winter");
    	
    	map.put("selectSpringCityTwenty", selectSpringCityTwenty);
    	map.put("selectSummerCityTwenty", selectSummerCityTwenty);
    	map.put("selectFallCityTwenty", selectFallCityTwenty);
    	map.put("selectWinterCityTwenty", selectWinterCityTwenty);
    	
    	map.put("selectSpringCityThirty", selectSpringCityThirty);
    	map.put("selectSummerCityThirty", selectSummerCityThirty);
    	map.put("selectFallCityThirty", selectFallCityThirty);
    	map.put("selectWinterCityThirty", selectWinterCityThirty);
  	
    	return map;
    	
    }
    
    // 여행 타입 별 많이 여행가는 도시
    public List<RecommandDto> selectCityByPlanType(String planType) {
    	logger.info("selectCityByPlanType() RecommandService.java");
    	
    	List<RecommandDto> selectCityByPlanType = recommandDao.selectCityByPlanType(planType);
    	
		return selectCityByPlanType;
    	
    }
    
    // 여행 타입별 인기 순위
    public List<RecommandDto> selectTypeRank() {
    	logger.info("selectTypeRank() RecommandService.java");  
    	
    	List<RecommandDto> selectTypeRank = recommandDao.selectTypeRank();
    	
    	return selectTypeRank;
    }
    
    // 년도별 계절 인기 도시 순위
    public List<RecommandDto> selectSeasonCityByYear(int year, String season) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("year", year);
    	map.put("season", season);
    	
    	List<RecommandDto> selectSeasonCityByYear = recommandDao.selectSeasonCityByYear(map);
    	
    	return selectSeasonCityByYear;
    }
    
}
