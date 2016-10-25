package com.danim.service.community;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.danim.util.Pagination;
import com.sun.media.jfxmedia.logging.Logger;

 
@Service 
public class CommunityService {
	
	private final String NS = "com.danim.service";
    private final int LINE_PER_PAGE = 10;
    private final int BLOCK_PER_PAGE = 5;
	@Autowired 
    private SqlSessionTemplate sqlSession;

	public void insertCommunityItem(CommunityDto communityDto){
		sqlSession.insert(NS+".insertCommunityItem",communityDto);	
	};
	
	public List<CommunityDto> selectCommunityList(String communityCategoryNo, int page){
        Pagination pageNation = new Pagination(page,LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageHelper", pageNation);
        map.put("communityCategoryNo", communityCategoryNo);
		return sqlSession.selectList(NS+".selectCommunityList", map);	
	};
	
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){		
		return sqlSession.selectOne(NS+".selectDetailViewByCommunityNo", communityNo);
		
	}
	
	public int countCommunityList(String communityCategoryNo){		
		return sqlSession.selectOne(NS+".countCommunityList", communityCategoryNo);
	}
	
    public int startPage(int page){    	
        return ((page - 1) / BLOCK_PER_PAGE) * BLOCK_PER_PAGE + 1;        
    }
    
    public int endPage(int startpage){
    	
        return startpage+BLOCK_PER_PAGE-1;
    }
}
