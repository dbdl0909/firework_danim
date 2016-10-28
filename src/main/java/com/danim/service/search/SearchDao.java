package com.danim.service.search;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.danim.service.plan.CityInfoDao;

@Repository
public class SearchDao {
	private static final Logger logger = LoggerFactory.getLogger(CityInfoDao.class);
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
    // search 검색어를 통해서 도시의 이름만을 조회하는 메서드
    public List<SearchDto> selectCityInfoName(String search) {
    	logger.info("selectCityInfoName() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectCityInfoName", search);
    	
    }
    
    private final String nameSpace = "com.danim.service.SearchMapper";
    
    // search(도시이름) 검색어를 통해서 해당 지역의 명소를 검색
    public List<SearchDto> selectLandmarkInfo(String search) {
    	logger.info("selectLandmarkInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectLandmarkByCityInfoName", search);
    	
    }
       
    // search(도시이름) 검색어를 통해서 해당 지역의 음식점을 검색
    public List<SearchDto> selectEateryInfo(String search) {
    	logger.info("selectEateryInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEateryByCityInfoName", search);
    	
    }
    
    // search(도시이름) 검색어를 통해서 해당 지역의 축제를 검색
    public List<SearchDto> selectEventInfo(String search) {
    	logger.info("selectEventInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEventByCityInfoName", search);
    	
    }
    
    // search(도시이름) 검색어를 통해서 해당 지역의 숙소를 검색
    public List<SearchDto> selectStayInfo(String search) {
    	logger.info("selectStayInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectStayByCityInfoName", search);
    	
    }
    
    // landmarkInfoNo(명소번호)를 통해서 해당 번호 명소의 상세정보를 조회
    public Map<String, Object> selectLandmarkInfoOne(String landmarkInfoNo) {
    	logger.info("selectLandmarkInfoOne() SearchDao.java"); 
		
    	return sessionTemplate.selectOne(nameSpace + ".selectLandmarkByLandmarkInfoNo", landmarkInfoNo);
    	
    }
    
    // eateryNo(음식점번호)를 통해서 해당 번호 음식점의 상세정보를 조회
    public Map<String, Object> selectEateryInfoOne(String eateryNo) {
    	logger.info("selectEateryInfoOne() SearchDao.java"); 
		
    	return sessionTemplate.selectOne(nameSpace + ".selectEateryByEateryNo", eateryNo);
    	
    }
    
    // eventInfoName(축제정보이름)을 통해서 해당 번호 축제의 상세정보를 조회
    public Map<String, Object> selectEventInfoOne(String eventInfoName) {
    	logger.info("selectEventInfoOne() SearchDao.java"); 
		
    	return sessionTemplate.selectOne(nameSpace + ".selectEventByEventInfoName", eventInfoName);
    	
    }
 // stayInfoNo(숙소정보번호)를 통해서 해당 번호 숙소의 상세정보를 조회
	public Map<String, Object> selectStayInfoOne(String stayInfoNo) {
    	logger.info("selectStayInfoOne() SearchDao.java"); 
		
    	return sessionTemplate.selectOne(nameSpace + ".selectStayByStayInfoNo", stayInfoNo);
	}
      
}
