package com.danim.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danim.util.Pagination;


 
@Service 
public class CommunityService {
	private static final Logger logger = LoggerFactory.getLogger(CommunityService.class);
	@Autowired
	CommunityDao cummunityDao;
    private final int LINE_PER_PAGE = 10;//한페이지에 보여줄 글 갯수 공지 제외
    private final int BLOCK_PER_PAGE = 5;//하단 페이징 블록의 갯수
    int startPage;
    int endPage;
	//게시글 입력 
	public void insertCommunityItem(CommunityDto communityDto){
		cummunityDao.insertCommunityItem(communityDto);	
	};
	public void modifyCommunityItem(CommunityDto communityDto){
		logger.info("categoryNo {} CommunityController.java", communityDto.getCommunityCategoryNo());
		logger.info("memberId {} CommunityController.java", communityDto.getMemberId());
		logger.info("communitySubject {} ", communityDto.getCommunitySubject());
		logger.info("communityNotice {} CommunityController.java", communityDto.getCommunityNotice());
		logger.info("communityContent {} CommunityController.java", communityDto.getCommunityContent());	
		cummunityDao.modifyCommunityItem(communityDto);	
	};
	//해당 카테고리 리스트
	//컨트롤러에서 넘어온 카테고리 넘버와 페이지 값을 
	//util패키지 내의 pagination클래스에 넣고 
	//map에 담아 쿼리 호출
	public List<CommunityDto> selectCommunityList(String communityCategoryNo, int page){
        Pagination pageNation = new Pagination(page,LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageNation", pageNation);
        map.put("communityCategoryNo", communityCategoryNo);
        List<CommunityDto> communityList =  cummunityDao.selectCommunityList(map);        
		return communityList;	
	};
	//해당 카테고리의 공지글만 출력
	public List<CommunityDto> selectCommunityNoticeList(String communityCategoryNo){
		List<CommunityDto> communityNoticeList = cummunityDao.selectCommunityNoticeList(communityCategoryNo);
		return communityNoticeList;	
	};
	//해당 게시글의 디테일 뷰
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){		
		return cummunityDao.selectDetailViewByCommunityNo(communityNo);		
	}
	//해당 카테고리의 총 게시글 수
	public int countCommunityList(String communityCategoryNo){		
		return cummunityDao.countCommunityList(communityCategoryNo);
	}
	//시작페이지를 정하기 위한 메소드
    public int getStartPage(int page){
    	this.startPage = ((page - 1) / BLOCK_PER_PAGE) * BLOCK_PER_PAGE + 1;
        return this.startPage;        
    }
    //마지막 페이지 구하기
    public int getEndPage(int startpage){
    	this.endPage = startpage+BLOCK_PER_PAGE-1;
        return this.endPage;
    }
    
    public int getLastPage(String communityCategoryNo, int page) {
		int totalCount = countCommunityList(communityCategoryNo);
		int lastPage = (int) Math.ceil((double)totalCount/LINE_PER_PAGE);
		return lastPage;    	
    }
}
