/*$(".submitButton").on("click", function(){
    let num = $(".submitButton").attr("data-qna-num");

    $.ajax({
        url: "/qna/reply",
        type: "POST",
        data: {
            num: num
        },
        success: function() {

        }
    });

})

*/


/* $("#replyAdd").on("click", function(){
    let contents = $("#replyContents").val();
    let num = $("#replyAdd").attr("data-qna-num");

    $.ajax({
        url: "/qna/reply",
        type: "POST",
        data: {
            contents: contents,
            num: num
        },
        success: function(res) {
            if(res.trim() > 0) {
                alert('댓글이 등록 되었습니다');
                $("#replyContents").val('');
                getList(1);
            } else {
                alert('댓글 등록이 실패했습니다');
            }
        },
        error: function() {
            alert('댓글 등록이 실패했습니다');
        }
    });
});

getList(1);

function getList(page){
    $.ajax({
        url: "/qnaComment/qnaCommentList",
        type: "GET",
        data: {
            num: $("#replyAdd").attr("data-qna-num"),
            page: page
        },
        success: function(res) {
            $("#commentListResult").html(res.trim());
        },
        error: function() {
            alert('댓글 목록을 가져오는데 실패했습니다');
        }
    });
}

$("#commentListResult").on("click", ".page-link", function() {
    let page = $(this).attr("data-board-page");
    getList(page);
});

$("#commentListResult").on("click", ".del", () => {
    let commentNum = $(".del").attr("data-comment-num");

    $.ajax({
        url: "/qnaComment/qnaCommentDelete",
        type: "POST",
        data: {
            commentNum: commentNum
        },
        success: function() {
            alert('댓글이 삭제 되었습니다');
            getList(1);
        },
        error: function() {
            alert('삭제가 실패했습니다');
        }
    });
});

$("#commentListResult").on("click", ".update", function(e){
    let commentNum = $(this).attr("data-comment-num");

    $("#contents").val($("#contents"+commentNum).text());

    $("#contentsConfirm").attr("data-comment-num", commentNum);

    e.preventDefault();
});

$("#contentsConfirm").click(function(){
    let commentNum = $(this).attr("data-comment-num");
    let contents = $("#contents").val();

    $.ajax({
        url: "/qna/qnaCommentUpdate",
        type: "POST",
        data: {
            commentNum: commentNum,
            contents: contents
        },
        success: function() {
            alert('댓글이 수정 되었습니다');
            $("#closeModal").click();
            getList(1);
        },
        error: function() {
            alert('댓글 수정을 실패했습니다');
        }
    });
});*/