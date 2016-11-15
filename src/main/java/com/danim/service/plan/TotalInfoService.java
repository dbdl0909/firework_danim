package com.danim.service.plan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TotalInfoService {
	private static final Logger logger = LoggerFactory.getLogger(TotalInfoService.class);
	
	@Autowired
    private TotalInfoDao totalInfoDao;
	
	//도시리스트 가져오는 메서드
	public List<CityInfoDto> selectCityInfoAll() {
		logger.info("selectCityInfoByCityInfoDoName() TotalInfoService.java");
		List<CityInfoDto> listCityInfo = totalInfoDao.selectCityInfoAll();
		//logger.info("listCityInfo : {} <-- selectCityInfoByCityInfoDoName() TotalInfoService.java", listCityInfo);
		if(listCityInfo != null) {
			logger.info("listCityInfo SELECT O");
		} else {
			logger.info("listCityInfo SELECT X");
		}
		
		return listCityInfo;
	}
	
	/*//클릭한 도시에 해당하는 명소리스트 가져오는 메서드
	public List<LandmarkInfoDto> selectLandmarkInfoByCityName(String clickCityName) {
		logger.info("clickCityName(도시 이름) : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", clickCityName);
		
		//clickCityName에 담겨있는 도 이름 값을 매개변수로 보내 해당 도의 도시 리스트를 가져온다.
		List<LandmarkInfoDto> listLandmarkInfoByCityName = totalInfoDao.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfoByCityName : {} <-- selectLandmarkInfoByCityName() TotalInfoService.java", listLandmarkInfoByCityName);
		
		return listLandmarkInfoByCityName;
    }*/
	
	//클릭한 도시에 해당하는 명소, 식당, 숙소, 축제 리스트 가져오는 메서드
	public Map<String, Object> selectTotalInfoByCityName(String clickCityName, int infoMoreView) {
		logger.info("clickCityName(도시 이름) : {} <-- selectTotalInfoByCityName() TotalInfoService.java", clickCityName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clickCityName", clickCityName);
		map.put("infoMoreView", infoMoreView);
		
		List<LandmarkInfoDto> listLandmarkInfoByCityName = totalInfoDao.selectLandmarkInfoByCityName(clickCityName);
		logger.info("listLandmarkInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listLandmarkInfoByCityName);
		
		List<EateryInfoDto> listEateryInfoByCityName = totalInfoDao.selectEateryInfoByCityName(map);
		logger.info("listEateryInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listEateryInfoByCityName);
		
		List<StayInfoDto> listStayInfoByCityName = totalInfoDao.selectStayInfoByCityName(map);
		logger.info("listStayInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listStayInfoByCityName);
		
		List<EventInfoDto> listEventInfoByCityName = totalInfoDao.selectEventInfoByCityName(map);
		logger.info("listEventInfoByCityName : {} <-- selectTotalInfoByCityName() TotalInfoService.java", listEventInfoByCityName);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("listLandmarkInfo", listLandmarkInfoByCityName);
		resultMap.put("listEateryInfo", listEateryInfoByCityName);
		resultMap.put("listStayInfo", listStayInfoByCityName);
		resultMap.put("listEventInfo", listEventInfoByCityName);
		
		return resultMap;
	}
	
	//plan, city_route_plan, landmark_plan 테이블에 값 담기 위한 메서드
	@Transactional
	public void insertPlanTotal(MainPlanDto mainPlanDto) {
		logger.info("insertPlan() TotalInfoService.java");
		
		int resultIndex = 0;
		int planNo = totalInfoDao.selectMaxPlanNo();
		logger.info("planNo : {}", planNo);
		
		//plan 테이블에 넣을 데이터 셋팅
		PlanDto planDto = new PlanDto();
		planDto.setPlanNo(planNo);
		planDto.setMemberId(mainPlanDto.getMemberId());
		planDto.setPlanName(mainPlanDto.getPlanName());
		planDto.setPlanHeadcount(mainPlanDto.getPlanHeadcount());
		planDto.setPlanType(mainPlanDto.getPlanType());
		planDto.setPlanStay(mainPlanDto.getStayDay());
		planDto.setPlanDeparture(mainPlanDto.getStartDate());
		planDto.setPlanArrival(mainPlanDto.getEndDate());
		planDto.setPlanMemo(mainPlanDto.getPlanMemo());
		logger.info("planDto : {} <-- insertPlan() TotalInfoService.java", planDto);
		
		resultIndex = totalInfoDao.insertPlan(planDto);
		if(resultIndex == 1) {
			logger.info("plan 등록 O");
		} else {
			logger.info("plan 등록 X");
		}
		
		//city_route 테이블에 넣을 데이터 셋팅
		Map<String, Object> map = new HashMap<String, Object>();
		List<CityRouteDto> cityRouteDtoList = new ArrayList<CityRouteDto>();
		CityRouteDto cityRouteDto = null;
		int i = 0;
		int cityRouteNo = totalInfoDao.selectMaxCityRouteNo();
		logger.info("cityRouteNo : {}", cityRouteNo);
		
		ArrayList<String> cityRouteStartDate = mainPlanDto.getCityRouteStartDate();
		ArrayList<String> cityRouteDepartureCity = mainPlanDto.getCityRouteDepartureCity();
		ArrayList<String> cityRouteArrivalCity = mainPlanDto.getCityRouteArrivalCity();
		ArrayList<String> cityRouteDepartureTime = mainPlanDto.getCityRouteDepartureTime();
		ArrayList<String> cityRouteArrivalTime = mainPlanDto.getCityRouteArrivalTime();
		ArrayList<String> cityRouteMemo = mainPlanDto.getCityRouteMemo();
		/*logger.info("cityRouteStartDate.size() : {}", cityRouteStartDate.size());
		logger.info("cityRouteDepartureCity.size() : {}", cityRouteDepartureCity.size());
		logger.info("cityRouteArrivalCity.size() : {}", cityRouteArrivalCity.size());
		logger.info("cityRouteDepartureTime.size() : {}", cityRouteDepartureTime.size());
		logger.info("cityRouteArrivalTime.size() : {}", cityRouteArrivalTime.size());
		logger.info("cityRouteMemo.size() : {}", cityRouteMemo.size());*/
		
		for(i=0; i<cityRouteStartDate.size(); i++) {
			cityRouteDto = new CityRouteDto();
			cityRouteDto.setCityRouteNo(cityRouteNo+i);
			logger.info("getCityRouteNo : {}", cityRouteDto.getCityRouteNo());
			cityRouteDto.setPlanNo(planNo);
			cityRouteDto.setCityRouteDate(cityRouteStartDate.get(i));
			cityRouteDto.setCityRouteDepartureCity(cityRouteDepartureCity.get(i));
			cityRouteDto.setCityRouteArrivalCity(cityRouteArrivalCity.get(i));
			cityRouteDto.setCityRouteDepartureTime(cityRouteDepartureTime.get(i));
			cityRouteDto.setCityRouteArrivalTime(cityRouteArrivalTime.get(i));
			cityRouteDto.setCityRouteMemo(cityRouteMemo.get(i));
			cityRouteDtoList.add(cityRouteDto);
		}
		logger.info(cityRouteDtoList.toString());
		
		map.put("cityRouteDtoList", cityRouteDtoList);
		
		resultIndex = totalInfoDao.insertCityRoute(map);
		if(resultIndex >= 1) {
			logger.info("city_route 등록 O : {}", resultIndex);
		} else {
			logger.info("city_route 등록 X");
		}
		
		//landmark_plan 테이블에 넣을 데이터 셋팅
		List<LandmarkPlanDto> landmarkPlanDtoList = new ArrayList<LandmarkPlanDto>();
		LandmarkPlanDto landmarkPlanDto = null;
		int j = 0;
		int landmarkPlanNo = totalInfoDao.selectMaxLandmarkNo();
		
		ArrayList<String> landmarkInfoNo = mainPlanDto.getLandmarkInfoNo();
		logger.info("landmarkInfoNo.size() : {}", landmarkInfoNo.size());
		
		for(j=0; j<landmarkInfoNo.size(); j++) {
			landmarkPlanDto = new LandmarkPlanDto();
			landmarkPlanDto.setLandmarkPlanNo(landmarkPlanNo+i);
			landmarkPlanDto.setPlanNo(planNo);
			landmarkPlanDto.setCityRouteNo(cityRouteNo);
			landmarkPlanDto.setLandmarkInfoNo(landmarkInfoNo.get(i));
			landmarkPlanDtoList.add(landmarkPlanDto);
		}
		logger.info(landmarkPlanDtoList.toString());
		
		map.put("landmarkPlanDtoList", landmarkPlanDtoList);
		resultIndex = totalInfoDao.insertLandmarkPlan(map);
		if(resultIndex >= 1) {
			logger.info("city_route 등록 O : {}", resultIndex);
		} else {
			logger.info("city_route 등록 X");
		}
	}
};
