<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.UserDTO" %>
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
    box-shadow:0 0 4px rgba(0,0,0,0.45);
}

/* --- Button Style --- */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover { background:#000; transform:translateY(-2px); }
</style>

<%
    UserDTO user = (UserDTO) request.getAttribute("user");
    if (user == null) {
%>
<div class="alert alert-danger text-center mt-3">잘못된 접근입니다. 다시 로그인해주세요.</div>
<%
        return;
    }
%>

<div class="container mt-5">
    <div class="card shadow p-4 fade-card" style="max-width: 500px; margin:auto;">

        <h3 class="text-center mb-4">회원 정보 수정</h3>
        <hr>

        <form action="editUser" method="post">

            <!-- 아이디(수정 불가) -->
            <div class="mb-3">
                <label class="form-label">아이디</label>
                <input type="text" class="form-control" value="<%= user.getUserid() %>" disabled>
                <input type="hidden" name="userid" value="<%= user.getUserid() %>">
            </div>

            <!-- 이름 -->
            <div class="mb-3">
                <label class="form-label">이름</label>
                <input type="text" class="form-control" name="name" value="<%= user.getName() %>" required>
            </div>

            <!-- 이메일 -->
            <div class="mb-4">
                <label class="form-label">이메일</label>
                <input type="email" class="form-control" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <!-- 제출 버튼 -->
            <button class="btn btn-dark w-100">수정하기</button>
        </form>

    </div>
</div>