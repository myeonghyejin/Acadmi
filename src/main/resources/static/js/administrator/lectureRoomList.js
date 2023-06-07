let button = $('[data-lecture]')

$('#table1').on("click",'[data-lecture]',function() {

    let status = $(this).parents('.find').find('.status').val();
     console.log(status)
     
    let lectureBuilding = $(this).attr('data-lectureBuilding')
    let lectureRoom = $(this).attr('data-lectureRoom')

    $.ajax ({
        url :    './lectureRoomList',
        type : 'POST',
        data : {
            lectureBuilding : lectureBuilding,
            lectureRoom : lectureRoom,
            status : status,
        },
        success : function(response) {
            alert("수정되었습니다")
            location.href = './lectureRoomList'
        }
   })
})

