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
	    
	    @Autowired
	    private SqlSessionTemplate sessionTemplate;
	    
	    private final String namesPace = "com.danim.service.CityInfoMapper";
	    
	    //클릭한 도에 해당하는 도시들 가져오는 매퍼
	    public List<CityInfoDto> selectCityInfoByCityInfoDoName(String cityInfoDoName) {
			logger.info("cityInfoDoName(도 이름) : {} <-- selectCityInfoByCityInfoDoName() CityInfoDao.java", cityInfoDoName);
			
	        return sessionTemplate.selectList(namesPace + ".selectCityInfoByCityInfoDoName", cityInfoDoName);
	    }
}
