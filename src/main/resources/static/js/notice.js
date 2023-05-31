
$(".submitButton").on("click", function(){

    if($("#important").prop("checked")) {
        $("#important").val(1);
    } else {
        $("#important").val(0);
    }
})

$(document).ready(function(){

    $.ajax({
        url: "/notice/importantList",
        type: "GET",
        data : {
            important : 1
        },
        success: function(result) {
            $(".importantList").html(result);
        }
    })

})


