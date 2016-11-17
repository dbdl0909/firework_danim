
package com.danim.service.plan;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlanDao {

    private static final Logger logger = LoggerFactory.getLogger(PlanDao.class);
    @Autowired
    private SqlSessionTemplate sessionTemplate;
    private final String namesPace = "com.danim.service.PlanMapper";

    
	public List<PlanDto> selectPlanListByMemberId(String memberId) {
    	logger.info("selectPlanListByMemberId :{} PlanDao.java",memberId);
    	
    	return sessionTemplate.selectList(namesPace + ".selectPlanListByMemberId",memberId);
    }//아이디를 받아 플랜리스트를 띄워줌 
	
	public List<PlanAllDto> selectPlanDetailListByPlanNo(int planNo) {
    	logger.info("selectPlanListByplanNo :{} PlanDao.java",planNo);
    	
    	return sessionTemplate.selectList(namesPace + ".selectPlanDetailListByPlanNo",planNo);
    }
	public List<CityInfoDto> selectGpsByPlanNo(int planNo) {
    	logger.info("selectGpsByPlanNo :{} PlanDao.java",planNo);
    	
    	return sessionTemplate.selectList(namesPace + ".selectGpsByPlanNo",planNo);
    }
}
