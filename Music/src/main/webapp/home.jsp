<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* Fade In */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* Button Hover */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover { background:#000; transform:translateY(-2px); }

.btn-outline-dark { transition:0.25s ease; }
.btn-outline-dark:hover { transform:translateY(-2px); }
</style>

<div class="container mt-5" style="max-width:600px;">
    <div class="card shadow p-5 text-center fade-card">

        <h2 class="mb-4">메인 페이지</h2>
        <p class="text-muted mb-4">원하시는 메뉴를 선택하세요</p>

        <!-- 버튼 묶음 -->
        <div class="d-grid gap-3">

            <a href="register.jsp" class="btn btn-dark btn-lg">
                회원가입
            </a>

            <a href="login.jsp" class="btn btn-dark btn-lg">
                로그인
            </a>

            <a href="mypage" class="btn btn-outline-dark btn-lg">
                마이페이지
            </a>

            <a href="adminLogin.jsp" class="btn btn-outline-dark btn-lg">
                관리자 로그인
            </a>

            <a href="logout" class="btn btn-danger btn-lg">
                로그아웃
            </a>

        </div>

    </div>
</div>