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
    
    public List<RecommandDto> selectPopularityCity() {
    	logger.info("selectPopularityCity() RecommandService.java");
		
    	List<RecommandDto> selectPopularityCity = recommandDao.selectPopularityCity();
    	
    	return selectPopularityCity;
    	
    }

}
