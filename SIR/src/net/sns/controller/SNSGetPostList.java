package net.sns.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sns.model.SNSDAO;

public class SNSGetPostList {

	public ArrayList getSnsList(HttpServletRequest request, HttpServletResponse response){
		
		ArrayList result = new ArrayList();
		
		// 오름차순으로 조회하니깐 초기 int 값은 int 의 max 최댓값 2147483647
		int	idxnum = 2147483647; // 초기 로드 경우
		if (request.getParameter("idxnum") != null){ // 무한 스크롤 로드 경우
			// 초기 로드 될때는 max 값 그대로 사용, 무한 스크롤때만 request 값 받아서
			idxnum = Integer.parseInt(request.getParameter("idxnum").trim());  
		}
		
		SNSDAO sdao = new SNSDAO();
		result = sdao.GetSNSList(idxnum);
		
		return result;
	}
	
	public ArrayList getInfoList(HttpServletRequest request, HttpServletResponse response, String email){
		
		ArrayList result = new ArrayList();
		
		// 오름차순으로 조회하니깐 초기 int 값은 int 의 max 최댓값 2147483647
		int	idxnuminfo = 2147483647; // 초기 로드 경우
		if (request.getParameter("idxnuminfo") != null){ // 무한 스크롤 로드 경우
			// 초기 로드 될때는 max 값 그대로 사용, 무한 스크롤때만 request 값 받아서
			idxnuminfo = Integer.parseInt(request.getParameter("idxnuminfo").trim());  
		}

		SNSDAO sdao = new SNSDAO();
		result = sdao.GetSNSList(idxnuminfo, email);
		
		return result;
	}
	
	public ArrayList getScrapList(HttpServletRequest request, HttpServletResponse response, String email){
		
		ArrayList result = new ArrayList();
		
		// 오름차순으로 조회하니깐 초기 int 값은 int 의 max 최댓값 2147483647
		int	idxnumScrap = 2147483647; // 초기 로드 경우
		if (request.getParameter("idxnumScrap") != null){ // 무한 스크롤 로드 경우
			// 초기 로드 될때는 max 값 그대로 사용, 무한 스크롤때만 request 값 받아서
			idxnumScrap = Integer.parseInt(request.getParameter("idxnumScrap").trim());  
		}

		SNSDAO sdao = new SNSDAO();
		result = sdao.GetSNSScrapList(idxnumScrap, email);
		
		return result;
	}
}
