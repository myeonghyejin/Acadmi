
$("#tableAdmin").on("click", '[data-lecturenum]', function() {
    let lectureNum = $(this).attr('data-lecturenum')


   
    let confirm = prompt("강의 번호를 입력하세요.") 

    console.log(confirm)
    console.log(lectureNum)

    if(confirm === lectureNum) {
       
    $.ajax ({
        url : "./lectureList",
        type : 'POST',
        data : {
            lectureNum : lectureNum
        },
        
        success : function() {
            alert("폐강되었습니다.")
           
            location.href="./lectureList"
            
        }
    })
    }else if(confirm === null){
        return false;
        
        
    }else{
        alert("강의 번호를 다시 입력해주세요.")
    }


})