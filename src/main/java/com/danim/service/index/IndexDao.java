package com.danim.service.index;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDao {
	private static final Logger logger = LoggerFactory.getLogger(IndexDao.class);
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String nameSpace = "com.danim.service.IndexMapper";
	
	// 인덱스에 뿌려주기 위한 명소 사진 가져오기
	public List<IndexLandmarkImageDto> selectLandmarkImageForIndex(){
		logger.info("selectLandmarkImageForIndex() IndexDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectLandmarkInfoImageForIndex");
	}
	
	// 모든 도시를 조회
	public List<String> selectCityAll() {
		logger.info("selectCityAll() IndexDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityAll");
	}	

}
