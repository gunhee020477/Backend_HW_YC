<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* Fade Up 애니메이션 */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* input 포커스 블랙 강조 */
.form-control:focus {
    border-color: #000;
    box-shadow: 0 0 4px rgba(0,0,0,0.45);
}

/* 링크 색상 통일(검정) */
.custom-link {
    color: #000 !important;
    text-decoration: none !important;
}
.custom-link:hover {
    color: #555 !important;
    transform: translateY(-1px);
}

/* 버튼 hover */
.btn-dark { transition: 0.25s ease; }
.btn-dark:hover { background:#000; transform: translateY(-2px); }
</style>


<!-- 🔴 로그인 실패 시 에러 표시 -->
<%
    String error = (String) request.getAttribute("error");
    if (error != null) {
%>
<div class="alert alert-danger text-center mt-3" role="alert">
    <%= error %>
</div>
<% } %>


<!-- 로그인 카드 -->
<div class="container mt-4" style="max-width: 400px;">
    <div class="card shadow fade-card">
        <div class="card-body">

            <h3 class="text-center mb-4">로그인</h3>

            <form action="login" method="post">

                <!-- 아이디 -->
                <div class="mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" name="userid" required>
                </div>

                <!-- 비밀번호 -->
                <div class="mb-4">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <!-- 🔽 검은색 로그인 버튼 -->
                <button class="btn btn-dark w-100 mb-3">로그인</button>
            </form>

            <!-- 하단 링크 (검은색 통일) -->
            <div class="d-flex justify-content-between">
                <a href="findId.jsp" class="custom-link">아이디 찾기</a>
                <a href="findPw.jsp" class="custom-link">비밀번호 찾기</a>
            </div>

        </div>
    </div>
</div>