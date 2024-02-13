<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
html {
	line-height: 1.15;
}

*, :after, :before, legend, td, th {
	padding: 0;
}

*, :after, :before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
}

canvas, img, video {
	max-width: 100%;
}

[type="submit"] {
	border-radius: 0;
}

img, legend {
	border: 0;
	vertical-align: top;
}

html {
	height: 100%;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}

body {
	height: 100%;
	margin: 0;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: white;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, menu, nav, section, summary {
	display: block;
}

audio, canvas, progress, video {
	display: inline-block;
	vertical-align: baseline;
}

audio:not([controls]) {
	display: none;
	height: 0;
}

[hidden], template {
	display: none;
}

a {
	background-color: transparent;
	text-decoration: none;
	color: inherit;
}

a:active, a:hover {
	outline: 0;
}

abbr[title] {
	border-bottom: 1px dotted;
}

b, optgroup, strong {
	font-weight: 700;
}

mark {
	background: #ff0;
	color: #000;
}

sub, sup {
	font-size: 75%;
	line-height: 0;
	position: relative;
	vertical-align: baseline;
}

sup {
	top: -0.5em;
}

sub {
	bottom: -0.25em;
}

svg:not(:root) {
	overflow: hidden;
}

figure {
	margin: 0;
}

hr {
	-moz-box-sizing: content-box;
	box-sizing: content-box;
	height: 0;
}

pre, textarea {
	overflow: auto;
	vertical-align: top;
}

code, kbd, pre, samp {
	font-family: monospace, monospace;
	font-size: 1em;
}

button, input, optgroup, select, textarea {
	color: inherit;
	font: inherit;
	margin: 0;
}

button {
	overflow: visible;
	background-color: transparent;
	border: none;
}

button, select {
	text-transform: none;
}

button, input[type="button"], input[type="reset"], input[type="submit"]
	{
	-webkit-appearance: button;
	cursor: pointer;
}

button[disabled], input[disabled] {
	cursor: default;
}

button::-moz-focus-inner, input::-moz-focus-inner {
	border: 0;
	padding: 0;
}

input[type="checkbox"], input[type="radio"] {
	box-sizing: border-box;
	padding: 0;
}

input[type="number"]::-webkit-inner-spin-button, input[type="number"]::-webkit-outer-spin-button
	{
	height: auto;
}

input[type="search"]::-webkit-search-cancel-button, input[type="search"]::-webkit-search-decoration
	{
	-webkit-appearance: none;
}

fieldset {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

ol, ul {
	list-style-type: none;
}

body, button, input, select, textarea {
	font-size: 14px;
	color: #333;
}

button {
	border-radius: 0;
}

.wrapper {
	padding: 30px;
	font-size: 14px;
	line-height: 19px;
	letter-spacing: -0.5px;
	color: #666;
}

h1 {
	display: block;
	font-size: 20px;
	font-weight: 500;
	line-height: 1.25;
	letter-spacing: -0.5px;
	color: #333;
}

.tit_main {
	display: block;
	padding-top: 16px;
	padding-bottom: 8px;
	font-size: 16px;
	font-weight: 500;
	line-height: 21px;
	color: #333;
	font-weight: 500;
}

.tit_sub {
	display: block;
	font-weight: normal;
}

.box_tbl table {
	width: 100%;
	table-layout: fixed;
}

.box_tbl th {
	padding: 10px 5px;
	background-color: #f4f4f4;
	border: 1px solid #ccc;
	text-align: center;
}

.box_tbl thead th {
	border-bottom: 0;
	font-size: 14px;
}

.box_tbl thead th.emph {
	text-decoration: underline;
}

.box_tbl td {
	padding: 5px;
	border: 1px solid #ccc;
	text-align: center;
	vertical-align: middle;
	font-size: 12px;
	line-height: 19px;
}

.box_tbl td.emph {
	font-weight: 600;
	font-size: 15px;
	text-decoration: underline;
}

.tbl_desc {
	padding: 0 5px;
	color: #999;
}

.txt_service {
	padding: 20px 5px 24px;
	font-size: 14px;
	color: #999;
	line-height: 20px;
}

.terms_view {
	margin-top: 20px;
	font-size: 14px;
	line-height: 20px;
}

.terms_view .tit_main {
	font-size: 16px;
}

.terms_view .tit_sub {
	display: block;
	padding: 20px 0 10px;
}

.terms_view .normal, .terms_view:last-child .tit_sub {
	font-weight: 400;
}

.terms_view:last-child .tit_sub .emph {
	font-weight: 700;
}

.screen_out {
	display: block;
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	
@font-face {
	font-family: 'SCoreDream';
	font-weight: 200;
	font-style: normal;
	src:
		url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream1.woff2)
		format('woff2'),
		url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream1.woff)
		format('woff');
	font-display: swap;
}

@font-face {
	font-family: 'SCoreDream';
	font-weight: 300;
	font-style: normal;
	src:
		url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff2)
		format('woff2'),
		url(https://cdn.jsdelivr.net/gh/webfontworld/SCoreDream/SCoreDream3.woff)
		format('woff');
	font-display: swap;
}

* {
	font-family: 'SCoreDream';
}
}
</style>
<meta charset="UTF-8">
<title>개인정보 수집 이용 동의</title>
</head>
<body>
	<div
		class="MuiPaper-root MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiDialog-paperFullWidth MuiPaper-elevation24 MuiPaper-rounded"
		role="dialog">
		<div class="MuiDialogContent-root css-1qtcb7g">
			<div class="css-18jk04h">

				<div class="wrapper">
					<h1>개인정보 수집·이용 동의(필수)</h1>
					<br><br>	
					<div class="scroll_wrapper box_tbl">
						<table>
							<caption class="screen_out">개인정보 수집·이용 동의 (필수)</caption>
							<colgroup>
								<col width="50%">
								<col width="25%">
								<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th class="tit1" scope="row">수집 목적</th>
									<th class="tit2" scope="row">수집 항목</th>
									<th class="tit3" scope="row">보유 기간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>회원 가입의사 확인, 이용자 식별 및 본인여부, 회원자격 유지·관리, 계약 이행 및 약관변경
										고지를 위한 연락, 본인의사 확인 및 민원 처리, 부정이용 방지, 비인가 사용방지, 서비스 제공 및 계약의
										이행, 서비스 이용 및 상담, 문의, 후기를 위한 원활한 의사소통 경로 확보, 맞춤형 서비스 제공, 거점 기반
										서비스 제공</td>
									<td>이름, 아이디, 비밀번호, 휴대폰번호, 이메일, <strong>주소*</strong></td>
									<td class="emph">회원 탈퇴 <br>즉시 파기 <br>
									<br>부정이용 방지를 위하여 3개월 동안 보관 (아이디, 휴대폰 번호) 후 파기
									</td>
								</tr>
								<tr>
									<td>서비스방문 및 이용기록 분석, 부정이용 방지를 위한 기록 관리, 앱 서비스 이용자 식별, 맞춤형
										서비스 제공</td>
									<td>서비스 이용 과정 중 자동 수집 :<br>
									<br> 서비스 이용기록, 방문기록, 불량 이용기록, IP주소, 쿠키, MAC주소, 모바일 기기정보(앱
										버전, OS 버전, Device ID), ADID/IDFA(광고식별자)
									</td>
									<td class="emph">회원 탈퇴 즉시 또는 이용 목적 달성 즉시 파기</td>
								</tr>
							</tbody>
						</table>
						<p class="txt_service">
							※ 단, 회원 탈퇴와 별개로 분쟁 조정, 고객문의 대응 및 법령 준수 이력 증빙을 위하여 이메일, 문자, 알림톡
							발송이력은 발송일로부터 6개월 보관(이름, 아이디, 휴대폰 번호, 이메일) 후 파기합니다. <br>
							<br> ※ APPLE 계정을 통해 회원가입 할 경우 *에 해당하는 정보는 추후 서비스 이용과정에서 수집 및
							이용됩니다. <br>
							<br> ※ 서비스 제공을 위해서 필요한 최소한의 개인정보입니다. 동의를 해 주셔야 서비스를 이용하실 수
							있으며, 동의하지 않으실 경우 서비스에 제한이 있을 수 있습니다.
						</p>
					</div>
				</div>


			</div>
		</div>
		<div
			class="MuiDialogActions-root css-156dd0p MuiDialogActions-spacing" align="center">
			<button class="css-738xq4 e4nu7ef3" type="button" height="56"
				radius="0" style="text-align: center;" onclick="window.close()">
				<span class="css-nytqmg e4nu7ef1" style="padding-bottom: 12px;"> 확인 </span>
			</button>
		</div>
	</div>
</body>
</html>