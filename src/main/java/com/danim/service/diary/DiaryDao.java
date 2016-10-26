package com.danim.service.diary;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DiaryDao {
	    private static final Logger logger = LoggerFactory.getLogger(DiaryDao.class);
	    private final String nameSpace = "com.danim.service.DiaryMapper";
	    @Autowired
	    private SqlSessionTemplate sessionTemplate;
	    
	    public List<CityRouteDto> selectCityRouteByCityRouteNo(String cityRouteNo){
	    	return sessionTemplate.selectList(nameSpace+".selectCityRouteByCityRouteNo",cityRouteNo);
	    }
}
