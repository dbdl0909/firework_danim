package com.danim.service.search;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchMoreDao {
	 private static final Logger logger = LoggerFactory.getLogger(SearchMoreDao.class);
	 
	 @Autowired
	private SqlSessionTemplate sessionTemplate;
	 
	private final String nameSpace = "com.danim.service.SearchMapper";
	
	// 더보기를 눌러서 명소 페이지 10개 더 요청하는 메서드
    public List<SearchDto> selectLandmarkInfo(HashMap<String, Object> map) {
    	logger.info("selectLandmarkInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectLandmarkByCityInfoName", map);
    	
    }
	
    // 더보기를 눌러서 음식점 페이지 10개 더 요청하는 메서드
    public List<SearchDto> selectEateryInfo(HashMap<String, Object> map) {
    	logger.info("selectEateryInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEateryByCityInfoName", map);
    	
    }
    // 더보기를 눌러서 행사 페이지 10개 더 요청하는 메서드    
    public List<SearchDto> selectEventInfo(HashMap<String, Object> map) {
    	logger.info("selectEventInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEventByCityInfoName", map);
    	
    }
    // 더보기를 눌러서 숙소 페이지 10개 더 요청하는 메서드
    public List<SearchDto> selectStayInfo(HashMap<String, Object> map) {
    	logger.info("selectStayInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectStayByCityInfoName", map);
    	
    }
    
}
