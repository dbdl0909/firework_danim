var mainslider;

$(document).ready(function(){
    var options = {
        slides: '.slide', // The name of a slide in the slidesContainer
        swipe: true,    // Add possibility to Swipe > note that you have to include touchSwipe for this
        transition: "fade", // Accepts "slide" and "fade" for a slide or fade transition
        slideTracker: true, // Add a UL with list items to track the current slide
        slideTrackerID: 'slideposition', // The name of the UL that tracks the slides
        slideOnInterval: true, // Slide on interval
        interval: 6000, // Interval to slide on if slideOnInterval is enabled
        animateDuration: 1000, // Duration of an animation
        animationEasing: 'ease', // Accepts: linear ease in out in-out snap easeOutCubic easeInOutCubic easeInCirc easeOutCirc easeInOutCirc easeInExpo easeOutExpo easeInOutExpo easeInQuad easeOutQuad easeInOutQuad easeInQuart easeOutQuart easeInOutQuart easeInQuint easeOutQuint easeInOutQuint easeInSine easeOutSine easeInOutSine easeInBack easeOutBack easeInOutBack
        pauseOnHover: false // Pause when user hovers the slide container
    };


    $(".slider").on("init", function(event){
        console.log(event);
    });

    $(".slider").simpleSlider(options);
    mainslider = $(".slider").data("simpleslider");
    /* yes, that's all! */

    $(".slider").on("beforeSliding", function(event){
        var prevSlide = event.prevSlide;
        var newSlide = event.newSlide;
        $(".slider .slide[data-index='"+prevSlide+"'] .slidecontent").fadeOut();
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent").hide();
    });

    $(".slider").on("afterSliding", function(event){
        var prevSlide = event.prevSlide;
        var newSlide = event.newSlide;
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent").fadeIn();
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent span").hide();
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent span").css('margin-top', '800px');
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent span").fadeIn().animate({marginTop:'-30px'},500);
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent span").fadeIn().animate({marginTop:'0px'},500);
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent h1").hide();
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent h1").css('margin-top', '800px');
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent h1").fadeIn().animate({marginTop:'-30px'},1000);
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent h1").fadeIn().animate({marginTop:'20px'},500);
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent div").hide();
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent div").css('margin-top', '800px');
        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent div").fadeIn().animate({marginTop:'20px'},1500);
    });

    $(".slide#first").backstretch("resources/images/img1.jpg");
    $(".slide#sec").backstretch("resources/images/img2.jpg");

    $('.slide .backstretch img').on('dragstart', function(event) { event.preventDefault(); });

    $(".slidecontent").each(function(){
        $(this).css('margin-top', -$(this).height()/2);
    });
});
