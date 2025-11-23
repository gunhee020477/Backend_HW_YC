<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* Fade-in Animation */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card {
    animation: fadeInUp 0.7s ease-out;
}

/* Button Hover */
.btn-dark {
    transition: 0.25s ease;
}
.btn-dark:hover {
    transform: translateY(-2px);
    background:#000;
}
</style>

<div class="container mt-5" style="max-width:600px;">
    <div class="card shadow p-4 fade-card">

        <h2 class="text-center mb-3">관리자 페이지</h2>
        <p class="text-center text-muted mb-4">관리 기능을 선택하세요</p>

        <div class="d-grid">
            <a href="adminMemberList" class="btn btn-dark btn-lg">
                회원 목록 보기
            </a>
        </div>

    </div>
</div>