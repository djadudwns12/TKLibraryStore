<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상세페이지</title>



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<script>
    $(function() {
            let bDetail = $('.bDetail');
            $('#main_content').html(bDetail);
        });

</script>
<body>

	<c:import url="../header.jsp"></c:import>
	
	<div class="bDetail">
		<div class="container">
		
		    <!-- 책 상세보기 Section Begin -->
		    <section class="bookDetail" >
		        <div class="bookContainer">
		            <div class="row">
		                <div class="col-lg-6 col-md-6">
		                    <div class="product__details__pic">
		                        <div class="product__details__pic__item">
		                        
		                        <c:forEach var="bookInfo" items="${bookDetailInfo}">
		                            <img class="bookImagelarge"
                                src="${bookInfo.thumbNail}" alt="">
		                        </div>
		                       
		                    </div>
		                </div>
		                <div class="col-lg-6 col-md-6">
		                    <div class="bookBriefInfo">
		                        <h3>${bookInfo.title}</h3>
		                        <div class="product__details__rating">
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star"></i>
		                            <i class="fa fa-star-half-o"></i>
		                            <span>(18 reviews)</span>
		                        </div>
		                        <div class="author">${bookInfo.author}</div>
		                        <p>Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam
		                            vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet
		                            quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>
		                        <div class="product__details__quantity">
		                            <div class="quantity">
		                                <div class="pro-qty">
		                                    <input type="text" value="1">
		                                </div>
		                            </div>
		                        </div>
		                        <a href="#" class="primary-btn">장바구니 담기</a>
		                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a>
		                        <ul>
		                            <li><b>정가</b> <span>${bookInfo.price}</span></li>
		                            <li><b>할인가</b> <span>${bookInfo.salePrice} </span></li>
		                            <li><b>배송예정일</b> <span>주문일로부터 3일 이내</span></li>
		                            <li><b>적립</b> <span>책 정가의 10%</span></li>
		                        </ul>
		                    </div>
		                </div>
		                <div class="col-lg-12">
		                    <div class="product__details__tab">
		                        <ul class="nav nav-tabs" role="tablist">
		                            <li class="nav-item">
		                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
		                                    aria-selected="true">Description</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
		                                    aria-selected="false">Information</a>
		                            </li>
		                            <li class="nav-item">
		                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
		                                    aria-selected="false">Reviews <span>(1)</span></a>
		                            </li>
		                        </ul>
		                        <div class="tab-content">
		                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
		                                <div class="product__details__tab__desc">
		                                    <h6>책 소개</h6>
		                                    <p>${bookInfo.introduction}</p>
		                                </div>
		                            </div>
		                           
		                            </div>
		                            
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
		            </div>
		        </div>
		    </section>
		</div>
	</div>
	
	<c:import url="../footer.jsp"></c:import>


</body>
</html>