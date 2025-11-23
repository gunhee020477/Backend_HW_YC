<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>
/* --- Fade In Animation --- */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* --- Input Focus --- */
.form-control:focus {
    border-color:#000;
    box-shadow:0 0 4px rgba(0,0,0,0.45);
}

/* --- Button Hover --- */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover { background:#000; transform:translateY(-2px); }
</style>

<!-- 관리자 로그인 실패 메시지 -->
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<div class="alert alert-danger text-center mt-3" role="alert">
    <%= error %>
</div>
<% } %>

<div class="container mt-5" style="max-width:400px;">
    <div class="card shadow fade-card">
        <div class="card-body">

            <h3 class="text-center mb-4">관리자 로그인</h3>

            <form action="adminLogin" method="post">

                <div class="mb-3">
                    <label class="form-label">관리자 ID</label>
                    <input type="text" class="form-control" name="adminid" required>
                </div>

                <div class="mb-4">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="password" required>
                </div>

                <button class="btn btn-dark w-100">로그인</button>

            </form>

        </div>
    </div>
</div>