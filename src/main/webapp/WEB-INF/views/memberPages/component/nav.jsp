<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .menu {
        display: flex;
        align-items: center;
        background-color: gainsboro;
        border-width: thin;
        border-style: none;
        border-color: black;
    }

    .menu-item {
        list-style-type: none;
        margin-left: 20px;
    }

    /* menu-item 클래스가 적용된 요소 내부의 a 태그 요소 */
    .menu-item a {
        text-decoration: none;
        /* a태그는 기본적으로 inline 요소
            inline 요소는 높이, 너비를 가질 수 없음.
            높이, 너비를 가지려면 block 요소여야 함.
            아래 문법은 block요소로 하는 방법임.
         */
        display: block;
        padding: 10px;
        color: black;
        font-weight: bold;
    }

    .menu-item a:hover {
        background-color: gray;
    }


</style>

<div id="nav">
    <ul class="menu mx-5">
        <li class="menu-item">
            <a href="/">Home</a>
        </li>
        <c:if test="${sessionScope.loginEmail==null}">
            <li class="menu-item">
                <a href="/member/save">회원가입</a>
            </li>
        </c:if>
        <li class="menu-item">
            <a href="/board/list">글목록</a>
        </li>
        <c:if test="${sessionScope.loginEmail=='admin'}">
            <li class="menu-item">
                <a href="/member/list">회원관리</a>
            </li>
        </c:if>
        <c:if test="${sessionScope.loginEmail!=null}">
            <li class="menu-item">
                <a href="/member/logout">로그아웃</a>
            <li class="menu-item">
            <li class="menu-item">
                <a href="/member/myPage?id=${sessionScope.loginId}">마이페이지</a>
            </li>
        </c:if>
    </ul>
</div>
<div class="mx-5">
    <c:if test="${sessionScope.loginEmail!=null}">
        <p>${sessionScope.loginEmail}님 환영합니다!</p>
    </c:if>

</div>
