package net.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberCMD {
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
}
