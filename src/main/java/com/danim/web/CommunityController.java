package com.danim.web;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.danim.service.community.CommunityDao;
import com.danim.service.community.CommunityDto;
import com.danim.service.community.CommunityReplyDto;
import com.danim.service.community.CommunityService;
import com.danim.service.community.QnaDto;
import com.danim.service.community.ReportDto;
import com.danim.util.FileUpload;
 
@Controller
public class CommunityController { 

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService communityService;
	
	@RequestMapping(value = "/community/list", method = RequestMethod.GET)
	public String communityList(Model model,
			@RequestParam(value="communityCategoryNo", defaultValue="community_category_01") String communityCategoryNo,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchOption", defaultValue="") String searchOption,
			@RequestParam(value="searchInput", defaultValue="") String searchInput) {
		
		logger.info("searchOption{} CommunityController.java", searchOption);
		logger.info("searchInput{} CommunityController.java", searchInput);
		List<CommunityDto> communityList = communityService.selectCommunityList(communityCategoryNo, page, searchOption, searchInput);
		List<CommunityDto> communityNoticeList = communityService.selectCommunityNoticeList(communityCategoryNo);
		//페이징시 마지막 페이지와 총 블럭페이지의 오차를 없애기위한 코드
		// 마지막 페이지를 강제로 endpage로 치환하여 오차를 없애준다.
		int startPage = communityService.getStartPage(page);
		int endPage = communityService.getEndPage(startPage);
		int lastPage = communityService.getLastPage(communityCategoryNo, page, searchOption, searchInput);
		if(lastPage < endPage){
			endPage = lastPage;			
		}
		logger.info("startPage{} CommunityController.java", startPage);
		logger.info("endPage{} CommunityController.java", endPage);
		logger.info("totalPage{} CommunityController.java", lastPage);
		model.addAttribute("communityList", communityList);
		model.addAttribute("communityNoticeList", communityNoticeList);
		model.addAttribute("totalCount", communityService.countCommunityList(communityCategoryNo, searchOption, searchInput));
        model.addAttribute("startPage", startPage);
        model.addAttribute("page", page);
        model.addAttribute("endPage", endPage);
        model.addAttribute("lastPage", lastPage);
		return "/community/list";
	}
	
	// 나의 QNA 리스트 조회
	@RequestMapping(value="/community/myQnaList", method = RequestMethod.GET)
	public String myQnaList(Model model,
			@RequestParam(value="communityCategoryNo", defaultValue="community_category_05") String communityCategoryNo,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="memberId") String memberId,
			@RequestParam(value="searchOption", defaultValue="") String searchOption,
			@RequestParam(value="searchInput", defaultValue="") String searchInput) {
		
		logger.info("memberId{} CommunityController.java", memberId);
		List<QnaDto> myQnaList = communityService.selectQnaByMemberId(communityCategoryNo, page, memberId, searchOption, searchInput);
		List<CommunityDto> communityNoticeList = communityService.selectCommunityNoticeList(communityCategoryNo);

		//페이징시 마지막 페이지와 총 블럭페이지의 오차를 없애기위한 코드
		// 마지막 페이지를 강제로 endpage로 치환하여 오차를 없애준다.
		int startPage = communityService.getStartPage(page);
		int endPage = communityService.getEndPage(startPage);
		int lastPage = communityService.getLastPage(communityCategoryNo, page, searchOption, searchInput);
		if(lastPage < endPage){
			endPage = lastPage;			
		}
		logger.info("startPage{} CommunityController.java", startPage);
		logger.info("endPage{} CommunityController.java", endPage);
		logger.info("totalPage{} CommunityController.java", lastPage);				
		model.addAttribute("myQnaList", myQnaList);
		model.addAttribute("communityNoticeList", communityNoticeList);
		model.addAttribute("totalCount", communityService.countMyQnaList(communityCategoryNo, searchOption, searchInput, memberId));
        model.addAttribute("startPage", startPage);
        model.addAttribute("page", page);
        model.addAttribute("endPage", endPage);
        model.addAttribute("lastPage", lastPage);
		
		return "/community/qnaList";
	}

	@RequestMapping(value = "/community/write", method = RequestMethod.GET)
	public String write(Model model) {		
		return "community/write";
	}
	
	@RequestMapping(value = "/community/communityInsert", method = RequestMethod.POST)
	public String writeSubmit(Model model, CommunityDto communityDto) {
		//logger.info("categoryNo {} CommunityController.java", communityDto.getCommunityCategoryNo());
		logger.info("memberId {} CommunityController.java", communityDto.getMemberId());
		logger.info("communitySubject {} ", communityDto.getCommunitySubject());
		logger.info("communityNotice {} CommunityController.java", communityDto.getCommunityNotice());
		logger.info("communityContent {} CommunityController.java", communityDto.getCommunityContent());		
		communityService.insertCommunityItem(communityDto);
		
		int CategoryNo = Integer.parseInt(communityDto.getCommunityCategoryNo().substring(20));
		
		String returnList = "";
		if(CategoryNo < 5 && CategoryNo > 0) {
			returnList = "redirect:/community/list?communityCategoryNo="+communityDto.getCommunityCategoryNo();
		}else if(CategoryNo < 11 && CategoryNo > 4) {
			returnList = "redirect:/community/myQnaList?communityCategoryNo="+communityDto.getCommunityCategoryNo()+"&"+"memberId="+communityDto.getMemberId();
		}
		
		return returnList;
		// 나중에 시간나면 바로 자기가 쓴 글로 이동하게 바꿀 예정
	}
	
	@RequestMapping(value = "/community/communityDetail", method = RequestMethod.GET)
	public String communityDetailView(Model model, 
									@RequestParam(value="communityNo") int communityNo,
									@RequestParam(value="communityCategoryNo") String communityCategoryNo) {
		logger.info("communityNo {} CommunityController.java", communityNo);
		logger.info("communityCategoryNo {} CommunityController.java", communityCategoryNo);
		model.addAttribute("detailViewReply", communityService.selectDetailViewReplyByCommunityNo(communityNo));
		model.addAttribute("detailView", communityService.selectDetailViewByCommunityNo(communityNo));
		
		int CategoryNo = Integer.parseInt(communityCategoryNo.substring(20));
		logger.info("CategoryNo {} CommunityController.java", CategoryNo);
		
		String detail = "";
		if(CategoryNo < 5 && CategoryNo > 0) {
			detail = "/community/communityDetail";
		}else if(CategoryNo < 11 && CategoryNo > 4) {
			detail = "/community/qnaDetail";
		}
		
		return detail;
	}
	
	@RequestMapping(value = "/community/communityModify", method = RequestMethod.GET)
	public String communityModify(Model model, @RequestParam(value="communityNo") int communityNo) {
		model.addAttribute("detailView", communityService.modifyCommunityItemView(communityNo));
		model.addAttribute("communityNo", communityNo);
		return "community/modify";
	}
	
	@RequestMapping(value = "/community/communityModifySubmit", method = RequestMethod.POST)
	public String modifySubmit(Model model, CommunityDto communityDto) {
		logger.info("categoryNo {} CommunityController.java", communityDto.getCommunityCategoryNo());
		logger.info("memberId {} CommunityController.java", communityDto.getMemberId());
		logger.info("communitySubject {} ", communityDto.getCommunitySubject());
		logger.info("communityNotice {} CommunityController.java", communityDto.getCommunityNotice());
		logger.info("communityContent {} CommunityController.java", communityDto.getCommunityContent());
		logger.info("communityNo {} CommunityController.java", communityDto.getCommunityNo());
		communityService.modifyCommunityItem(communityDto);
		return "redirect:/community/communityDetail?communityCategoryNo="+communityDto.getCommunityCategoryNo()+"&communityNo="+communityDto.getCommunityNo();
	}
	@RequestMapping(value = "/community/communityReply", method = RequestMethod.POST)
	public String insertCommunityReply(CommunityReplyDto communityReplyDto){
		communityService.insertCommunityReply(communityReplyDto);
		return "redirect:/community/communityDetail?communityCategoryNo="+communityReplyDto.getCommunityCategoryNo()+"&communityNo="+communityReplyDto.getCommunityNo();
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;		
		String path = request.getSession().getServletContext().getRealPath("/")+"/resources/upload";//서버와 동일
		logger.info("path {} CommunityController.java", path);
		//logger.info("path {} CommunityController.java", path);
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "community/file_upload";
	}
	
	@RequestMapping(value = "/community/communityDetail", method = RequestMethod.POST)
	public String detailRating(Model model, @RequestParam(value="votedId") String votedId,
							  @RequestParam(value="communityNo") int communityNo,							  
							  @RequestParam(value="communityCategoryNo") String communityCategoryNo){

		logger.info("votedId {} CommunityController.java", votedId);
		logger.info("communityNo {} CommunityController.java", communityNo);
		logger.info("communityCategoryNo {} CommunityController.java", communityCategoryNo);		
		String votedCheck = communityService.insertCommunityVote(votedId, communityNo, communityCategoryNo);
		model.addAttribute("votedCheck", votedCheck);
		return "redirect:/community/communityDetail?communityCategoryNo="+communityCategoryNo+"&communityNo="+communityNo;
	}
	
	@RequestMapping(value = "/community/communityReport", method = RequestMethod.POST)
	public String communityReport(ReportDto reportDto,
								@RequestParam(value="communityCategoryNo") String communityCategoryNo) {
		communityService.insertReport(reportDto);
		logger.info("reportDto {} CommunityController.java", reportDto);
		logger.info("CommunityNo {} CommunityController.java", reportDto.getCommunityNo());
		
		return "redirect:/community/communityDetail?communityCategoryNo="+communityCategoryNo+"&communityNo="+reportDto.getCommunityNo();
	}
	
	@RequestMapping(value = "/community/communityDelete")
	public String deleteCommunity(@RequestParam(value="communityNo") int communityNo, 
								@RequestParam(value="communityCategoryNo") String communityCategoryNo,
								@RequestParam(value="memberId", defaultValue="") String memberId) {
		
		communityService.deleteCommunity(communityNo);
		
		int CategoryNo = Integer.parseInt(communityCategoryNo.substring(20));
		logger.info("CategoryNo {} CommunityController.java", CategoryNo);
		
		String returnList = "";
		if(CategoryNo < 5 && CategoryNo > 0) {
			returnList = "redirect:/community/list?communityCategoryNo="+communityCategoryNo;
		}else if(CategoryNo < 11 && CategoryNo > 4) {
			returnList = "redirect:/community/myQnaList?communityCategoryNo="+communityCategoryNo+"&"+"memberId="+memberId;
		}
		
		return returnList;
	}

}
