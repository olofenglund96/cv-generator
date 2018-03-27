
$(document).ready( watch_shrink)


function watch_shrink(){
  $('.js-cv-display-card').hover( 
    function(){    
      $('.js-cv-display-card').addClass('u-shrink')
    },
    function(){
      $('.js-cv-display-card').removeClass("u-shrink")
    }
)};

