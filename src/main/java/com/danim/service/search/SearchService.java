package com.danim.service.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SearchService {
	@Autowired
	private SearchDao searchDao;
	
	private static final Logger logger = LoggerFactory.getLogger(SearchService.class);
	
    public List<SearchDto> getselectCityInfoName(String search) {
    	logger.info("getSelectLandmarkInfo() SearchService.java");
    	
    	List<SearchDto> selectCityInfoName = searchDao.selectCityInfoName(search);
    	
		return selectCityInfoName;
    	
    }
	
	// search(도시이름) 매개변수를 통해서 랜드마크 정보를 조회하는 메서드 호출
    public List<SearchDto> getSelectLandmarkInfo(String search, int moreView) {
    	logger.info("getSelectLandmarkInfo() SearchService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectLandmarkInfoList = searchDao.selectLandmarkInfo(map);
    	
		return selectLandmarkInfoList;
    	
    }
    
 // search(도시이름) 매개변수를 통해서 음식점 정보를 조회하는 메서드 호출
    public List<SearchDto> getSelectEateryInfo(String search, int moreView) {
    	logger.info("getSelectEateryInfo() SearchService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectEateryInfoList = searchDao.selectEateryInfo(map);
    	
		return selectEateryInfoList;
    	
    }
    
    // search(도시이름) 매개변수를 통해서 행사 정보를 조회하는 메서드 호출
    public List<SearchDto> getSelectEventInfo(String search, int moreView) {
    	logger.info("getSelectEventInfo() SearchService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectEventInfoList = searchDao.selectEventInfo(map);
    	
		return selectEventInfoList;
    	
    }
    
    // search(도시이름) 매개변수를 통해서 숙소 정보를 조회하는 메서드 호출
    public List<SearchDto> getSelectStayInfo(String search, int moreView) {
    	logger.info("getSelectStayInfo() SearchService.java");
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("search", search);
    	map.put("moreView", moreView);
    	
    	List<SearchDto> selectStayInfoList = searchDao.selectStayInfo(map);
    	
		return selectStayInfoList;
    	
    }
    
    public Map<String, Object> getSelectLandmarkInfoOne(String landmarkInfoNo) {
    	logger.info("getSelectLandmarkInfoOne() SearchService.java");
    	
    	Map<String, Object> selectLandmarkInfoOne = searchDao.selectLandmarkInfoOne(landmarkInfoNo);
    	
		return selectLandmarkInfoOne;
    	
    }
    
    public Map<String, Object> getSelectEateryInfoOne(String eateryNo) {
    	logger.info("getSelectEateryInfoOne() SearchService.java");
    	
    	Map<String, Object> selectEateryInfoOne = searchDao.selectEateryInfoOne(eateryNo);
    	
		return selectEateryInfoOne;
    	
    }
    
    public Map<String, Object> getSelectEventInfoOne(String eventInfoName) {
    	logger.info("getSelectEventInfoOne() SearchService.java");
    	
    	Map<String, Object> selectEventInfoOne = searchDao.selectEventInfoOne(eventInfoName);
    	
		return selectEventInfoOne;
    	
    }

	public Map<String, Object> getSelectStayInfoOne(String stayInfoNo) {
		logger.info("getSelectStayInfoOne() SearchService.java");
    	
    	Map<String, Object> selectStayInfoOne = searchDao.selectStayInfoOne(stayInfoNo);
    	
		return selectStayInfoOne;
	}
	
	public List<String> getSelectCityAll() {
		logger.info("getSelectCityAll() SearchService.java");
    	
    	List<String> selectCityAll = searchDao.selectCityAll();
    	
		return selectCityAll;
	}
	
	// 즐겨찾기 추가
	public void getInsertBookmark(String bookmarkInfo, String memberId) {
		logger.info("getInsertBookmark() SearchService.java");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bookmarkInfo", bookmarkInfo);
		map.put("memberId", memberId);
		
		searchDao.insertBookmark(map);
	}
	
	// 즐겨찾기 화면페이지
	public Map<String, Object> selectBookmark(String memberId) {
		logger.info("selectBookmark() SearchService.java");
		
		Map<String, Object> selectBookmark = new HashMap<String, Object>();
		selectBookmark.put("landmarkBookmark", searchDao.selectLandmarkBookmark(memberId));
		selectBookmark.put("eateryBookmark", searchDao.selectEateryBookmark(memberId));
		selectBookmark.put("eventBookmark", searchDao.selectEventBookmark(memberId));
		selectBookmark.put("stayBookmark", searchDao.selectStayBookmark(memberId));
		
		return selectBookmark;
	}
	
}
