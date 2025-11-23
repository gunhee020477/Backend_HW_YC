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

/* --- Buttons Hover --- */
.btn-dark { transition:0.25s ease; }
.btn-dark:hover { background-color:#000; transform: translateY(-2px); }

.btn-outline-danger { transition:0.25s ease; }
.btn-outline-danger:hover { transform: translateY(-2px); }
</style>

<%
    // 로그인 체크
    UserDTO user = (UserDTO) request.getAttribute("user");
    if (user == null) {
%>
<div class="alert alert-danger text-center mt-3">
    잘못된 접근입니다. 다시 로그인해주세요.
</div>
<%
        return;
    }
%>

<div class="container mt-5">
    <div class="card shadow p-4 fade-card" style="max-width: 600px; margin: auto;">
        
        <h3 class="mb-3 text-center">마이페이지</h3>
        <hr>

        <div class="mb-3">
            <p><strong>아이디:</strong> <%= user.getUserid() %></p>
            <p><strong>이름:</strong> <%= user.getName() %></p>
            <p><strong>이메일:</strong> <%= user.getEmail() %></p>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <a href="editUser" class="btn btn-dark w-50 me-2">정보 수정</a>
            <a href="deleteUser.jsp" class="btn btn-outline-danger w-50 ms-2">회원 탈퇴</a>
        </div>

    </div>
</div>