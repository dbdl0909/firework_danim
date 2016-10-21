package com.danim.service.plan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CityInfoService {
	@Autowired
    private CityInfoDao cityInfoDao;
	
	CityInfoDto cityInfoDto;
	
	public List<CityInfoDto> selectcityInfo(String doArea) {
//dao 호출후 doArea 담아서 보내주면 된다.
		List<CityInfoDto> listCityInfoDto; /*= new ArrayList<CityInfoDto>();*///dto리스트를 생성하고 listCityInfoName
		listCityInfoDto = cityInfoDao.selectCityInfoByCityInfoDoName(doArea);//반복문 돌리기.
		System.out.println("서비스:"+listCityInfoDto);
		System.out.println("서비스:"+doArea);
		
		return listCityInfoDto;      
    }

};
