<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>내 재생목록 - PickGok</title>

    <!-- FontAwesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/myplaylist.css">
</head>

<body class="${empty playList ? 'empty-state' : ''}">

<div class="playlist-container">

    <!-- ================= 빈 상태 ================= -->
    <c:if test="${empty playList}">
        <div class="empty-center">

            <!-- 🔥 카드 기준 래퍼 -->
            <div class="empty-card-wrapper">

                <!-- 🔥 카드 위 버튼 (한글 + 아이콘) -->
                <div class="empty-top-actions">
                    <a href="${pageContext.request.contextPath}/home"
                       class="icon-text-btn home-btn">
                        <i class="fa-solid fa-house"></i>
                        <span>홈으로</span>
                    </a>

                    <button class="icon-text-btn delete-btn"
                            onclick="clearAllHistory()">
                        <i class="fa-solid fa-trash"></i>
                        <span>삭제</span>
                    </button>
                </div>

                <!-- 🔥 중앙 카드 -->
                <div class="empty-playlist">
                    <h2 class="playlist-title">
                        <i class="fa-solid fa-headphones"></i>
                        내 재생목록 <span class="count">0</span>
                    </h2>

                    <i class="fa-solid fa-music"></i>

                    <p class="empty-title">아직 재생한 곡이 없습니다</p>
                    <p class="empty-sub">
                        PickGok이 추천하는 음악을 들어보세요 🎵
                    </p>

                    <a href="${pageContext.request.contextPath}/home"
                       class="btn-go-home">
                        음악 들으러 가기
                    </a>
                </div>

            </div>
        </div>
    </c:if>

</div>

<!-- ================= JS ================= -->
<script>
function clearAllHistory() {
    if (!confirm("모든 재생 기록을 삭제할까요?")) return;

    fetch("${pageContext.request.contextPath}/deletePlayHistory", {
        method: "POST"
    }).then(() => location.reload());
}
</script>

</body>
</html>