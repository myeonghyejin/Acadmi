let button = $('[data-lecture]')

$('status0').val('0')
$('.status1').val('1')

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

// $("#table1").on("change", ".status0",function() {
   
//     button.click(function() {
//      let lectureBuilding = $(this).attr('data-lectureBuilding')
//      let lectureRoom = $(this).attr('data-lectureRoom')
//      $.ajax ({
//          url :    './lectureRoomList',
//          type : 'POST',
//          data : {
//              lectureBuilding : lectureBuilding,
//              lectureRoom : lectureRoom,
//              status : status,
//          },
//          success : function(response) {
//              alert("수정되었습니다")
//          }
//     })
//     })
//}) 
  


// $("#table1").on("change",'.status1',function() {
//     let status = $(this).val()
//     console.log(status)
//     let button = $('[data-lecture]')
//     button.click(function() {
//      let lectureBuilding = $(this).attr('data-lectureBuilding')
//      let lectureRoom = $(this).attr('data-lectureRoom')
//      $.ajax ({
//          url :    './lectureRoomList',
//          type : 'POST',
//          data : {
//              lectureBuilding : lectureBuilding,
//              lectureRoom : lectureRoom,
//              status : status,
//          },
//          success : function(response) {
//              alert("수정되었습니다")
             
//          }
//     })
//     })
 //})



