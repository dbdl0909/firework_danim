package com.danim.service.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchMoreService {
	
	@Autowired
	SearchMoreDao searchMoreDao;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchMoreService.class);
	
    public Map<String, Object> searchMore(String search, int moreView) {
    	logger.info("searchMore() SearchMoreService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectLandmarkInfoList = searchMoreDao.selectLandmarkInfo(map);
    	List<SearchDto> selectEateryInfoList = searchMoreDao.selectEateryInfo(map);
    	List<SearchDto> selectEventInfoList = searchMoreDao.selectEventInfo(map);
    	List<SearchDto> selectStayInfoList = searchMoreDao.selectStayInfo(map);
    	
    	resultMap.put("selectLandmarkInfoList", selectLandmarkInfoList);
    	resultMap.put("selectEateryInfoList", selectEateryInfoList);
    	resultMap.put("selectEventInfoList", selectEventInfoList);
    	resultMap.put("selectStayInfoList", selectStayInfoList);
    	
		return resultMap;
    	
    }
    
    /*public List<String, Object> searchMore(String search, int stayMoreView) {
    	logger.info("searchMore() SearchMoreService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	map.put("stayMoreView", stayMoreView);
    	
    	List<SearchDto> selectEateryInfoList = searchMoreDao.selectEateryInfo(map);
    	List<SearchDto> selectStayInfoList = searchMoreDao.selectStayInfo(map);
    	
    	resultMap.put("selectEateryInfoList", selectEateryInfoList);
    	resultMap.put("selectStayInfoList", selectStayInfoList);
    	
		return resultMap;
    	
    }*/
}
