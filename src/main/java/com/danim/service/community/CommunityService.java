package com.danim.service.community;

import java.util.List;

import org.springframework.stereotype.Service;

@Service 
public class CommunityService {

	public CommunityDto getBoardItem(CommunityDto board){
		return board;};

	public List<CommunityDto> getBoardList(CommunityDto communityDto){
		return null;};

	public void insertBoardItem(CommunityDto communityDto){};

	public void updateBoardItem(CommunityDto communityDto){};

	public void deleteBoardItem(CommunityDto communityDto){};

	public Integer countBoardList(CommunityDto communityDto){
		return null;};
}
