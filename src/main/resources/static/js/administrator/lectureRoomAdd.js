let check= [false,false,false]

 //강의실호수 필수입력사항
 
$("#lectureRoom").blur(function() {
    if($("#lectureRoom").val() == '') {
        check[0] = false
        $("#lecture").html("<p style='color : red;'>강의실 호수는 필수 사항입니다.</p>")

    }else {
        $.ajax ( {
            url : './lectureRoomDuplicateCheck',
            type : 'GET',
            data : {
                lectureBuilding : $('#lectureBuilding').val(),
                lectureRoom : $('#lectureRoom').val()
            },
    
            success : function(result) {
                console.log(result)
                if(result) {
                    $("#lecture").html("<p>등록 가능한 강의실입니다.</p>")
                    check[0] = true
                }else {
                    $("#lecture").html("<p style='color : red;'>중복된 강의실입니다.</p>")
                    check[0] = false
                }
            },
            error :function() {
                console.log("error")
            }
        })
    }

   

}) 

$("#personal").blur(function() {
    if($("#personal").val()== '') {
        check[1] = false
        $("#personalResult").html("<p style='color : red;'>최대 수용 인원은 필수 사항입니다.</p>")
    }else {
       check[1] = true
       $("#personalResult").html("")
    }
})

if($("#radioPrimary1").val() == 1) {
    check[2] = true
}

$("#roomAdd").click(function() {
    if(!check.includes(false) || check[2]) {
        if($("#lectureRoom").val() == '') {
            alert("강의실 호수는 필수 사항입니다")
            return
        }
        if(!check[0]) {
            alert("중복된 강의실입니다")
            return;
        }
        if(!check[1]) {
            alert("최대 수용 인원을 입력하세요")
            return;
        }
        //console.log("성공")
        $("#lectureRoomForm").submit()
    }
})

//취소
$("#backBtn").click(function() {
    let back = confirm("정말 취소하시겠습니까?")

    if(back == true) {
        location.href="../administrator/lectureRoomList"
    }else {
        return;
    }
})