package com.market.controll;

import static com.market.common.util.AuthorityUtil.requireSigning;

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
import com.market.auth.domain.User;
import com.market.command.MAdminBrand;
import com.market.command.MAdminBrandDetail;
import com.market.command.MAdminBrandInsert;
import com.market.command.MAdminBrandUpdate;
import com.market.command.MAdminCategory;
import com.market.command.MAdminCategoryDelete;
import com.market.command.MAdminCategoryDetail;
import com.market.command.MAdminCategoryInsert;
import com.market.command.MAdminCategoryUpdate;
import com.market.command.MAdminEvent;
import com.market.command.MAdminEventDelete;
import com.market.command.MAdminEventDetail;
import com.market.command.MAdminEventInsert;
import com.market.command.MAdminEventUpdate;
import com.market.command.MAdminGenderChart;
import com.market.command.MAdminGetCategory;
import com.market.command.MAdminGetPackKind;
import com.market.command.MAdminGetPackType;
import com.market.command.MAdminGetSubCategory;
import com.market.command.MAdminOrder;
import com.market.command.MAdminOrderDetail;
import com.market.command.MAdminOrderProduct;
import com.market.command.MAdminPopularChart;
import com.market.command.MAdminProductCount;
import com.market.command.MAdminProductDelete;
import com.market.command.MAdminProductDetail;
import com.market.command.MAdminProductInsert;
import com.market.command.MAdminProductNum;
import com.market.command.MAdminProductUpdate;
import com.market.command.MAdminQuest;
import com.market.command.MAdminQuestDetail;
import com.market.command.MAdminQuestInsert;
import com.market.command.MAdminQuestNum;
import com.market.command.MAdminSaleChart;
import com.market.command.MAdminUserChart;
import com.market.command.MBrandSelect;
import com.market.command.MCalignBestHighPrice;
import com.market.command.MCalignBestLowPrice;
import com.market.command.MCalignNewHighPrice;
import com.market.command.MCalignNewLowPrice;
import com.market.command.MCalignRecipeHighPrice;
import com.market.command.MCalignRecipeLowPrice;
import com.market.command.MCartListView;
import com.market.command.MCartListViewApi;
import com.market.command.MCartRegistry;
import com.market.command.MCartUpdateAmount;
import com.market.command.MCbestProduct;
import com.market.command.MCheckAuthentic;
import com.market.command.MClogin;
import com.market.command.MCnewProductPaging;
import com.market.command.MCommand;
import com.market.command.MCommandReturnInt;
import com.market.command.MCpaging;
import com.market.command.MCrecipeProduct;
import com.market.command.MDeleteUserInfo;
import com.market.command.MDuplicatedCheck;
import com.market.command.MEventDetail;
import com.market.command.MInquiryDetail;
import com.market.command.MInsertInquiry;
import com.market.command.MInsertPrice;
import com.market.command.MLoadEventList;
import com.market.command.MLoadInquiryList;
import com.market.command.MMyPage;
import com.market.command.MMyPageDetail;
import com.market.command.MProductDetailPageCommand;
import com.market.command.MRecipeDetailPageCommand;
import com.market.command.MSignUp;
import com.market.command.MinsertBrandToProduct;
import com.market.command.MinsertCategoryToProduct;
import com.market.command.MinsertPackToProduct;
import com.market.command.MinsertUnitToProduct;
import com.market.command.getCartByProduct;
import com.market.command.getCartByRecipe;
import com.market.dto.AdminBrandDto;
import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminEventDto;
import com.market.dto.AdminGetCategoryDto;
import com.market.dto.AdminGetPackTypeDto;
import com.market.dto.AdminProductDto;
import com.market.dto.AdminQuestDto;
import com.market.dto.AdminSaleDto;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		MCommand command = null;
		MCommandReturnInt returnCommand = null;
		String viewPage = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);

		String id = null;
		// 페이징 처리를 위한
		int curPage = 0;
		int cartCount = 0;
		// 페이지 클릭 시 신제품, 가격순으로 정렬하기 위한 변수
		String alignCategory = null;
		// header 카테고리
		String headerCategory = null;
		// 장바구니 클릭 시 가져 올 productid
		int productid = 0;

		response.setContentType("applicaton/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		Gson gson = new Gson();

		switch (com) {
		// 로그인 화면
		case "/login.do":
			viewPage = "Login.jsp";
			break;

		// 로그인 아이디 체크
		case "/loginCheck.do":
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

			// 확인
			System.out.println(userName + "  userName in controller");
			System.out.println(alertMessage + " controller alert message");

			// login.js 로 보내기 message 보내기
			out.print(new Gson().toJson(alertMessage));
			out.flush();

			return;

		case "/inquiry.do":
			System.out.println("마지막");
			command = new MLoadInquiryList();
			command.execute(request, response);
			viewPage = "individualInquiry.jsp";
			break;

		case "/inquiryInsert.do":
			System.out.println("inquiryInsert");
			command = new MInsertInquiry();
			command.execute(request, response);
			viewPage = "inquiry.do";
			break;

		case "/inquirydetail.do":
			System.out.println("inquirydetail.do");
			command = new MInquiryDetail();
			command.execute(request, response);
			// 문의 상세페이지로 이동,
			viewPage = "InquiryDetail.jsp";
			break;

		case "/signup.do":
			returnCommand = new MSignUp();
			int resultCode = returnCommand.execute(request, response);

			if (resultCode == 1)
				viewPage = "mainPage.do";
			else
				viewPage = "mypageinfo.jsp";
			break;

		case "/test.do":
			viewPage = "TestProductSelection.jsp";
			System.out.println(viewPage);
			break;

		case "/detail.do":
			command = new MProductDetailPageCommand();
			command.execute(request, response);
			viewPage = "ProductDetailPage.jsp";
			break;

		case "/mypage.do":
			System.out.println("mypage.do");
			command = new MMyPage();
			command.execute(request, response);
			return;

		case "/mypagedetail.do":
			command = new MMyPageDetail();
			command.execute(request, response);

			viewPage = "mypagedetail.jsp";
			break;

		case "/deleteuserinfo.do":
			command = new MDeleteUserInfo();
			command.execute(request, response);

			viewPage = "logout.do";
			break;

		case "/noticelist.do":
			command = new MLoadEventList();
			command.execute(request, response);

			return;

		case "/noticedetail.do":
			command = new MEventDetail();
			command.execute(request, response);

			viewPage = "noticedetail.jsp";
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
				
		case "/testRecipe.do" :
			viewPage = "TestRecipeSelection.jsp";
			System.out.println(viewPage);
			break;

		case "/recipeDetail.do" :
			System.out.println("----레시피 do----");
			// 요청에서 선택된 상품 번호를 가져옴
			String selectRecipeId = request.getParameter("recipeId");				
	       		// 선택된 상품 번호를 세션에 저장
	       		session.setAttribute("recipeID", selectRecipeId);
	      
			System.out.println("보낼 아이디 : " + selectRecipeId);
	      
			command = new MRecipeDetailPageCommand();
			command.execute(request, response);
			viewPage = "RecipeDetailPage.jsp";
			break;

		// recipeAjax.do 요청에 대한 처리
		case "/recipeAjax.do" :
			System.out.println("----아젝스 do----");
		    // 클라이언트로부터 전달된 장바구니 상품 이름들을 가져옵니다.
		    String cartItemNamesStr = request.getParameter("cartItemNames");
		    String cartItemQuantitiesStr = request.getParameter("cartItemQuantities");
		   
		    System.out.println("컨트롤러, 잘 받아져왔나(이름) : " + cartItemNamesStr);
		    System.out.println("컨트롤러, 잘 받아져왔나(수량) : " + cartItemQuantitiesStr);
		   
		    if (cartItemNamesStr != null && !cartItemNamesStr.isEmpty()) {
		        // 상품 이름들을 쉼표로 구분하여 배열로 분리합니다.
		        String[] cartItemNames = cartItemNamesStr.split(",");
		        String[] cartItemQuantities = cartItemQuantitiesStr.split(",");
		        // 상품 이름 배열을 request에 attribute로 설정합니다.
		        request.setAttribute("cartItemNames", cartItemNames);
		        request.setAttribute("cartItemQuantities", cartItemQuantities);
		        // 상품 이름 배열을 그대로 출력합니다.
		        System.out.println("컨트롤러에서 받은 상품이름들: ");
		        for (String itemName : cartItemNames) {
		            System.out.println(itemName + ", ");
		        }
		        System.out.println("컨트롤러에서 받은 상품수량들: ");
		        for (String itemName : cartItemQuantities) {
		            System.out.println(itemName + ", ");
		        }
		    } else {
		        // 장바구니 상품 이름이 전달되지 않은 경우에 대한 처리
		        System.out.println("cartItemNames 매개변수가 비어 있거나 null입니다.");
		    }
		    command = new MSendCartCommand();
		    command.execute(request, response);
		    break;
				
		// 관리자 제품 조회 + 페이징처리
		case "/adminProduct.do":
			command = new MAdminProductCount();
			command.execute(request, response);

			int total = (int) request.getAttribute("total");
			int lastPage = (int) request.getAttribute("lastPage");
			int index_no = (int) request.getAttribute("index_no");
			ArrayList<AdminProductDto> productList = (ArrayList) request.getAttribute("list");

			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> data = new HashMap<>();
			data.put("total", total);
			data.put("lastPage", lastPage);
			data.put("index_no", index_no);
			data.put("productList", productList);

			out.print(new Gson().toJson(data));
			out.flush();
			return;

		// 관리자 제품 등록페이지
		case "/adminProductRegister.do":
			viewPage = "adminProductRegister.jsp";
			break;

		// 관리자 제품등록 - 카테고리 조회
		case "/selectCategory.do":
			command = new MAdminGetCategory();
			command.execute(request, response);

			ArrayList<AdminGetCategoryDto> typeList = (ArrayList) request.getAttribute("typeList");
			request.setAttribute("typeList", typeList);
			out.print(new Gson().toJson(typeList));
			out.flush();
			return;

		// 관리자 제품등록 - 카테고리 중분류 조회
		case "/selectSubCategory.do":
			command = new MAdminGetSubCategory();
			command.execute(request, response);

			ArrayList<AdminGetCategoryDto> subList = (ArrayList) request.getAttribute("subList");
			request.setAttribute("subList", subList);

			out.print(new Gson().toJson(subList));
			out.flush();
			return;

		// 관리자 제품등록 - 포장타입 조회
		case "/selectPackType.do":
			command = new MAdminGetPackType();
			command.execute(request, response);

			ArrayList<AdminGetPackTypeDto> packType = (ArrayList) request.getAttribute("packType");
			request.setAttribute("packType", packType);

			out.print(new Gson().toJson(packType));
			out.flush();
			return;

		// 관리자 제품등록 - 포장종류 조회
		case "/selectPackKind.do":
			command = new MAdminGetPackKind();
			command.execute(request, response);

			ArrayList<AdminGetPackTypeDto> packKind = (ArrayList) request.getAttribute("packKind");
			request.setAttribute("packKind", packKind);

			out.print(new Gson().toJson(packKind));
			out.flush();
			return;

		// 관리자 제품등록 - 제품등록등록!!
		case "/insertProduct.do":
			command = new MAdminProductInsert();
			command.execute(request, response);
			int result = (int) request.getAttribute("result");
			int pId = (int) request.getAttribute("productid");
			session.setAttribute("pId", pId); // insert된 제품의 pID
			out.print(new Gson().toJson(result));
			out.flush();
			return;

		// 관리자 카테고리 현황
		case "/adminCategory.do":
			command = new MAdminCategory();
			command.execute(request, response);

			int categoryTotal = (int) request.getAttribute("total");
			int categoryLastPage = (int) request.getAttribute("lastPage");
			int categoryIndex_no = (int) request.getAttribute("index_no");
			ArrayList<AdminCategoryDto> categoryList = (ArrayList) request.getAttribute("list");

			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> dataCategory = new HashMap<>();
			dataCategory.put("total", categoryTotal);
			dataCategory.put("lastPage", categoryLastPage);
			dataCategory.put("index_no", categoryIndex_no);
			dataCategory.put("categoryList", categoryList);

			out.print(new Gson().toJson(dataCategory));
			out.flush();
			return;

		// 관리자 카테고리 페이지
		case "/goToadminCategory.do":
			viewPage = "adminCategory.jsp";
			return;

		// 관리자 카테고리 등록 페이지 전환
		case "/adminCategoryRegister.do":
			viewPage = "adminCategoryRegister.jsp";
			break;

		// 관리자 카테고리 등록하기
		case "/insertCategory.do":
			command = new MAdminCategoryInsert();
			command.execute(request, response);

			int num = (int) request.getAttribute("num");
			request.setAttribute("num", num);
			out.print(new Gson().toJson(num));
			out.flush();
			return;

		case "/adminCategoryDetailPage.do":
			session.setAttribute("categoryid", request.getParameter("id"));
			System.out.println("카테고리 id : " + session.getAttribute("categoryid"));
			viewPage = "adminCategoryDetail.jsp";
			break;

		// 관리자 카테고리 상사페이지 조회
		case "/selectAdminCategoryDetail.do":
			request.setAttribute("categoryid", session.getAttribute("categoryid"));
			System.out.println("카테고리 id2 : " + session.getAttribute("categoryid"));
			command = new MAdminCategoryDetail();
			command.execute(request, response);
			ArrayList<AdminCategoryDto> categoryListDetail = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(categoryListDetail));
			out.flush();
			return;

		// 관리자 카테고리 수정하기
		case "/updateCategory.do":
			command = new MAdminCategoryUpdate();
			command.execute(request, response);
			int chkNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(chkNum));
			out.flush();
			return;

		// 관리자 카테고리 삭제하기
		case "/deleteCategory.do":
			command = new MAdminCategoryDelete();
			command.execute(request, response);
			int deleteNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(deleteNum));
			out.flush();
			return;

		// 관리자 이벤트 현황 조회
		case "/adminEvent.do":
			command = new MAdminEvent();
			command.execute(request, response);
			int eventTotal = (int) request.getAttribute("eventTotal");
			int eventLastPage = (int) request.getAttribute("eventLastPage");
			int eventIndex_no = (int) request.getAttribute("eventIndex_no");
			ArrayList<AdminCategoryDto> eventList = (ArrayList) request.getAttribute("eventList");
			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> dataEvent = new HashMap<>();
			dataEvent.put("total", eventTotal);
			dataEvent.put("lastPage", eventLastPage);
			dataEvent.put("index_no", eventIndex_no);
			dataEvent.put("eventList", eventList);
			out.print(new Gson().toJson(dataEvent));
			out.flush();
			return;

		// 관리자 이벤트 등록 페이지 이동
		case "/adminEventRegister.do":
			viewPage = "adminEventRegister.jsp";
			break;

		// 관리자 이벤트 상세 페이지 이동
		case "/adminEventDetailPage.do":
			session.setAttribute("eventid", request.getParameter("id"));
			viewPage = "adminEventDetail.jsp";
			break;

		// 관리자 카테고리 상사페이지 조회
		case "/selectAdminEventDetail.do":
			request.setAttribute("eventid", session.getAttribute("eventid"));
			command = new MAdminEventDetail();
			command.execute(request, response);
			ArrayList<AdminEventDto> eventDetailList = (ArrayList) request.getAttribute("eventDetailList");
			out.print(new Gson().toJson(eventDetailList));
			out.flush();
			return;

		// 관리자 이벤트 입력하기
		case "/insertEvent.do":
			command = new MAdminEventInsert();
			command.execute(request, response);
			viewPage = "/adminEvent.do";
			return;

		// 관리자 이벤트 수정하기
		case "/updateEvent.do":
			command = new MAdminEventUpdate();
			command.execute(request, response);
			int event = (int) request.getAttribute("num");
			out.print(new Gson().toJson(event));
			out.flush();
			return;

		// 관리자 이벤트 삭제하기
		case "/deleteEvent.do":
			command = new MAdminEventDelete();
			command.execute(request, response);
			int deleteEventNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(deleteEventNum));
			out.flush();
			return;

		// 관리제 제품현황에 숫자 표시
		case "/adminProductNum.do":
			command = new MAdminProductNum();
			command.execute(request, response);
			int productNum = (int) request.getAttribute("productNum");
			out.print(new Gson().toJson(productNum));
			out.flush();
			return;

		// 관리자 입고요청 조회
		case "/adminOrder.do":
			command = new MAdminOrder();
			command.execute(request, response);
			int orderTotal = (int) request.getAttribute("total");
			int orderLastPage = (int) request.getAttribute("lastPage");
			int orderIndex_no = (int) request.getAttribute("index_no");
			ArrayList<AdminCategoryDto> orderList = (ArrayList) request.getAttribute("list");
			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> dataOrder = new HashMap<>();
			dataOrder.put("total", orderTotal);
			dataOrder.put("lastPage", orderLastPage);
			dataOrder.put("index_no", orderIndex_no);
			dataOrder.put("orderList", orderList);
			out.print(new Gson().toJson(dataOrder));
			out.flush();
			return;

		// 관리자 입고요청 페이지 전환
		case "/adminOrderDetailPage.do":
			session.setAttribute("orderProductId", request.getParameter("id"));
			viewPage = "adminOrderDetail.jsp";
			break;

		// 관리자 입고요청 페이지 조회
		case "/selectAdminOrderDetail.do":
			request.setAttribute("orderProductId", session.getAttribute("orderProductId"));
			command = new MAdminOrderDetail();
			command.execute(request, response);
			ArrayList<AdminProductDto> listToOrderDetail = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(listToOrderDetail));
			out.flush();
			return;

		// 관리자 입고요청 insert 및 update
		case "/orderProduct.do":
			command = new MAdminOrderProduct();
			command.execute(request, response);
			command.execute(request, response);
			int orderNum = (int) request.getAttribute("total");
			out.print(new Gson().toJson(orderNum));
			out.flush();
			return;

		// 관리자 고객문의 조회하기
		case "/adminQuest.do":
			command = new MAdminQuest();
			command.execute(request, response);
			int questTotal = (int) request.getAttribute("total");
			int questLastPage = (int) request.getAttribute("lastPage");
			int questIndex_no = (int) request.getAttribute("index_no");
			ArrayList<AdminCategoryDto> questList = (ArrayList) request.getAttribute("list");
			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> dataQuest = new HashMap<>();
			dataQuest.put("total", questTotal);
			dataQuest.put("lastPage", questLastPage);
			dataQuest.put("index_no", questIndex_no);
			dataQuest.put("questList", questList);
			out.print(new Gson().toJson(dataQuest));
			out.flush();
			return;

		// 관리자 고객문의 답변페이지 이동
		case "/adminQuestDetailPage.do":
			session.setAttribute("questId", request.getParameter("id"));
			viewPage = "adminQuestDetailPage.jsp";
			break;

		// 관리자 고객문의 내용 조회
		case "/selectAdminQuestDetail.do":
			command = new MAdminQuestDetail();
			command.execute(request, response);
			ArrayList<AdminQuestDto> questDetail = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(questDetail));
			out.flush();
			return;

		// 관리자 고객문의 답변 등록
		case "/adminInsertQuest.do":
			command = new MAdminQuestInsert();
			command.execute(request, response);
			int questNum = (int) request.getAttribute("total");
			out.print(new Gson().toJson(questNum));
			out.flush();
			return;

		// 관리제 고객문의에 숫자 표시
		case "/adminQuestNum.do":
			command = new MAdminQuestNum();
			command.execute(request, response);
			int selectQuestNum = (int) request.getAttribute("questNum");
			out.print(new Gson().toJson(selectQuestNum));
			out.flush();
			return;

		// 제품현황 - 브랜드 조회
		case "/selectBrand.do":
			command = new MBrandSelect();
			command.execute(request, response);
			ArrayList<AdminBrandDto> brandSelectList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(brandSelectList));
			out.flush();
			return;
		// 제품 가격 insert
		case "/insertPrice.do":
			command = new MInsertPrice();
			command.execute(request, response);
			int priceResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(priceResult));
			out.flush();
			return;
		// 제품 브랜드 연결
		case "/insertBrandToProduct.do":
			command = new MinsertBrandToProduct();
			command.execute(request, response);
			int brandResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(brandResult));
			out.flush();
			return;
		// 제품 카테고리 연결
		case "/insertCategoryToProduct.do":
			command = new MinsertCategoryToProduct();
			command.execute(request, response);
			int cateResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(cateResult));
			out.flush();
			return;
		// 제품 카테고리 연결
		case "/insertPackToProduct.do":
			command = new MinsertPackToProduct();
			command.execute(request, response);
			int packResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(packResult));
			out.flush();
			return;
		// 제품 중량 연결
		case "/insertUnitToProduct.do":
			command = new MinsertUnitToProduct();
			command.execute(request, response);
			int unitResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(unitResult));
			out.flush();
			return;

			// 레시피 페이지
		case "/recipePage.do" :
			
			headerCategory = "레시피";
			alignCategory = "";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}
			
			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			// 페이징 처리를 위한
			command = new MCrecipeProduct();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "recipeList.jsp";
			
			break;
			
		case "/alignRecipeLowPrice.do" :
			headerCategory = "레시피";
			alignCategory = "낮은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}
			
			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			command = new MCalignRecipeLowPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "recipeList.jsp";
			break;
			
		case "/alignRecipeHighPrice.do" :
			headerCategory = "레시피";
			alignCategory = "높은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}
			
			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			command = new MCalignRecipeHighPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "recipeList.jsp";
			break;
			
		// 신제품 정보 불러오는 작업
		case "/mainPage.do" :
			headerCategory = "신상품";
			alignCategory = "신상품순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}
			
			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCnewProductPaging();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "newProduct.jsp";
			
			break;
			
		case "/alignNewLowPrice.do" :
			headerCategory = "신상품";
			alignCategory = "낮은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}
			
			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCalignNewLowPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "newProduct.jsp";
			break;
			
		case "/alignNewHighPrice.do" :
			headerCategory = "신상품";
			alignCategory = "높은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}

			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCalignNewHighPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "newProduct.jsp";
			break;
			
		// 베스트순 정보 불러오는 작업
		case "/bestProduct.do" :
			headerCategory = "베스트";
			alignCategory = "베스트순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}

			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCbestProduct();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "bestProduct.jsp";
			break;
			
			
		case "/alignBestLowPrice.do" :
			headerCategory = "베스트";
			alignCategory = "낮은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}

			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCalignBestLowPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "bestProduct.jsp";
			break;
			
		case "/alignBestHighPrice.do" :
			headerCategory = "베스트";
			alignCategory = "높은 가격순";
			
			id = (String) session.getAttribute("id");
			
			try {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}catch (Exception e) {
				curPage = 1;
			}

			session.setAttribute("id", id);
			session.setAttribute("curPage", curPage);
			
			
			command = new MCalignBestHighPrice();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			session.setAttribute("cartCount", cartCount);
			session.setAttribute("alignCategory", alignCategory);
			session.setAttribute("headerCategory", headerCategory);
			
			viewPage = "bestProduct.jsp";
			break;

		case "/paging.do" :
			command = new MCpaging();
			command.execute(request, response);
			
			return;
			
			
		// main페이지 카트 클릭
		case "/recipePageCart.do" :
			
			id = (String) session.getAttribute("id");
			int recipeid = Integer.parseInt(request.getParameter("recipeid"));
			
			session.setAttribute("id", id);
			session.setAttribute("recipeid", recipeid);
			
			command = new getCartByRecipe();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			out.print(new Gson().toJson(cartCount));
			out.flush();
			
			return;
			
		// 신제품 페이지 카트 클릭
		case "/newPageCart.do" :
			
			id = (String) session.getAttribute("id");
			productid = Integer.parseInt(request.getParameter("productid"));
			
			session.setAttribute("id", id);
			session.setAttribute("productid", productid);
			
			command = new getCartByProduct();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			out.print(new Gson().toJson(cartCount));
			out.flush();
			
			return;
			
		case "/bestPageCart.do" :
			
			id = (String) session.getAttribute("id");
			productid = Integer.parseInt(request.getParameter("productid"));
			
			session.setAttribute("id", id);
			session.setAttribute("productid", productid);
			
			command = new getCartByProduct();
			command.execute(request, response);
			
			cartCount = (int) session.getAttribute("cartCount");
			
			out.print(new Gson().toJson(cartCount));
			out.flush();
			
			return;

		case "/duplicatedCheck.do":
			command = new MDuplicatedCheck();
			command.execute(request, response);
			return;


		// TODO HTTP Method 구분할 수 있는 구조로 리팩토링 하면 URL에서 행위 제외
		case "/api/cart.do":
			requireSigning(request, response);

			command = new MCartRegistry();
			command.execute(request, response);
			return;

		// 장바구니 page 보여주기.
		case "/cart.do":
			command = new MCartListView();
			command.execute(request, response);
			
			request.setAttribute("router", "cart");
			viewPage = "gwangyeong.jsp";
			break;

		// 장바구니 page에서 item 수량 변경하기.
		case "/cart/amount/update.do":
			// response.setStatus(200);
			// response.setContentType("application/json");
			command = new MCartUpdateAmount();
			command.execute(request, response);
			return;

		case "/cart/amount/increase.do":
			// response.setStatus(200);
			// response.setContentType("application/json");
			command = new MCartUpdateAmount();
			command.execute(request, response);
			return;

		// 장바구니 page에서 item 가격 계산하기.
		case "/api/cart/query.do":
			command = new MCartListViewApi();
			command.execute(request, response);
			return;
				
		// 장바구니 page 테스트를 위한 임시 로그인
		case "/fake/login.do":
			User user = new User("admin", "1234");
			session.setAttribute("loginUser", user);
			out.print("{\"success\": true}");
			out.flush();
			return;
			
		// 장바구니 page에서 item 선택 삭제.
		case "/cart/item/delete.do":
			command = new MCartItemDelete();
			command.execute(request, response);
			return;

		case "/logout.do":
			session.invalidate();
			viewPage = "mainPage.do";

			break;

		// ---------------- 2024.02.13 snr : controller 추가
		// 관리자 제품현황 상세 페이지 이동
		case "/adminProductDetailPage.do":
			session.setAttribute("productidToDetail", request.getParameter("id"));
			viewPage = "adminProductDetail.jsp";
			break;

		// 관리자 제품현황 상세 페이지 조회
		case "/selectAdminProductDetail.do":
			command = new MAdminProductDetail();
			command.execute(request, response);

			ArrayList<AdminProductDto> productDetailList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(productDetailList));
			out.flush();
			return;

		// 관리자 제품현황 수정
		case "/adminUpdateProduct.do":
			command = new MAdminProductUpdate();
			command.execute(request, response);
			int updatePNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(updatePNum));
			out.flush();
			return;

		// 관리자 제품 삭제
		case "/deleteProduct.do":
			command = new MAdminProductDelete();
			command.execute(request, response);
			int deletePNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(deletePNum));
			out.flush();
			return;

		// 관리자 브랜드 조회
		case "/adminBrand.do":
			command = new MAdminBrand();
			command.execute(request, response);

			int brandTotal = (int) request.getAttribute("total");
			int brandLastPage = (int) request.getAttribute("lastPage");
			int brandIndex_no = (int) request.getAttribute("index_no");
			ArrayList<AdminCategoryDto> brandList = (ArrayList) request.getAttribute("list");

			// ajax로 데이터를 한번에 보내기 위해 키-값 형태의 Map 이용.
			Map<String, Object> dataBrand = new HashMap<>();
			dataBrand.put("total", brandTotal);
			dataBrand.put("lastPage", brandLastPage);
			dataBrand.put("index_no", brandIndex_no);
			dataBrand.put("brandList", brandList);

			out.print(new Gson().toJson(dataBrand));
			out.flush();
			return;

		// 관리자 브랜드 등록 페이지 이동
		case "/adminBrandRegister.do":
			viewPage = "adminBrandRegister.jsp";
			break;

		// 관리자 브랜드 등록하기
		case "/insertBrand.do":
			command = new MAdminBrandInsert();
			command.execute(request, response);

			int InsertBNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(InsertBNum));
			out.flush();
			return;

		// 관리자 브랜드 상세페이지 이동
		case "/adminBrandDetailPage.do":
			session.setAttribute("brandid", request.getParameter("id"));
			viewPage = "adminBrandDetail.jsp";
			break;

		// 관리자 상세페이지 조회
		case "/selectAdminBrandDetail.do":
			command = new MAdminBrandDetail();
			command.execute(request, response);

			ArrayList<AdminBrandDto> brandDetailList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(brandDetailList));
			out.flush();
			return;

		// 관리자 브랜드명 수정
		case "/updateBrand.do":
			command = new MAdminBrandUpdate();
			command.execute(request, response);
			int updateBNum = (int) request.getAttribute("num");
			out.print(new Gson().toJson(updateBNum));
			out.flush();
			return;

		// 관리자 매출차트
		case "/showSaleChart.do":
			command = new MAdminSaleChart();
			command.execute(request, response);
			ArrayList<AdminSaleDto> saleList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(saleList));
			out.flush();
			return;

		// 관리자 인기 차트 top5
		case "/showPopular.do":
			command = new MAdminPopularChart();
			command.execute(request, response);
			ArrayList<AdminSaleDto> popList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(popList));
			out.flush();
			return;

		// 관리자 가입 성비 조회
		case "/showGender.do":
			command = new MAdminGenderChart();
			command.execute(request, response);
			ArrayList<AdminSaleDto> genderList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(genderList));
			out.flush();
			return;

		// 관리자 가입 성비 조회
		case "/showUser.do":
			command = new MAdminUserChart();
			command.execute(request, response);
			ArrayList<AdminSaleDto> userList = (ArrayList) request.getAttribute("list");
			out.print(new Gson().toJson(userList));
			out.flush();
			return;
			
		case "/authenticKeyCheck.do":
			command = new MCheckAuthentic();
			command.execute(request, response);
			
			return;

		case "/selectDelivery.do" :
			command = new MAdminDelivery();
			command.execute(request, response);
			ArrayList<AdminGetPackTypeDto> delivery = (ArrayList) request.getAttribute("dname");
			out.print(new Gson().toJson(delivery));
			out.flush();
			return;
		
		//배달방식 제품과 연결	
		case "/insertDelivery.do" :
			command = new MInsertDelivery();
			command.execute(request, response);
			int deliveryResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(deliveryResult));
			out.flush();
			return;
			
		//디비에 이미지 넣기	
		case "/insertImage.do" :
			command = new MInsertImage();
			command.execute(request, response);
			int imageResult = (int) request.getAttribute("result");
			out.print(new Gson().toJson(imageResult));
			out.flush();
			return;

		default:
			break;

		}

		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);

	} // actionDo

} // End
