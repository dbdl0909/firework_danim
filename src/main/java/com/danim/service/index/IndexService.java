package com.danim.service.index;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndexService {
	@Autowired
	IndexDao indexDao;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexService.class);
	
	public List<IndexLandmarkImageDto> selectLandmarkImageForIndex() {
		logger.info("selectLandmarkImageForIndex() IndexService.java");
		
		List<IndexLandmarkImageDto> selectLandmarkImageForIndex = indexDao.selectLandmarkImageForIndex();
		
		return selectLandmarkImageForIndex;		
	}
	
	public List<String> getSelectCityAll() {
		logger.info("getSelectCityAll() IndexService.java");
    	
    	List<String> selectCityAll = indexDao.selectCityAll();
    	
		return selectCityAll;
	}	
	
}
