/**
 * 
 */
function category(obj){
	console.log(obj.value)
	
	// if(obj.value == '-1'){
	// 	$(obj).next().val("-1").prop("selected", true); //값이 1인 option 선택
	// }
	
	
		$.ajax({
        url : '/category/'+obj.value,
        type : 'GET',
        dataType : 'json',
        success : function(data){
            console.log(data);
            // let downCat = data.genreCode;
            let category = '';
            let li = '';
            for(let i=0; i<data.length; i++){
               // if(data[i].genreCode.length == obj.value.length+2){
                    category += "<option value="+data[i].genreCode+">"+data[i].genreName+"</option>";
                    if(i== 0){
                        li += "<li data-value="+data[i].genreCode+" class='option selected focus'>"+data[i].genreName+"</li>";
                    }
                    else{
                        li += "<li data-value="+data[i].genreCode+" class='option'>"+data[i].genreName+"</li>";
                    }
                    
               // } 
            }
            //$(obj).next().html(category);
            //$(obj).next().next().html(category);
            $(obj).next().next().html(category);
            $(obj).next().next().next().children('span').text(data[0].genreName)
            $(obj).next().next().next().children('ul').html(li);
        },
        error : function(data, status){

        }

    })
    
}