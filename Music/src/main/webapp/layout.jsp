<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String pageTitle = (String) request.getAttribute("pageTitle");
    if (pageTitle == null) pageTitle = "MusicSwipe";

    // contentPage가 null → 기본 pageContent.jsp
    String contentPage = (String) request.getAttribute("content");
    if (contentPage == null || contentPage.trim().equals("")) {
        contentPage = "pageContent.jsp";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title><%= pageTitle %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Glass + Gradient 네온 UI */
        .blur-card {
            background: rgba(255,255,255,0.05);
            border-radius: 22px;
            padding: 35px;
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.15);
            box-shadow:
                0 0 35px rgba(255,105,155,0.25),
                0 0 18px rgba(255,105,155,0.15);
        }

        .text-glow {
            color:#fff;
            font-weight:700;
            text-shadow:
                0 0 12px rgba(255,255,255,0.45),
                0 0 25px rgba(255,80,160,0.35);
        }

        .btn-main {
            background: linear-gradient(90deg, #ff6b8b, #ff8bd3);
            color:#fff;
            font-weight:600;
            border:none;
            padding:12px 22px;
            border-radius:10px;
            box-shadow:0 0 15px rgba(255,120,160,0.45);
        }

        .btn-main:hover {
            background: linear-gradient(90deg, #ff7c9a, #ffa1e4);
        }

        .form-control {
            background: rgba(255,255,255,0.08);
            border:1px solid rgba(255,255,255,0.2);
            color: rgba(255,255,255,0.85);
        }

        .form-control::placeholder {
            color: rgba(255,255,255,0.40);
        }

        /* 기본 레이아웃 */
        body {
            background: linear-gradient(140deg, #1b1f27 0%, #12141a 35%, #0b0d11 100%);
            color:#fff;
            min-height:100vh;
            display:flex;
            flex-direction:column;
        }

        nav {
            background: rgba(0,0,0,0.55);
            padding: 15px 25px;
        }
        nav a {
            color:#fff;
            margin-right:25px;
            font-weight:500;
            text-decoration:none;
        }
        nav a:hover {
            color:#ff6b6b;
        }

        /* 중앙 정렬 영역 */
        .layout-center {
            flex:1;
            display:flex;
            justify-content:center;
            align-items:flex-start;
            padding-top:40px;
        }
    </style>
</head>

<body>

<nav>
    <a href="page.jsp?view=main" style="font-weight:700; font-size:1.2rem;">MusicSwipe</a>

    <%
        Object loginUser = session.getAttribute("loginUser");
        Object adminUser = session.getAttribute("adminUser");

        if (adminUser != null) {
    %>
            <a href="page.jsp?view=adminMain">대시보드</a>
            <a href="page.jsp?view=adminMember">회원관리</a>
            <a href="logout">로그아웃</a>
    <%
        } else if (loginUser != null) {
    %>
            <a href="page.jsp?view=main">Home</a>
            <a href="page.jsp?view=mypage">MyPage</a>
            <a href="logout">Logout</a>
    <%
        } else {
    %>
            <a href="page.jsp?view=login">Login</a>
            <a href="page.jsp?view=register">Join</a>
    <%
        }
    %>
</nav>

<div class="layout-center">
    <jsp:include page="<%= contentPage %>" />
</div>

<script>
    // ★ 서버 세션 타임아웃 시간 (ms)
    const SESSION_TIMEOUT = 30 * 60 * 1000;  // 30분
    const WARNING_TIME = 5 * 60 * 1000;      // 5분 전 경고

    // ★ 현재 페이지가 로드된 시간
    let startTime = new Date().getTime();

    // ★ 자동 경고 띄우기
    setTimeout(() => {
        alert("⚠ 5분 뒤 자동 로그아웃됩니다.\n작업을 계속하려면 아무 페이지나 이동하세요!");
    }, SESSION_TIMEOUT - WARNING_TIME);

    // ★ 자동 로그아웃
    setTimeout(() => {
        alert("⏳ 세션이 만료되어 자동 로그아웃되었습니다.");
        location.href = "logout";  // LogoutServlet 호출
    }, SESSION_TIMEOUT);
</script>

</body>
</html>