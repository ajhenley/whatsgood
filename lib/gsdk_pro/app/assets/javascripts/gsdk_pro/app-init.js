// Dynamic load the javascript init based on features specified from view
// Combine the best practice to handle javascript invocation in rails
// http://brandonhilkert.com/blog/organizing-javascript-in-rails-application-with-turbolinks/
// https://viget.com/extend/javascript-execution-patterns-for-non-web-apps

window.App || (window.App = {});

// Get the features array
App.features = function() {
  var features = $('body').data('features');
  var featuresArray = [];
  if(features) {
    featuresArray = features.split(' ');
  }
  return featuresArray;
};

// For Rails 4 (Turbolinks Classic)
$(document).on("page:change", function() {
  // components init
  if ($.inArray('components',App.features()) >= 0) {
    var transparent = true;
    var header_height;
    var fixed_section;
    var floating = false;

    var checkScrollForPresentationNavbar = debounce(function() {
      if($(this).scrollTop() > 470 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-small');
                $('#issueButton').addClass('btn-info').removeClass('btn-neutral');

            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-small');
                $('#issueButton').addClass('btn-neutral').removeClass('btn-info');
            }
        }

        if($(this).scrollTop() > header_height ) {
                if(!floating) {
                    floating = true;
                    fixed_section.addClass('float');
                }
            } else {
                if( floating ) {
                    floating = false;
                    fixed_section.removeClass('float');
                }
            }
    }, 4);

    function activateScrollCheck(){
        $(window).on('scroll',function(){
            checkScrollForPresentationNavbar();
        });
    }
    suggestions_distance = $("#suggestions").offset();
    header_height = $('.parallax').outerHeight() + 20;
    pay_height = $('.fixed-section').outerHeight();
    fixed_section = $('.fixed-section');

    initMorphingButtons();
    initDemoChartist();
    initGoogleMaps();


    if($(document).width() > 768){
        activateScrollCheck();
    }


    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
    });
    $( "#slider-default" ).slider({
        value: 70,
        orientation: "horizontal",
        range: "min",
        animate: true
    });

    $('.radio').on('toggle', function() { });
  }

  // index init
  if ($.inArray('index',App.features()) >= 0) {
    initMorphingButtons();
    initDemoChartist();
    initGoogleMaps();
  }

  // navbar-transparent init
  if ($.inArray('navbar-transparent',App.features()) >= 0) {
    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);
  } else {
    $(window).off('scroll', gsdk.checkScrollForTransparentNavbar);
  }

  // notification init
  if ($.inArray('notification',App.features()) >= 0) {
    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);
  } else {
    $(window).off('scroll', gsdk.checkScrollForTransparentNavbar);
  }

  // template init
  if ($.inArray('template',App.features()) >= 0) {

  }

  // tutorial-html init
  if ($.inArray('tutorial-html',App.features()) >= 0) {
    var transparent = true;
    var header_height;
    var fixed_section;
    var floating = false;
    var checkScrollForPresentationNavbar = debounce(function() {
    	if($(this).scrollTop() > 470 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-small');
                $('#issueButton').addClass('btn-info').removeClass('btn-neutral');

            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-small');
                $('#issueButton').addClass('btn-neutral').removeClass('btn-info');
            }
        }

        if($(this).scrollTop() > header_height ) {
                if(!floating) {
                    floating = true;
                    fixed_section.addClass('float');
                }
            } else {
                if( floating ) {
                    floating = false;
                    fixed_section.removeClass('float');
                }
            }
    }, 4);

    suggestions_distance = $("#suggestions").offset();
    header_height = $('.parallax').outerHeight() + 20;
    pay_height = $('.fixed-section').outerHeight();
    fixed_section = $('.fixed-section');

    checkScrollForPresentationNavbar();

    $(window).on('scroll',function(){
        checkScrollForPresentationNavbar();
    });
  }

  // about-us init
  if ($.inArray('about-us',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // blog-page init
  if ($.inArray('blog-page',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // blog-post init
  if ($.inArray('blog-post',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // contact-us init
  if ($.inArray('contact-us',App.features()) >= 0) {
    var parallax_map;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         parallax_map.css('top',oVal);
     };
    responsive = $(window).width();

    examples.initContactUsMap();

    if (responsive >= 768){
        parallax_map = $('.parallax').find('.big-map');

        $(window).on('scroll',function(){
            parallax();
            gsdk.checkScrollForTransparentNavbar();
        });
    }
  }

  // ecommerce init
  if ($.inArray('ecommerce',App.features()) >= 0) {
    var big_image;
    var transparent = true;

    function checkScroll(){
      if($(document).scrollTop() > 260 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-default');
            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-default');
            }
        }
    }

    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    $(window).on('scroll', checkScroll);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
            checkScroll();
        });
    }
  }

  // home init
  if ($.inArray('home',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // pricing init
  if ($.inArray('pricing',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // product-page init
  if ($.inArray('product-page',App.features()) >= 0) {
    $(window).load(function() {
        $("#flexiselDemo1").flexisel({
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint:480,
                    visibleItems: 3
                },
                landscape: {
                    changePoint:640,
                    visibleItems: 3
                },
                tablet: {
                    changePoint:768,
                    visibleItems: 3
                }
            }
          });


       $("#flexiselDemo2").flexisel({
           enableResponsiveBreakpoints: true,
           visibleItems: 6,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint:480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint:640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint:768,
                        visibleItems: 3
                    }
                }
        });
    });
  }
});

// For Rails 5 (Turbolinks)
$(document).on("turbolinks:load", function() {
  // components init
  if ($.inArray('components',App.features()) >= 0) {
    var transparent = true;
    var header_height;
    var fixed_section;
    var floating = false;

    var checkScrollForPresentationNavbar = debounce(function() {
      if($(this).scrollTop() > 470 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-small');
                $('#issueButton').addClass('btn-info').removeClass('btn-neutral');

            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-small');
                $('#issueButton').addClass('btn-neutral').removeClass('btn-info');
            }
        }

        if($(this).scrollTop() > header_height ) {
                if(!floating) {
                    floating = true;
                    fixed_section.addClass('float');
                }
            } else {
                if( floating ) {
                    floating = false;
                    fixed_section.removeClass('float');
                }
            }
    }, 4);

    function activateScrollCheck(){
        $(window).on('scroll',function(){
            checkScrollForPresentationNavbar();
        });
    }
    suggestions_distance = $("#suggestions").offset();
    header_height = $('.parallax').outerHeight() + 20;
    pay_height = $('.fixed-section').outerHeight();
    fixed_section = $('.fixed-section');

    initMorphingButtons();
    initDemoChartist();
    initGoogleMaps();


    if($(document).width() > 768){
        activateScrollCheck();
    }


    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
    });
    $( "#slider-default" ).slider({
        value: 70,
        orientation: "horizontal",
        range: "min",
        animate: true
    });

    $('.radio').on('toggle', function() { });
  }

  // index init
  if ($.inArray('index',App.features()) >= 0) {
    initMorphingButtons();
    initDemoChartist();
    initGoogleMaps();
  }

  // navbar-transparent init
  if ($.inArray('navbar-transparent',App.features()) >= 0) {
    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);
  } else {
    $(window).off('scroll', gsdk.checkScrollForTransparentNavbar);
  }

  // notification init
  if ($.inArray('notification',App.features()) >= 0) {
    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);
  } else {
    $(window).off('scroll', gsdk.checkScrollForTransparentNavbar);
  }

  // template init
  if ($.inArray('template',App.features()) >= 0) {

  }

  // tutorial-html init
  if ($.inArray('tutorial-html',App.features()) >= 0) {
    var transparent = true;
    var header_height;
    var fixed_section;
    var floating = false;
    var checkScrollForPresentationNavbar = debounce(function() {
    	if($(this).scrollTop() > 470 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-small');
                $('#issueButton').addClass('btn-info').removeClass('btn-neutral');

            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-small');
                $('#issueButton').addClass('btn-neutral').removeClass('btn-info');
            }
        }

        if($(this).scrollTop() > header_height ) {
                if(!floating) {
                    floating = true;
                    fixed_section.addClass('float');
                }
            } else {
                if( floating ) {
                    floating = false;
                    fixed_section.removeClass('float');
                }
            }
    }, 4);

    suggestions_distance = $("#suggestions").offset();
    header_height = $('.parallax').outerHeight() + 20;
    pay_height = $('.fixed-section').outerHeight();
    fixed_section = $('.fixed-section');

    checkScrollForPresentationNavbar();

    $(window).on('scroll',function(){
        checkScrollForPresentationNavbar();
    });
  }

  // about-us init
  if ($.inArray('about-us',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // blog-page init
  if ($.inArray('blog-page',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // blog-post init
  if ($.inArray('blog-post',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         big_image.css('top',oVal);
     };

    responsive = $(window).width();

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // contact-us init
  if ($.inArray('contact-us',App.features()) >= 0) {
    var parallax_map;
    var parallax = function() {
         var current_scroll = $(this).scrollTop();

         oVal = ($(window).scrollTop() / 3);
         parallax_map.css('top',oVal);
     };
    responsive = $(window).width();

    examples.initContactUsMap();

    if (responsive >= 768){
        parallax_map = $('.parallax').find('.big-map');

        $(window).on('scroll',function(){
            parallax();
            gsdk.checkScrollForTransparentNavbar();
        });
    }
  }

  // ecommerce init
  if ($.inArray('ecommerce',App.features()) >= 0) {
    var big_image;
    var transparent = true;

    function checkScroll(){
      if($(document).scrollTop() > 260 ) {
            if(transparent) {
                transparent = false;
                $('nav[role="navigation"]').removeClass('navbar-transparent').addClass('navbar-default');
            }
        } else {
            if( !transparent ) {
                transparent = true;
                $('nav[role="navigation"]').addClass('navbar-transparent').removeClass('navbar-default');
            }
        }
    }

    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    $(window).on('scroll', checkScroll);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
            checkScroll();
        });
    }
  }

  // home init
  if ($.inArray('home',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    $(window).on('scroll', gsdk.checkScrollForTransparentNavbar);

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // pricing init
  if ($.inArray('pricing',App.features()) >= 0) {
    var big_image;
    var parallax = function() {
        var current_scroll = $(this).scrollTop();

        oVal = ($(window).scrollTop() / 3);
        big_image.css('top',oVal);
    };

    responsive = $(window).width();

    if (responsive >= 768){
        big_image = $('.parallax-image').find('img');

        $(window).on('scroll',function(){
            parallax();
        });
    }
  }

  // product-page init
  if ($.inArray('product-page',App.features()) >= 0) {
    $(window).load(function() {
        $("#flexiselDemo1").flexisel({
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint:480,
                    visibleItems: 3
                },
                landscape: {
                    changePoint:640,
                    visibleItems: 3
                },
                tablet: {
                    changePoint:768,
                    visibleItems: 3
                }
            }
          });


       $("#flexiselDemo2").flexisel({
           enableResponsiveBreakpoints: true,
           visibleItems: 6,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint:480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint:640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint:768,
                        visibleItems: 3
                    }
                }
        });
    });
  }
});
