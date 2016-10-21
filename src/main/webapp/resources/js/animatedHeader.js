var speed = 800;
var header = 0;
var scrollCount = 0;
$(window).scroll(function(scrolled){
    if($(document).scrollTop() > 0) {	
		if(header == 0) {			
           header = 1;
            $('#header-inner').stop().animate({ marginTop:'0px' }, speed);
			$('#header').stop().animate({backgroundColor:'rgba(255,255,255,0.5)'}, speed);			
        }		
    } else {        
		if(header == 1) {			
           header = 0;
            $('#header-inner').stop().animate({ marginTop:'20px' },speed);
			$('#header').stop().animate({backgroundColor:'transparent'}, speed);			
        }  
    }
   /*
	     스크롤링시 현재 위치값과 블럭 영역의 위치값을 비교하여 해당 영역에 스크롤이 이동되었다면 안의 내용에 효과를 주기위한 코드
	    오차범위 +300으로 해당영역으로부터 위로 300px정도에서부터 내용이 나타난다.
	    클릭시 document의 top값도 같이 적용되므로 클릭했을때에도 동일하게 적용된다.
	    현재 위치 0값은 미구현 상태
	    추가로 해당 영역 안의 내용도 나타낼 예정
	    코드작성 : 김용
    */
    $('.tab').each(function() {
	    if($(this).offset().top == $(document).scrollTop() || $(this).offset().top == $(document).scrollTop()+300) {
	    	$(this).find($('.tab-headline')).fadeIn(1500);
	    	$(this).find($('.tab-headline')).animate({top:150}, '2000');
	    }  
	}); 

});


$(window).load(function () {	
	$('*[data-button]').click(function() {
	    $('html, body').animate({
	        scrollTop: $('*[data-section="'+$(this).attr('data-button')+'"]').offset().top
	}, speed);
});



function resize(){
	$('.tab').height(window.innerHeight);   
	$('.tab-headline').each(function(index, element) {
		
	$(this).css('margin-left',-$(this).width()/2);
	$(this).css('margin-top',-$(this).height()/2);	
	
	});	
	
}


$( window ).resize(function() {
resize();
});

resize();

});