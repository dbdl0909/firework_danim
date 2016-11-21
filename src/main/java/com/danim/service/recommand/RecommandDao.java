package com.danim.service.recommand;

import java.util.List;
import java.util.Map;

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
	
	// 성별 간 선호하는 도시
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
	
	// 30대 계절별 많이 여행하는 도시
	public int selectSeasonCityThirty(String season) {
		logger.info("selectSeasonCityThirty RecommandDao.java");
		logger.info("selectSeasonCityThirty season {} RecommandDao.java", season);
		
		return sessionTemplate.selectOne(nameSpace + ".selectSeasonCityThirty", season);
	}
	
	// 여행 타입 별 선호하는 도시
	public List<RecommandDto> selectCityByPlanType(String planType) {
		logger.info("selectCityByPlanType RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityByPlanType", planType);
	}
	
	// 성별 간 선호하는 모든 도 / 특별광역시
	public List<RecommandDto> selectCityAllByGender(String gender) {
		logger.info("selectCityAllByGender RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityAllByGender", gender);
	}
	
	// 도 안에서 많이찾은 시 순위
	public List<RecommandDto> selectCityByProvince(String province) {
		logger.info("selectCityByProvince RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityByProvince", province);
	}
	
	// 여행 타입별 인기 순위
	public List<RecommandDto> selectTypeRank() {
		logger.info("selectTypeRank RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectTypeRank");
	}
	
	public List<RecommandDto> selectSeasonCityByYear(Map<String, Object> map) {
		logger.info("selectSeasonCityByYear RecommandDao.java");
	
		return sessionTemplate.selectList(nameSpace + ".selectSeasonCityByYear", map);		
	}
	
	public Map<String, Object> selectMemberInfo(String memberId) {
		logger.info("selectMemberInfo RecommandDao.java");
		
		return sessionTemplate.selectOne(nameSpace + ".selectMemberInfo", memberId);
	}
	
	// 로그인 회원과 비슷한 정보를 가진 회원에게 추천하는 도시
	public List<RecommandDto> selectCityForMember(Map<String, Object> map) {
		logger.info("selectCityForMember RecommandDao.java");
		
		return sessionTemplate.selectList(nameSpace + ".selectCityForMember", map);
	}
	
}
