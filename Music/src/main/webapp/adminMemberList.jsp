<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.UserDTO" %>
<%@ include file="navbar.jsp" %>

<%
    List<UserDTO> list = (List<UserDTO>) request.getAttribute("users");
%>

<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<style>
/* Fade Up 애니메이션 */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}
.fade-card { animation: fadeInUp 0.7s ease-out; }

/* 테이블 hover 효과 */
.table-hover tbody tr:hover {
    background-color: #f2f2f2;
    transition: 0.2s;
}

/* 삭제 버튼 hover */
.btn-danger { transition: 0.25s ease; }
.btn-danger:hover { transform: translateY(-2px); }

</style>

<div class="container mt-5" style="max-width:900px;">
    <div class="card shadow p-4 fade-card">

        <h3 class="mb-4"><i class="bi bi-people-fill"></i> 회원 목록</h3>

        <table class="table table-striped table-bordered table-hover align-middle shadow-sm">
            <thead class="table-dark text-center">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
                <th width="120">관리</th>
            </tr>
            </thead>

            <tbody>
            <%
                if (list != null) {
                    for (UserDTO u : list) {
            %>
                <tr>
                    <td><%= u.getUserid() %></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td class="text-center">
                        <a href="adminDeleteUser?userid=<%= u.getUserid() %>"
                           class="btn btn-sm btn-danger">
                            <i class="bi bi-trash-fill"></i> 삭제
                        </a>
                    </td>
                </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>

    </div>
</div>