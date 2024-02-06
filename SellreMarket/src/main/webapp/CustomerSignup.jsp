<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="stylesheet" href="css/signup.css"/>
<script src="js/signup.js"></script>
<body>
	<jsp:include page="header.jsp" />
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
								<input data-testid="input-box" id="memberId" name="memberId"
									placeholder="아이디를 입력해주세요" type="text" required=""
									class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-ufulao e4nu7ef3" type="button">
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
								<input data-testid="input-box" id="passwordConfirm"
									name="passwordConfirm" placeholder="비밀번호를 한번 더 입력해주세요"
									type="password" autocomplete="off" class="css-u52dqk e1uzxhvi2"
									value="">
							</div>
						</div>
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
					</div>
					<div class="css-1w0ksfz e744wfw2">
						<button class="css-ufulao e4nu7ef3" type="button">
							<span class="css-nytqmg e4nu7ef1">중복확인</span>
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
								<input data-testid="input-box" id="mobileNumber"
									name="mobileNumber" placeholder="숫자만 입력해주세요." type="tel"
									required="" class="css-u52dqk e1uzxhvi2" value="">
							</div>
						</div>
					</div>
					<div class="css-1w0ksfz e744wfw2">
					</div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">주소<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<button class="css-1schgvv e4nu7ef3" type="button" height="44"
							radius="4">
							<img src="../image/searchImage.png" alt="" class="css-1m3kac1 e4nu7ef0">
							<span class="css-nytqmgq e4nu7ef1">주소 검색</span>
						</button>
						<span class="css-vukl2m eq6ygzw0">배송지에 따라 상품 정보가 달라질 수
							있습니다.</span>
					</div>
					<div class="css-1w0ksfz e744wfw2"></div>
				</div>
				<div class="css-1pjgd36 e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">성별</label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-14wodj6 es1pbny0">
							<label class="css-z9g6s0 et8nqc33" for="gender-man">
								<input data-testid="radio-MALE" id="gender-man" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="MALE">
								<span class="css-198i9ca e2sqze61">
									<div class="css-1dahn5m e2sqze60"></div>
								</span>
								<span aria-labelledby="gender-man" class="css-mgd87h et8nqc31">남자</span>
							</label>
							<label class="css-z9g6s0 et8nqc33" for="gender-woman">
								<input data-testid="radio-FEMALE" id="gender-woman" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="FEMALE">
								<span class="css-198i9ca e2sqze61">
								<div class="css-1dahn5m e2sqze60"></div>
								</span>
								<span aria-labelledby="gender-woman" class="css-mgd87h et8nqc31">여자</span>
							</label>
							<label class="css-z9g6s0 et8nqc33" for="gender-none">
								<input data-testid="radio-NONE" id="gender-none" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="NONE" checked="">
								<span class="css-5xw1m2 e2sqze61">
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
									<input data-testid="input-box" name="birthYear" placeholder="YYYY" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="">
								</div>
							</div>
							<span class="css-5lnvt6 e1ke3ehm0"></span>
							<div class="css-1dkwuq4 e1uzxhvi6">
								<div height="40" class="css-xsmgyi e1uzxhvi3">
									<input data-testid="input-box" name="birthMonth" placeholder="MM" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="">
								</div>
							</div>
							<span class="css-5lnvt6 e1ke3ehm0"></span>
							<div class="css-1dkwuq4 e1uzxhvi6">
								<div height="40" class="css-xsmgyi e1uzxhvi3">
									<input data-testid="input-box" name="birthDay" placeholder="DD" type="text" height="40" class="css-151eme7 e1uzxhvi2" value="">
								</div>
							</div>
						</div>
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
				<div class="css-2yzr8b e744wfw6">
					<div class="css-1y8737n e744wfw5">
						<label class="css-1obgjqh e744wfw4">이용약관동의<span
							class="css-qq9ke6 e744wfw0">*</span></label>
					</div>
					<div class="css-82a6rk e744wfw3">
						<div class="css-ov2xfu e1sjmfnv7">
							<label class="css-msja7w e1dcessg3" for="TermsAgreeAll"><input
								id="TermsAgreeAll" type="checkbox" class="css-agvwxo e1dcessg2">
								<div class="css-79hxr7 e1dcessg1">
									<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="#fff"></path>
										<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
								</div><span>전체 동의합니다.</span></label>
							<p class="css-nygcgj e1sjmfnv6">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
						</div>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3" for="RequiredTermsCondition">
								<input id="RequiredTermsCondition" type="checkbox" class="css-agvwxo e1dcessg2">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
												stroke="#ddd" fill="#fff"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd"
												stroke-width="1.5" stroke-linecap="round"
												stroke-linejoin="round"></path></svg>
									</div> <span>이용약관 동의</span></label><span class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
							<a class="css-7chi73 e1sjmfnv3">약관보기</a>
						</div>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3"
									for="RequiredTermsOfPrivacy"><input
									id="RequiredTermsOfPrivacy" type="checkbox"
									class="css-agvwxo e1dcessg2">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<path
												d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
												stroke="#ddd" fill="#fff"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd"
												stroke-width="1.5" stroke-linecap="round"
												stroke-linejoin="round"></path></svg>
									</div> <span>개인정보 수집∙이용 동의</span></label><span class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
							<a class="css-7chi73 e1sjmfnv3">약관보기</a>
						</div>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3"
									for="OptionalTermsOfPrivacy"><input
									id="OptionalTermsOfPrivacy" type="checkbox"
									class="css-agvwxo e1dcessg2">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<path
												d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
												stroke="#ddd" fill="#fff"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd"
												stroke-width="1.5" stroke-linecap="round"
												stroke-linejoin="round"></path></svg>
									</div> <span>개인정보 수집∙이용 동의</span></label><span class="css-64z8en e1sjmfnv5">(선택)</span>
							</div>
							<a class="css-7chi73 e1sjmfnv3">약관보기</a>
						</div>
						<div class="css-ov2xfu e1sjmfnv7">
							<div class="css-s5xdrg e1sjmfnv4">
								<label class="css-1mjkje9 e1dcessg3" for="RequiredSignupAge"><input
									id="RequiredSignupAge" type="checkbox"
									class="css-agvwxo e1dcessg2">
									<div class="css-79hxr7 e1dcessg1">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg">
											<path
												d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z"
												stroke="#ddd" fill="#fff"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd"
												stroke-width="1.5" stroke-linecap="round"
												stroke-linejoin="round"></path></svg>
									</div> <span>본인은 만 14세 이상입니다.</span></label><span
									class="css-64z8en e1sjmfnv5">(필수)</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="css-ud3rkg e1utgeno0">
				<button class="css-18m884r e4nu7ef3" type="submit" width="240" height="56" radius="3">
					<span class="css-nytqmg e4nu7ef1">가입하기</span>
				</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.html" />
</body>
</html>