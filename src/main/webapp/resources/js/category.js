/**
 * 
 */
function category(obj) {
    console.log(obj.value);

    if(obj.value != '-1'){
    	$('.categoryNo').val(obj.value);
    }
    // AJAX 요청을 통해 해당 카테고리 데이터를 가져옴
    $.ajax({
        url: '/category/' + $('.categoryNo').val(),
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log(data);
            
            let category = '<option value='+$('.categoryNo').val()+'>선택</option>';
            let li = '<li data-value='+$('.categoryNo').val()+' class="option selected focus">선택</li>';

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

            $(obj).next().next().val($('.categoryNo').val()).prop('selected', true);
            		
    		// $(obj).next().next().next().find('li').eq(0).trigger('click');  // 첫 번째 li 항목 클릭 이벤트 트리거
    		// $(obj).next().next().next().find('li').eq(0).trigger('click');  // 첫 번째 li 항목 클릭 이벤트 트리거 
    		
    		if($('#mid_class').val() != '05'){
    			$('#low_class').next().show();
    		}else if($('#mid_class').val() == '05'){
    			$('#low_class').next().hide();
    		}
    		

            // 북리스트 페이지 불러오기
            getBookList();

        },
        error: function(data, status) {
            console.error("Error fetching category data:", status);
            // 오류 처리 로직 추가 가능
        }
    });
}

function getBookList(){
	
    $.ajax({
        url: '/bookList/category/' + $('.categoryNo').val(),
        type: 'GET',
        dataType: 'json',
        success: function(result) {
        	let data = result.list;
           // console.log(result);
           // console.log(data);
            	let inputHTML = ''
            	
            	if(data.length == 0){
            		inputHTML += `<tr><td colspan=6 style="text-align: center;">검색된 결과가 없습니다.</td></tr>`;
            	}
            	
            	$.each(data,function(i,row){
            		inputHTML += `<tr onclick="location.href='/bookList/bookDetail?bookNo=${row.bookNo}';" style='cursor:pointer;'>>`
            		inputHTML += `<td><img src='${row.thumbNail}'></td>`
            		inputHTML += `<td>${row.title}</td>`
            		inputHTML += `<td>${row.author}</td>`
            		inputHTML += `<td>${row.publisher}</td>`
            		let dd = longodate(row.pubDate);
            		inputHTML += `<td>${dd}</td>`
            		let price = parseInt(row.salePrice).toLocaleString('ko-KR',{ style: "currency", currency: "KRW" });
            		inputHTML += `<td>${price}</td>`
            		inputHTML += `<td>${row.zzim}</td>`
            		inputHTML += `<td>${row.reviewCnt}</td>`
            		inputHTML += '</tr>'
            	});
            	
            	$('.table tbody').html(inputHTML);
            	// 페이징
            	categoryPaging(result);
            	
            	
            
        },
        error: function(data, status) {
            console.error("Error fetching book list data:", status);
            // 오류 처리 로직 추가 가능
        }
    });
}
// 날짜 yyyy-mm-dd형식으로 표현하여 주는 함수
function longodate(datetime){
	let today=new Date(datetime);
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;
	
	return dateString
}
function categoryPaging(obj){
	console.log(obj.pi);

    let paginationInfo = obj.pi;
	
	let inputHtml = '';

    if(paginationInfo.pageNo > 1){
        inputHtml += `<li class="page-item"><a class="page-link" href="javascript:getBookListPaging(${paginationInfo.pageNo-1},${paginationInfo.viewPostCntPerPage})">Previous</a></li>`;
    }
	for(let i=paginationInfo.startPageNoCurBlock; i<=paginationInfo.endPageNoCurBlock; i++){
        if(paginationInfo.pageNo == i){
            inputHtml += `<li class="page-item active" id="${i}"><a class="page-link" href="javascript:getBookListPaging(${i},${paginationInfo.viewPostCntPerPage})">${i}</a></li>`;
        }else{
            inputHtml += `<li class="page-item" id="${i}"><a class="page-link" href="javascript:getBookListPaging(${i},${paginationInfo.viewPostCntPerPage})">${i}</a></li>`;
        }
    }
    if(paginationInfo.pageNo < paginationInfo.totalPageCnt){
        inputHtml +=`<li class="page-item"><a class="page-link" href="javascript:getBookListPaging(${paginationInfo.pageNo+1},${paginationInfo.viewPostCntPerPage})">Next</a></li>`;
    }

    $('ul.pagination').html(inputHtml);	
}

// 페이징하여 booklist를 가지고 오는 함수
function getBookListPaging(pageNo,pageSize){
	
    $.ajax({
        url: '/bookList/category/' + $('.categoryNo').val()+'?pageNo='+pageNo+'&pagingSize='+pageSize,
        type: 'GET',
        dataType: 'json',
        success: function(result) {
        	let data = result.list;
           // console.log(result);
           // console.log(data);
            	let inputHTML = '';
            	
            	$.each(data,function(i,row){
            		inputHTML += `<tr onclick="location.href='/bookList/bookDetail?bookNo=${row.bookNo}';" style='cursor:pointer;'>`;
            		inputHTML += `<td><img src='${row.thumbNail}'></td>`
            		inputHTML += `<td>${row.title}</td>`
            		inputHTML += `<td>${row.author}</td>`
            		inputHTML += `<td>${row.publisher}</td>`
            		let dd = longodate(row.pubDate);
            		inputHTML += `<td>${dd}</td>`
            		let price = parseInt(row.salePrice).toLocaleString('ko-KR',{ style: "currency", currency: "KRW" });
            		inputHTML += `<td>${price}</td>`
            		inputHTML += `<td>${row.zzim}</td>`
            		inputHTML += `<td>${row.reviewCnt}</td>`
            		inputHTML += '</tr>'
            	});
            	
            	$('.table tbody').html(inputHTML);
            	// 페이징
            	categoryPaging(result);
            	
        },
        error: function(data, status) {
            console.error("Error fetching book list data:", status);
            // 오류 처리 로직 추가 가능
        }
    });
}