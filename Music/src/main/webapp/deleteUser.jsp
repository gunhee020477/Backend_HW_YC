<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* Fade Up Animation */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* Button Hover Effects */
.btn-danger { transition:0.25s ease; }
.btn-danger:hover { transform:translateY(-2px); }

.btn-secondary { transition:0.25s ease; }
.btn-secondary:hover { transform:translateY(-2px); }
</style>

<div class="container mt-5" style="max-width: 500px;">
    <div class="card shadow p-4 fade-card text-center">

        <h3 class="text-danger mb-3">정말 탈퇴하시겠습니까?</h3>
        <p class="mb-4">탈퇴 시 모든 정보는 복구할 수 없습니다.</p>

        <!-- 탈퇴 실행 -->
        <form action="deleteUser" method="post">
            <button class="btn btn-danger w-100 mb-3">
                회원 탈퇴
            </button>
        </form>

        <!-- 취소 버튼 -->
        <a href="mypage" class="btn btn-secondary w-100">
            취소
        </a>

    </div>
</div>