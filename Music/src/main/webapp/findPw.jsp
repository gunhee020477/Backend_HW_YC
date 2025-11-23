<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* --- 카드 페이드인 (로그인/회원가입/아이디찾기 통일) --- */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* --- 입력창 포커스 효과 --- */
.form-control:focus {
    border-color:#000;
    box-shadow:0 0 4px rgba(0,0,0,0.4);
}

/* --- 검은색 링크 스타일 --- */
.custom-link {
    color:#000!important;
    text-decoration:none!important;
    transition:0.2s ease;
}
.custom-link:hover {
    color:#555!important;
    transform: translateY(-2px);
}

/* --- 버튼 hover 애니메이션 통일 --- */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover {
    background-color:#000;
    transform: translateY(-2px);
}
</style>

<!-- 에러 메시지 있을 때 출력 -->
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div class="alert alert-danger text-center mt-3" role="alert">
    <%= error %>
</div>
<%
}
%>

<div class="container mt-4" style="max-width: 400px;">
    <div class="card shadow fade-card">
        <div class="card-body">

            <h3 class="text-center mb-4">비밀번호 찾기</h3>

            <form action="findPw" method="post">

                <div class="mb-3">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" name="userid" required>
                </div>

                <div class="mb-4">
                    <label class="form-label">이메일</label>
                    <input type="email" class="form-control" name="email" required>
                </div>

                <button class="btn btn-dark w-100 mb-3">비밀번호 찾기</button>

            </form>

            <div class="d-flex justify-content-between">
                <a href="login.jsp" class="custom-link">로그인</a>
                <a href="findId.jsp" class="custom-link">아이디 찾기</a>
            </div>

        </div>
    </div>
</div>