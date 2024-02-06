package com.market.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.command.ClickData;
import com.market.command.MCgetCart;
import com.market.command.MCmainView;
import com.market.command.MCommand;
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
		
		switch(com) {
			// 로그인 화면
			case "/login.do" :
				viewPage = "test.jsp";
				break;
				
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
				
				String yName = (String) session.getAttribute("yName");
				String ytitle = (String) session.getAttribute("ytitle");
				String ySrc = (String) session.getAttribute("ySrc");
				String price = (String) session.getAttribute("price");
				
				session.setAttribute("yName", yName);
				session.setAttribute("ytitle", ytitle);
				session.setAttribute("ySrc", ySrc);
				session.setAttribute("price", price);
				System.out.println(yName + " controller");
				System.out.println(ytitle);
				System.out.println(ySrc);
				System.out.println(price);
				
//				command = new ClickData();
//				command.execute(request, response);
//				
//				// "javax.servlet.http.HttpSession.getAttribute(String)" is null
//				int recipeId = (int) session.getAttribute("recipeId");
//				session.setAttribute("recipeId", recipeId);
				
				viewPage = "popup.jsp";
				
				break;
				
//			case "/getCart.do" : 
//				
//				command = new MCgetCart();
//				command.execute(request, response);
//				
//				viewPage = "mainViewPage.jsp";
//				
//			default :
//				break;
				
//			case "/page.do" : 
//				int curPage = 0;
//				
//				try {
//					curPage = Integer.parseInt(request.getParameter("curPage"));
//				}
//				catch (Exception e) {
//					curPage = 1;
//				}
//				
//				request.setAttribute("curPage", curPage);
//				
//				command = new Paging();
//				command.execute(request, response);
//				
//				
//				viewPage = "Test.jsp";
//				
//				break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
		
	} // actionDo

} // End
