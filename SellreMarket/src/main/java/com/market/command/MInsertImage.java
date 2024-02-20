package com.market.command;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;
import com.oreilly.servlet.MultipartRequest;

public class MInsertImage implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	        
		HttpSession session = request.getSession();
		
		int productid = (int) session.getAttribute("pId");
		
		String fileName = "";
		
		String path = request.getServletContext().getRealPath("/image");
		File file = new File(path);
		
		//위 서버경로에 image폴더 없으면 생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String encType = "UTF-8";
		int maxFileSize = 5 * 1024 * 1024;
		int result = 0;
		
		//MultipartRequest (request, 저장경로, 최대허용크기, 인코딩, 동일한 파일명 보호 여부)
		try {
				MultipartRequest multi = new MultipartRequest(request, path, maxFileSize ,encType);
				fileName = multi.getFilesystemName("image");	//이미지 input 태그 name
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		AdminProductInputDao dao = new AdminProductInputDao();
		result = dao.insertImage(fileName, productid);
		request.setAttribute("result", result);
		
	}

}
