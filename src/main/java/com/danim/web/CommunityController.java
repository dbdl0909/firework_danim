package com.danim.web;

import java.io.File;
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

import com.danim.service.community.CommunityDto;
import com.danim.service.community.CommunityService;
import com.danim.util.FileUpload;
 
@Controller
public class CommunityController { 

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Autowired
	private CommunityService communityService;
	
	@RequestMapping(value = "/community/list")
	public String home(Model model,
			@RequestParam(value="communityCategoryNo") String communityCategoryNo,
			@RequestParam(value="page", defaultValue="1") int page) {
		List<CommunityDto> communityList = communityService.selectCommunityList(communityCategoryNo, page);
		List<CommunityDto> communityNoticeList = communityService.selectCommunityNoticeList(communityCategoryNo);
		//페이징시 마지막 페이지와 총 블럭페이지의 오차를 없애기위한 코드
		// 마지막 페이지를 강제로 endpage로 치환하여 오차를 없애준다.
		int startPage = communityService.getStartPage(page);
		int endPage = communityService.getEndPage(startPage);
		int lastPage = communityService.getLastPage(communityCategoryNo, page);
		if(lastPage < endPage){
			endPage = lastPage;			
		}
		logger.info("startPage{} CommunityController.java", startPage);
		logger.info("endPage{} CommunityController.java", endPage);
		logger.info("totalPage{} CommunityController.java", lastPage);
		model.addAttribute("communityList", communityList);
		model.addAttribute("communityNoticeList", communityNoticeList);
        model.addAttribute("startPage", startPage);
        model.addAttribute("page", page);
        model.addAttribute("endPage", endPage);
        model.addAttribute("lastPage", lastPage);
		return "/community/list";
	}

	@RequestMapping(value = "/community/write", method = RequestMethod.GET)
	public String write(Model model) {
		return "community/write";
	}
	
	@RequestMapping(value = "/community/communityInsert", method = RequestMethod.POST)
	public String writeSubmit(Model model, CommunityDto communityDto) {
		logger.info("categoryNo {} CommunityController.java", communityDto.getCommunityCategoryNo());
		logger.info("memberId {} CommunityController.java", communityDto.getMemberId());
		logger.info("communitySubject {} ", communityDto.getCommunitySubject());
		logger.info("communityNotice {} CommunityController.java", communityDto.getCommunityNotice());
		logger.info("communityContent {} CommunityController.java", communityDto.getCommunityContent());		
		communityService.insertCommunityItem(communityDto);
		return "redirect:/community/list?communityCategoryNo="+communityDto.getCommunityCategoryNo();
	}
	
	@RequestMapping(value = "/community/communityDetail", method = RequestMethod.GET)
	public String communityDetailView(Model model, @RequestParam(value="communityNo") int communityNo) {
		model.addAttribute("detailView", communityService.selectDetailViewByCommunityNo(communityNo));
		return "/community/communityDetail";
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
		return "redirect:/community/list?communityCategoryNo="+communityDto.getCommunityCategoryNo();
	}
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String fileUpload(Model model, MultipartRequest multipartRequest, HttpServletRequest request) throws IOException{
		MultipartFile imgfile = multipartRequest.getFile("Filedata");
		Calendar cal = Calendar.getInstance();
		String fileName = imgfile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String replaceName = cal.getTimeInMillis() + fileType;		
		String path = request.getSession().getServletContext().getRealPath("/")+File.separator+"resources/upload";
		FileUpload.fileUpload(imgfile, path, replaceName);
		model.addAttribute("path", path);
		model.addAttribute("filename", replaceName);
		return "community/file_upload";
	}

}
