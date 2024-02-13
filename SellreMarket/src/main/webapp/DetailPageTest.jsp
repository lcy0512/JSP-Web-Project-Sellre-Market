<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 뷰포트 설정: 화면 폭에 맞춰 초기 확대, 최대 확대는 1배로 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, viewport-fit=cover">
    
    <!-- 언어 설정 -->
    <meta charset="UTF-8">
    
    <!-- 제목 설정 -->
    <title>레시피 상세페이지</title>
    
    <!-- 파비콘 설정 -->
    <link rel="shortcut icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
    <link rel="icon" href="http://localhost:8080/SellreMarket/image/logo.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="http://localhost:8080/SellreMarket/image/logo.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="http://localhost:8080/SellreMarket/image/logo.png" />
    
    <!-- 외부 CSS -->
    <link rel="preload" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" as="style"/>
    <link rel="stylesheet" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" data-n-g=""/>
    <link rel="stylesheet" href="css/detailPage.css" />

    <!-- 내부 CSS -->
    <style>
        .dropdown-container {
            border: 1px solid #ccc; /* 테두리 스타일 설정 */
            border-radius: 4px; /* 테두리 모양을 더 둥글게 만듭니다. */
            overflow: hidden; /* 내용이 테두리를 넘어가지 않도록 설정합니다. */
        }
    </style>
</head>
<body>
    <!-- 헤더 jsp 파일 include -->
    <jsp:include page="header.jsp" />
    
    <!-- 상품 선택 영역 -->
    <div class="css-n48rgu ex9g78v0">
        <div class="css-16c0d81 e1brqtzw0">
            <main id="product-atf" class="css-1eoy87d e17iylht5">
                <div class="css-5v50l3 e17iylht4"></div>
                <section class="css-1ua1wyk e17iylht3">
                    <!-- 상품 선택을 위한 컨테이너 -->
                    <div class="css-1bp09d0 e17iylht1">
                        <!-- 상품 선택을 위한 컨테이너 -->
                        <div class="css-2lvxh7 e1qy0s5w0">
                            <!-- 상품 리스트 항목 -->
                            <li class="css-e6zlnr epzddad2">
                                <!-- 상품 선택 제목 -->
                                <dt class="css-159o541 epzddad1">상품 선택</dt>
                                <!-- 상품 선택 옵션 -->
                                <dd class="css-1k8t52o epzddad0">
                                    <!-- 드롭다운 메뉴 -->
                                    <div class="dropdown-container">
                                        <!-- 드롭다운 선택 영역 -->
                                        <div class="MuiFormControl-root css-tzsjye">
                                            <!-- 드롭다운 선택 영역 -->
                                            <div variant="outlined" class="MuiOutlinedInput-root MuiInputBase-root MuiInputBase-colorPrimary MuiInputBase-formControl jss1 css-xald09" onclick="toggleDropdown()">
                                                <!-- 선택 텍스트 -->
                                                <div id="dropdownText" tabindex="0" role="button" aria-expanded="false" aria-haspopup="listbox" aria-label="Without label" class="MuiSelect-select MuiSelect-outlined MuiOutlinedInput-input MuiInputBase-input css-qiwgdb">상품을 선택해주세요.</div>
                                                <!-- 숨겨진 네이티브 입력 -->
                                                <input aria-hidden="true" tabindex="-1" class="MuiSelect-nativeInput css-1k3x8v3" value="">
                                                <!-- 드롭다운 아이콘 -->
                                                <svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium MuiSelect-icon MuiSelect-iconOutlined css-1636szt" focusable="false" aria-hidden="true" viewBox="0 0 24 24" data-testid="ArrowDropDownIcon">
                                                    <path d="M7 10l5 5 5-5z"></path>
                                                </svg>
                                                <!-- 아웃라인 스타일링 -->
                                                <fieldset aria-hidden="true" class="MuiOutlinedInput-notchedOutline css-igs3ac">
                                                    <legend class="css-nnbavb">
                                                        <span class="notranslate">​</span>
                                                    </legend>
                                                </fieldset>
                                            </div>
											<!-- 드롭다운 옵션 목록 -->
											<div id="dropdownOptions" class="dropdown-options" style="display: none;">
											    <!-- 각 옵션에 클릭 이벤트 추가 -->
											    <div class="option" onclick="selectOption('상품을 선택해주세요')"></div>
											    <%-- pnameList를 가져와서 각각의 상품 이름으로 옵션을 생성 --%>
											    <%
											        List<String> pnameList = (List<String>)request.getAttribute("pnameList");
											        if (pnameList != null) {
											            for (String pname : pnameList) {
											    %>
											                <div class="option" onclick="selectOption('<%= pname %>')"><%= pname %></div>
											    <%
											            }
											        }
											    %>
											</div>
                                        <!-- 장바구니 옵션 -->
                                        <div id="cartOptions" class="css-j9a02z e1aw4qzr1" style="display: none;"></div>
                                    </div>
                                </dd>
                            </li>
                        </div>
                    </div>
                </section>        
                <script>
                    // 페이지 로드 시 자동으로 실행되는 함수
                    window.onload = function() {
                        // 시작할 때 상품을 선택해주세요 옵션 선택
                        selectOption('상품을 선택해주세요');
                    };
            
                    // 드롭다운을 토글하는 함수
                    function toggleDropdown() {
                        // "dropdownOptions" 요소를 가져옴
                        var dropdownOptions = document.getElementById("dropdownOptions");
                        // 만약 "dropdownOptions" 요소의 표시 속성이 "none" 이거나 비어있다면
                        if (dropdownOptions.style.display === "none" || dropdownOptions.style.display === "") {
                            // "dropdownOptions" 요소의 표시 속성을 "block" 으로 설정
                            dropdownOptions.style.display = "block";
                        } else {
                            // 그렇지 않으면, "dropdownOptions" 요소의 표시 속성을 "none" 으로 설정
                            dropdownOptions.style.display = "none";
                        }
                    }
            
                    // 옵션 선택 시 실행되는 함수
                    function selectOption(option) {
					    var dropdownText = document.getElementById("dropdownText");
					    var dropdownOptions = document.getElementById("dropdownOptions");
					    var cartOptions = document.getElementById("cartOptions");
					
					    // 선택된 옵션이 "상품을 선택해주세요"가 아닌 경우에만 선택 텍스트를 변경
					    if (option !== "상품을 선택해주세요") {
					        // 선택된 옵션을 드롭다운 버튼에 표시
					        dropdownText.innerText = option;
					
					        // 이미 선택된 상품에 대한 장바구니 옵션이 존재하는지 확인
					        var existingCartOption = document.getElementById(option + "-cart-option");
					        if (!existingCartOption) {
					            // 선택된 상품에 대한 장바구니 옵션이 존재하지 않는 경우 생성
					            var newCartOption = document.createElement("div");
					            newCartOption.id = option + "-cart-option";
					            newCartOption.innerHTML = `
					                <!-- 장바구니 옵션 항목 -->
					                <div class="cart-option-item css-1cb5lnc e1bjklo18">
					                    <!-- 옵션 항목 내용 -->
					                    <div class="css-1qdyvok e1bjklo16">
					                        <!-- 아이콘 표시 부분 -->
					                        <span class="css-1yojl0t e1bjklo14">${option}</span>
					                        <!-- 삭제 버튼 -->
					                        <button class="css-rrel8y e1ad0u7r0" onclick="deleteCartItem('${option}')">
					                            <!-- 삭제 버튼 아이콘 -->
					                            <svg class="MuiSvgIcon-root MuiSvgIcon-fontSizeSmall" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
					                                <path fill="none" d="M0 0h24v24H0z"></path>
					                                <path d="M19 6h-4.5l-1-1h-5l-1 1H5v2h14V6zM8 18v-8h2v8H8zm6 0v-8h2v8h-2z"></path>
					                            </svg>
					                        </button>
					                    </div>
					                    <!-- 수량 조절 부분 -->
					                    <div class="css-tk6lxo e1bjklo15">
					                        <div class="css-nx0orh e1cqr3m40">
					                            <!-- 수량 감소 버튼 -->
					                            <button type="button" aria-label="수량내리기" class="css-1e90glc e1hx75jb0" onclick="decreaseQuantity('${option}')">-</button>
					                            <!-- 수량 표시 -->
					                            <div class="count css-6m57y0 e1cqr3m41" id="${option}-quantity">1</div>
					                            <!-- 수량 증가 버튼 -->
					                            <button type="button" aria-label="수량올리기" class="css-18y6jr4 e1hx75jb0" onclick="increaseQuantity('${option}')">+</button>
					                        </div>
					                        <!-- 가격 정보 부분 -->
					                        <div class="css-1jzvrpg e1bjklo12">
					                            <!-- 원래 가격 -->
					                            <span class="css-fburr9 e1bjklo11">16,000원</span>
					                            <!-- 할인 가격 -->
					                            <span class="css-gqkxk8 e1bjklo10">11,900원</span>
					                        </div>
					                    </div>
					                </div>
					            `;
					
					            cartOptions.appendChild(newCartOption);
					        }
					        cartOptions.style.display = "block";
					    } else {
					        // 선택된 옵션이 "상품을 선택해주세요"인 경우, 선택 텍스트를 변경하지 않고 장바구니 옵션을 숨김
					        dropdownText.innerText = option;
					        cartOptions.style.display = "none";
					    }
					
					    // 드롭다운 옵션을 숨김
					    dropdownOptions.style.display = "none";
					}
            
                    // 장바구니 옵션 삭제하는 함수
                    function deleteCartItem(option) {
                        var cartOption = document.getElementById(option + "-cart-option");
                        cartOption.parentNode.removeChild(cartOption);
            
                        // 장바구니 옵션이 모두 삭제되면 다시 "상품을 선택해주세요" 옵션으로 변경
                        var cartOptions = document.getElementById("cartOptions");
                        if (cartOptions.children.length === 0) {
                            selectOption('상품을 선택해주세요');
                        }
                    }
                    
                    // 수량을 증가시키는 함수
                    function increaseQuantity(option) {
                        var quantityElement = document.getElementById(`${option}-quantity`);
                        var quantity = parseInt(quantityElement.textContent);
                        quantityElement.textContent = quantity + 1;
                    }
            
                    // 수량을 감소시키는 함수
                    function decreaseQuantity(option) {
                        var quantityElement = document.getElementById(`${option}-quantity`);
                        var quantity = parseInt(quantityElement.textContent);
                        if (quantity > 1) {
                            quantityElement.textContent = quantity - 1;
                        }
                    }
                </script>
            </main>
        </div>
    </div>
    <!-- 푸터 html 파일 include -->
    <jsp:include page="footer.html" flush="false" />
</body>
</html>