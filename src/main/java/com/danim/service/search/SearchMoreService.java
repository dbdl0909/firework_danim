package com.danim.service.search;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchMoreService {
	
	@Autowired
	SearchMoreDao searchMoreDao;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchMoreService.class);
	
    public List<SearchDto> getSelectEateryInfo(String search, int moreView) {
    	logger.info("getSelectEateryInfo() SearchMoreService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectEateryInfoList = searchMoreDao.selectEateryInfo(map);
    	
		return selectEateryInfoList;
    	
    }
}
