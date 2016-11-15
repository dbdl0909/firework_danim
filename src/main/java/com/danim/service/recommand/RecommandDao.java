package com.danim.service.recommand;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecommandDao {
	private static final Logger logger = LoggerFactory.getLogger(RecommandDao.class);
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	private final String nameSpace = "com.danim.service.RecommandMapper";
	
	// 여성이 선호하는 도시
	public List<RecommandDto> selectCityForGender(String gender) {
		logger.info("selectCityForFemale RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityForGender", gender);
	}
	
	// 가장 많이 찾은 도시
	public List<RecommandDto> selectPopularityCity() {
		logger.info("selectPopularityCity RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectPopularityCity");
	}
	
	// 20대 계절별 많이 여행하는 도시
	public int selectSeasonCityTwenty(String season) {
		logger.info("selectSeasonCityTwenty RecommandDao.java");
		logger.info("selectSeasonCityTwenty season {} RecommandDao.java", season);
		
		return sessionTemplate.selectOne(nameSpace + ".selectSeasonCityTwenty", season);
	}
	
	// 여행 타입 별 선호하는 도시
	public List<RecommandDto> selectCityByPlanType(String planType) {
		logger.info("selectCityByPlanType RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityByPlanType", planType);
	}
}
