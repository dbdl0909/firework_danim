package com.danim.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.danim.util.Pagination;
import com.sun.org.apache.bcel.internal.generic.RETURN;


 
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
	}
	//수정을 위한 수정화면출력
	public CommunityDto modifyCommunityItemView(int communityNo){
		CommunityDto communityDto= cummunityDao.selectDetailViewByCommunityNo(communityNo);
		return communityDto;		
	}
	//수정된 값 처리
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
	public List<CommunityDto> selectCommunityList(String communityCategoryNo, int page, 
												  String searchOption, String searchInput){
        Pagination pageNation = new Pagination(page,LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageNation", pageNation);
        map.put("communityCategoryNo", communityCategoryNo);
        map.put("searchOption", searchOption);
        map.put("searchInput", searchInput);
        logger.info("searchOption {} ", map.get("searchOption"));
        logger.info("searchInput {} ", map.get("searchInput"));
        List<CommunityDto> communityList =  cummunityDao.selectCommunityList(map);        
		return communityList;	
	}
	//해당 카테고리의 공지글만 출력
	public List<CommunityDto> selectCommunityNoticeList(String communityCategoryNo){
		List<CommunityDto> communityNoticeList = cummunityDao.selectCommunityNoticeList(communityCategoryNo);
		return communityNoticeList;	
	}
	//해당 게시글의 디테일 뷰
	//디테일 뷰 출력 시 readcount에 1씩 증가
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){
		CommunityDto communityDto= cummunityDao.selectDetailViewByCommunityNo(communityNo);
		int readCount = communityDto.getCommunityReadcount();
		readCount++;
		communityDto.setCommunityReadcount(readCount);
		logger.info("readCount {} CommunityController.java", communityDto.getCommunityReadcount());
		cummunityDao.updateReadCount(communityDto);
		return communityDto;		
	}
	//해당 카테고리의 총 게시글 수
	public int countCommunityList(String communityCategoryNo, String searchOption, String searchInput ){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("communityCategoryNo", communityCategoryNo);
		map.put("searchOption", searchOption);
		map.put("searchInput", searchInput);
		return cummunityDao.countCommunityList(map);
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
    
    public int getLastPage(String communityCategoryNo, int page, String searchOption, String searchInput ) {
		int totalCount = countCommunityList(communityCategoryNo, searchOption, searchInput);
		int lastPage = (int) Math.ceil((double)totalCount/LINE_PER_PAGE);
		return lastPage;    	
    }
    //해당 게시글 리플 입력
    public void insertCommunityReply(CommunityReplyDto communityReplyDto) {
    	CommunityDto communityDto = selectDetailViewByCommunityNo(communityReplyDto.getCommunityNo());
    	int replyCount = communityDto.getCommunityReplyCount();
    	logger.info("replyCount prev {} CommunityController.java", replyCount);
    	replyCount++;
    	logger.info("replyCount next {} CommunityController.java", replyCount);
    	communityDto.setCommunityReplyCount(replyCount);
    	logger.info("communityDto.getCommunityReplyCount() next {} CommunityController.java", communityDto.getCommunityReplyCount());
    	cummunityDao.updateReplyCount(communityDto);
    	cummunityDao.insertCommunityReply(communityReplyDto);
    }
    //해당 게시글 리플 가져오기
    public List<CommunityReplyDto> selectDetailViewReplyByCommunityNo(int communityNo) {
    	List<CommunityReplyDto> communityReplyList = cummunityDao.selectDetailViewReplyByCommunityNo(communityNo);
		return communityReplyList;
    }
    //게시글 추천
    public String insertCommunityVote(String votedId, int communityNo, String communityCategoryNo){
    	String result = null;
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("votedId", votedId);
    	map.put("communityNo", communityNo);
    	map.put("communityCategoryNo", communityCategoryNo);
    	int checkVoted = cummunityDao.selectRatingForVotedCheck(map);
    	logger.info("checkVoted {} CommunityController.java", checkVoted);
    	if(checkVoted == 0) {
			CommunityDto communityDto= cummunityDao.selectDetailViewByCommunityNo(communityNo);
			int ratingCount = communityDto.getCommunityRating();
			ratingCount++;
			communityDto.setCommunityRating(ratingCount);
	    	cummunityDao.insertCommunityVote(map);
	    	cummunityDao.updateRatingCount(communityDto);
	    	result = "voted";
    	}else if(checkVoted == 1){
    		result = "failed";
    	}
    	return result;
    }
}
