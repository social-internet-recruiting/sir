package net.sns.controller;

import java.util.ArrayList;

import net.sns.model.SNSDTO;

public class SNSTransStringForInfiniteScroll {

	public String getString(ArrayList<SNSDTO> slistArr) {
		
		String result = "";
		int lastIdxNum = 0;
		for (int i=0; i<slistArr.size(); i++){
			SNSDTO sdto = (SNSDTO)slistArr.get(i);
			// db 글 뿌려주는 로직 (5개씩)
			SNSMakePost snsPost = new SNSMakePost();
			result 	+= 	snsPost.getPost(sdto);

			// for 문계속 돌면서 idx 저장하고, 마지막 getIdx 를 얻는다.
			lastIdxNum = sdto.getIdx();
			
		}
		
		// "#%&@#" = 구분자 
		result += "#%&@#" + lastIdxNum;
		
		return result;
	}

	public String getInfoString(ArrayList<SNSDTO> slistArr) {
		
		String result = "";
		int lastIdxNum = 0;
		System.out.println("slistArr : " + slistArr);
		for (int i=0; i<slistArr.size(); i++){
			SNSDTO sdto = (SNSDTO)slistArr.get(i);
			// db 글 뿌려주는 로직 (9개씩)
			SNSMakeInfoPost snsPost = new SNSMakeInfoPost();
			result 	+= 	snsPost.getInfoPost(sdto);

			// for 문계속 돌면서 idx 저장하고, 마지막 getIdx 를 얻는다.
			lastIdxNum = sdto.getIdx();
			
		}
		
		// "#%&@#" = 구분자 
		result += "#%&@#" + lastIdxNum;
		
		return result;
	}
}
