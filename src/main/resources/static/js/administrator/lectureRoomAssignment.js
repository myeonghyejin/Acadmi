$("#table1").on("click", '[data-lecture]',function() {

    console.log("test")
    let lectureBuilding = $(this).attr('data-lectureBuilding')
    let lectureRoom = $(this).attr('data-lectureRoom')
    let lectureNum = $(this).attr('data-lectureNum')

    $.ajax ({
        uri : './lectureRoomAssignment',
        type : 'POST',
        data : {
            lectureNum : lectureNum,
            lectureBuilding :lectureBuilding,
            lectureRoom : lectureRoom
        },

        success : function(response) {
            alert("배정 되었습니다")
            location.href = './lectureList'
        }
    })
})