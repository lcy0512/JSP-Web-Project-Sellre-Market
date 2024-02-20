<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>결제 - 셀리</title>
<link rel="stylesheet" href="css/purchaseProduct.css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, viewport-fit=cover">
<meta name="keywords" content="다이어트, 식단, 닭가슴살, 요리, 치아바타, 레시피, 상차림, 다이어트음식, 이유식, 건강이유식, 뷰티, 화장품">
<meta property="og:type" content="website"><meta property="og:site_name" content="컬리 - 마켓컬리/뷰티컬리">
<meta property="og:image" content="https://res.kurly.com/images/marketkurly/logo/logo_sns_marketkurly.jpg">
<meta property="twitter:card" content="summary">
<meta property="twitter:image" content="https://res.kurly.com/images/marketkurly/logo/logo_sns_marketkurly.jpg"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, viewport-fit=cover"><meta name="description" content="Better Life for All. 건강한 식재료부터 믿을 수 있는 뷰티, 라이프스타일 상품까지. 나와 내 가족이 사고 싶은 상품을 판매합니다. 내일 아침 문 앞에서 만나요!"><meta property="og:title" content="컬리 - 마켓컬리/뷰티컬리"><meta property="og:description" content="Better Life for All. 건강한 식재료부터 믿을 수 있는 뷰티, 라이프스타일 상품까지. 나와 내 가족이 사고 싶은 상품을 판매합니다. 내일 아침 문 앞에서 만나요!"><meta property="twitter:title" content="컬리 - 마켓컬리/뷰티컬리"><meta property="twitter:description" content="Better Life for All. 건강한 식재료부터 믿을 수 있는 뷰티, 라이프스타일 상품까지. 나와 내 가족이 사고 싶은 상품을 판매합니다. 내일 아침 문 앞에서 만나요!"><meta property="og:url" content="https://www.kurly.com/order/checkout"><meta property="twitter:url" content="https://www.kurly.com/order/checkout"><link rel="canonical" href="https://www.kurly.com/order/checkout"><meta name="next-head-count" content="17"><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="application-name" content="컬리"><meta name="referrer" content="no-referrer-when-downgrade"><meta name="format-detection" content="telephone=no"><link rel="shortcut icon" href="https://res.kurly.com/favicon.ico"><link rel="icon" href="https://res.kurly.com/favicon.ico"><link rel="icon" type="image/png" sizes="16x16" href="https://res.kurly.com/icons/favicon-16x16.png"><link rel="icon" type="image/png" sizes="32x32" href="https://res.kurly.com/icons/favicon-32x32.png"><link rel="apple-touch-icon" sizes="128x128" href="https://res.kurly.com/icons/favicon-128x128.png"><link rel="apple-touch-icon" sizes="144x144" href="https://res.kurly.com/icons/favicon-144x144.png"><link rel="apple-touch-icon" sizes="152x152" href="https://res.kurly.com/icons/favicon-152x152.png"><link rel="apple-touch-icon" sizes="167x167" href="https://res.kurly.com/icons/favicon-167x167.png"><link rel="apple-touch-icon" sizes="180x180" href="https://res.kurly.com/icons/favicon-180x180.png"><link rel="apple-touch-icon" sizes="192x192" href="https://res.kurly.com/icons/favicon-192x192.png"><link rel="apple-touch-startup-image" media="(device-width: 320px) and (device-height: 568px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/iphone5_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 375px) and (device-height: 667px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/iphone6_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 621px) and (device-height: 1104px) and (-webkit-device-pixel-ratio: 3)" href="https://res.kurly.com/images/splashs/iphoneplus_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 375px) and (device-height: 812px) and (-webkit-device-pixel-ratio: 3)" href="https://res.kurly.com/images/splashs/iphonex_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/iphonexr_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 3)" href="https://res.kurly.com/images/splashs/iphonexsmax_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 768px) and (device-height: 1024px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/ipad_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 834px) and (device-height: 1112px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/ipadpro1_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 834px) and (device-height: 1194px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/ipadpro3_splash.png"><link rel="apple-touch-startup-image" media="(device-width: 1024px) and (device-height: 1366px) and (-webkit-device-pixel-ratio: 2)" href="https://res.kurly.com/images/splashs/ipadpro2_splash.png"><meta name="mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-capable" content="yes"><meta name="apple-mobile-web-app-title" content="컬리"><meta name="msapplication-TileColor" content="#ffffff"><meta name="msapplication-tap-highlight" content="no"><link rel="manifest" href="/manifest.json"><link rel="preload" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" as="style"><link rel="stylesheet" href="https://res.kurly.com/_next/static/css/d59287ec5b86dc49.css" data-n-g=""><noscript data-n-css=""></noscript><script defer="" nomodule="" src="https://res.kurly.com/_next/static/chunks/polyfills-5cd94c89d3acac5f.js"></script><script src="https://res.kurly.com/_next/static/chunks/webpack-63a90d86fad16c90.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/framework-f8115f7fae64930e.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/main-849da2e2e3898e8b.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/pages/_app-cf1d51abb75e6b26.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/49089-9b005c12d23d9836.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/78359-54f29aae1d7b3216.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/59192-23c01ad8f182b115.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/65241-d0f8221752e92c4e.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/46353-05e26a558d1a14bd.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/68455-4e7fac1251dff4f9.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/25675-77b2c4f366a45891.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/56269-42c32452ccee5939.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/66261-8613f356f0226ebe.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/85665-1f7bafa1b8737b98.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/23335-d0507122b83dfd9e.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/96230-491a1734525f3fb4.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/51855-466e9f428c8a41e2.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/79716-f0b472de648ad354.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/72873-5b6bd1e3e0a79a70.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/73207-6ea084cfc421dd51.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/82607-e661fca28bb6f448.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/81694-230eaaa0a02e2612.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/85418-40f597f2685c70da.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/89571-a7cc7ed35f344089.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/59812-abd8e2f0d977eef7.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/51087-de5f388174ab1ce2.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/4895-743dd2ef61324a78.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/27480-c264fa9bbcf9cccb.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/85371-b44cdcd9e74bcb33.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/95202-6cb5ef829d2ce41e.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/98826-6427e66eae1fc157.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/69890-c89d7f9ec33230c9.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/41756-ca3c7493a2a8625b.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/74753-3abc33d5dbe93eb9.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/87629-452813d25f3cc926.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/72223-95cae6777d66f2dc.js" defer=""></script><script src="https://res.kurly.com/_next/static/chunks/pages/main-5ffe9f4cace1f4ee.js" defer=""></script><script src="https://res.kurly.com/_next/static/Lq9-BW28oMsoeWzAsDCDR/_buildManifest.js" defer=""></script><script src="https://res.kurly.com/_next/static/Lq9-BW28oMsoeWzAsDCDR/_ssgManifest.js" defer=""></script><script src="https://res.kurly.com/_next/static/Lq9-BW28oMsoeWzAsDCDR/_middlewareManifest.js" defer=""></script><style>.swal2-popup.swal2-toast{flex-direction:column;align-items:stretch;width:auto;padding:1.25em;overflow-y:hidden;background:#fff;box-shadow:0 0 .625em #d9d9d9}.swal2-popup.swal2-toast .swal2-header{flex-direction:row;padding:0}.swal2-popup.swal2-toast .swal2-title{flex-grow:1;justify-content:flex-start;margin:0 .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-loading{justify-content:center}.swal2-popup.swal2-toast .swal2-input{height:2em;margin:.3125em auto;font-size:1em}.swal2-popup.swal2-toast .swal2-validation-message{font-size:1em}.swal2-popup.swal2-toast .swal2-footer{margin:.5em 0 0;padding:.5em 0 0;font-size:.8em}.swal2-popup.swal2-toast .swal2-close{position:static;width:.8em;height:.8em;line-height:.8}.swal2-popup.swal2-toast .swal2-content{justify-content:flex-start;margin:0 .625em;padding:0;font-size:1em;text-align:initial}.swal2-popup.swal2-toast .swal2-html-container{padding:.625em 0 0}.swal2-popup.swal2-toast .swal2-html-container:empty{padding:0}.swal2-popup.swal2-toast .swal2-icon{width:2em;min-width:2em;height:2em;margin:0 .5em 0 0}.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:1.8em;font-weight:700}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{font-size:.25em}}.swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line]{top:.875em;width:1.375em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:.3125em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:.3125em}.swal2-popup.swal2-toast .swal2-actions{flex:1;flex-basis:auto!important;align-self:stretch;width:auto;height:2.2em;height:auto;margin:0 .3125em;margin-top:.3125em;padding:0}.swal2-popup.swal2-toast .swal2-styled{margin:.125em .3125em;padding:.3125em .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-styled:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(100,150,200,.5)}.swal2-popup.swal2-toast .swal2-success{border-color:#a5dc86}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line]{position:absolute;width:1.6em;height:3em;transform:rotate(45deg);border-radius:50%}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.8em;left:-.5em;transform:rotate(-45deg);transform-origin:2em 2em;border-radius:4em 0 0 4em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.25em;left:.9375em;transform-origin:0 1.5em;border-radius:0 4em 4em 0}.swal2-popup.swal2-toast .swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-success .swal2-success-fix{top:0;left:.4375em;width:.4375em;height:2.6875em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line]{height:.3125em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=tip]{top:1.125em;left:.1875em;width:.75em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=long]{top:.9375em;right:.1875em;width:1.375em}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-toast-animate-success-line-tip .75s;animation:swal2-toast-animate-success-line-tip .75s}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-toast-animate-success-line-long .75s;animation:swal2-toast-animate-success-line-long .75s}.swal2-popup.swal2-toast.swal2-show{-webkit-animation:swal2-toast-show .5s;animation:swal2-toast-show .5s}.swal2-popup.swal2-toast.swal2-hide{-webkit-animation:swal2-toast-hide .1s forwards;animation:swal2-toast-hide .1s forwards}.swal2-container{display:flex;position:fixed;z-index:1060;top:0;right:0;bottom:0;left:0;flex-direction:row;align-items:center;justify-content:center;padding:.625em;overflow-x:hidden;transition:background-color .1s;-webkit-overflow-scrolling:touch}.swal2-container.swal2-backdrop-show,.swal2-container.swal2-noanimation{background:rgba(0,0,0,.4)}.swal2-container.swal2-backdrop-hide{background:0 0!important}.swal2-container.swal2-top{align-items:flex-start}.swal2-container.swal2-top-left,.swal2-container.swal2-top-start{align-items:flex-start;justify-content:flex-start}.swal2-container.swal2-top-end,.swal2-container.swal2-top-right{align-items:flex-start;justify-content:flex-end}.swal2-container.swal2-center{align-items:center}.swal2-container.swal2-center-left,.swal2-container.swal2-center-start{align-items:center;justify-content:flex-start}.swal2-container.swal2-center-end,.swal2-container.swal2-center-right{align-items:center;justify-content:flex-end}.swal2-container.swal2-bottom{align-items:flex-end}.swal2-container.swal2-bottom-left,.swal2-container.swal2-bottom-start{align-items:flex-end;justify-content:flex-start}.swal2-container.swal2-bottom-end,.swal2-container.swal2-bottom-right{align-items:flex-end;justify-content:flex-end}.swal2-container.swal2-bottom-end>:first-child,.swal2-container.swal2-bottom-left>:first-child,.swal2-container.swal2-bottom-right>:first-child,.swal2-container.swal2-bottom-start>:first-child,.swal2-container.swal2-bottom>:first-child{margin-top:auto}.swal2-container.swal2-grow-fullscreen>.swal2-modal{display:flex!important;flex:1;align-self:stretch;justify-content:center}.swal2-container.swal2-grow-row>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-grow-column{flex:1;flex-direction:column}.swal2-container.swal2-grow-column.swal2-bottom,.swal2-container.swal2-grow-column.swal2-center,.swal2-container.swal2-grow-column.swal2-top{align-items:center}.swal2-container.swal2-grow-column.swal2-bottom-left,.swal2-container.swal2-grow-column.swal2-bottom-start,.swal2-container.swal2-grow-column.swal2-center-left,.swal2-container.swal2-grow-column.swal2-center-start,.swal2-container.swal2-grow-column.swal2-top-left,.swal2-container.swal2-grow-column.swal2-top-start{align-items:flex-start}.swal2-container.swal2-grow-column.swal2-bottom-end,.swal2-container.swal2-grow-column.swal2-bottom-right,.swal2-container.swal2-grow-column.swal2-center-end,.swal2-container.swal2-grow-column.swal2-center-right,.swal2-container.swal2-grow-column.swal2-top-end,.swal2-container.swal2-grow-column.swal2-top-right{align-items:flex-end}.swal2-container.swal2-grow-column>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-no-transition{transition:none!important}.swal2-container:not(.swal2-top):not(.swal2-top-start):not(.swal2-top-end):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-start):not(.swal2-center-end):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-start):not(.swal2-bottom-end):not(.swal2-bottom-left):not(.swal2-bottom-right):not(.swal2-grow-fullscreen)>.swal2-modal{margin:auto}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-container .swal2-modal{margin:0!important}}.swal2-popup{display:none;position:relative;box-sizing:border-box;flex-direction:column;justify-content:center;width:32em;max-width:100%;padding:1.25em;border:none;border-radius:5px;background:#fff;font-family:inherit;font-size:1rem}.swal2-popup:focus{outline:0}.swal2-popup.swal2-loading{overflow-y:hidden}.swal2-header{display:flex;flex-direction:column;align-items:center;padding:0 1.8em}.swal2-title{position:relative;max-width:100%;margin:0 0 .4em;padding:0;color:#595959;font-size:1.875em;font-weight:600;text-align:center;text-transform:none;word-wrap:break-word}.swal2-actions{display:flex;z-index:1;box-sizing:border-box;flex-wrap:wrap;align-items:center;justify-content:center;width:100%;margin:1.25em auto 0;padding:0}.swal2-actions:not(.swal2-loading) .swal2-styled[disabled]{opacity:.4}.swal2-actions:not(.swal2-loading) .swal2-styled:hover{background-image:linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.1))}.swal2-actions:not(.swal2-loading) .swal2-styled:active{background-image:linear-gradient(rgba(0,0,0,.2),rgba(0,0,0,.2))}.swal2-loader{display:none;align-items:center;justify-content:center;width:2.2em;height:2.2em;margin:0 1.875em;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border-width:.25em;border-style:solid;border-radius:100%;border-color:#2778c4 transparent #2778c4 transparent}.swal2-styled{margin:.3125em;padding:.625em 1.1em;box-shadow:none;font-weight:500}.swal2-styled:not([disabled]){cursor:pointer}.swal2-styled.swal2-confirm{border:0;border-radius:.25em;background:initial;background-color:#2778c4;color:#fff;font-size:1em}.swal2-styled.swal2-deny{border:0;border-radius:.25em;background:initial;background-color:#d14529;color:#fff;font-size:1em}.swal2-styled.swal2-cancel{border:0;border-radius:.25em;background:initial;background-color:#757575;color:#fff;font-size:1em}.swal2-styled:focus{outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-styled::-moz-focus-inner{border:0}.swal2-footer{justify-content:center;margin:1.25em 0 0;padding:1em 0 0;border-top:1px solid #eee;color:#545454;font-size:1em}.swal2-timer-progress-bar-container{position:absolute;right:0;bottom:0;left:0;height:.25em;overflow:hidden;border-bottom-right-radius:5px;border-bottom-left-radius:5px}.swal2-timer-progress-bar{width:100%;height:.25em;background:rgba(0,0,0,.2)}.swal2-image{max-width:100%;margin:1.25em auto}.swal2-close{position:absolute;z-index:2;top:0;right:0;align-items:center;justify-content:center;width:1.2em;height:1.2em;padding:0;overflow:hidden;transition:color .1s ease-out;border:none;border-radius:5px;background:0 0;color:#ccc;font-family:serif;font-size:2.5em;line-height:1.2;cursor:pointer}.swal2-close:hover{transform:none;background:0 0;color:#f27474}.swal2-close:focus{outline:0;box-shadow:inset 0 0 0 3px rgba(100,150,200,.5)}.swal2-close::-moz-focus-inner{border:0}.swal2-content{z-index:1;justify-content:center;margin:0;padding:0 1.6em;color:#545454;font-size:1.125em;font-weight:400;line-height:normal;text-align:center;word-wrap:break-word}.swal2-checkbox,.swal2-file,.swal2-input,.swal2-radio,.swal2-select,.swal2-textarea{margin:1em auto}.swal2-file,.swal2-input,.swal2-textarea{box-sizing:border-box;width:100%;transition:border-color .3s,box-shadow .3s;border:1px solid #d9d9d9;border-radius:.1875em;background:inherit;box-shadow:inset 0 1px 1px rgba(0,0,0,.06);color:inherit;font-size:1.125em}.swal2-file.swal2-inputerror,.swal2-input.swal2-inputerror,.swal2-textarea.swal2-inputerror{border-color:#f27474!important;box-shadow:0 0 2px #f27474!important}.swal2-file:focus,.swal2-input:focus,.swal2-textarea:focus{border:1px solid #b4dbed;outline:0;box-shadow:0 0 0 3px rgba(100,150,200,.5)}.swal2-file::-moz-placeholder,.swal2-input::-moz-placeholder,.swal2-textarea::-moz-placeholder{color:#ccc}.swal2-file:-ms-input-placeholder,.swal2-input:-ms-input-placeholder,.swal2-textarea:-ms-input-placeholder{color:#ccc}.swal2-file::placeholder,.swal2-input::placeholder,.swal2-textarea::placeholder{color:#ccc}.swal2-range{margin:1em auto;background:#fff}.swal2-range input{width:80%}.swal2-range output{width:20%;color:inherit;font-weight:600;text-align:center}.swal2-range input,.swal2-range output{height:2.625em;padding:0;font-size:1.125em;line-height:2.625em}.swal2-input{height:2.625em;padding:0 .75em}.swal2-input[type=number]{max-width:10em}.swal2-file{background:inherit;font-size:1.125em}.swal2-textarea{height:6.75em;padding:.75em}.swal2-select{min-width:50%;max-width:100%;padding:.375em .625em;background:inherit;color:inherit;font-size:1.125em}.swal2-checkbox,.swal2-radio{align-items:center;justify-content:center;background:#fff;color:inherit}.swal2-checkbox label,.swal2-radio label{margin:0 .6em;font-size:1.125em}.swal2-checkbox input,.swal2-radio input{flex-shrink:0;margin:0 .4em}.swal2-input-label{display:flex;justify-content:center;margin:1em auto}.swal2-validation-message{align-items:center;justify-content:center;margin:0 -2.7em;padding:.625em;overflow:hidden;background:#f0f0f0;color:#666;font-size:1em;font-weight:300}.swal2-validation-message::before{content:"!";display:inline-block;width:1.5em;min-width:1.5em;height:1.5em;margin:0 .625em;border-radius:50%;background-color:#f27474;color:#fff;font-weight:600;line-height:1.5em;text-align:center}.swal2-icon{position:relative;box-sizing:content-box;justify-content:center;width:5em;height:5em;margin:1.25em auto 1.875em;border:.25em solid transparent;border-radius:50%;border-color:#000;font-family:inherit;line-height:5em;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:3.75em}.swal2-icon.swal2-error{border-color:#f27474;color:#f27474}.swal2-icon.swal2-error .swal2-x-mark{position:relative;flex-grow:1}.swal2-icon.swal2-error [class^=swal2-x-mark-line]{display:block;position:absolute;top:2.3125em;width:2.9375em;height:.3125em;border-radius:.125em;background-color:#f27474}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:1.0625em;transform:rotate(45deg)}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:1em;transform:rotate(-45deg)}.swal2-icon.swal2-error.swal2-icon-show{-webkit-animation:swal2-animate-error-icon .5s;animation:swal2-animate-error-icon .5s}.swal2-icon.swal2-error.swal2-icon-show .swal2-x-mark{-webkit-animation:swal2-animate-error-x-mark .5s;animation:swal2-animate-error-x-mark .5s}.swal2-icon.swal2-warning{border-color:#facea8;color:#f8bb86}.swal2-icon.swal2-info{border-color:#9de0f6;color:#3fc3ee}.swal2-icon.swal2-question{border-color:#c9dae1;color:#87adbd}.swal2-icon.swal2-success{border-color:#a5dc86;color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-circular-line]{position:absolute;width:3.75em;height:7.5em;transform:rotate(45deg);border-radius:50%}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.4375em;left:-2.0635em;transform:rotate(-45deg);transform-origin:3.75em 3.75em;border-radius:7.5em 0 0 7.5em}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.6875em;left:1.875em;transform:rotate(-45deg);transform-origin:0 3.75em;border-radius:0 7.5em 7.5em 0}.swal2-icon.swal2-success .swal2-success-ring{position:absolute;z-index:2;top:-.25em;left:-.25em;box-sizing:content-box;width:100%;height:100%;border:.25em solid rgba(165,220,134,.3);border-radius:50%}.swal2-icon.swal2-success .swal2-success-fix{position:absolute;z-index:1;top:.5em;left:1.625em;width:.4375em;height:5.625em;transform:rotate(-45deg)}.swal2-icon.swal2-success [class^=swal2-success-line]{display:block;position:absolute;z-index:2;height:.3125em;border-radius:.125em;background-color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-line][class$=tip]{top:2.875em;left:.8125em;width:1.5625em;transform:rotate(45deg)}.swal2-icon.swal2-success [class^=swal2-success-line][class$=long]{top:2.375em;right:.5em;width:2.9375em;transform:rotate(-45deg)}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-animate-success-line-tip .75s;animation:swal2-animate-success-line-tip .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-animate-success-line-long .75s;animation:swal2-animate-success-line-long .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-circular-line-right{-webkit-animation:swal2-rotate-success-circular-line 4.25s ease-in;animation:swal2-rotate-success-circular-line 4.25s ease-in}.swal2-progress-steps{flex-wrap:wrap;align-items:center;max-width:100%;margin:0 0 1.25em;padding:0;background:inherit;font-weight:600}.swal2-progress-steps li{display:inline-block;position:relative}.swal2-progress-steps .swal2-progress-step{z-index:20;flex-shrink:0;width:2em;height:2em;border-radius:2em;background:#2778c4;color:#fff;line-height:2em;text-align:center}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step{background:#2778c4}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step{background:#add8e6;color:#fff}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step-line{background:#add8e6}.swal2-progress-steps .swal2-progress-step-line{z-index:10;flex-shrink:0;width:2.5em;height:.4em;margin:0 -1px;background:#2778c4}[class^=swal2]{-webkit-tap-highlight-color:transparent}.swal2-show{-webkit-animation:swal2-show .3s;animation:swal2-show .3s}.swal2-hide{-webkit-animation:swal2-hide .15s forwards;animation:swal2-hide .15s forwards}.swal2-noanimation{transition:none}.swal2-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}.swal2-rtl .swal2-close{right:auto;left:0}.swal2-rtl .swal2-timer-progress-bar{right:0;left:auto}@supports (-ms-accelerator:true){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@-webkit-keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@-webkit-keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@-webkit-keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@-webkit-keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@-webkit-keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@-webkit-keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@-webkit-keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@-webkit-keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@-webkit-keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@-webkit-keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@-webkit-keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@-webkit-keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}@keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow:hidden}body.swal2-height-auto{height:auto!important}body.swal2-no-backdrop .swal2-container{top:auto;right:auto;bottom:auto;left:auto;max-width:calc(100% - .625em * 2);background-color:transparent!important}body.swal2-no-backdrop .swal2-container>.swal2-modal{box-shadow:0 0 10px rgba(0,0,0,.4)}body.swal2-no-backdrop .swal2-container.swal2-top{top:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-top-left,body.swal2-no-backdrop .swal2-container.swal2-top-start{top:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-top-end,body.swal2-no-backdrop .swal2-container.swal2-top-right{top:0;right:0}body.swal2-no-backdrop .swal2-container.swal2-center{top:50%;left:50%;transform:translate(-50%,-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-left,body.swal2-no-backdrop .swal2-container.swal2-center-start{top:50%;left:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-end,body.swal2-no-backdrop .swal2-container.swal2-center-right{top:50%;right:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom{bottom:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom-left,body.swal2-no-backdrop .swal2-container.swal2-bottom-start{bottom:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-bottom-end,body.swal2-no-backdrop .swal2-container.swal2-bottom-right{right:0;bottom:0}@media print{body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow-y:scroll!important}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)>[aria-hidden=true]{display:none}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) .swal2-container{position:static!important}}body.swal2-toast-shown .swal2-container{background-color:transparent}body.swal2-toast-shown .swal2-container.swal2-top{top:0;right:auto;bottom:auto;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-top-end,body.swal2-toast-shown .swal2-container.swal2-top-right{top:0;right:0;bottom:auto;left:auto}body.swal2-toast-shown .swal2-container.swal2-top-left,body.swal2-toast-shown .swal2-container.swal2-top-start{top:0;right:auto;bottom:auto;left:0}body.swal2-toast-shown .swal2-container.swal2-center-left,body.swal2-toast-shown .swal2-container.swal2-center-start{top:50%;right:auto;bottom:auto;left:0;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-center{top:50%;right:auto;bottom:auto;left:50%;transform:translate(-50%,-50%)}body.swal2-toast-shown .swal2-container.swal2-center-end,body.swal2-toast-shown .swal2-container.swal2-center-right{top:50%;right:0;bottom:auto;left:auto;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-left,body.swal2-toast-shown .swal2-container.swal2-bottom-start{top:auto;right:auto;bottom:0;left:0}body.swal2-toast-shown .swal2-container.swal2-bottom{top:auto;right:auto;bottom:0;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-end,body.swal2-toast-shown .swal2-container.swal2-bottom-right{top:auto;right:0;bottom:0;left:auto}</style><style data-emotion="css-global" data-s=""></style><style data-emotion="css" data-s=""></style><meta http-equiv="origin-trial" content="AymqwRC7u88Y4JPvfIF2F37QKylC04248hLCdJAsh8xgOfe/dVJPV3XS3wLFca1ZMVOtnBfVjaCMTVudWM//5g4AAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjk1MTY3OTk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<style type="text/css">
.lds-ellipsis {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 64px; }

.lds-ellipsis div {
  position: absolute;
  top: 27px;
  width: 11px;
  height: 11px;
  border-radius: 50%;
  background: #363636;
  animation-timing-function: cubic-bezier(0, 1, 1, 0); }

.lds-ellipsis div:nth-child(1) {
  left: 6px;
  animation: lds-ellipsis1 0.6s infinite; }

.lds-ellipsis div:nth-child(2) {
  left: 6px;
  animation: lds-ellipsis2 0.6s infinite; }

.lds-ellipsis div:nth-child(3) {
  left: 26px;
  animation: lds-ellipsis2 0.6s infinite; }

.lds-ellipsis div:nth-child(4) {
  left: 45px;
  animation: lds-ellipsis3 0.6s infinite; }

@keyframes lds-ellipsis1 {
  0% {
    transform: scale(0); }
  100% {
    transform: scale(1); } }

@keyframes lds-ellipsis3 {
  0% {
    transform: scale(1); }
  100% {
    transform: scale(0); } }

@keyframes lds-ellipsis2 {
  0% {
    transform: translate(0, 0); }
  100% {
    transform: translate(19px, 0); } }
</style>
<style type="text/css">
.ptr, .ptr__children {
  height: 100%;
  width: 100%;
  overflow: hidden;
  -webkit-overflow-scrolling: touch;
  position: relative; }

.ptr.ptr--fetch-more-treshold-breached .ptr__fetch-more {
  display: block; }

.ptr__fetch-more {
  display: none; }

/**
  * Pull down transition 
  */
.ptr__children,
.ptr__pull-down {
  transition: transform 0.2s cubic-bezier(0, 0, 0.31, 1); }

.ptr__pull-down {
  position: absolute;
  overflow: hidden;
  left: 0;
  right: 0;
  top: 0;
  visibility: hidden; }
  .ptr__pull-down > div {
    display: none; }

.ptr--dragging {
  /**
    * Hide PullMore content is treshold breached
    */
  /**
    * Otherwize, display content
    */ }
  .ptr--dragging.ptr--pull-down-treshold-breached .ptr__pull-down--pull-more {
    display: none; }
  .ptr--dragging .ptr__pull-down--pull-more {
    display: block; }

.ptr--pull-down-treshold-breached {
  /**
    * Force opacity to 1 is pull down trashold breached
    */
  /**
    * And display loader
    */ }
  .ptr--pull-down-treshold-breached .ptr__pull-down {
    opacity: 1 !important; }
  .ptr--pull-down-treshold-breached .ptr__pull-down--loading {
    display: block; }

.ptr__loader {
  margin: 0 auto;
  text-align: center; }
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js" async=""></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js" async=""></script>
<style data-jss="" data-meta="MuiDialog">
@media print {
  .MuiDialog-root {
    position: absolute !important;
  }
}
.MuiDialog-scrollPaper {
  display: flex;
  align-items: center;
  justify-content: center;
}
.MuiDialog-scrollBody {
  overflow-x: hidden;
  overflow-y: auto;
  text-align: center;
}
.MuiDialog-scrollBody:after {
  width: 0;
  height: 100%;
  content: "";
  display: inline-block;
  vertical-align: middle;
}
.MuiDialog-container {
  height: 100%;
  outline: 0;
}
@media print {
  .MuiDialog-container {
    height: auto;
  }
}
.MuiDialog-paper {
  margin: 32px;
  position: relative;
  overflow-y: auto;
}
@media print {
  .MuiDialog-paper {
    box-shadow: none;
    overflow-y: visible;
  }
}
.MuiDialog-paperScrollPaper {
  display: flex;
  max-height: calc(100% - 64px);
  flex-direction: column;
}
.MuiDialog-paperScrollBody {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}
.MuiDialog-paperWidthFalse {
  max-width: calc(100% - 64px);
}
.MuiDialog-paperWidthXs {
  max-width: 444px;
}
@media (max-width:507.95px) {
  .MuiDialog-paperWidthXs.MuiDialog-paperScrollBody {
    max-width: calc(100% - 64px);
  }
}
.MuiDialog-paperWidthSm {
  max-width: 600px;
}
@media (max-width:663.95px) {
  .MuiDialog-paperWidthSm.MuiDialog-paperScrollBody {
    max-width: calc(100% - 64px);
  }
}
.MuiDialog-paperWidthMd {
  max-width: 960px;
}
@media (max-width:1023.95px) {
  .MuiDialog-paperWidthMd.MuiDialog-paperScrollBody {
    max-width: calc(100% - 64px);
  }
}
.MuiDialog-paperWidthLg {
  max-width: 1280px;
}
@media (max-width:1343.95px) {
  .MuiDialog-paperWidthLg.MuiDialog-paperScrollBody {
    max-width: calc(100% - 64px);
  }
}
.MuiDialog-paperWidthXl {
  max-width: 1920px;
}
@media (max-width:1983.95px) {
  .MuiDialog-paperWidthXl.MuiDialog-paperScrollBody {
    max-width: calc(100% - 64px);
  }
}
.MuiDialog-paperFullWidth {
  width: calc(100% - 64px);
}
.MuiDialog-paperFullScreen {
  width: 100%;
  height: 100%;
  margin: 0;
  max-width: 100%;
  max-height: none;
  border-radius: 0;
}
.MuiDialog-paperFullScreen.MuiDialog-paperScrollBody {
  margin: 0;
  max-width: 100%;
}
</style>

</head>
<body>
	<!-- header Start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header End -->
	
	
	<div class="css-1ykiyus e146m4rf2">
		<div class="css-1uom1od e146m4rf0">
			<h2 class="css-10owlr e146m4rf1">주문서</h2>
			
			<div class="css-ixlb9s epvroj94">
				<div class="css-zo1i6f edbbr7c2">
			  <h3 class="css-1ddzp0m edbbr7c1">주문 상품</h3>
			  <button data-testid="fold-button" class="css-lvqq7y e17cst860">
			    <svg id="fold-svg" width="30" height="30" viewBox="0 0 30 30" xmlns="http://www.w3.org/2000/svg">
			      <defs><path id="7a02qqg3ja" d="M11 12h9v9"></path></defs>
			      <g fill="none" fill-rule="evenodd">
			        <path d="M0 0h30v30H0z"></path>
			        <use stroke="#333" stroke-width="2" stroke-linecap="square" transform="rotate(-45 15.5 16.5)" href="#7a02qqg3ja"></use>
			      </g>
			    </svg>
			  </button>
			</div>

				<div class="css-bd9p1l e17a7yib10">
					<img src="https://img-cf.kurly.com/cdn-cgi/image/width=120,height=156,fit=crop,quality=85/shop/data/goods/1654846801479l0.jpg" alt="Top 장바구니 목록" class="css-17jyui4 e17a7yib9">
					<div class="css-productInfo">
						<span class="css-10nl60h e17a7yib8">
							<span class="css-9j7jhp e17a7yib7">
							장바구니 1번 제품 이
							</span>
						</span>
						<span class="css-1efb5i1 e17a7yib5">2개</span>
						<span class="css-1j31gob e17a7yib4">
							<span class="css-jnogx7 e17a7yib3">9,010원</span>
							<span class="css-9dxu4e e17a7yib2">10,600원</span>
						</span>
					</div>
				</div>
				
				<div class="css-12aowi2 edbbr7c2">
				<h3 class="css-1ddzp0m edbbr7c1">주문자 정보</h3>
				</div>
				
				<div id="kurly-orderer-info" class="css-shoa2s e1vfdada3">
					<div class="css-yazyg9 e150alo82">
					<span class="css-ln1csn e150alo81">보내는 분</span>
					<div class="css-82a6rk e150alo80">
						<div class="css-t6o2y8 e1vfdada2">사용자 이름</div>
					</div>
					</div>
					
					<div class="css-yazyg9 e150alo82">
						<span class="css-ln1csn e150alo81">휴대폰</span>
						<div class="css-82a6rk e150alo80">
							<div class="css-t6o2y8 e1vfdada2">010-5967-1329</div>
						</div>
					</div>
					
					<div class="css-yazyg9 e150alo82">
						<span class="css-ln1csn e150alo81">이메일</span>
						<div class="css-82a6rk e150alo80">jsungj3@gmail.com
							<div class="css-1r0yqr6 e1vfdada1">
								<p class="css-i7dt79 e1vfdada0">이메일을 통해 주문처리과정을 보내드립니다.</p>
								<p class="css-i7dt79 e1vfdada0">정보 변경은 마이컬리 &gt; 개인정보 수정 메뉴에서 가능합니다.</p>
							</div>
						</div>
					</div>
				</div>
				
				<div id="shipping-container">
					<div class="css-12aowi2 edbbr7c2">
						<h3 class="css-1ddzp0m edbbr7c1">배송 정보</h3>
						<div class="css-bjn8wh er4y7r83">
							<a class="css-orhu8r er4y7r82">배송지 변경 안내
								<span class="css-gwort8 er4y7r81"></span>
							</a>
							<div width="188" height="60" class="css-1k2fiq3 ev65imb2">
								<div class="css-82a6rk ev65imb1">
									<span class="css-2s3epn er4y7r80">장바구니, 홈에서</span>
									<span class="css-4zleql er4y7r80">배송지를 변경할 수 있어요</span>
								</div>
								<button class="css-157xhr7 ev65imb0">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
										<path d="M12.6154 12.8154L3 3" stroke="#fff" stroke-linecap="round"></path>
										<path d="M3 12.8154L12.6242 3" stroke="#fff" stroke-linecap="round"></path>
									</svg>
								</button>
							</div>
						</div>
					</div>
					<div class="css-5d6nlw e17yjk9v4">
						<div class="css-1gshg9u e150alo82">
						<span class="css-ln1csn e150alo81">배송지</span>
							<div class="css-82a6rk e150alo80">
								<span class="css-3uygi7 e17yjk9v3">기본배송지</span>
								<p class="css-36j4vu e17yjk9v2">강원 양양군 현남면 동산큰길 44-39 (뉴그린회집) 파머스키친</p>
								<div class="css-iqoq9n e17yjk9v0">
									<button class="css-1xky6jf e4nu7ef3" type="button" width="60" height="30" radius="3">
										<span class="css-nytqmg e4nu7ef1">변경</span>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div id="checkout-shipping-details" class="css-1y0xj4c e1pxan881">
						<div class="css-kc45zq e150alo82">
							<span class="css-ln1csn e150alo81">배송 요청사항</span>
							<div class="css-82a6rk e150alo80">
								<div>
									<span class="css-11y0tcn efthce41"></span>
								</div>
								<div class="css-rqc9f e14u1xpe0">조성진, 010-5967-1329</div>
								<div class="css-iqoq9n e1pxan880">
									<button class="css-117jo2j e4nu7ef3" type="button" width="60" height="30" radius="3">
										<span class="css-nytqmg e4nu7ef1">수정</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			  <div class="css-12aowi2 edbbr7c2">
			  	<h3 class="css-1ddzp0m edbbr7c1">결제 수단</h3>
			  </div>
			  
			  <div class="css-1gshg9u e150alo82">
				  <span class="css-ln1csn e150alo81">결제수단 선택</span>
				  <div class="css-82a6rk e150alo80">
					  <div class="css-gd125q e4nb37r1">
						  <div>
							  <div class="css-18dvwsu ef0cmoa0">
								  <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="kakao-pay-button" color="#f6e500">
								  	<span class="css-1oanxtx e106vb1p0">혜택</span>
									  <img class="css-1wbfblw e1ewacwr0" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNTAiIGhlaWdodD0iMjAiIH
									  htbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSIjMDAwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgI
									  CAgIDxwYXRoIGQ9Ik03LjUxNSAyLjhDMy4zNjUgMi44IDAgNS40NDUgMCA4LjcwN2MwIDEuOTM4IDEuMTg3IDMuNjU3IDMuMDIxIDQuNzM0
									  LS4xOTEuNzY4LS42ODQgMi43NDItLjc1IDIuOTU3LS4wODMuMjY2LS4xMDMgMS4wNDYuNzAyLjUxMi42MzQtLjQyIDIuNDc5LTEuNyAzLjU
									  3LTIuMzQ4LjMxOC4wMzMuNjQyLjA1MS45NzIuMDUxIDQuMTUgMCA3LjUxNS0yLjY0NCA3LjUxNS01LjkwNiAwLTMuMjYyLTMuMzY1LTUuO
									  TA3LTcuNTE1LTUuOTA3TTIxLjA0OCA0LjExM2MxLjUxNy0xLjMxMyAzLjQ2OC0xLjUwOCA0Ljg5My0uNTg1IDEuNzA3IDEuMTA2IDIuMTY4
									  IDIuNzU0IDIuMTY4IDQuODkyIDAgMi40LTEuMTE1IDMuOTY4LTEuNjQyIDQuNDYtLjUyNi40OTMtMS42NzMgMS4yOTItMi44OCAxLjI5Mkgy
									  MS40MnYzLjc4NGgtMi45MTFWMy4yODJoMi4xMDZzLjI2LjU0OC40MzMuODN6bTEuOTUxIDEuMTUzYy0uNjk3IDAtMS4xNTMuMTc3LTEuNTMz
									  LjQ3N3Y2LjMwNmgxLjEzOGMuNTU4IDAgMi41NDctLjUwNyAyLjU0Ny0zLjM4MyAwLS42NzctLjA5LTEuMzg1LS4yNzgtMS45LS4zNTctLjk
									  3Ny0xLjI0Ny0xLjUtMS44NzQtMS41ek0zMy44MTcgMy4wNDZjMi4wODUgMCAyLjk0Mi43MTggMy40NDggMS4zNTQuNDgxLjYwNC44NjI
									  gMS40OTcuODYyIDIuOHY2LjY4aC0yLjI2di0uOTU0cy0uNDQyLjQyLTEuMzc5LjgzMWMtLjk4LjQzLTIuNjUzLjg3Ny00LjA0MS0uMT
									  g0LTEuMzk3LTEuMDY4LTEuMi0zLjQ3MS0uODUyLTQuMTU0LjQ4LS45MzggMS4zNjMtMS45NjggMy43MTYtMS45NjhoMi4wMjl2LS45M
									  DhjMC0uNTU0LS41ODMtMS4xMDctMS43My0xLjEwNy0xLjI4IDAtMS44MzMuMTkyLTIuODE3LjYzNWwtLjk5Ni0xLjk0M3MxLjQ5Ni0x
									  LjA4MiA0LjAyLTEuMDgyem0xLjQ3NyA2LjI1aC0xLjQxNWMtLjU5OSAwLTEuOTYxLjIxNi0xLjk2MSAxLjQ3NyAwIDEuMjgzIDEuMDk
									  gMS4yNiAxLjQ0OCAxLjIzIDEuMDg5LS4wOTEgMS45MzgtLjc5NCAxLjkzOC0uNzk0bC0uMDEtMS45MTN6TTQ3LjA2MSAzLjA0NmwtMi
									  4yOTEgOC4xMTEtMi41NC04LjExLTIuODQ5LjgyczMuNSA5LjM4MyAzLjYyNCA5Ljc4M2MuMTIzLjQtLjAwNS44NTgtLjI4IDEuMzIyL
									  S4zNzEuNjMtMS44MjYgMi4wMy0xLjgyNiAyLjAzbDEuODc4IDEuNjYzcy44NTctLjY4OCAxLjc0NS0xLjc1NWMuNzQzLS44OTIgMS42M
									  zYtMi44MyAxLjkzOC0zLjU3Ny44NTktMi4xMTkgMy40Mi05LjQ2NiAzLjQyLTkuNDY2bC0yLjgxOS0uODJ6Ii8+CiAgICA8L2c+Cjwv
									  c3ZnPgo=" alt="카카오페이">
								  </button>
							  </div>
							 <div class="css-18dvwsu ef0cmoa0">
								 <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="creditcard-button">신용카드</button>
								 <button type="button" class="css-1pvbmgb ehlmjxl0" data-testid="simplepay-button">
								 	<span class="css-1oanxtx e106vb1p0">혜택</span>간편 결제
								 </button>
								 <button type="button" class="css-1wlyg0y ehlmjxl0" data-testid="phonebill">휴대폰</button>
							 </div>
						 </div>
						 <div class="css-nemdq9 evz7bw03">
							 <div class="css-nznuh9 evz7bw02">
								 <label class="css-11zj85u et8nqc33" for="naver-pay">
								 <input data-testid="radio-naver-pay" id="naver-pay" name="naver-pay" type="radio" class="css-1pes2r6 et8nqc32" value="naver-pay">
								 <span class="css-198i9ca e2sqze61">
								 	<div class="css-1dahn5m e2sqze60"></div>
								 </span>
								 <span aria-labelledby="naver-pay" class="css-mgd87h et8nqc31">
								 	<span class="css-s5xdrg evz7bw00">네이버페이 </span>
								 </span>
								 </label>
							 </div>
							 <div class="css-nznuh9 evz7bw02">
								 <label class="css-11zj85u et8nqc33" for="toss">
									 <input data-testid="radio-toss" id="toss" name="toss" type="radio" class="css-1pes2r6 et8nqc32" value="toss" checked="">
									 <span class="css-5xw1m2 e2sqze61"><div class="css-1vic0rk e2sqze60"></div></span>
									 <span aria-labelledby="toss" class="css-mgd87h et8nqc31">
										 <span class="css-s5xdrg evz7bw00">토스 
										 	<span class="css-1ox35cj evz7bw01">혜택</span>
										 </span>
									 </span>
								 </label>
							 </div>
							 <div class="css-nznuh9 evz7bw02">
								 <label class="css-11zj85u et8nqc33" for="payco">
									 <input data-testid="radio-payco" id="payco" name="payco" type="radio" class="css-1pes2r6 et8nqc32" value="payco">
									 <span class="css-198i9ca e2sqze61">
									 	<div class="css-1dahn5m e2sqze60"></div>
									 </span>
									 <span aria-labelledby="payco" class="css-mgd87h et8nqc31">
									 <span class="css-s5xdrg evz7bw00">페이코 
									 	<span class="css-1ox35cj evz7bw01">혜택</span>
									 </span>
									 </span>
								 </label>
							 </div>
						 </div>
						 <div class="css-p04ye2 eqgsbpy1">
							 <div class="css-1uv50i eqgsbpy0">
							 <span>혜택안내</span>
							 <button class="css-1lecd96 ekuwusm0">무이자 혜택 안내 
								 <svg width="12" height="12" viewBox="0 0 14 14" version="1.1" xmlns="http://www.w3.org/2000/svg">
								 <title>Shape</title>
									 <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
										 <g id="commonIcon_info" fill="#999" fill-rule="nonzero">
											 <path d="M6.3,3.5 L7.7,3.5 L7.7,4.9 L6.3,4.9 L6.3,3.5 Z M6.3,6.3 L7.7,6.3 L7.7,10.5 L6.3,10.5 L6.3,6.3 Z
											  M0,7 C0,10.864 3.129,14 6.993,14 C10.864,14 14,10.864 14,7 C14,3.136 10.864,0 6.993,0 C3.129,0 0,3.136 
											  0,7 Z M1.4,7 C1.4,3.906 3.906,1.4 7,1.4 C10.094,1.4 12.6,3.906 12.6,7 C12.6,10.094 10.094,12.6 7,12.6 
											  C3.906,12.6 1.4,10.094 1.4,7 Z" id="Shape">
											  </path>
										  </g>
									  </g>
								  </svg>
							  </button>
							  </div>
							  <div class="css-1eyoyxr e1dfkh4o6">
								  <div class="css-109w7xc e1dfkh4o3">
									  <p class="css-1rlhglk e1dfkh4o2">토스</p>
									  <p class="css-5jw6s3 e1dfkh4o1">토스페이 6만원 이상 결제 시 2천원 즉시할인</p>
									  <p class="css-95xna2 e1dfkh4o0">토스머니 &amp; 후불결제 6만원 이상 결제 시 2천원 즉시할인</p>
									  <p class="css-95xna2 e1dfkh4o0">기간중, 인당 1회 사용가능</p>
									  <p class="css-95xna2 e1dfkh4o0">2/15 11시 ~ 2/26 11시</p>
								  </div>
								  <div class="css-109w7xc e1dfkh4o3">
									  <p class="css-1rlhglk e1dfkh4o2">컬리페이</p>
									  <p class="css-5jw6s3 e1dfkh4o1">컬리카드 &amp; 컬리페이 결제 혜택</p>
									  <p class="css-95xna2 e1dfkh4o0">1. 컬리카드 첫 결제 3만원 즉시 할인 + 2만원 쿠폰팩 + 8만원 적립금 제공</p>
									  <p class="css-95xna2 e1dfkh4o0">24/02/01~ 02/29</p>
									  <p class="css-95xna2 e1dfkh4o0">2. 컬리페이 X 현대카드 5만원 이상 결제 시, 최대 2천원 M포인트 차감 할인 ...</p>
								  </div>
								  <button class="css-755sul e1dfkh4o5">
								  <span class="css-1b9oelf e1dfkh4o4">혜택 더보기</span>
								  <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
									  <path d="M13 7L9 11L5 7" stroke="#333" stroke-width="1.2">
									  </path>
								  </svg>
								  </button>
							  </div>
						  </div>
					  </div>
				  </div>
			  </div>
			  <ul class="css-wx42bm e4nb37r0">
				  <li>※ 카카오페이, 토스, 네이버페이, 페이코 결제 시, 결제하신 수단으로만 환불되는 점 양해부탁드립니다.</li>
				  <li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의 구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>
			  </ul>
			  
			  <div class="css-12aowi2 edbbr7c2">
			  	<h3 class="css-1ddzp0m edbbr7c1">개인정보 수집/제공</h3>
			  </div>
		  
		  	  <div class="css-37px7p eh5sxvr5">
				  <div class="css-vtybye eh5sxvr2">
					  <span class="css-0 eh5sxvr1">개인정보 수집∙이용 및 처리 동의</span>
					  <button class="css-1q6jmiw eh5sxvr0">보기</button>
				  </div>
				  <div class="css-vtybye eh5sxvr2">
					  <span class="css-0 eh5sxvr1">전자지급 결제대행 서비스 이용약관 동의</span>
					  <button class="css-1q6jmiw eh5sxvr0">보기</button>
				  </div>
			  	  <strong class="css-87vide eh5sxvr4">위 내용을 확인 하였으며 결제에 동의합니다.</strong>
		  	  </div>
			  <p class="css-1tak4sl eh5sxvr3">주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시 결제하신 수단으로 환불됩니다.</p>
			  <p class="css-1tak4sl eh5sxvr3">컬리 내 개별 판매자가 등록한 오픈마켓 상품의 경우 컬리는 통신판매중개자로서 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.</p>
			  <div class="css-1azakc el0c5j40">
				  <button class="css-1lha8en e4nu7ef3" type="button" width="240" height="56" radius="3">
				  	<span class="css-nytqmg e4nu7ef1">37,810원 결제하기</span>
				  </button>
			  </div>
		  </div>
	  
	  
		  <div class="css-1rz7w0y epvroj91">
			  <div class="css-9i9om4 epvroj90">
				  <div class="css-6hge48 edbbr7c2">
				  <h3 class="css-1ddzp0m edbbr7c1">결제 금액</h3>
				  </div>
				  <div class="css-hdnk73 e12lli9y0">
					  <div class="css-1hvttuk eahaaoi12">
					  	  <div class="css-1rmc3ba eahaaoi11">주문금액</div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  34,810
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-sk644d eahaaoi9">
						  <div class="css-zjik7 eahaaoi0">
							  <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path>
							  </svg>
							  <div class="css-1rmc3ba eahaaoi11">상품금액</div>
						  </div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  36,400
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-sk644d eahaaoi9">
						  <div class="css-zjik7 eahaaoi0">
							  <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							  	<path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path>
							  </svg>
						  	<div class="css-1rmc3ba eahaaoi11">상품할인금액</div>
						  </div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3">-</span>
								  1,590
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-1bj5qaf eahaaoi12">
						  <div class="css-1rmc3ba eahaaoi11">배송비</div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3">+</span>
								  3,000
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-1bj5qaf eahaaoi12">
						  <div class="css-1rmc3ba eahaaoi11">쿠폰할인</div>
						  <div class="css-0">
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  0
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-1bj5qaf eahaaoi12">
						  <div class="css-1rmc3ba eahaaoi11">카드즉시할인</div>
						  <div class="css-37wf0k">
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  0
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-1hvttuk eahaaoi12">
						  <div class="css-1rmc3ba eahaaoi11">적립금 ∙ 컬리캐시</div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  0
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-sk644d eahaaoi9">
						  <div class="css-zjik7 eahaaoi0">
							  <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							  	<path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path>
							  </svg>
							  <div class="css-1rmc3ba eahaaoi11">적립금</div>
						  </div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  0
							  </span>
							  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-sk644d eahaaoi9">
						  <div class="css-zjik7 eahaaoi0">
							  <svg width="16" height="20" viewBox="0 0 16 20" fill="none" xmlns="http://www.w3.org/2000/svg">
							  	<path fill-rule="evenodd" clip-rule="evenodd" d="M1 5H0V10V11H1H6V10H1V5Z" fill="#ddd"></path>
							  </svg>
						  	<div class="css-1rmc3ba eahaaoi11">컬리캐시</div>
						  </div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  0
							  </span>
						  	  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
					  <div class="css-1hgn7mh eahaaoi7">
					  	  <div class="css-1rmc3ba eahaaoi11">최종결제금액</div>
						  <div>
							  <span class="css-2pg1ps eahaaoi10">
								  <span class="css-rfpchb eahaaoi3"></span>
								  37,810
							  </span>
						  	  <span class="css-158icaa eahaaoi8">원</span>
						  </div>
					  </div>
				  	  <div class="css-1ujngs9 eahaaoi1">컬리카드 결제 시 최대 1,891원 추가 적립</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   
	
	<!-- footer Start -->
	<%-- <jsp:include page="footer.html"></jsp:include> --%>
	<!-- footer End -->
	
	
	

</body>
</html>