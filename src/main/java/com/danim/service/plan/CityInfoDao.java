package com.danim.service.plan;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CityInfoDao {
	
	    private static final Logger logger = LoggerFactory.getLogger(CityInfoDao.class);
	    private final String namesPace = "com.danim.service.CityInfoMapper";
	    @Autowired
	    private SqlSessionTemplate sessionTemplate;
	    
	    // 도 이름을 갖고와서 시를 출력하는 매퍼
	    public List<CityInfoDto> selectCityInfoByCityInfoDoName(String cityInfoDoName) {
			logger.info("DAO: {}",cityInfoDoName);
	        return sessionTemplate.selectList(namesPace+".selectCityInfoByCityInfoDoName", cityInfoDoName);
	        
	    }

	
}
