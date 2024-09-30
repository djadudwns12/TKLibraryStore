/**
 * 
 */
function category(obj) {
    console.log(obj.value);

    // 값이 -1일 경우, 다음 요소의 값을 -1로 설정하고 선택 상태로 만듭니다.
    if (obj.value == '-1') {
        $(obj).next().val("-1").prop("selected", true); // 값이 -1인 option 선택
        //return;  // 값이 -1이면 아래의 AJAX 호출을 하지 않음
    }

    // AJAX 요청을 통해 해당 카테고리 데이터를 가져옴
    $.ajax({
        url: '/category/' + obj.value,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log(data);

            let category = '<option value="-1">선택</option>';
            let li = '<li data-value="-1" class="option selected focus">선택</li>';

            // 받아온 데이터를 바탕으로 option과 li를 생성
            for (let i = 0; i < data.length; i++) {
                category += "<option value=" + data[i].genreCode + ">" + data[i].genreName + "</option>";
                
                // 첫 번째 항목은 선택된 상태로 설정
                if (i == 0) {
                    li += "<li data-value=" + data[i].genreCode + " class='option'>" + data[i].genreName + "</li>";
                } else {
                    li += "<li data-value=" + data[i].genreCode + " class='option'>" + data[i].genreName + "</li>";
                }
            }

            // 다음 요소의 HTML을 업데이트 (select 요소와 ul 목록을 업데이트)
            $(obj).next().next().html(category);  // 두 번째 next()로 select 요소 업데이트
//				$(obj).next().next().next().children('span').text(data[0].genreName);  // 선택된 값 표시
				$(obj).next().next().next().children('span').text('선택');  // 처음값을 선택으로 세팅
            
            $(obj).next().next().next().children('ul').html(li);  // 리스트 업데이트
            		
    		$(obj).next().next().next().find('li').eq(0).trigger('click');  // 첫 번째 li 항목 클릭 이벤트 트리거
    		$(obj).next().next().next().find('li').eq(0).trigger('click');  // 첫 번째 li 항목 클릭 이벤트 트리거 

            // 북리스트 페이지 불러오기
            getBookList(obj);

        },
        error: function(data, status) {
            console.error("Error fetching category data:", status);
            // 오류 처리 로직 추가 가능
        }
    });
}

function getBookList(obj){
    $.ajax({
        url: '/bookList/category/' + obj.value,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log(data);
            if(data.length != 0){
            	let inputHTML = ''
            	
            	$.each(data,function(i,row){
            		inputHTML += `<tr onclick="location.href='/bookList/bookDetail?bookNo=${row.bookNo}';" style='cursor:pointer;'>>`
            		inputHTML += `<td>${row.title}</td>`
            		inputHTML += `<td>${row.author}</td>`
            		inputHTML += `<td>${row.publisher}</td>`
            		let dd = longodate(row.pubDate);
            		inputHTML += `<td>${dd}</td>`
            		inputHTML += `<td>${row.salePrice}</td>`
            		inputHTML += '</tr>'
            	})
            	
            	
            	$('.table tbody').html(inputHTML);
            }
        },
        error: function(data, status) {
            console.error("Error fetching book list data:", status);
            // 오류 처리 로직 추가 가능
        }
    });
}
function longodate(datetime){
	let today=new Date(datetime);
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	
	return dateString
}