$(document).ready(function(){

    $.ajax({
        url: "/qna/replyDetail",
        type: "GET",
        data: {
            ref: $(".replyDetail").attr("data-num-id"),
            step: 1
        },
        success: function(result) {
            $(".replyDetail").html(result);
        },
    });
})

$(document).ready(function(){

    $.ajax({
        url: "/lectureQna/replyDetail",                         
        type: "GET",
        data: {
            ref: $(".replyDetail").attr("data-num-id"),
            step: 1
        },
        success: function(result) {
            $(".replyDetail").html(result);
        },
    });
})