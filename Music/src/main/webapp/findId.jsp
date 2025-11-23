<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* --- Fade Up Animation --- */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* --- Input Focus Black Highlight --- */
.form-control:focus {
    border-color:#000;
    box-shadow:0 0 4px rgba(0,0,0,0.4);
}

/* --- Black Link --- */
.custom-link {
    color:#000!important;
    text-decoration:none!important;
    transition:0.2s ease;
}
.custom-link:hover {
    color:#555!important;
    transform: translateY(-2px);
}

/* --- Button Hover --- */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover {
    background-color:#000;
    transform: translateY(-2px);
}
</style>

<!-- 아이디 찾기 실패 메시지 -->
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div class="alert alert-danger text-center mt-3"><%= error %></div>
<% } %>

<div class="container mt-4" style="max-width:400px;">
    <div class="card shadow fade-card">
        <div class="card-body">

            <h3 class="text-center mb-4">아이디 찾기</h3>

            <form action="findId" method="post">

                <!-- 이름 -->
                <div class="mb-3">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" name="name" required>
                </div>

                <!-- 이메일 -->
                <div class="mb-4">
                    <label class="form-label">이메일</label>
                    <input type="email" class="form-control" name="email" required>
                </div>

                <button class="btn btn-dark w-100 mb-3">아이디 찾기</button>
            </form>

            <!-- 아래 링크 -->
            <div class="d-flex justify-content-between">
                <a href="login.jsp" class="custom-link">로그인</a>
                <a href="findPw.jsp" class="custom-link">비밀번호 찾기</a>
            </div>

        </div>
    </div>
</div>