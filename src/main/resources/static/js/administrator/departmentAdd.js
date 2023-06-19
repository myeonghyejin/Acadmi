let check = [false,false]

//학과 이름 필수사항
$("#deptName").blur(function() {
    if($("#deptName").val() == '') {
        check[0] = false
        $("#deptNameResult").html("<p style='color : red;'>학과 이름은 필수 사항입니다.</p>")
    }else {
       $.ajax ({
            url : './departmentDuplicateCheck',
            type : 'GET',
            data : {
                deptName : $("#deptName").val()
            },
            success  : function(result) {
                if(result) {
                    $("#deptNameResult").html("<p>등록 가능한 학과입니다.</p>")
                    check[1] = true
                }else {
                    $("#deptNameResult").html("<p style='color : red;'>중복된 학과입니다.</p>")
                    check[1] = false
                }
            }, 
            error : function() {
                console.log("error")
            }
       })
    }
})

$("#deptBtn").click(function() {
    if ($("#deptName").val() == '') {
        alert("학과 이름은 필수 사항입니다.");
        return;
   }
   if (!check[1]) {
        alert("중복된 학과입니다.");
        return;
   }

   $("#deptForm").submit()
  
})

