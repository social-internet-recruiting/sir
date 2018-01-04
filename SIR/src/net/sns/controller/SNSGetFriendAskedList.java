package net.sns.controller;

import java.util.ArrayList;

import net.sns.model.SNSDAO;

public class SNSGetFriendAskedList {

	public ArrayList<String> getFriendAskedListMethod(String email) {
		
		SNSDAO sdao = new SNSDAO();
		ArrayList<String> getList = sdao.getFriendAskedList(email);
		return getList;
		
	}

}
