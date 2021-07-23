$(function(){
            var swiper = new Swiper('#view_more .swiper-container', {
            
            loop: true,
                speed: 1000,
//                  autoplay: {
//                    delay: 3000,
//                    disableOnInteraction: false,
//                   
//                  },

//            pagination: {
//                el: '#view_more .swiper-pagination',
//            },
//
//            navigation: {
//                nextEl: '#view_more .swiper-button-next',
//                prevEl: '#view_more .swiper-button-prev',
//            },
//
//           scrollbar: {
//                el: '#view_more .swiper-scrollbar',
//            },
        });
    
         var swiper = new Swiper('#service_18 .swiper-container', {
            
            loop: true,
                speed: 1000,
            
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 7,
    
        });
    var swiper = new Swiper('#service_18_2 .swiper-container', {
            
            loop: true,
                speed: 1000,
            
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 7,
        });
    
    
    var swiper = new Swiper('#service_18_3 .swiper-container', {
            
            loop: true,
                speed: 1000,
            
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 7,
    
      });
             
         var swiper = new Swiper('#service_18_3 .swiper-container', {
            
            loop: true,
                speed: 1000,
            
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 7,
    
      });     
             
    
    
     var swiper = new Swiper('#service_20 .swiper-container', {
            
            loop: true,
                speed: 1000,
            
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 7,
    
      });     
    
    
    
    
    
/////////////////////////////////////////////////카달로그 210625////////////////////////////////////////////////////
         var swiper = new Swiper('#MN000 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#MN000 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 20,
    
      });     
    
    
var swiper = new Swiper('#GNB001 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#GNB001 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 20,
    
      });     
    
    
    
   var swiper = new Swiper('#BZ001-TB02 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ001-TB02 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 20,
    
      });      
    
    
     var swiper = new Swiper('#BZ001-TB02-DT01 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ001-TB02-DT01 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 20,
    
      });   
    
    
    
    var swiper = new Swiper('#BZ001-TB04 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ001-TB04 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      });   
    
        var swiper = new Swiper('#BZ001-TB04-DT01 .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ001-TB04-DT01 .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      }); 
    
    
    
    var swiper = new Swiper('#BZ001-TB04-DT01-MAIN .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ001-TB04-DT01-MAIN .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      }); 
    
    
   
//        $('#MY001-QA02 .txt').off('click'); 
//        $('#MY001-QA02 .btn').off('click');

       $('#MY001-QA02 .btn').on('click', function(e){
        e.preventDefault();
        
        $('#MY001-QA02 .toggle_bottom').stop().slideUp(); 
        $('.title_right').removeClass('on');
//        $(this).parents('.title_box').stop(true,true).slideToggle();
        $(this).parents('.title_right').stop(true,true).toggleClass('on');
        });
    
    $('.btn1').trigger('click');
    
    
    
    
    
    $('.day_btn').on('click', function(e){
        e.preventDefault();
        $(this).toggleClass('on');
    }); 
    
    
    
    var swiper = new Swiper('#BZ002-TB01-D .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ002-TB01-D .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 20,
    
      });      
    
    
    var swiper = new Swiper('#BZ002-TB01-A .swiper-container', {
            
            loop: true,
                speed: 1000,
             pagination: {
                el: '#BZ002-TB01-A .swiper-pagination',
              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      });   
    
       var swiper = new Swiper('#BZ002-TB01-E .swiper-container', {
            
            loop: true,
                speed: 1000,
//             pagination: {
//                el: '#BZ002-TB01-E" .swiper-pagination',
//              },
           /*반응형*/
         slidesPerView: 3,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      });   
     
           var swiper = new Swiper('#BZ002-PF01 .swiper-container', {
            
            loop: true,
                speed: 1000,
            pagination: {
               el: '#BZ002-PF01 .swiper-pagination',
             },
           /*반응형*/
         slidesPerView: 1,
//         spaceBetween: 0,
         spaceBetween: 10,
    
      });   
    
}); 