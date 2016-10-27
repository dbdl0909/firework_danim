package com.danim.service.search;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danim.service.plan.CityInfoService;
import com.danim.service.plan.LandmarkInfoDto;

@Service
public class SearchService {
	@Autowired
	private SearchDao searchDao;
	
	private static final Logger logger = LoggerFactory.getLogger(CityInfoService.class);
	
    public SearchDto getselectCityInfoName(String search) {
    	logger.info("getSelectLandmarkInfo() SearchService.java");
    	
    	SearchDto selectCityInfoName = searchDao.selectCityInfoName(search);
    	
		return selectCityInfoName;
    	
    }
	
	// search(도시이름) 매개변수를 통해서 랜드마크 정보를 조회하는 메서드 호출
    public List<SearchDto> getSelectLandmarkInfo(String search) {
    	logger.info("getSelectLandmarkInfo() SearchService.java");
    	
    	List<SearchDto> selectLandmarkInfoList = searchDao.selectLandmarkInfo(search);
    	
		return selectLandmarkInfoList;
    	
    }
    
    public List<SearchDto> getSelectEateryInfo(String search) {
    	logger.info("getSelectEateryInfo() SearchService.java");
    	
    	List<SearchDto> selectEateryInfoList = searchDao.selectEateryInfo(search);
    	
		return selectEateryInfoList;
    	
    }
    
    public List<SearchDto> getSelectEventInfo(String search) {
    	logger.info("getSelectEventInfo() SearchService.java");
    	
    	List<SearchDto> selectEventInfoList = searchDao.selectEventInfo(search);
    	
		return selectEventInfoList;
    	
    }
    
    public List<SearchDto> getSelectStayInfo(String search) {
    	logger.info("getSelectStayInfo() SearchService.java");
    	
    	List<SearchDto> selectStayInfoList = searchDao.selectStayInfo(search);
    	
		return selectStayInfoList;
    	
    }
    
    public Map<String, Object> getSelectLandmarkInfoOne(String landmarkInfoNo) {
    	logger.info("getSelectLandmarkInfoOne() SearchService.java");
    	
    	Map<String, Object> selectLandmarkInfoOne = searchDao.selectLandmarkInfoOne(landmarkInfoNo);
    	
		return selectLandmarkInfoOne;
    	
    }

}
