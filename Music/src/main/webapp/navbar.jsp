<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Music Admin</a>

        <ul class="navbar-nav ms-auto">

            <% 
                String loginUser = (String) session.getAttribute("userid");
                String loginAdmin = (String) session.getAttribute("adminid");
            %>

            <!-- 로그인 상태 아님 -->
            <% if (loginUser == null && loginAdmin == null) { %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">로그인</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">회원가입</a></li>
                <li class="nav-item"><a class="nav-link" href="adminLogin.jsp">관리자</a></li>

            <!-- 일반 로그인 -->
            <% } else if (loginUser != null) { %>
                <li class="nav-item"><a class="nav-link" href="mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>

            <!-- 관리자 로그인 -->
            <% } else if (loginAdmin != null) { %>
                <li class="nav-item"><a class="nav-link" href="adminPage">관리자페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
            <% } %>

        </ul>
    </div>
</nav>