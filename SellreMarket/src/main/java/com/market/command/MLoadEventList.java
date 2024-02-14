package com.market.command;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.dao.EventListDao;
import com.market.dto.EventDto;

public class MLoadEventList implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventListDao dao = new EventListDao();
		
		// 한 페이지에 몇 개의 ROW를 보여줄 것인지
		int pagePerCount = 10;
		
		// 현재 페이지
		int curPage;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e) {
			curPage = 1;
		}
		System.out.println("curPage : " + curPage);
		// 총 데이터의 갯수
		int totalRowCount = 0;
		totalRowCount = dao.totalRowCount();
		
		// 전체 페이지 수
		// 85개의 데이터 수 / 10 + 1 = 총 9p
		// 90개의 데이터 수 / 10 + 1 = 총 10p
		int totalPage = totalRowCount % pagePerCount == 0 ? (totalRowCount / pagePerCount) : (totalRowCount / pagePerCount) + 1;
		
		// 현재 페이지에 해당하는 시작 index
		// curPage = 1 이면, startIndex = 0 | curPage = 2 이면, startIndex = 10
		// 1p 에서는 limit 0 ~ 10, 2p 에서는 limit 10 ~ 10
		// np 에서는 limit startIndex ~ 10
		// 0 < row < 10 --- limit
		int startIndex = (curPage - 1) * pagePerCount;
		
		// 현재 페이지가 위치한 블럭
		// << [1,2,3,4,5] >> 이면, curBlockNo = 1
		// << [6,7,8,9,10] >> 이면, curBlockNo = 2
		// curPage가 5의 배수이면 참, 아니면 거짓 이므로,
		// curPage = 5 이면, 5 / 5 = 1이고,
		// curPage < 5 이면, (n / 5) + 1 = 1임.
		// 따라서 1 <= curPage <= 5 이면, curBlockNo = 1
		int curBlockNo = curPage % (pagePerCount/2) == 0 ? (curPage / (pagePerCount/2)) : ((curPage / (pagePerCount/2)) + 1); 
		System.out.println("curBlockNo : " + curBlockNo);
		
		// 한 블럭의 시작 페이지와 끝 페이지
		// << [1,2,3,4,5] >> , curBlockNo = 1 이면, 1p 부터 시작, 5p까지
		// << [6,7,8,9,10] >> ,curBlockNo = 2 이면, 6p 부터 시작
		int blockStartPage = 1 + (curBlockNo - 1) * (pagePerCount/2);
		int blockEndPage = blockStartPage + (pagePerCount/2) - 1;
		System.out.println("block Start : " + blockStartPage);
		System.out.println("block End : " + blockEndPage);
		
		ArrayList<EventDto> eventList = dao.eventList(startIndex);
		
		Map<String, Object> data = new HashMap<String, Object>();
		
		
		data.put("eventList", eventList);
		data.put("totalPage", totalPage);
		data.put("blockStartPage", blockStartPage);
		data.put("blockEndPage", blockEndPage);
		data.put("curPage", curPage);
		
		// =================
		HttpSession session = request.getSession();
		
		try {
			PrintWriter out = response.getWriter();
			
			out.print(new Gson().toJson(data));
			out.flush();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
