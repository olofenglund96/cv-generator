
var closeOnClickOutside = true;

$(document).ready(function initCta(){
    $(".js-navbar-cta").click(function(e){
        $(".js-navbar-cta").addClass("is-open")
        e.stopPropagation()       
    })
    $(document).click(function(e){
        if($(e.target).is("js-navbar-cta__popup")===false && closeOnClickOutside){
            console.log("sho")
           $(".js-navbar-cta").removeClass("is-open")  
        }
    })
})