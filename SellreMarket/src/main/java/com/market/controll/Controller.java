package com.market.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.command.getCart;
import com.market.command.MAdminProductCount;
import com.market.command.MCgetCart;
import com.market.command.MCmainView;
import com.market.command.MCommand;
import com.market.command.MLoadInquiryList;
import com.market.dto.AdminProductDto;
import com.market.dto.PageInfo;
import com.market.command.Paging;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		MCommand command = null;
		String viewPage = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String id = null;
		
		response.setContentType("applicaton/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		switch(com) {
			// 로그인 화면
			case "/login.do" :
				viewPage = "test.jsp";
				break;
				
			case "/inquiry.do" :
				command = new MLoadInquiryList();
				command.execute(request, response);
				viewPage = "individualInquiry.jsp";
				break;
				
			//관리자 제품 조회 
			case "/adminProduct.do":
				command = new MAdminProductCount();
				command.execute(request, response);
				ArrayList<AdminProductDto> list = (ArrayList) request.getAttribute("list");
				out.print(new Gson().toJson(list)); 
				out.flush(); //실행 => ajax로 불러오므로 viewPage값 없이 바로 return;
				return;
				
				//관리자 제품 조회 - 페이징처리	
			case "/adminProductCnt.do":
				command = new MAdminProductCount();
				command.execute(request, response);
				
				PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
				ArrayList<AdminProductDto> pageList = (ArrayList)request.getAttribute("list");
				int listCount = (int) request.getAttribute("listCount");
				
				//ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
				Map<String, Object> data = new HashMap<>();
				data.put("pageInfo", pageInfo);
				data.put("pageList", pageList);
				data.put("listCount", listCount);
				
				out.print(new Gson().toJson(data)); 
				out.flush(); //실행 => ajax로 불러오므로 viewPage값 없이 바로 return;
				
				return;	
				
			case "/mainPage.do" :
				// 페이징 처리를 위한
				int curPage = 0;
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				// 페이징 처리를 위한
				
				command = new Paging();
				command.execute(request, response);
				command = new MCmainView();
				command.execute(request, response);
				
				viewPage = "mainViewPage.jsp";
				
				break;
				
			case "/popup.do" :
				
				String yName = request.getParameter("yName");
				String ySrc = request.getParameter("ySrc");
				String price =  request.getParameter("price");
				String yTitle = request.getParameter("yTitle");
				
				int recipeid = Integer.parseInt(request.getParameter("recipeid"));
				int productid = Integer.parseInt(request.getParameter("productid"));
				
				session.setAttribute("yName", yName);
				session.setAttribute("ySrc", ySrc);
				session.setAttribute("price", price);
				session.setAttribute("yTitle", yTitle);
				session.setAttribute("recipeid", recipeid);
				session.setAttribute("productid", productid);
				
//				command = new ClickData();
//				command.execute(request, response);
//				
//				// "javax.servlet.http.HttpSession.getAttribute(String)" is null
//				int recipeId = (int) session.getAttribute("recipeId");
//				session.setAttribute("recipeId", recipeId);
				
				viewPage = "popup.jsp";
				
				break;
				
				
				// 카트 수정 해야함
			case "/getCart.do" :
				int ri = Integer.parseInt(request.getParameter("recipeid"));
				int pi = Integer.parseInt(request.getParameter("productid"));
				
				System.out.println(ri);
				System.out.println(pi);
				
				viewPage = "mainViewPage.jsp";
//				받아 올 것 productid, recipeid , qty
//				int productid = Integer.parseInt(request.getParameter("productid"));
//				int recipeid = Integer.parseInt(request.getParameter("recipeid"));
//				int selectedNumber = Integer.parseInt(request.getParameter("selectedNumber"));
//				
//				System.out.println(productid);
//				System.out.println(recipeid);
//				System.out.println(selectedNumber);
				
//				session.setAttribute("productid", productid);
//				session.setAttribute("recipeid", recipeid);
//				session.setAttribute("selectedNumber", selectedNumber);
//				
//				command = new getCart();
//				command.execute(request, response);
//				
//				viewPage = "mainViewPage.jsp";
				
			default :
				break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
		
	} // actionDo

} // End
