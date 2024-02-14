package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MCommandReturnInt {

	public int execute(HttpServletRequest request, HttpServletResponse response);
	
}
