<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String pageType = (String) request.getAttribute("pageType");
    if (pageType == null) pageType = "login";

    Object loginUserObj = session.getAttribute("loginUser");
    Object adminUserObj = session.getAttribute("adminUser");
%>

<!-- ################ LOGIN ################ -->
<% if (pageType.equals("login")) { %>

<div class="blur-card" style="max-width:450px; width:100%;">
    <h3 class="text-center text-glow mb-4">로그인</h3>

    <% if (request.getAttribute("msg") != null) { %>
        <div class="alert <%= "success".equals(request.getAttribute("msgType")) ? "alert-success" : "alert-danger" %>">
            <%= request.getAttribute("msg") %>
        </div>
    <% } %>

    <form action="login" method="post">
        <input class="form-control mb-3" name="userid" placeholder="아이디">
        <input class="form-control mb-3" type="password" name="password" placeholder="비밀번호">
        <button class="btn btn-main w-100 py-2">로그인</button>
    </form>

    <div class="text-center mt-3">
        <a href="page.jsp?view=findId" style="color:#ccc; margin-right:10px;">아이디 찾기</a>
        <span style="color:#666;">|</span>
        <a href="page.jsp?view=findPw" style="color:#ccc; margin:0 10px;">비밀번호 찾기</a>
        <span style="color:#666;">|</span>
        <a href="page.jsp?view=register" style="color:#ccc; margin-left:10px;">회원가입</a>
        <br>
        <a href="page.jsp?view=adminLogin"
           style="color:#ff6b8b; margin-top:12px; display:inline-block; font-weight:600;">
            🛠 관리자 로그인
        </a>
    </div>
</div>

<% } %>

<!-- ################ REGISTER ################ -->
<% if (pageType.equals("register")) { %>

<div class="blur-card" style="max-width:500px; width:100%;">
    <h3 class="text-center text-glow mb-4">회원가입</h3>

    <form action="register" method="post">
        <input class="form-control mb-3" name="userid" placeholder="아이디">
        <input class="form-control mb-3" name="password" placeholder="비밀번호">
        <input class="form-control mb-3" name="name" placeholder="이름">
        <input class="form-control mb-3" name="email" placeholder="이메일">
        <button class="btn btn-main w-100 py-2">회원가입</button>
    </form>

    <a href="page.jsp?view=login" class="btn btn-outline-light mt-3 w-100"
       style="border-color:rgba(255,255,255,0.3); color:#ddd;">← 뒤로 가기</a>
</div>

<% } %>

<!-- ################ FIND ID ################ -->
<% if (pageType.equals("findId")) { %>

<div class="blur-card" style="max-width:500px; width:100%;">
    <h3 class="text-center text-glow mb-4">🔎 아이디 찾기</h3>

    <%-- ★★★ 결과 메시지 출력 (중요!) --%>
    <% if (request.getAttribute("msg") != null) { %>
        <div class="alert 
            <%= "success".equals(request.getAttribute("msgType")) 
                 ? "alert-success" : "alert-danger" %>">
            <%= request.getAttribute("msg") %>
        </div>
    <% } %>

    <form action="findId" method="post">
        <input class="form-control mb-3" name="name" placeholder="이름">
        <input class="form-control mb-3" name="email" placeholder="이메일">
        <button class="btn btn-main w-100 py-2">아이디 찾기</button>
    </form>

    <a href="page.jsp?view=login"
       class="btn btn-outline-light mt-3 w-100"
       style="border-color:rgba(255,255,255,0.3); color:#ddd;">← 뒤로 가기</a>
</div>

<% } %>

<!-- ################ FIND PW ################ -->
<% if (pageType.equals("findPw")) { %>

<div class="blur-card" style="max-width:500px; width:100%;">
    <h3 class="text-center text-glow mb-4">🔐 비밀번호 찾기</h3>

    <%-- ★★★ 결과 메시지 출력 (중요!) --%>
    <% if (request.getAttribute("msg") != null) { %>
        <div class="alert 
            <%= "success".equals(request.getAttribute("msgType")) 
                 ? "alert-success" : "alert-danger" %>">
            <%= request.getAttribute("msg") %>
        </div>
    <% } %>

    <form action="findPw" method="post">
        <input class="form-control mb-3" name="userid" placeholder="아이디">
        <input class="form-control mb-3" name="name" placeholder="이름">
        <input class="form-control mb-3" name="email" placeholder="이메일">
        <button class="btn btn-main w-100 py-2">임시 비밀번호 발급</button>
    </form>

    <a href="page.jsp?view=login"
       class="btn btn-outline-light mt-3 w-100"
       style="border-color:rgba(255,255,255,0.3); color:#ddd;">← 뒤로 가기</a>
</div>

<% } %>

<% if (pageType.equals("adminLogin")) { %>
<div class="blur-card" style="max-width:450px; width:100%;">
    <h3 class="text-center text-glow mb-4">🛠 관리자 로그인</h3>

    <% if (request.getAttribute("msg") != null) { %>
        <div class="alert  
            <%= "success".equals(request.getAttribute("msgType")) 
                 ? "alert-success" : "alert-danger" %>">
            <%= request.getAttribute("msg") %>
        </div>
    <% } %>

    <form action="adminLogin" method="post">
        <input class="form-control mb-3" name="adminid" placeholder="관리자 ID">
        <input class="form-control mb-3" name="password" placeholder="비밀번호">
        <button class="btn btn-main w-100 py-2">로그인</button>
    </form>

    <a href="page.jsp?view=login"
       class="btn btn-outline-light mt-3 w-100"
       style="border-color:rgba(255,255,255,0.3); color:#ddd;">← 뒤로 가기</a>
</div>
<% } %>

<!-- ########################################################
     🔹 관리자 메인
######################################################## -->
<% if (pageType.equals("adminMain")) { %>

    <% if (adminUserObj == null) { %>
        <script>alert("관리자 로그인이 필요합니다."); location.href="page.jsp?view=adminLogin";</script>
    <% } else { %>

    <div class="blur-card" style="max-width:600px; width:100%;">
        <h2 class="text-glow mb-3">🛠 관리자 대시보드</h2>

        <p style="opacity:0.85;">관리 기능을 선택하세요.</p>

        <div class="mt-4 d-flex gap-3">
            <a class="btn btn-main w-100" href="page.jsp?view=adminMember">회원 목록 보기</a>
        </div>
    </div>

    <% } %>

<% } %>



<!-- ########################################################
     🔹 관리자 회원 목록
######################################################## -->
<% if (pageType.equals("adminMember")) { %>

    <% if (adminUserObj == null) { %>
        <script>alert("관리자 로그인이 필요합니다."); location.href="page.jsp?view=adminLogin";</script>
    <% } else { %>

    <div class="blur-card" style="max-width:900px; width:100%;">
        <h2 class="text-glow mb-3">👥 회원 목록</h2>

        <table class="table table-dark table-striped mt-3"
               style="border-radius:12px; overflow:hidden;">
            <tr>
                <th style="width:20%;">ID</th>
                <th style="width:25%;">이름</th>
                <th style="width:35%;">Email</th>
                <th style="width:20%;">관리</th>
            </tr>

            <%
                java.util.List<model.UserDTO> list =
                    (java.util.List<model.UserDTO>) request.getAttribute("userList");

                if (list != null) {
                    for (model.UserDTO u : list) {
            %>
            <tr>
                <td><%= u.getUserid() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td>
                    <a class="btn btn-danger btn-sm"
                       href="admin/deleteUser?userid=<%= u.getUserid() %>">삭제</a>
                </td>
            </tr>
            <% } } %>
        </table>

        <a href="page.jsp?view=adminMain"
           class="btn btn-outline-light mt-3 w-100"
           style="border-color:rgba(255,255,255,0.3); color:#ddd;">← 관리자 메인으로</a>
    </div>

    <% } %>

<% } %>