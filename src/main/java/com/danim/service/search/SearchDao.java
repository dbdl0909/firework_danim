package com.danim.service.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDao {
	private static final Logger logger = LoggerFactory.getLogger(SearchDao.class);
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String nameSpace = "com.danim.service.SearchMapper";
	
    // search 검색어를 통해서 도시의 이름만을 조회하는 메서드
    public List<SearchDto> selectCityInfoName(String search) {
    	logger.info("selectCityInfoName() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectCityInfoName", search);
    	
    }
        
    // search(도시이름) 검색어를 통해서 해당 지역의 명소를 검색
    public List<SearchDto> selectLandmarkInfo(HashMap<String, Object> map) {
    	logger.info("selectLandmarkInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectLandmarkByCityInfoName", map);
    	
    }
       
    // search(도시이름) 검색어를 통해서 해당 지역의 음식점을 검색
    public List<SearchDto> selectEateryInfo(HashMap<String, Object> map) {
    	logger.info("selectEateryInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEateryByCityInfoName", map);
    	
    }
    
    // search(도시이름) 검색어를 통해서 해당 지역의 축제를 검색
    public List<SearchDto> selectEventInfo(HashMap<String, Object> map) {
    	logger.info("selectEventInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectEventByCityInfoName", map);
    	
    }
    
    // search(도시이름) 검색어를 통해서 해당 지역의 숙소를 검색
    public List<SearchDto> selectStayInfo(HashMap<String, Object> map) {
    	logger.info("selectStayInfo() SearchDao.java");
    	
		return sessionTemplate.selectList(nameSpace + ".selectStayByCityInfoName", map);
    	
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
	
	// 모든 도시를 조회
	public List<String> selectCityAll() {
		logger.info("selectCityAll() SearchDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityAll");
	}
	
	// 즐겨찾기 추가
	public void insertBookmark(Map<String, Object> map) {
		logger.info("insertBookmark() SearchDao.java");
		
		sessionTemplate.insert(nameSpace + ".insertBookmark", map);
	}
	
	// 명소 즐겨찾기
	public List<SearchDto> selectLandmarkBookmark(String memberId) {
		logger.info("selectLandmarkBookmark() SearchDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectLandmarkBookmark", memberId);
	}
	
	// 음식점 즐겨찾기
	public List<SearchDto> selectEateryBookmark(String memberId) {
		logger.info("selectEateryBookmark() SearchDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectEateryBookmark", memberId);
	}
	
	// 행사 즐겨찾기
	public List<SearchDto> selectEventBookmark(String memberId) {
		logger.info("selectEventBookmark() SearchDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectEventBookmark", memberId);
	}
	
	// 숙소 즐겨찾기
	public List<SearchDto> selectStayBookmark(String memberId) {
		logger.info("selectStayBookmark() SearchDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectStayBookmark", memberId);
	}
	
}
