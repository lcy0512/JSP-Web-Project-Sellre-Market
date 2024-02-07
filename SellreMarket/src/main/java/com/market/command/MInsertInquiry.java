package com.market.command;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.InquiryDao;
import com.oreilly.servlet.MultipartRequest;

public class MInsertInquiry implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String inimage = "";
//		String userid = (String)session.getAttribute("userid");
		String userid = "admin";
		
		try {
			// 서버 경로
			String path = request.getServletContext().getRealPath("/image");
			
			// 파일의 최대 크기 지정 , 1KB * 1KB * [option] = [option]MB
			int maxSize = 1024 * 1024 * 4;
			
			// 생성자를 호출 시 파일 업로드를 수행, (request객체, 파일경로, 파일의 최대 용량)
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			
			Enumeration<String> files = multi.getFileNames();
			
			// 넘겨받은 form에서 <file> tag가 있는지를 확인
			if (files.hasMoreElements()) {
				// <file> tag의 name
			    String name = (String) files.nextElement();
			    // 사용자가 업로드한 file의 이름
			    inimage = multi.getOriginalFileName(name);
			    
			    System.out.println("inimage Name: " + inimage);
			}
			
			String questid = multi.getParameter("questid");
			String intitle = multi.getParameter("intitle");

			String[] incontents = multi.getParameterValues("incontent");
			String incontent = "";
			// 여러 줄로 입력된 상세 설명을 하나의 문자열로 합침
			if (incontents != null && incontents.length > 0) {
				StringBuilder descriptionBuilder = new StringBuilder();

				for (String line : incontents) {
					descriptionBuilder.append(line).append("\n");
				}

				incontent = descriptionBuilder.toString().trim();
			}
			
			InquiryDao dao = new InquiryDao();
			
			dao.insertInquiry(intitle,incontent,inimage,questid,userid);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
} // End
