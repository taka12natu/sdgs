// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap-sprockets

$(document).on('turbolinks:load', function() {

  // 画像プレビュ
  $(function () {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('.img_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
     $('.img_field').change(function () {
      readURL(this);
    });
  });

  // TOPに戻る
  $(function() {
    $('#back-to-top a').on('click',function(event){
      $('body, html').animate({
        scrollTop:0
      }, 800);
      event.preventDefault();
    });
  });

  // goal index スクロール
  $(function () {
      $('a[href^="#scroll"]').click(function () {
          var speed = 500;
          var href= $(this).attr("href");
          var target = $(href == "#" || href == "" ? 'html' : href);
          var position = target.offset().top - 80;
          $("html, body").animate({scrollTop:position}, speed, 'swing');
          return false;
      });
  });
// top スクロール
  $(function () {
      $('a[href^="#top-scroll"]').click(function () {
          var speed = 900;
          var href= $(this).attr("href");
          var target = $(href == "#" || href == "" ? 'html' : href);
          var position = target.offset().top - 30;
          $("html, body").animate({scrollTop:position}, speed, 'swing');
          return false;
      });
  });

//投稿画像のスライドショー
  $(function() {
    new Swiper('.post-image-slide', {

        // Optional parameters
        slidesPerView: 3,
        autoplay: true,
        speed: 1000,
        loop: true,

        pagination: {
            el: '.swiper-pagination',
        type: 'bullets',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    });
  });

// トップのテキストのfadein
 $(window).scroll(function (){
      var  scroll = $(window).scrollTop(),
           windowHeight = $(window).height();
    $('.jumbotron-container-2').each(function(){
        var elemPos = $(this).offset().top;
          if (scroll > elemPos - windowHeight + 100){
              $(this).addClass("fade_on");
            }
        });
    });

//クリックでコメントを全文表示
 $(function() {
    $('.line_wrap_comment').click(function () {
        $(this).removeClass("line_wrap_comment");
    });
  });

});