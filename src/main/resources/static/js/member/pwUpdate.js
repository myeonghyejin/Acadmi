const password = document.getElementById("password");
const passwordCheck = document.getElementById("passwordCheck");

let check = [false];

// Password required
password.addEventListener("blur", function(){
    if ($('#password').val() != $('#passwordCheck').val()) {
		console.log('비밀번호 다름')
		if($('#pwChkMsg').text() == '') {
			      $('#pwCheck').append("<p id='pwChkMsg' style='color: red;'>비밀번호가 다릅니다.</p>");
		}
  
    } else {
       	$('#pwChkMsg').text('');
    }
});

passwordCheck.addEventListener("blur", function(){
    if ($('#password').val() != $('#passwordCheck').val()) {
		console.log('비밀번호 다름')
		if($('#pwChkMsg').text() == '') {
			      $('#pwCheck').append("<p id='pwChkMsg' style='color: red;'>비밀번호가 다릅니다.</p>");
		}
  
    } else {
       	$('#pwChkMsg').text('');
    }
});
