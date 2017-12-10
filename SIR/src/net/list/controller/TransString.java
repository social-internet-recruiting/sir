package net.list.controller;

import java.util.ArrayList;

public class TransString {

	public String getJobCodeString(ArrayList<String> codeList, String selectedJob2) {
		String result = "";
		
		for(int i=0; i<codeList.size(); i++){
			String job2 = (String)codeList.get(i);
			if (job2.equals(selectedJob2)){ //같으면 selected로 
				result += "<option value='" + job2 + "' selected >" + job2 + "</option>";
			} else {
				result += "<option value='" + job2 + "' >" + job2 + "</option>";	
			}
			 
		}
		
		return result;
	}

}
