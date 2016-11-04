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
	
    public List<SearchDto> selectEateryInfo(HashMap<String, Object> map) {
    	logger.info("selectEateryInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEateryByCityInfoName", map);
    	
    }
    
    public List<SearchDto> selectStayInfo(HashMap<String, Object> map) {
    	logger.info("selectStayInfo() SearchMoreDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectStayByCityInfoName", map);
    	
    }   
    	
}