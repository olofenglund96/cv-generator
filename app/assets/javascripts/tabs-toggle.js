
$(document).ready(function(){
  $('.js-form-tab').on("click",function(){

    $('.js-form-tab').removeClass('is-active')
    $(this).addClass('is-active')

    panel_ID = $(this).data('panel')
    panel = $('#'+panel_ID)
    
    $('.js-panel').removeClass('is-visible')
    panel.addClass('is-visible')



  })

})