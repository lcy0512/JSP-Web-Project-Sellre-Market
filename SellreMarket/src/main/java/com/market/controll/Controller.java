package com.market.controll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.command.MCgetCart;
import com.market.command.MCmainView;
import com.market.command.MCommand;

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
		
		String yName = (String) session.getAttribute("yName");
		String rContent = (String) session.getAttribute("rContent");
		String ySrc = (String) session.getAttribute("ySrc");
		String price = (String) session.getAttribute("price");
		
		switch(com) {
			// 로그인 화면
			case "/login.do" :
				viewPage = "test.jsp";
				break;
				
			case "/mainPage.do" :
				command = new MCmainView();
				command.execute(request, response);
				
				viewPage = "mainViewPage.jsp";
				
				break;
				
			case "/popup.do" :
				
				command = new MCmainView();
				command.execute(request, response);
				
				session.setAttribute("yName", yName);
				session.setAttribute("rContent", rContent);
				session.setAttribute("ySrc", ySrc);
				session.setAttribute("price", price);
				
				viewPage = "popup.jsp";
				
				break;
				
			case "/getCart.do" : 
				
				command = new MCgetCart();
				command.execute(request, response);
				
				session.setAttribute("yName", yName);
				session.setAttribute("rContent", rContent);
				session.setAttribute("ySrc", ySrc);
				session.setAttribute("price", price);
				
				viewPage = "mainViewPage.jsp";
				
			default :
				break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
		
	} // actionDo

} // End
