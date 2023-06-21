$('#table2').on('click', '[data-dept]', function() {
    let status = $(this).parents('.dept').find('.select2').val();
    
    let deptNum = $(this).attr('data-dept')
     
    $.ajax ({
        url : './departmentList',
        type : 'POST',
        data : {
            deptNum : deptNum,
            status : status
        },
        success : function(response) {
            alert("수정되었습니다.")
            location.href='./departmentList'
        }
    })
})