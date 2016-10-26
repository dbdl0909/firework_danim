package com.danim.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDao {
	
	private final String NS = "com.danim.service";
	@Autowired 
    private SqlSessionTemplate sqlSession;
	
	public void insertCommunityItem(CommunityDto communityDto){
		sqlSession.insert(NS+".insertCommunityItem",communityDto);	
	};
	
	public List<CommunityDto> selectCommunityList(Map<String, Object> map){
		return sqlSession.selectList(NS+".selectCommunityList", map);	
	};
	
	public List<CommunityDto> selectCommunityNoticeList(String communityCategoryNo){       
		return sqlSession.selectList(NS+".selectCommunityNoticeList", communityCategoryNo);	
	};
	
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){		
		return sqlSession.selectOne(NS+".selectDetailViewByCommunityNo", communityNo);		
	};
	
	public int countCommunityList(String communityCategoryNo){		
		return sqlSession.selectOne(NS+".countCommunityList", communityCategoryNo);
	}
}
