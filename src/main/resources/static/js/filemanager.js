/**
 * 
 */
const fileAdd = document.getElementById("fileAdd");
const fileList = document.getElementById("fileList");

let count = 0;
let max = 1;
let param = 'addfiles';
let idx=0;

function setCount(c){
    count = c;
}

// function setParam(p){
//     param = p;
// }

function setMax(m){
    max = m;
}

$(".deleteCheck").click(function(){
    let result = confirm('파일 영구 삭제됨');
    let ch = $(this);
    if(result){
        let fileNum = $(this).val();    //변하지 않으면 attr 변하는 속성이면 prop
        $.ajax({
            type:'POST',
            url:'./boardFileDelete',
            data:{
                fileNum:fileNum
            },
            success:function(response){
                if(response.trim() > 0){
                    alert("삭제 완료")
                    //this : ajax객체 자기 자신
                    console.log($(ch))
                    ch.parent().parent().remove();
                    count--;
                }
                else{
                    alert("삭제 실패")
                }
            },
            error:function(){

            }
        })

        //ajax DB에서 삭제
        //fetch
        // fetch("URL?P=1", {
        //     method:'GET'
        // }).then((response)=>response.text())
        // .then((res)=>{

        // })
        
        //fetch
        // fetch("URL", {
        // method: 'POST',
        // headers:{
        // 'Contents-Type':'X...'
        // },
        //     body:"p=1"
        // }).then((response)=>response.text())
        //  .then((res)=>{
                    
        //  })
        // $.get("URL?p=1", function(response){
        //      //
        // })
                    
        // $.post("URL",{p:1}, function(){

        // })        
    }
    else{
        $(this).prop('checked', false);
    }
});

$("#fileList").on("click", ".dels", function(){
    // let id = $(this).attr("data-dels-id");
    // $("#"+id).remove();
    $(this).parent().remove();
    count--;
})

// fileList.addEventListener("click", function(e){
//     if(e.target.classList.contains("dels")){
//         e.target.parentNode.remove();
//         // let id = e.target.getAttribute('data-dels-id');
//         // document.getElementById(id).remove();
//         count--;
//     }
// });

//function(){} : ()=>{}
$("#fileAdd").click(()=>{
    if(count >= max){
        alert('첨부파일은 최대 ' + max + '개 까지만 가능');
        return;
    }
        count++;

    let child = '<div class="input-group mb-3" id="f'+idx+'">';
        child = child+ '<input type="file" class="form-control" name="addfiles">'
        child = child+ '<button type="button" class="btn btn-outline-danger dels" data-dels-id="f'+idx+'">X</button>'
        // child = child + '<div>'
    $("#fileList").append(child);

    idx++;
});