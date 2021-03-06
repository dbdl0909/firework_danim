package com.danim.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDao {
	private static final Logger logger = LoggerFactory.getLogger(CommunityDao.class);
	private final String NS = "com.danim.service";
	@Autowired 
    private SqlSessionTemplate sqlSession;
	
	public void insertCommunityItem(CommunityDto communityDto){
		sqlSession.insert(NS+".insertCommunityItem",communityDto);	
	}
	
	public List<CommunityDto> selectCommunityList(Map<String, Object> map){
		return sqlSession.selectList(NS+".selectCommunityList", map);	
	}
	
	public List<CommunityDto> selectCommunityNoticeList(String communityCategoryNo){       
		return sqlSession.selectList(NS+".selectCommunityNoticeList", communityCategoryNo);	
	}
	
	public CommunityDto selectDetailViewByCommunityNo(int communityNo){	
		return sqlSession.selectOne(NS+".selectDetailViewByCommunityNo", communityNo);		
	}
	
	public int countCommunityList(Map<String, Object> map){		
		return sqlSession.selectOne(NS+".countCommunityList", map);
	}
	public void modifyCommunityItem(CommunityDto communityDto){
		sqlSession.update(NS+".modifyCommunityItem", communityDto);		
	}
	public void updateReadCount(CommunityDto communityDto) {		
		sqlSession.update(NS+".updateReadCount", communityDto);	
	}
	
	public List<CommunityReplyDto> selectDetailViewReplyByCommunityNo(int communityNo) {
		return sqlSession.selectList(NS+".selectDetailViewReplyByCommunityNo", communityNo);		
	}

	public void insertCommunityReply(CommunityReplyDto communityReplyDto) {
		sqlSession.insert(NS+".insertCommunityReply", communityReplyDto);	
	}

	public void updateReplyCount(CommunityDto communityDto) {		
		sqlSession.update(NS+".updateReplyCount", communityDto);
	}

	public void insertCommunityVote(Map<String, Object> map) {
		sqlSession.insert(NS+".insertCommunityVote", map);
	}
	
	public void updateRatingCount(CommunityDto communityDto){		
		sqlSession.update(NS+".updateRatingCount", communityDto);
	}
	public int selectRatingForVotedCheck(Map<String, Object> map){		
		return sqlSession.selectOne(NS+".selectRatingForVotedCheck", map);
	}
	
	//나의 QNA 리스트 조회
	public List<QnaDto> selectQnaByMemberId(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectQnaByMemberId", map);
	}
	
	//나의 QNA 총 게시글 수 조회
	public int countMyQnaList(Map<String, Object> map) {
		logger.info("countMyQnaList CommunityDao.java");
		return sqlSession.selectOne(NS+".countMyQnaList", map);
	}
	
	//게시글 삭제 및 정지
	public void deleteCommunity(int communityNo) {
		logger.info("deleteCommunity CommunityDao.java");
		sqlSession.update(NS + ".deleteCommunity", communityNo);
	}
	
	//삭제 및 정지 게시글 보관
	public void insertDeleteCommunity(int communityNo) {
		logger.info("insertDeleteCommunity CommunityDao.java");
		sqlSession.insert(NS + ".insertDeleteCommunity", communityNo);
	}
	
	//신고
	public void insertReport(ReportDto reportDto) {
		logger.info("insertReport CommunityDao.java");
		sqlSession.insert(NS + ".insertReport", reportDto);
	}
	
	//관리자용 전체 회원 QNA 리스트
	public List<QnaDto> selectQnaForAdmin(Map<String, Object> map) {
		logger.info("selectQnaForAdmin CommunityDao.java");
		
		return sqlSession.selectList(NS + ".selectQnaForAdmin", map);
	}
	//신고리스트 출력
	public List<ReportDto> selectReportList() {
		logger.info("selectReportList CommunityDao.java");
		return sqlSession.selectList(NS + ".selectReportList");
	}
	//신고게시글 삭제게시판으로 이동
	public void updateCommunityBan(int[] communityNoArray, List<String> reportReasonArray) {
		logger.info("updateCommunityBan CommunityDao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		int i=0;
		for(i=0; i<communityNoArray.length; i++) {
			map.put("communityNo", communityNoArray[i]);
			map.put("communityBanReason", reportReasonArray.get(i));
			sqlSession.update(NS + ".updateCommunityBan", map);
		}
	}
	public void insertCommunityBan(int[] communityNoArray) {
		logger.info("insertCommunityBan CommunityDao.java");
		int i=0;
		for(i=0; i<communityNoArray.length; i++) {
			int communityNo =  communityNoArray[i];
			sqlSession.insert(NS + ".insertCommunityBan", communityNo);
		}
	}
	public void deleteReportNo(int[] reportNoArray) {
		logger.info("deleteReportNo CommunityDao.java");
		Map<String, Object> map = new HashMap<String, Object>();
		int i=0;
		for(i=0; i<reportNoArray.length; i++) {
			map.put("reportNo", reportNoArray[i]);
			sqlSession.delete(NS + ".deleteReportNo", map);
		}
	}
}
