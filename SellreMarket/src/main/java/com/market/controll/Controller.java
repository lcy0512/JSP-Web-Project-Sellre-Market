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
import com.market.command.MAdminCategory;
import com.market.command.MAdminCategoryInsert;
import com.market.command.MAdminGetCategory;
import com.market.command.MAdminGetPackKind;
import com.market.command.MAdminGetPackType;
import com.market.command.MAdminGetSubCategory;
import com.market.command.MAdminProductCount;
import com.market.command.MAdminProductInsert;
import com.market.command.MCalignBestHighPrice;
import com.market.command.MCalignBestLowPrice;
import com.market.command.MCalignNewHighPrice;
import com.market.command.MCalignNewLowPrice;
import com.market.command.MCalignRecipeHighPrice;
import com.market.command.MCalignRecipeLowPrice;
import com.market.command.MCbestProduct;
import com.market.command.MClogin;
import com.market.command.MCnewProductPaging;
import com.market.command.MCommand;
import com.market.command.MDuplicatedCheck;
import com.market.command.MInquiryDetail;
import com.market.command.MInsertInquiry;
import com.market.command.MLoadInquiryList;
import com.market.command.MProductDetailPageCommand;
import com.market.command.MSignUp;
import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminGetCategoryDto;
import com.market.dto.AdminGetPackTypeDto;
import com.market.dto.AdminProductDto;
import com.market.dto.PageInfo;
import com.market.command.Paging;
import com.market.command.getCart;

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
		// 페이징 처리를 위한
		int curPage = 0;
		// 페이지 클릭 시 신제품, 가격순으로 정렬하기 위한 변수
		String alignCategory = null;
		// header 카테고리
		String headerCategory = null;
		// 장바구니 클릭 시 가져 올 productid
		int productid = 0;
		
		
		response.setContentType("applicaton/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		switch(com) {
		// 로그인 화면
			case "/login.do" :
				viewPage = "Login.jsp";
				break;
				
			
			// 로그인 아이디 체크
			case "/loginCheck.do" : 
				id = request.getParameter("id");
				String password = request.getParameter("password");
				
				// 아이디 비밀번호를 LoginDao로 보내기
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				
				
				command = new MClogin();
				command.execute(request, response);
				
				// MC login으로 받아온 message
				String alertMessage = (String) session.getAttribute("alertMessage");
				// MC login으로 받아온 userName
				String userName = (String) session.getAttribute("userName");
				
				
				session.setAttribute("userName", userName);
				
				// 확인
				System.out.println(userName + "  userName in controller");
				System.out.println(alertMessage + " controller alert message");
				
				
				// login.js 로 보내기 message 보내기
				out.print(new Gson().toJson(alertMessage));
				out.flush();
				
				return;
				
				
			case "/inquiry.do" :
				System.out.println("마지막");
				command = new MLoadInquiryList();
				command.execute(request, response);
				viewPage = "individualInquiry.jsp";
				break;
				
			case "/inquiryInsert.do" :
				System.out.println("inquiryInsert");
				command = new MInsertInquiry();
				command.execute(request, response);
				viewPage = "inquiry.do";
				break;
				
			case "/inquirydetail.do" :
				System.out.println("inquirydetail.do");
				command = new MInquiryDetail();
				command.execute(request, response);
				// 문의 상세페이지로 이동, 
				viewPage = "InquiryDetail.jsp";
				break;
		
			case "/signup.do" :
				command = new MSignUp();
				command.execute(request, response);
				
				viewPage = "mainPage.do";
				break;
		
			
			case "/test.do" :
				viewPage = "TestProductSelection.jsp";
				System.out.println(viewPage);
				break;
				
			case "/detail.do" :
				command = new MProductDetailPageCommand();
				command.execute(request, response);
				viewPage = "detailPage.jsp";
				break;
				
			case "/productDetail.do" :
		        // 요청에서 선택된 상품 번호를 가져옴
				String selectProductId = request.getParameter("productId");				
		        // 선택된 상품 번호를 세션에 저장
		        session.setAttribute("productID", selectProductId);
		       
				System.out.println("보낼 아이디 : " + selectProductId);
		       
				command = new MProductDetailPageCommand();
				command.execute(request, response);
				viewPage = "ProductDetailPage.jsp";
				break;
				
				//관리자 제품 조회 + 페이징처리	
			case "/adminProduct.do":
				command = new MAdminProductCount();
				command.execute(request, response);
				
				int total = (int) request.getAttribute("total");
				int lastPage = (int) request.getAttribute("lastPage");
				int index_no = (int) request.getAttribute("index_no");
				ArrayList<AdminProductDto> productList = (ArrayList) request.getAttribute("list");
				
				//ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
				Map<String, Object> data = new HashMap<>();
				data.put("total", total);
				data.put("lastPage", lastPage);
				data.put("index_no", index_no);
				data.put("productList", productList);
				
				out.print(new Gson().toJson(data));
				out.flush();
				return;
				
				
			//관리자 제품 등록페이지
			case "/adminProductRegister.do" :
				viewPage = "adminProductRegister.jsp";
				break;
			
				
			//관리자 제품등록 - 카테고리 조회	
			case "/selectCategory.do" :
				command = new MAdminGetCategory();
				command.execute(request, response);
				
				ArrayList<AdminGetCategoryDto> typeList = (ArrayList) request.getAttribute("typeList");
				request.setAttribute("typeList", typeList);
				out.print(new Gson().toJson(typeList));
				out.flush();
				return;
		
			//관리자 제품등록 - 카테고리 중분류 조회		
			case "/selectSubCategory.do" :
				command = new MAdminGetSubCategory();
				command.execute(request, response);
				
				ArrayList<AdminGetCategoryDto> subList = (ArrayList) request.getAttribute("subList");
				request.setAttribute("subList", subList);
				
				out.print(new Gson().toJson(subList));
				out.flush();
				return;
			
			//관리자 제품등록 - 포장타입 조회	
			case "/selectPackType.do" :
				command = new MAdminGetPackType();
				command.execute(request, response);
				
				ArrayList<AdminGetPackTypeDto> packType = (ArrayList) request.getAttribute("packType");
				request.setAttribute("packType", packType);
				
				out.print(new Gson().toJson(packType));
				out.flush();
				return;
			
			//관리자 제품등록 - 포장종류 조회	
			case "/selectPackKind.do" :
				command = new MAdminGetPackKind();
				command.execute(request, response);
				
				ArrayList<AdminGetPackTypeDto> packKind = (ArrayList) request.getAttribute("packKind");
				request.setAttribute("packKind", packKind);
				
				out.print(new Gson().toJson(packKind));
				out.flush();
				return;
				
				
			//관리자 제품등록 - 제품등록등록!!
			case "/insertProduct.do" :
				command = new MAdminProductInsert();
				command.execute(request, response);
				
				int result = (int) request.getAttribute("result");
				request.setAttribute("result", result);
				out.print(new Gson().toJson(result));
				out.flush();
				return;
			
				//관리자 카테고리 현황
			case "/adminCategory.do" :
				command = new MAdminCategory();
				command.execute(request, response);
				
				int categoryTotal = (int) request.getAttribute("total");
				int categoryLastPage = (int) request.getAttribute("lastPage");
				int categoryIndex_no = (int) request.getAttribute("index_no");
				ArrayList<AdminCategoryDto> categoryList = (ArrayList) request.getAttribute("list");
				
				//ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
				Map<String, Object> dataCategory = new HashMap<>();
				dataCategory.put("total", categoryTotal);
				dataCategory.put("lastPage", categoryLastPage);
				dataCategory.put("index_no", categoryIndex_no);
				dataCategory.put("categoryList", categoryList);
				
				out.print(new Gson().toJson(dataCategory));
				out.flush();
				return;
				
			//관리자 카테고리 페이지
			case "/goToadminCategory.do" :
				viewPage = "adminCategory.jsp";
				return;
			
			//관리자 카테고리 등록 페이지 전환
			case "/adminCategoryRegister.do" :
				viewPage = "adminCategoryRegister.jsp";
				break;
					
			//관리자 카테고리 등록하기
			case "/insertCategory.do" :
				command = new MAdminCategoryInsert();
				command.execute(request, response);
				
				int num = (int) request.getAttribute("num");
				request.setAttribute("num", num);
				out.print(new Gson().toJson(num));
				out.flush();
				return;
				
			// 레시피 페이지
			case "/recipePage.do" :
				
				headerCategory = "레시피";
				alignCategory = "";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				request.setAttribute("customerid", id);
				
				// 페이징 처리를 위한
				command = new Paging();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "recipeList.jsp";
				
				break;
			case "/alignRecipeLowPrice.do" :
				headerCategory = "레시피";
				alignCategory = "낮은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignRecipeLowPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "recipeList.jsp";
				break;
				
			case "/alignRecipeHighPrice.do" :
				headerCategory = "레시피";
				alignCategory = "높은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignRecipeHighPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "recipeList.jsp";
				break;
				
			// 신제품 정보 불러오는 작업
			case "/mainPage.do" :
				headerCategory = "신상품";
				alignCategory = "신상품순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCnewProductPaging();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "newProduct.jsp";
				break;
				
			case "/alignNewLowPrice.do" :
				headerCategory = "신상품";
				alignCategory = "낮은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignNewLowPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "newProduct.jsp";
				break;
				
			case "/alignNewHighPrice.do" :
				headerCategory = "신상품";
				alignCategory = "높은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignNewHighPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "newProduct.jsp";
				break;
				
			// 베스트순 정보 불러오는 작업
			case "/bestProduct.do" :
				headerCategory = "베스트";
				alignCategory = "베스트순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCbestProduct();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "bestProduct.jsp";
				break;
				
				
			case "/alignBestLowPrice.do" :
				headerCategory = "베스트";
				alignCategory = "낮은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignBestLowPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "bestProduct.jsp";
				break;
				
			case "/alignBestHighPrice.do" :
				headerCategory = "베스트";
				alignCategory = "높은 가격순";
				
				// 수정 필요
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				// 수정 필요
				
				try {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				catch (Exception e) {
					curPage = 1;
				}
				
				request.setAttribute("curPage", curPage);
				
				command = new MCalignBestHighPrice();
				command.execute(request, response);
				
				session.setAttribute("alignCategory", alignCategory);
				session.setAttribute("headerCategory", headerCategory);
				
				viewPage = "bestProduct.jsp";
				break;
			
			// 장바구니 클릭 시 띄우는 팝업
//			case "/popup.do" :
//				
//				String yName = request.getParameter("yName");
//				String ySrc = request.getParameter("ySrc");
//				String price =  request.getParameter("price");
//				String yTitle = request.getParameter("yTitle");
//				
//				int recipeid = Integer.parseInt(request.getParameter("recipeid"));
//				int productid = Integer.parseInt(request.getParameter("productid"));
//				
//				System.out.println(recipeid);
//				System.out.println(productid);
//				
//				session.setAttribute("yName", yName);
//				session.setAttribute("ySrc", ySrc);
//				session.setAttribute("price", price);
//				session.setAttribute("yTitle", yTitle);
//				session.setAttribute("recipeid", recipeid);
//				session.setAttribute("productid", productid);
//				
//				viewPage = "popup.jsp";
//				
//				break;
				
				
			// main페이지 카트 클릭
			case "/recipePageCart.do" :
				
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				
				int ri = Integer.parseInt(request.getParameter("recipeid"));
				
				System.out.println(ri + " ?????????");
				
				session.setAttribute("customerid", id);
				session.setAttribute("recipeid", ri);
				command = new getCart();
				command.execute(request, response);
				
				viewPage = "recipePage.do";
				break;
				
			// 신제품 페이지 카트 클릭
			case "/newPageCart.do" :
				
				if (request.getParameter("customerid") != null) {
					id = request.getParameter("customerid");
				}
				
				productid = Integer.parseInt(request.getParameter("productid"));
				
				System.out.println(productid + " ?????????");
				
				session.setAttribute("customerid", id);
				session.setAttribute("productid", productid);
				command = new getCart();
				command.execute(request, response);
				
				viewPage = "newProductList.do";
				break;
				// 신제품 페이지 카트 클릭
				
			// 수정필요
				// 수정필요
				// 수정필요
				// 수정필요
				// 수정필요
				
				// 카트 수정 해야함
			case "/getCart.do" :
				int selectedNumber = Integer.parseInt(request.getParameter("selectedNumber"));
				System.out.println(selectedNumber);
//				int ri = (int) session.getAttribute("recipeid");
//				int pi = (int) session.getAttribute("productid");
				
//				System.out.println(ri + " ?????????");
//				System.out.println(pi + " ?????????");
				
				viewPage = "mainViewPage.do";
				
				break;
			
			case "/duplicatedCheck.do" :
				command = new MDuplicatedCheck();
				command.execute(request, response);
				return;

//			case "/bestPageCart.do" :
//				
//				if (request.getParameter("customerid") != null) {
//					id = request.getParameter("customerid");
//				}
//				
//				productid = Integer.parseInt(request.getParameter("productid"));
//				
//				System.out.println(productid + " ?????????");
//				
//				session.setAttribute("customerid", id);
//				session.setAttribute("productid", productid);
//				command = new getCart();
//				command.execute(request, response);
//				
//				viewPage = "newProductList.do";
//				return;
				// 수정필요
				// 수정필요
				// 수정필요
				// 수정필요
				// 수정필요
				
			case "/logout.do" :
				session.invalidate();
				viewPage = "mainPage.do";
				
				break;
				
			default :
				break;
				
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
		
	} // actionDo

} // End
