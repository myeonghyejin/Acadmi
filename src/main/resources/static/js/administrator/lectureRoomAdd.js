$.ajax({
    url: "./lectureRoomAdd", // 요청을 보낼 URL
    type: "POST", // HTTP 메서드 (POST, GET 등)
    data: yourData, // 전송할 데이터
    success: function(response) {
      // 성공적으로 요청이 처리되었을 때의 콜백 함수
      alert("요청이 성공적으로 처리되었습니다.");
    },
    error: function(xhr, status, error) {
      // 요청이 실패하거나 오류가 발생했을 때의 콜백 함수
      alert("중복된 값이 존재합니다.");
    }
  });