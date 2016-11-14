
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
    }
}
