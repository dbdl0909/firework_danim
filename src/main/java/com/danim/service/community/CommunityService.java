package com.danim.service.community;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service 
public class CommunityService {
	private final String NS = "com.danim.service";
	@Autowired 
    private SqlSessionTemplate sqlSession;

	public void insertCommunityItem(CommunityDto communityDto){
		sqlSession.insert(NS+".insertCommunityItem",communityDto);	
	};

}
