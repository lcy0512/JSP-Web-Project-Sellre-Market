package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;
import com.market.dao.AdminEventDao;
import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminEventDto;

public class MAdminEvent implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * currentPage : ajax로 넘어온 현재페이지 (사용자가 클린한 페이지번호)
		 *
		 */
		int currentPage = 0;
		
		if(request.getParameter("pageNum") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		
		/*
		 * total : product 전체 리스트 갯수 
		 */
		int total = new AdminEventDao().getEventCnt();
		
		
		/*
		 * index_no : 인덱스번호? 르스트의 번호를가져와서 10개씩 가져오기 위해 사용
		 * (1 -> 0), (2 -> 10), (3 ->20)
		 */
		int index_no = ( currentPage - 1 ) * 15;
		
		/*
		 * lastPage : 10개씩 보여주겠다고 했을 때, 마지막 있을  
		 * 19-> 2, 29-> 3, 39 -> 4
		 * 19/10 -> 1.9 -> ceil(1.9) -> 2.0
		 * 29/10 -> 2.9 -> ceil(2.9) -> 3.0
		 */
		int lastPage = (int) (Math.ceil((double)total/15));

		
		//클릭한 페이지에 맞게 10개씩 자른 list가져옴
		ArrayList<AdminEventDto> list = new AdminEventDao().selectList(index_no);	// 클릭한 페이지의 리스트 조회

		request.setAttribute("eventTotal", total);
		request.setAttribute("eventLastPage", lastPage);
		request.setAttribute("eventIndex_no", index_no);
		request.setAttribute("eventList", list);
	}

}