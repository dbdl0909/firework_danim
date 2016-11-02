package com.danim.service.plan;

import java.io.BufferedInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class ExpBus {
	public Map<String, Object> ExpBus(String search) throws Exception {
		
		Map map = new HashMap<String, Object>();
		List<String> expBusInfoList = new ArrayList<String>();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject)jsonParser.parse(readUrl(search));
		JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
		JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
		JSONObject jsonItems = (JSONObject) jsonBody.get("items");
		JSONArray jsonArray = (JSONArray)jsonItems.get("item");
		JSONArray idArray = new JSONArray();
		JSONArray nameArray = new JSONArray();
        for(int i = 0; i < jsonArray.size(); i++){
        	JSONObject expBus = (JSONObject)jsonArray.get(i);
        	idArray.add(i, expBus.get("terminalId"));
        	nameArray.add(i, expBus.get("terminalNm"));
        }
        
        System.out.println(idArray + "<-- idArray");
        System.out.println(nameArray + "<-- nameArray");
        map.put("idArray", idArray.toArray());
        map.put("nameArray", nameArray.toArray());
		/*
		ArrayList idArray = new JSONArray();
		ArrayList nameArray = new JSONArray();		
        for(int i = 0; i < jsonArray.size(); i++){
        	JSONObject expBus = (JSONObject)jsonArray.get(i);
        	for(int j = 0; j < expBus.size(); j++) {
        		idArray.add(i, expBus.get("terminalId").toString());
            	nameArray.add(i, expBus.get("terminalNm").toString());
        	}        	
            String terminalId = (String) expBus.get("terminalId");
            System.out.println(terminalId);
            String terminalNm = (String) expBus.get("terminalNm");
            System.out.println(terminalNm);      	
        }
        idArray.toJSONString();
        nameArray.toJSONString();
        System.out.println(expBusInfoList + "<--expBusInfoList");
        
        //map.put("expBusInfoList", expBusInfoList);
        */
        return map;
	}
	
    private static String readUrl(String search) throws Exception {
        BufferedInputStream reader = null;
        try {
            URL url = new URL(
                    "http://openapi.tago.go.kr/openapi/service/ExpBusInfoService/getExpBusTrminlList"
                    + "?ServiceKey=henz71OsAIe5lJY%2F7i79nxJ2A6Pd%2BGYoJZjI0ew6UeUiGonDFpRLRwQqX1fCGg1tR7NHzoz11cTBHq4bpUzx0g%3D%3D"
                    + "&terminalNm=" +URLEncoder.encode(search,"UTF-8")+ "&numOfRows=999&pageSize=999&pageNo=1&startPage=1&_type=json");
            reader = new BufferedInputStream(url.openStream());
            StringBuffer buffer = new StringBuffer();
            int i;
            byte[] b = new byte[4096];
            while( (i = reader.read(b)) != -1){
              buffer.append(new String(b, 0, i));
            }
            return buffer.toString();
        } finally {
            if (reader != null)
                reader.close();
        }
    }
}
