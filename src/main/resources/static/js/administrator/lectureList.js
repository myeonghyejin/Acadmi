let button = $('[data-lectureNum]')

$("#tableAdmin").on("click", '[data-lectureNum]', function() {
    let confirm = prompt("강의 번호를 입력하세요.") 

    let lectureNum = $(this).attr('data-lectureNum')

    $.ajax ({
        url : "./lectureList",
        type : 'POST',
        data : {
            lectureNum : lectureNum
        },
        

    })
})