package com.danim.web;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String home(Model model, CommunityDto communityDto) {

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
		return "redirect:/community/list";
	}
	
	@RequestMapping(value = "/community/communityDetail", method = RequestMethod.GET)
	public String view(Model model, CommunityDto communityDto) {

		return "/community/communityDetail";
	}
	
	@RequestMapping(value = "/community/modify", method = RequestMethod.POST)
	public String modify(Model model, CommunityDto communityDto) {

		return "community/write";
	}
	
	@RequestMapping(value = "/community/modifySubmit", method = RequestMethod.POST)
	public String modifySubmit(Model model, CommunityDto communityDto) {
		
		return null;
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
