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
    private final int LINE_PER_PAGE = 10;//한페이지에 보여줄 글 갯수 공지 제외
    private final int BLOCK_PER_PAGE = 5;//하단 페이징 블록의 갯수
	@Autowired 
    private SqlSessionTemplate sqlSession;
	//게시글 입력 
	public void insertCommunityItem(CommunityDto communityDto){
		sqlSession.insert(NS+".insertCommunityItem",communityDto);	
	};
	//해당 카테고리 리스트
	//컨트롤러에서 넘어온 카테고리 넘버와 페이지 값을 
	//util패키지 내의 pagination클래스에 넣고 
	//map에 담아 쿼리 호출
	public List<CommunityDto> selectCommunityList(String communityCategoryNo, int page){
        Pagination pageNation = new Pagination(page,LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageHelper", pageNation);
        map.put("communityCategoryNo", communityCategoryNo);
		return sqlSession.selectList(NS+".selectCommunityList", map);	
	};
	//해당 카테고리의 공지글만 출력
	public List<CommunityDto> selectCommunityNoticeList(String communityCategoryNo){       
		return sqlSession.selectList(NS+".selectCommunityNoticeList", communityCategoryNo);	
	};
	//해당 게시글의 디테일 뷰
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){		
		return sqlSession.selectOne(NS+".selectDetailViewByCommunityNo", communityNo);		
	}
	//해당 카테고리의 총 게시글 수
	public int countCommunityList(String communityCategoryNo){		
		return sqlSession.selectOne(NS+".countCommunityList", communityCategoryNo);
	}
	//시작페이지를 정하기 위한 메소드
    public int startPage(int page){    	
        return ((page - 1) / BLOCK_PER_PAGE) * BLOCK_PER_PAGE + 1;        
    }
    //마지막 페이지 구하기
    public int endPage(int startpage){    	
        return startpage+BLOCK_PER_PAGE-1;
    }
}
