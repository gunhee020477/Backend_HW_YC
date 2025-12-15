console.log(">>> Script Loaded (v3.1 - PLAY History Added)");

document.addEventListener('DOMContentLoaded', function() {
    const playBtn = document.getElementById('playBtn');
    const audio = document.getElementById('audioPlayer');
    const progressFill = document.getElementById('progressFill');

    const heartBtn = document.querySelector('.btn-heart');
    const xBtn = document.querySelector('.btn-x'); // X 버튼
    const currentTrackIdInput = document.getElementById('currentTrackId');
    const autoPlayToggle = document.getElementById('autoPlayToggle'); // 자동재생 토글

    const contextPath = window.contextPath || '';

    // 🔥 같은 곡 중복 PLAY 기록 방지용
    let lastPlayedTrackId = null;

    // ---------------------------------------------------------
    // 1. 플레이어 기본 기능
    // ---------------------------------------------------------
    if (playBtn && audio) {
        playBtn.addEventListener('click', () => {
            const icon = playBtn.querySelector('i');

            if (audio.paused) {
                audio.play().then(() => {
                    icon.classList.remove('fa-play');
                    icon.classList.add('fa-pause');
                }).catch(error => console.error("Play error:", error));
            } else {
                audio.pause();
                icon.classList.remove('fa-pause');
                icon.classList.add('fa-play');
            }
        });

        // 🔥 실제 재생 시 서버에 PLAY 기록 전송 (곡당 1회)
        audio.addEventListener('play', () => {
            const trackId = currentTrackIdInput.value;
            if (!trackId || trackId === lastPlayedTrackId) return;

            lastPlayedTrackId = trackId;

            fetch(`${contextPath}/count`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'track_id=' + encodeURIComponent(trackId)
            });
        });

        // 진행 바
        audio.addEventListener('timeupdate', () => {
            if (audio.duration) {
                progressFill.style.width =
                    (audio.currentTime / audio.duration) * 100 + '%';
            }
        });

        // 곡 종료 시 UI 초기화
        audio.addEventListener('ended', () => {
            playBtn.querySelector('i').classList.remove('fa-pause');
            playBtn.querySelector('i').classList.add('fa-play');
            progressFill.style.width = '0%';
        });
    }

    // ---------------------------------------------------------
    // 2. 사용자 액션 처리 (Like / Skip)
    // ---------------------------------------------------------
    function handleUserAction(actionType) {
        // 로그인 체크
        if (typeof window.isLoggedIn !== 'undefined' && !window.isLoggedIn) {
            if (confirm("로그인이 필요한 서비스입니다.\n로그인 페이지로 이동하시겠습니까?")) {
                location.href = `${contextPath}/views/user/login.jsp`;
            }
            return;
        }

        const trackId = currentTrackIdInput.value;
        if (!trackId) return;

        let serverAction = '';

        if (actionType === 'heart') {
            const icon = heartBtn.querySelector('i');
            const isLiked = icon.classList.contains('fa-solid');
            serverAction = isLiked ? 'remove' : 'add';
        } else if (actionType === 'x') {
            serverAction = 'skip';
        }

        console.log(`>>> User Action: ${serverAction} (Track ID: ${trackId})`);

        fetch(`${contextPath}/like`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'track_id=' + encodeURIComponent(trackId) + '&action=' + serverAction
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {

                // 하트 UI 갱신
                if (serverAction === 'add') updateHeartUI(true);
                else if (serverAction === 'remove') updateHeartUI(false);

                // 다음 곡 로드 (remove 제외)
                if (serverAction !== 'remove' && data.nextTrack) {
                    loadNextTrack(data.nextTrack);
                }
            } else {
                alert(data.message);
            }
        })
        .catch(err => console.error("AJAX Error:", err));
    }

    // ---------------------------------------------------------
    // 하트 UI 변경
    // ---------------------------------------------------------
    function updateHeartUI(isFilled) {
        const icon = heartBtn.querySelector('i');
        if (isFilled) {
            icon.classList.remove('fa-regular');
            icon.classList.add('fa-solid');
            icon.style.color = '#e74c3c';
            heartBtn.style.borderColor = '#e74c3c';
        } else {
            icon.classList.remove('fa-solid');
            icon.classList.add('fa-regular');
            icon.style.color = '';
            heartBtn.style.borderColor = '#444';
        }
    }

    // ---------------------------------------------------------
    // 3. 다음 곡 로딩 및 자동 재생 제어
    // ---------------------------------------------------------
    function loadNextTrack(track) {
        document.querySelector('.music-title').innerText = track.title;
        document.querySelector('.artist-name').innerText = track.artist;

        audio.src = contextPath + track.filePath;
        audio.load();

        currentTrackIdInput.value = track.trackId;

        // 새 곡이므로 PLAY 기록 허용
        lastPlayedTrackId = null;

        // 하트 초기화
        updateHeartUI(false);

        const isAutoPlay = autoPlayToggle && autoPlayToggle.checked;

        if (isAutoPlay) {
            audio.play().then(() => {
                playBtn.querySelector('i').classList.remove('fa-play');
                playBtn.querySelector('i').classList.add('fa-pause');
            }).catch(e => console.log("Autoplay blocked:", e));
        } else {
            playBtn.querySelector('i').classList.remove('fa-pause');
            playBtn.querySelector('i').classList.add('fa-play');
        }
    }

    // ---------------------------------------------------------
    // 4. 이벤트 리스너 연결
    // ---------------------------------------------------------
    if (heartBtn) {
        heartBtn.onclick = () => handleUserAction('heart');
    }

    if (xBtn) {
        xBtn.onclick = (e) => {
            e.preventDefault();
            handleUserAction('x');
        };
    }
});