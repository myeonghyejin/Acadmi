<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<head>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Acadmi!</title>
    <!-- CSS/favicon 적용 -->
    <c:import url="../temp/style.jsp"></c:import>
    <!-- CSS/favicon 끝 -->
    <script nonce="f1cf7028-b6d4-4877-9946-a29be428bdc3">(function (w, d) { !function (a, b, c, d) { a[c] = a[c] || {}; a[c].executed = []; a.zaraz = { deferred: [], listeners: [] }; a.zaraz.q = []; a.zaraz._f = function (e) { return function () { var f = Array.prototype.slice.call(arguments); a.zaraz.q.push({ m: e, a: f }) } }; for (const g of ["track", "set", "debug"]) a.zaraz[g] = a.zaraz._f(g); a.zaraz.init = () => { var h = b.getElementsByTagName(d)[0], i = b.createElement(d), j = b.getElementsByTagName("title")[0]; j && (a[c].t = b.getElementsByTagName("title")[0].text); a[c].x = Math.random(); a[c].w = a.screen.width; a[c].h = a.screen.height; a[c].j = a.innerHeight; a[c].e = a.innerWidth; a[c].l = a.location.href; a[c].r = b.referrer; a[c].k = a.screen.colorDepth; a[c].n = b.characterSet; a[c].o = (new Date).getTimezoneOffset(); if (a.dataLayer) for (const n of Object.entries(Object.entries(dataLayer).reduce(((o, p) => ({ ...o[1], ...p[1] })), {}))) zaraz.set(n[0], n[1], { scope: "page" }); a[c].q = []; for (; a.zaraz.q.length;) { const q = a.zaraz.q.shift(); a[c].q.push(q) } i.defer = !0; for (const r of [localStorage, sessionStorage]) Object.keys(r || {}).filter((t => t.startsWith("_zaraz_"))).forEach((s => { try { a[c]["z_" + s.slice(7)] = JSON.parse(r.getItem(s)) } catch { a[c]["z_" + s.slice(7)] = r.getItem(s) } })); i.referrerPolicy = "origin"; i.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a[c]))); h.parentNode.insertBefore(i, h) };["complete", "interactive"].includes(b.readyState) ? zaraz.init() : a.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>
</head>

            <body class="hold-transition login-page">
                <div class="login-box">
                    <div class="card card-outline card-info">
                        <div class="card-header text-center">
                            <a href="./login" class="h1"><img src="/images/black.png" style="width: 70%; height: 70%;"></a>
                        </div>
                        <div class="card-body">
                         	<div class="text-center">
                        		<h6 class="fa-solid fa-circle-check text-center" style="font-weight : normal;">   이메일을 확인해 주세요.</h6>
                        		<p>로고 클릭시 로그인으로 돌아갑니다</p>
                        	</div>
                        </div>
					</div>
				</div>
           
</body>
</html>