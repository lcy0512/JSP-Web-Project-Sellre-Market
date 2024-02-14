<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정 - 셀리마켓</title>
</head>
<link rel="stylesheet" href="css/signup.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="js/signup.js"></script>
<script src="js/mypagedetail.js"></script>
<script src="js/address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>
	<jsp:include page="header.jsp" />
	<div class="css-luwwab eug5r8l1">
		<jsp:include page="mypagemenubar.jsp" />
		<div class="css-171zbec eug5r8l0">
			<div class="css-j0lifa ed9qr673" style="border-bottom: none;">
				<div class="css-fhxb3m ed9qr672">
					<h2 class="css-1268zpe ed9qr671">개인정보 수정</h2>
				</div>
			</div>
			<div class="css-1492bdb e1f12ame0">
				<form name="signupForm" action="signup.do" method="post">
					<div class="css-pculus e1ovi4141" style="margin-top: 20px;">
						<div class="css-mhmtvt e15so55l1" style="margin-top: 20px; margin-left: 0px; border-top:solid; border-top-width: 1px;">
							<div class="css-y8aj3r eo6ykj40">
							<div class="css-1pjgd36"></div>
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
													class="css-u52dqk e1uzxhvi2" value="${UserDetail.userid}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<div class="css-1pjgd36 e744wfw6">
									<div class="css-1y8737n e744wfw5">
										<label class="css-1obgjqh e744wfw4">현재 비밀번호</label>
									</div>
									<div class="css-82a6rk e744wfw3">
										<div class="css-jmalg e1uzxhvi6">
											<div class="css-176lya2 e1uzxhvi3">
												<input data-testid="input-box" id="nowpassword" name="nowpassword" placeholder="비밀번호를 입력해주세요" type="password" autocomplete="off" class="css-u52dqk e1uzxhvi2" value="${UserDetail.password}" readonly="readonly">
											</div>
										</div>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 비밀번호 row --%>
								<div class="css-1pjgd36 e744wfw6">
									<div class="css-1y8737n e744wfw5">
										<label class="css-1obgjqh e744wfw4">비밀번호<span
											class="css-qq9ke6 e744wfw0">*</span></label>
									</div>
									<div class="css-82a6rk e744wfw3">
										<div class="css-jmalg e1uzxhvi6">
											<div class="css-176lya2 e1uzxhvi3">
												<input data-testid="input-box" id="password" name="password"
													placeholder="비밀번호를 입력해주세요" type="password"
													autocomplete="off" class="css-u52dqk e1uzxhvi2" value="">
											</div>
										</div>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 비밀번호 row --%>
								<%-- 비밀번호 확인 row --%>
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
													type="password" autocomplete="off"
													class="css-u52dqk e1uzxhvi2" value="">
											</div>
										</div>
										<span id="passwordcheck"></span>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 비밀번호 확인 row --%>
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
													class="css-u52dqk e1uzxhvi2" value="${UserDetail.name}">
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
													placeholder="예: SellreMarket@sellre.com" type="text"
													required="" class="css-u52dqk e1uzxhvi2" value="${UserDetail.email}">
											</div>
										</div>
										<span id="emailcheckmessage"></span>
									</div>
									<div class="css-1w0ksfz e744wfw2">
										<button class="css-ufulao e4nu7ef3" type="button"
											id="emailDuplicatedCheck">
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
													required="" class="css-u52dqk e1uzxhvi2" value="${UserDetail.tel_no}"
													maxlength="11">
											</div>
										</div>
										<span id="phonemessage"></span>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 주소 div row --%>
								<div class="css-1pjgd36 e744wfw6">
									<div class="css-1y8737n e744wfw5">
										<label class="css-1obgjqh e744wfw4">주소<span
											class="css-qq9ke6 e744wfw0">*</span></label>
									</div>
									<div class="css-82a6rk e744wfw3">
										<div class="css-jmalg e1uzxhvi6">
										<input class="css-u52dqk e1uzxhvi2" type="text" id="postcode" placeholder="우편번호" style="width: 100px; display: none;" readonly="readonly">
											<input class="css-u52dqk e1uzxhvi2" type="text" name="address" id="address" placeholder="주소" readonly="readonly" value="${UserDetail.address}">
											<input class="css-u52dqk e1uzxhvi2" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="${UserDetail.detailaddress}" style="margin-top: 10px;">
										</div>
										<span class="css-vukl2m eq6ygzw0">배송지에 따라 상품 정보가 달라질 수
											있습니다.</span>
									</div>
									<div class="css-1w0ksfz e744wfw2">
										<button class="css-1schgvv e4nu7ef3" type="button" height="44"
											radius="4" onclick="execDaumPostcode()"
											style="padding-right: 0px;">
											<span class="css-nytqmgq e4nu7ef1" style="margin-top: 5px;">주소
												검색</span>
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
										<input type="hidden" id="receivedGender" name="receivedGender" value="${UserDetail.gender}">
											<label class="css-z9g6s0 et8nqc33" for="gender-man">
												<input data-testid="radio-MALE" id="gender-man" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="MALE">
												<span id="gender-man1" class="css-198i9ca e2sqze61">
													<div class="css-1vic0rk e2sqze60"></div></span>
												<span aria-labelledby="gender-man" class="css-mgd87h et8nqc31">남자</span>
											</label>
											<label class="css-z9g6s0 et8nqc33" for="gender-woman">
												<input data-testid="radio-FEMALE" id="gender-woman" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="FEMALE">
												<span id="gender-woman1" class="css-198i9ca e2sqze61">
													<div class="css-1vic0rk e2sqze60"></div></span> 
												<span aria-labelledby="gender-woman" class="css-mgd87h et8nqc31">여자</span>
											</label>
											<label class="css-z9g6s0 et8nqc33" for="gender-none">
												<input data-testid="radio-NONE" id="gender-none" name="gender" type="radio" class="css-1pes2r6 et8nqc32" value="NONE">
												<span id="gender-none1" class="css-198i9ca e2sqze61">
													<div class="css-1vic0rk e2sqze60"></div></span>
												<span aria-labelledby="gender-none" class="css-mgd87h et8nqc31">선택안함</span>
											</label>
										</div>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 성별 div row --%>
								<%-- 생년월일 div --%>
								<div class="css-1pjgd36 e744wfw6">
								<input type="hidden" name="birthdate" id="birthdate" value="${UserDetail.birthdate}">
									<div class="css-1y8737n e744wfw5">
										<label class="css-1obgjqh e744wfw4">생년월일</label>
									</div>
									<div class="css-82a6rk e744wfw3">
										<div class="css-18n8lnw e1ke3ehm1">
											<div class="css-1dkwuq4 e1uzxhvi6">
												<div height="40" class="css-xsmgyi e1uzxhvi3">
													<input data-testid="input-box" id="birthYear"
														name="birthYear" placeholder="YYYY" type="text"
														height="40" class="css-151eme7 e1uzxhvi2" value=""
														maxlength="4">
												</div>
											</div>
											<span class="css-5lnvt6 e1ke3ehm0"></span>
											<div class="css-1dkwuq4 e1uzxhvi6">
												<div height="40" class="css-xsmgyi e1uzxhvi3">
													<input data-testid="input-box" id="birthMonth"
														name="birthMonth" placeholder="MM" type="text" height="40"
														class="css-151eme7 e1uzxhvi2" value="" maxlength="2">
												</div>
											</div>
											<span class="css-5lnvt6 e1ke3ehm0"></span>
											<div class="css-1dkwuq4 e1uzxhvi6">
												<div height="40" class="css-xsmgyi e1uzxhvi3">
													<input data-testid="input-box" id="birthDay"
														name="birthDay" placeholder="DD" type="text" height="40"
														class="css-151eme7 e1uzxhvi2" value="" maxlength="2">
												</div>
											</div>
										</div>
										<span id="birthdatemessage"></span>
									</div>
									<div class="css-1w0ksfz e744wfw2"></div>
								</div>
								<%-- 생년월일 div --%>
								<div class="css-1pjgd36 e744wfw6">
									<div class="css-82a6rk e744wfw3">
										<div class="css-1w0ksfz e744wfw2"></div>
									</div>
								</div>
								<div class="css-1eo0fey e1j7jtti0"></div>
								<div class="css-y8aj3r e1k9oeg10">
								</div>
								<div class="css-ud3rkg e1utgeno0">
									<button class="css-18m884r e4nu7ef3" type="button" width="240" id="updatebtn"
										height="56" radius="3"  onclick='deleteuserinfo()' style="margin-right: 60px; width: 200px;">
										<span class="css-nytqmg e4nu7ef1">탈퇴하기</span>
									</button>
									<button class="css-18m884r e4nu7ef3" type="button" width="240" id="updatebtn"
										height="56" radius="3" onclick='checkInput(true)' style="width: 200px;">
										<span class="css-nytqmg e4nu7ef1">수정하기</span>
									</button>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	</form>

	<jsp:include page="footer.html" />
</body>
</html>