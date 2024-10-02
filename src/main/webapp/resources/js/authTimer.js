function startTimer() {
    let timer = 180; 
    let timerInterval = setInterval(() => {
        let min = Math.floor(timer / 60);  
        let sec = String(timer % 60).padStart(2, '0'); 

        $('.timer').html(`남은시간 : ${min}:${sec}`);

        if (timer <= 0) {
            // clearInterval: setInterval에 의해 설정된 반복 실행을 중단
            // 이 메서드는 setInterval 함수의 반환 값인 ID(timerInterval)를 사용하여 해당 반복을 중단함
            clearInterval(timerInterval);  // 더 이상 타이머가 작동하지 않도록 반복 중지
			alert('인증 시간이 만료되었습니다. 다시 시도하세요.');
            $('#emailAuth').remove();
            $("#email").focus();
        } 
       	--timer; // 1초 감소
 
    }, 1000);  // 1000ms (1초)마다 실행
}
