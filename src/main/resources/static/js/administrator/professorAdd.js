let check = [true,true,true,true,true,true,true,true,true]


//입학년도 필수사항
$("#year").blur(function() {
    if($("#year").val() == '') {
        check[0] = false
        $("#yearResult").html("<p style='color : red;'>입학 연도는 필수 사항입니다.</p>")
    }else {
       check[0] = true
       $("#yearResult").html("")
    }
})

//비밀번호 필수사항
$("#password").blur(function() {
    if($("#password").val()== '') {
        check[1] = false
        $("#passwordResult").html("<p style='color : red;'>비밀번호는 필수 사항입니다.</p>")
    }else {
       check[1] = true
       $("#passwordResult").html("")
    }
})

//이메일 필수사항
$("#email").blur(function() {
    if($("#email").val() == '') {
        check[2] = false
        $("#emailResult").html("<p style='color : red;'>이메일은 필수 사항입니다.</p>")
    }else {
        check[2] = true
        $("#emailResult").html("")
    }
})

//이름 필수사항
$("#name").blur(function() {
    if($("#name").val() == '') {
        check[3] = false
        $("#nameResult").html("<p style='color : red;'>이름은 필수 사항입니다.</p>")
    }else {
        check[3] = true
        $("#nameResult").html("")
    }
})

//전화번호 필수사항
$("#phone").blur(function() {
    if($("#phone").val() == '') {
        check[4] = false
        $("#phoneResult").html("<p style='color : red;'>전화번호는 필수 사항입니다.</p>")
    }else {
        check[4] = true
        $("#phoneResult").html("")
    }
})

//교수사무실 필수사항
$("#professorRoom").blur(function() {
    if($("#professorRoom").val() == '') {
        check[5] = false
        $("#roomResult").html("<p style='color : red;'>교수 사무실은 필수 사항입니다.</p>")
    }else {
        check[5] = true
        $("#roomResult").html("")
    }
})
//학과 필수사항
$("#dept").blur(function() {
    if($("#dept").val() == '') {
        check[6] = false
        $("#deptResult").html("<p style='color : red;'>학과는 필수 사항입니다.</p>")
    }else {
        check[6] = true
        $("#deptResult").html("")
    }
})

//생년월일 필수사항
$("#birth").blur(function() {
    if($("#birth").val() == '') {
        check[7] = false
        $("#birthResult").html("<p style='color : red;'>생년월일은 필수 사항입니다.</p>")
    }else {
        check[7] = true
        $("#birthResult").html("")
    }
})

//주소 필수사항
$("#address_kakao").blur(function() {
    if($("#address_kakao").val() == '') {
        check[8] = false
        $("#addressResult").html("<p style='color : red;'>주소는 필수 사항입니다.</p>")
    }else {
        check[8] = true
        $("#addressResult").html("")
    }
})


$("#professorBtn").click(function() {
    if(!check.includes(false)) {
        // console.log("성공")
        $("#professorForm").submit()
        //console.log("test1")
    }
    else {
        // console.log("실패")
        alert("모든 사항을 입력하세요.")
        
    }
})

//취소
$("#backBtn").click(function() {
    let back = confirm("취소하시겠습니까?")

    if(back == true) {
        location.href="/"
    }else {
        return;
    }
})