
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
	    @Autowired
	    private SqlSessionTemplate sessionTemplate;
	    private final String namespace = "com.danim.service.DiaryMapper";
	    //다이어리 데이터 출력
	    public List<CityRouteDto> selectCityRouteDepartureCityByCityRouteDate(String cityRouteDate){
	    	sessionTemplate.selectList(namespace+".selectCityRouteDepartureCityByCityRouteDate",cityRouteDate);
	    	logger.info("씨티 날짜.{}",cityRouteDate);
	    	return sessionTemplate.selectList(namespace+".selectCityRouteDepartureCityByCityRouteDate",cityRouteDate);
	    }
	    
	    public List<CityRouteDto> selectCityRouteByCityRouteDepartureCity(String cityRouteDepartureCity){
	    	logger.info("cityRouteDepartureCity:{}",cityRouteDepartureCity);
	    	return sessionTemplate.selectList(namespace+".selectCityRouteByCityRouteDepartureCity",cityRouteDepartureCity);
	    }

	    public List<CityRouteDto> selectCityRoute(){
	    	logger.info("cityRouteNo");
	    	return sessionTemplate.selectList(namespace+".selectCityRoute");
	    }
	    
	    public int selectcityRouteDepartureTimeBycityRouteNo(String cityRouteNo) {
			return sessionTemplate.selectOne(namespace+".selectcityRouteDepartureTimeBycityRouteNo",cityRouteNo);
		}
	    
	    public int updateCityRouteDepartureTime(){
	    	return sessionTemplate.update(namespace+".updateCityRouteDepartureTime");
	    }
}