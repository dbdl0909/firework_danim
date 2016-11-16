
package com.danim.service.plan;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlanService {
private static final Logger logger = LoggerFactory.getLogger(PlanService.class);
	
	@Autowired
    private PlanDao planDao;
	
	//도시리스트 가져오는 메서드
	public List<PlanDto> selectPlanList(String memberId) {
		logger.info("selectPlanList() PlanService.java");
		List<PlanDto> PlanList = planDao.selectPlanListByMemberId(memberId);
		logger.info("listCityInfo : {} <-- selectCityInfoByCityInfoDoName() TotalInfoService.java", PlanList);
		
		return PlanList;
	}
	public List<PlanAllDto> selectPlanDetailList(int planNo) {
		logger.info("selectPlanList() PlanService.java");
		logger.info("planNo : {} selectPlanDetailList Service.java", planNo);
		List<PlanAllDto> PlanDetailList = planDao.selectPlanDetailListByPlanNo(planNo);
		
		
		return PlanDetailList;
	}
}


