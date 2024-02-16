<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/signup.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="js/signup.js"></script>
<script src="js/address.js"></script>
<script src="js/signUpCondition.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<form name="signupForm" action="signup.do" method="post">
	<div class="css-pculus e1ovi4141">
		<div class="css-o5dw7d e1ovi4140">회원가입</div>
		<div class="css-mhmtvt e15so55l1">
			<div class="css-rb0i47 e1yyjjij1">
				<span class="css-qq9ke6 e1yyjjij0">*</span> 필수입력사항
			</div>
			<div class="css-y8aj3r eo6ykj40">
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">아이디<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" type="text" required=""
									class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
						<span id="idcheckmessage"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-ufulao e4nu7ef3" type="button" id="idDuplicatedCheck">
							<span class="css-nytqmg e4nu7ef1">중복확인</span>
						</button>
					</div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">비밀번호<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="password" name="password"
									placeholder="비밀번호를 입력해주세요" type="password" autocomplete="off"
									class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
						
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">비밀번호확인<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 한번 더 입력해주세요"
									type="password" autocomplete="off" class="css-u52dqk e1uzxhvi2"
									value="">
							</div>
						</div>
						<span id="passwordcheck"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">이름<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="name" name="name"
									placeholder="이름을 입력해 주세요" type="text" required=""
									class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
						<span id="namemessage"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">이메일<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="email" name="email"
									placeholder="예: SellreMarket@sellre.com" type="text" required=""
									class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
						<span id="emailcheckmessage"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-ufulao e4nu7ef3" type="button" id="emailDuplicatedCheck">
							<span class="css-nytqmg e4nu7ef1">중복확인</span>
						</button>
					</div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<input class="css-1obgjqh e744wfw4" type="hidden"><span
							class="css-qq9ke6 e744wfw0"></span>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="authentication" name="authentication"
									type="text" required="" placeholder="인증번호를 입력하세요"
									class="css-u52dqk e1uzxhvi2" value="">
								<input type="hidden" id="sysAuthentic">
							</div>
						</div>
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-ufulao e4nu7ef3" type="button" id="confirmCheck" onclick="checkAuthentication()">
							<span class="css-nytqmg e4nu7ef1">인증확인</span>
						</button>
					</div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">휴대폰<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-jmalg e1uzxhvi6">
							<div class="css-176lya2 e1uzxhvi3">
								<input data-testid="input-box" id="mobileNumber" name="mobileNumber" placeholder="숫자만 입력해주세요." type="tel"
									required="" class="css-u52dqk e1uzxhvi2" value="" maxlength="11">
							</div>
						</div>
						<span id="phonemessage"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2">
					</div>
				</div>
				<%-- 주소 div row --%>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">주소<span class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
					<div class="css-jmalg e1uzxhvi6">
						<input class="css-u52dqk e1uzxhvi2" type="text" id="postcode" placeholder="우편번호" style="width: 100px;" readonly="readonly">
						<input class="css-u52dqk e1uzxhvi2" type="text" name="address" id="address" placeholder="주소" style="margin-top: 10px;" readonly="readonly">
						<input class="css-u52dqk e1uzxhvi2" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" style="margin-top: 10px;">
					</div>
						<span class="css-vukl2m eq6ygzw0">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-1schgvv e4nu7ef3" type="button" height="44" radius="4" onclick="execDaumPostcode()" style="padding-right: 0px;">
							<span class="css-nytqmgq e4nu7ef1" style="margin-top:5px;">주소 검색</span>
						</button>
					</div>
				</div>
				<%-- 주소 div row --%>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">성별</label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-14wodj6 es1pbny0">
							<label class="css-z9g6s0 et8nqc33" for="gender-man">
								<input data-testid="radio-MALE" id="gender-man" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="MALE">
								<span id="gender-man1" class="css-198i9ca e2sqze61">
									<div class="css-1vic0rk e2sqze60"></div>
								</span>
								<span aria-labelledby="gender-man" class="css-mgd87h et8nqc31">남자</span>
							</label>
							<label class="css-z9g6s0 et8nqc33" for="gender-woman">
								<input data-testid="radio-FEMALE" id="gender-woman" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="FEMALE">
								<span id="gender-woman1" class="css-198i9ca e2sqze61">
								<div class="css-1vic0rk e2sqze60"></div>
								</span>
								<span aria-labelledby="gender-woman" class="css-mgd87h et8nqc31">여자</span>
							</label>
							<label class="css-z9g6s0 et8nqc33" for="gender-none">
								<input data-testid="radio-NONE" id="gender-none" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="NONE" checked="checked">
								<span id="gender-none1" class="css-5xw1m2 e2sqze61">
									<div class="css-1vic0rk e2sqze60"></div>
								</span>
								<span aria-labelledby="gender-none" class="css-mgd87h et8nqc31">선택안함</span>
							</label>
						</div>
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">생년월일</label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-18n8lnw e1ke3ehm1">
							<div class="css-1dkwuq4 e1uzxhvi6">
								<div height="40" class="css-xsmgyi e1uzxhvi3">
									<input data-testid="input-box" id="birthYear" name="birthYear" placeholder="YYYY" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="" maxlength="4">
								</div>
							</div>
							<span class="css-5lnvt6 e1ke3ehm0"></span>
							<div class="css-1dkwuq4 e1uzxhvi6">
								<div height="40" class="css-xsmgyi e1uzxhvi3">
									<input data-testid="input-box"  id="birthMonth" name="birthMonth" placeholder="MM" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="" maxlength="2">
								</div>
							</div>
							<span class="css-5lnvt6 e1ke3ehm0"></span>
							<div class="css-1dkwuq4 e1uzxhvi6">
								<div height="40" class="css-xsmgyi e1uzxhvi3">
									<input data-testid="input-box"  id="birthDay" name="birthDay" placeholder="DD" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="" maxlength="2">
								</div>
							</div>
						</div>
						<span id="birthdatemessage"></span>
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-82a6rk e744wfw3">
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
			</div>
			<div class="css-1eo0fey e1j7jtti0"></div>
			<div class="css-y8aj3r e1k9oeg10">
			<!-- 이용약관동의 -->
				<div class="css-2yzr8b e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">이용약관동의<span class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3" id="checkboxContainer">
					<%-- 1 --%>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3" for="RequiredTermsCondition">
								<input id="RequiredTermsCondition" type="checkbox" class="css-agvwxo e1dcessg2" onclick="clickCheckBox('RequiredTermsCondition')">
								<div class="css-79hxr7 e1dcessg1">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path>
										<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
								</div><span>이용약관 동의</span></label><span class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
							<a class="css-7chi73 e1sjmfnv3" style="margin-top: 3px;" href="header.jsp" target="_blank">약관보기</a>
							<button class="css-7chi73 e1sjmfnv3" style="margin-top: 3px;" onclick="signUpCondition(1)">약관보기</button>
						</div>
					<%-- 2 --%>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3" for="RequiredTermsOfPrivacy">
								<input id="RequiredTermsOfPrivacy" type="checkbox" class="css-agvwxo e1dcessg2" onclick="clickCheckBox('RequiredTermsOfPrivacy')">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
									</div><span>개인정보 수집∙이용 동의</span></label><span class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
							<button class="css-7chi73 e1sjmfnv3" style="margin-top: 3px;" onclick="signUpCondition(2)">약관보기</button>
						</div>
					<%-- 3 --%>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3" for="RequiredSignupAge">
									<input id="RequiredSignupAge" type="checkbox" class="css-agvwxo e1dcessg2" onclick="clickCheckBox('RequiredSignupAge')">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path>
										<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd"stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
									</div>
									<span>본인은 만 14세 이상입니다.</span>
								</label>
								<span class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="css-ud3rkg e1utgeno0">
				<button class="css-18m884r e4nu7ef3" type="button" width="240" height="56" radius="3" onclick='checkInput()'>
					<span class="css-nytqmg e4nu7ef1">가입하기</span>
				</button>
			</div>
		</div>
	</div>
	</div>
	</form>

	<jsp:include page="footer.html" />
</body>
</html>